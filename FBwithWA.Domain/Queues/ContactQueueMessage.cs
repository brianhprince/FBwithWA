using AzureToolkit;

namespace FBwithWA.Domain.Queues
{
    public class ContactQueueMessage : AzureQueueMessage
    {
        public string FacebookId { get; set; }
    }
}
