using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FBwithWA.Domain.Models;

namespace FBwithWA.ViewModels
{
    public class ContactInfoViewModel
    {
        public Contact contact { get; set; }
        public StateData state { get; set; }
    }
}