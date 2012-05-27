using FBwithWA.Domain.Models;
using System.Collections.Generic;

namespace FBwithWA.Domain.Repositories
{
    public interface IStoreRepository
    {
        IList<Store> GetNearbyStores(string ZipCode);
    }
}
