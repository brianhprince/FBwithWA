using System;
using System.Diagnostics;
using System.Net;
using System.Threading;
using FBwithWA.Domain;
using FBwithWA.Domain.Models;
using FBwithWA.Domain.Queues;
using FBwithWA.Domain.Repositories;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace FBwithWA.BackendProcessing
{
    public class WorkerRole : RoleEntryPoint
    {
        public IContactQueue contactQueue;
        public IContactRepository contactRepository;
        public SQLContactRepository SQLContacts;

        public override void Run()
        {
            Trace.WriteLine("Backend Processing worker role started.", "Information");
            int queuePollingIntervalFloor = Convert.ToInt32(RoleEnvironment.GetConfigurationSettingValue("QueuePollingIntervalFloor"));
            int queuePollingIntervalCeiling = Convert.ToInt32(RoleEnvironment.GetConfigurationSettingValue("QueuePollingIntervalCeiling"));
            int currentInterval = queuePollingIntervalFloor;

            // connect to repositories
            contactQueue = new ContactQueue();
            contactRepository = new ContactRepository();
            SQLContacts = new SQLContactRepository();

            while (true)
            {
                // grab message
                ContactQueueMessage msg = contactQueue.GetMessage();
                if (msg != null)
                {
                    Contact contact = contactRepository.GetFromFacebookId(msg.FacebookId);

                    // email person
                    SendEmail(contact);

                    // map to sqlcontact object and store in sql
                    StoreContact(contact);

                    // remove message from queue now that we are done with it
                    contactQueue.DeleteMessage(msg);

                    // adjust queue polling interval to floor to speed up since we found something in the queue
                    currentInterval = queuePollingIntervalFloor;
                }
                else
                {
                    if (currentInterval < queuePollingIntervalCeiling)
                        currentInterval = currentInterval * 2;
                    
                    // the doubling of the interval may have pushed it above our ceiling
                    if (currentInterval > queuePollingIntervalCeiling)
                        currentInterval = queuePollingIntervalCeiling;
                }

                Thread.Sleep(TimeSpan.FromSeconds(currentInterval));
                Trace.WriteLine("Working. Polling Interval in seconds is " + currentInterval.ToString(), "Information");
            }
        }

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections 
            ServicePointManager.DefaultConnectionLimit = 12;

            //direct config to cloud config
            CloudStorageAccount.SetConfigurationSettingPublisher((configName, configSettingPublisher) =>
            {
                var connectionString = RoleEnvironment.GetConfigurationSettingValue(configName);
                configSettingPublisher(connectionString);
            });

            // set up azure storage
            AzureStorageInitializer.EnsureDomainObjectsExist();

            // For information on handling configuration changes
            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.

            return base.OnStart();
        }

        private void SendEmail(Contact _contact)
        {
            // contact another service to send off the email with the premium coupon here (outside the scope of this sample)
            Trace.TraceInformation("SAMPLE: Coupon email not implemented. Test address:" + _contact.Email);
        }

        public SQLContact MapContactToSqlContact(Contact contact)
        {
            SQLContact sqlContact = new SQLContact();

            sqlContact.FirstName = contact.FirstName;
            sqlContact.LastName = contact.LastName;
            sqlContact.DateOfBirth = contact.DateOfBirth;
            sqlContact.Email = contact.Email;
            sqlContact.Zip = contact.Zip;
            sqlContact.StoreNumber = Convert.ToInt32(contact.StoreNumber);
            sqlContact.Registered = contact.Registered;
            sqlContact.FacebookId = contact.PartitionKey;

            return sqlContact;
        }

        private void StoreContact(Contact _contact)
        {
            SQLContacts.Contacts.Add(MapContactToSqlContact(_contact));
            SQLContacts.SaveChanges();
            Trace.TraceInformation("Contact saved to SQL- " + _contact.Email);
        }
    }
}
