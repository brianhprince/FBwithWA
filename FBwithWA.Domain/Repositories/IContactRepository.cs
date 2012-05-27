using FBwithWA.Domain.Models;

namespace FBwithWA.Domain.Repositories
{
    public interface IContactRepository
    {
        void Delete(Contact contact);
        Contact GetFromFacebookId(string facebookId);
        Contact Get(string partitionKey);
        void Save(Contact contact);
        bool IsRegistered(string facebookId);
    }
}
