using System.Configuration;
using FBwithWA.Domain.Models;
using System.Data.Entity;
using System.Data;


namespace FBwithWA.Domain.Repositories
{
    public class SQLContactRepository : DbContext
    {
        public DbSet<SQLContact> Contacts { get; set; }      
    }
}
