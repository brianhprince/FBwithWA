using System;
using FBwithWA.Domain.Models;
using AzureToolkit;
using Microsoft.WindowsAzure;

namespace FBwithWA.Domain.Repositories
{
    public class ContactRepository : IContactRepository
    {
        readonly AzureTable<Contact> _table;

        public ContactRepository()
        {
            var factory = new AzureStorageFactory(CloudStorageAccount.FromConfigurationSetting("DataConnectionString"));
            _table = (AzureTable<Contact>) factory.GetTable<Contact>(FBwithWA.Domain.AzureConstants.ContactTableName);
        }

        public Contact GetFromFacebookId(string facebookId)
        {
            return this.Get(facebookId);
        }

        public Contact Get(string partitionKey)
        {
            return _table.Get(c => c.PartitionKey == partitionKey && c.RowKey == "");
        }

        public bool IsRegistered(string facebookId)
        {
            Contact aContact = GetFromFacebookId(facebookId);
            return (aContact != null) && aContact.Registered;
        }

        public void Save(Contact contact)
        {
            _table.AddOrUpdate(contact);
        }

        public void Delete(Contact contact)
        {
            _table.Delete(contact);
        }
    }
}