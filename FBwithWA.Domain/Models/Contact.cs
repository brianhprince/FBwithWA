using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Microsoft.WindowsAzure.StorageClient;
using System.Data.Entity;

namespace FBwithWA.Domain.Models
{
    public class Contact: TableServiceEntity
    {
        // partition key is facebook id.
        // row key is empty.

        public Contact()
        {
            this.RowKey = "";
        }

        public Contact(Int64 facebookId):this()
        {
            this.PartitionKey = facebookId.ToString();
        }

        [DisplayName("First Name")]
        [Required(ErrorMessage = "First Name is Required")]
        public string FirstName { get; set; }

        [DisplayName("Last Name")]
        [Required(ErrorMessage = "Last Name is Required")]
        public string LastName { get; set; }

        [DisplayName("Email Address")]
        [Required(ErrorMessage = "Email Address is Required")]
        [RegularExpression(@"^\w+[\w-.]*@\w+((-\w+)|(\w*))\.[a-zA-Z]{2,9}$", ErrorMessage = "Email Address is Not Valid")]
        public string Email { get; set; }

        [DisplayName("Date of Birth")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        [Required(ErrorMessage = "Date of Birth is Required")]
        [CustomValidation(typeof(Contact), "AgeValidator")]
        public DateTime DateOfBirth { get; set; }

        [DisplayName("Zip Code")]
        [Required(ErrorMessage = "A U.S. Zip Code is Required")]
        [RegularExpression(@"^\d{5}(-\d{4})?$", ErrorMessage = "Not a Valid U.S. Zip Code")]
        public string Zip { get; set; }

        [DisplayName("Store Number")]
        public string StoreNumber { get; set; }

        public bool Registered { get; set; }

        public static ValidationResult AgeValidator(DateTime dob, ValidationContext context)
        {
            if (dob <= DateTime.Today.AddYears(-18))
                return ValidationResult.Success;
            return new ValidationResult("You Must be 18 or Older");
        }

    }
}