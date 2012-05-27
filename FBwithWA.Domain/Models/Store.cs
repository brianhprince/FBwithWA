using Microsoft.WindowsAzure.StorageClient;

namespace FBwithWA.Domain.Models
{
    public class Store: TableServiceEntity
    {
        // partition key is store number
        // row key is empty

        public Store()
        {
            this.RowKey = "";
        }

        public string Name { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
    }
}
