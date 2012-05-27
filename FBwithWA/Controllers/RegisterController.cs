using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Web.Mvc;
using Facebook;
using FBwithWA.Domain.Models;
using FBwithWA.Domain.Queues;
using FBwithWA.Domain.Repositories;
using FBwithWA.ViewModels;


namespace FBwithWA.Controllers
{
    public class RegisterController : Controller
    {
        public IContactRepository contactRepository;
        public IContactQueue contactQueue;
        public IStoreRepository storeRepository;

        public RegisterController(IContactRepository contacts, IStoreRepository stores,
            IContactQueue queue)
        {
            contactRepository = contacts;
            storeRepository = stores;
            contactQueue = queue;
        }

        public RegisterController()
            : this(new ContactRepository(), new StoreRepository(), new ContactQueue())
        {
        }

        [HttpPost]
        public ActionResult FacebookLoginResult()
        {
            if (Request["signed_request"] == null)
            {
                return new RedirectResult("/");
            }
            else
            {
                return RedirectToAction("Index", new { _signedRequest = (string)Request["signed_request"] });
            }
        }

        public ActionResult Index(string _signedRequest)
        {
            dynamic response = GetFacebookUserData(_signedRequest);
            if (response == null)
                return new RedirectResult("/");

            Contact contact = new Contact();
            contact.FirstName = response.first_name;
            contact.LastName = response.last_name;
            contact.DateOfBirth = DateTime.Parse(response.birthday);
            contact.Email = response.email;

            StateData stateData = new StateData();
            stateData.FBSignedRequest = _signedRequest;
            stateData.FBUserId = response.id;

            ContactInfoViewModel model = new ContactInfoViewModel();
            model.contact = contact;
            model.state = stateData;

            if (contactRepository.IsRegistered(response.id))
                return RedirectToAction("RegisterComplete");
            else
                return View(model);
        }

        [HttpPost]
        public ActionResult Index(ContactInfoViewModel _model)
        {
            if (_model.state.FBSignedRequest == null)
                return new RedirectResult("/");

            dynamic response = GetFacebookUserData(_model.state.FBSignedRequest);

            _model.contact.PartitionKey = response.id;

            if (contactRepository.IsRegistered(response.id))
                return RedirectToAction("RegisterComplete");

            if (ModelState.IsValid)
            {
                //save
                contactRepository.Save(_model.contact);

                //redirect to selectstore action

                return RedirectToAction("SelectStore", new { _fbsignedRequest = _model.state.FBSignedRequest, _fbuserid = _model.state.FBUserId});
            }

            return View(_model);
        }

        public ActionResult SelectStore(string _fbsignedRequest, string _fbuserid)
        {
            if (_fbsignedRequest == null)
                return new RedirectResult("/");

            // load contact from storage
            Contact contact = contactRepository.GetFromFacebookId(_fbuserid);

            if (contactRepository.IsRegistered(_fbuserid))
                return RedirectToAction("RegisterComplete");

            // load nearby stores
            IList<Store> nearbyStores = storeRepository.GetNearbyStores(contact.Zip);

            if (nearbyStores.Count <= 1)
            {
                // Select this one store and move on automatically.
                if (nearbyStores.Count == 1)
                {
                    contact.StoreNumber = nearbyStores[0].PartitionKey;
                }
                contact.Registered = true;
                contactRepository.Save(contact);

                QueueContact(contact);
                return RedirectToAction("RegisterComplete");
            }
            else
            {
                SelectStoreViewModel model = new SelectStoreViewModel()
                {
                    NearbyStores = nearbyStores,
                    StoreNumber = nearbyStores[0].PartitionKey,
                    State = new StateData { FBSignedRequest = _fbsignedRequest, FBUserId = _fbuserid }
                };

                // have user pick a favorite store.
                return View(model);
            }
        }

        [HttpPost]
        public ActionResult SelectStore(SelectStoreViewModel _model)
        {
            if (_model.State.FBSignedRequest == null)
                return new RedirectResult("/");

            // load contact from storage
            Contact contact = contactRepository.GetFromFacebookId(_model.State.FBUserId);

            if (contact == null)
                return new RedirectResult("/");

            if (contactRepository.IsRegistered(_model.State.FBUserId))
                return RedirectToAction("RegisterComplete");

            if (ModelState.IsValid)
            {
                contact.StoreNumber = _model.StoreNumber;
                contact.Registered = true;
                contactRepository.Save(contact);

                QueueContact(contact);
                return RedirectToAction("RegisterComplete");
            }

            return View(_model);
        }

        public ActionResult RegisterComplete()
        {
            return View();
        }

        private void QueueContact(Contact contact)
        {
            // queue the contact for the worker role.
            ContactQueueMessage message = new ContactQueueMessage();
            message.FacebookId = contact.PartitionKey;
            contactQueue.AddMessage(message);
        }

        private dynamic GetFacebookUserData(string _signedRequest)
        {
            FacebookClient client = new FacebookClient();
            dynamic signedRequest = client.ParseSignedRequest(ConfigurationManager.AppSettings["facebook_appsecret"].ToString(), _signedRequest);

            client.AppId = ConfigurationManager.AppSettings["facebook_appid"].ToString();
            client.AppSecret = ConfigurationManager.AppSettings["facebook_appsecret"].ToString();
            
            if (signedRequest.ContainsKey("oauth_token"))
                client.AccessToken = (string)signedRequest["oauth_token"];
            else
                return null;

            dynamic response = client.Get("me");
            return response;
        }

        private bool AlreadyRegistered(Contact contact)
        {
            return (contact != null) && contact.Registered;
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            if ((filterContext == null) || (filterContext.Exception == null))
                return;

            Trace.TraceError(filterContext.Exception.ToString());
        }

    }
}
