using System;
using AzureToolkit;
using FBwithWA.Domain.Models;
using FBwithWA.Domain.Queues;
using Microsoft.WindowsAzure;

namespace FBwithWA.Domain
{
    public static class AzureStorageInitializer
    {
        public static void EnsureDomainObjectsExist()
        {
            var factory = new AzureStorageFactory(CloudStorageAccount.FromConfigurationSetting("DataConnectionString"));

            factory.GetTable<Contact>(FBwithWA.Domain.AzureConstants.ContactTableName).Initialize();
            factory.GetQueue<ContactQueueMessage>(AzureConstants.ContactQueueName).Initialize();
            factory.GetTable<ZipStore>(FBwithWA.Domain.AzureConstants.ZipStoreTableName).Initialize();
            factory.GetTable<Store>(FBwithWA.Domain.AzureConstants.StoreTableName).Initialize();
        }
    }
}
