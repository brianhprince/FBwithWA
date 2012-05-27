using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AzureToolkit;
using FBwithWA.Domain;
using FBwithWA.Domain.Models;
using Microsoft.WindowsAzure;
using System.Configuration;

namespace SampleDataDeployer
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("This is a simple program to copy the sample data to your Windows Azure storage account. This can take some time, depending on your network speed. Make sure you have changed the data connection string to point to your storage account.");

            // this could be easily re-written to use batching in the client storage api, 
            // but I wanted to be consistent with how we access table storage through the sample. 
            // And you will likely only run this once.

            AzureTable<Store> _Stores;
            AzureTable<ZipStore> _ZipCodes;
            AppSettingsReader myAppSettings = new AppSettingsReader();
            const int numberOfStores = 1000;
            const int numberOfZipCodes = 42192;

            var factory = new AzureStorageFactory(CloudStorageAccount.Parse((string)myAppSettings.GetValue("DataConnectionString", typeof(string))));

            _Stores = (AzureTable<Store>)factory.GetTable<Store>(FBwithWA.Domain.AzureConstants.StoreTableName);
            _Stores.Initialize();

            _ZipCodes = (AzureTable<ZipStore>)factory.GetTable<ZipStore>(FBwithWA.Domain.AzureConstants.ZipStoreTableName);
            _ZipCodes.Initialize();

            Console.WriteLine("Load stores..." + DateTime.Now.ToShortTimeString());
            using (CsvFileReader reader = new CsvFileReader(@"Store_List.csv"))
            {
                int count = 0;
                CsvRow row = new CsvRow();
                while (reader.ReadRow(row))
                {
                    //row headers: PartitionKey,RowKey,Name,City,State,Zip
                    Store aStore = new Store
                    {
                        PartitionKey = row[0],
                        RowKey = row[1],
                        Name = row[2],
                        City = row[3],
                        State = row[4],
                        Zip = row[5]
                    };
                    _Stores.AddOrUpdate(aStore);
                    Console.WriteLine(string.Format("Completed: {0} of {1} stores", count.ToString(), numberOfStores));
                    count++;
                }
            }
            Console.WriteLine("Load stores done. " + DateTime.Now.ToShortTimeString());

            // load zip array
            Console.WriteLine("Load zip code data..." + DateTime.Now.ToShortTimeString());

            using (CsvFileReader reader = new CsvFileReader(@"Zip_Map.csv"))
            {
                int count = 0;
                CsvRow row = new CsvRow();
                while (reader.ReadRow(row))
                {
                    ZipStore aZipCode = new ZipStore
                    {
                        // file format: PartitionKey,RowKey,zip,store1,store2,store3
                        PartitionKey = row[0],
                        RowKey = row[1],
                        store1 = row[3],
                        store2 = row[4],
                        store3 = row[5]
                    };
                    _ZipCodes.AddOrUpdate(aZipCode);
                    Console.WriteLine(string.Format("Completed: {0} of {1} zip codes", count.ToString(), numberOfZipCodes));
                    count++;
                }
            }
            Console.WriteLine("Load zip codes done. " + DateTime.Now.ToShortTimeString());
            Console.WriteLine("Prese enter to exit.");
            Console.ReadLine();
        }
    }
}
