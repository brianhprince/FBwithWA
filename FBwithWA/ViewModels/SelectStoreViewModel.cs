using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FBwithWA.Domain.Models;

namespace FBwithWA.ViewModels
{
    public class SelectStoreViewModel
    {
        public IList<Store> NearbyStores { get; set; }
        public string StoreNumber { get; set; }
        public StateData State { get; set; }
    }
}