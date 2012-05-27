using Microsoft.WindowsAzure.StorageClient;

namespace FBwithWA.Domain.Models
{
    public class ZipStore: TableServiceEntity
    {
        // partition key is zip code
        
        // id's if the three closest stores. store1 is closest, ...
        public string store1 { get; set; }
        public string store2 { get; set; }
        public string store3 { get; set; }
    }
}
