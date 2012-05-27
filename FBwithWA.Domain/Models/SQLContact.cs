using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FBwithWA.Domain.Models
{
    public class SQLContact
    {
        public int ID { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public DateTime DateOfBirth { get; set; }

        public string Zip { get; set; }

        public int StoreNumber { get; set; }

        public bool Registered { get; set; }

        public string FacebookId { get; set; }

    }
}
