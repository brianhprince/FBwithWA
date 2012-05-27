using System.Collections.Generic;
using System.Linq;
using FBwithWA.Domain.Models;
using AzureToolkit;

namespace FBwithWA.Domain.Repositories
{
    public class StoreRepository : IStoreRepository
    {
        readonly AzureTable<ZipStore> _zipStore;
        readonly AzureTable<Store> _store;

        public StoreRepository()
        {
            var factory = new AzureStorageFactory();
            _zipStore = (AzureTable<ZipStore>)factory.GetTable<ZipStore>(FBwithWA.Domain.AzureConstants.ZipStoreTableName);
            _store = (AzureTable<Store>)factory.GetTable<Store>(FBwithWA.Domain.AzureConstants.StoreTableName);
        }

        public IList<Store> GetNearbyStores(string ZipCode)
        {
            var stores = new List<Store>();
            Store store1, store2, store3;

            var ziplisting = _zipStore.Query.Where(zs => zs.PartitionKey == ZipCode).FirstOrDefault();

            store1 = _store.Get(s => s.PartitionKey == ziplisting.store1 && s.RowKey == "");
            if (store1 != null)
                stores.Add(store1);

            store2 = _store.Get(s => s.PartitionKey == ziplisting.store2 && s.RowKey == "");
            if (store2 != null)
                stores.Add(store2);

            store3 = _store.Get(s => s.PartitionKey == ziplisting.store3 && s.RowKey == "");
            if (store3 != null)
                stores.Add(store3);
            
            return stores;
        }
    }
}
