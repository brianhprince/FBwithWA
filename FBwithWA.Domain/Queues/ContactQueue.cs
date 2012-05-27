using AzureToolkit;

namespace FBwithWA.Domain.Queues
{
    public class ContactQueue : FBwithWA.Domain.Queues.IContactQueue
    {
        readonly AzureQueue<ContactQueueMessage> _queue;

        public ContactQueue()
        {
            var factory = new AzureStorageFactory();
            _queue = (AzureQueue<ContactQueueMessage>)factory.GetQueue<ContactQueueMessage>(AzureConstants.ContactQueueName);
        }

        public void EnsureExist()
        {
            _queue.Initialize();
        }

        public void AddMessage(ContactQueueMessage message)
        {
            _queue.AddMessage(message);
        }

        public ContactQueueMessage GetMessage()
        {
            return _queue.GetMessage();
            
        }

        public void DeleteMessage(ContactQueueMessage message)
        {
            _queue.DeleteMessage(message);
        }

    }
}
