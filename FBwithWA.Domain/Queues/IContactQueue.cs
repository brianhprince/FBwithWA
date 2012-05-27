namespace FBwithWA.Domain.Queues
{
    public interface IContactQueue
    {
        void AddMessage(ContactQueueMessage message);
        void EnsureExist();
        ContactQueueMessage GetMessage();
        void DeleteMessage(ContactQueueMessage message);
    }
}
