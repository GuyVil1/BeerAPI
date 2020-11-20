using ADOLibrary;
using DAL.Models;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace DAL.Services
{
    public class BeerService : ServiceBase<int, Beer>
    {
        private Beer Converter(SqlDataReader reader)
        {
            return new Beer(
                (int)reader["Id"],
                reader["Name"].ToString(),
                (double)reader["Degree"],
                reader["Type"].ToString(),
                (int)reader["BrandId"]
                );
        }

        public override bool Delete(int key)
        {
            Command cmd = new Command("DeleteBeer", true);
            cmd.AddParameter("Id", key);

            return connection.ExecuteNonQuery(cmd) == 1;
        }

        public override IEnumerable<Beer> GetAll()
        {
            Command cmd = new Command("GetAllBeer", true);

            return connection.ExecuteReader<Beer>(cmd, Converter);
        }

        public override Beer GetById(int key)
        {
            Command cmd = new Command("GetBeerById", true);
            cmd.AddParameter("Id", key);

            return connection.ExecuteReader<Beer>(cmd, Converter).FirstOrDefault();
        }

        public override int Insert(Beer entity)
        {
            Command cmd = new Command("AddBeer", true);
            cmd.AddParameter("Name", entity.Name);
            cmd.AddParameter("Degree", entity.Degree);
            cmd.AddParameter("Type", entity.Type);
            cmd.AddParameter("BrandId", entity.BrandId);

            return connection.ExecuteNonQuery(cmd);
        }

        public override bool Update(Beer entity)
        {
            Command cmd = new Command("UpdateBeer", true);
            cmd.AddParameter("Name", entity.Name);
            cmd.AddParameter("Degree", entity.Degree);
            cmd.AddParameter("Type", entity.Type);
            cmd.AddParameter("BrandId", entity.BrandId);

            // Attention
            cmd.AddParameter("Id", entity.Id);

            return connection.ExecuteNonQuery(cmd) == 1;
        }

        public IEnumerable<Beer> GetByBrandId(int key)
        {
            Command cmd = new Command("GetBeerByBrandId", true);
            cmd.AddParameter("Id", key);

            return connection.ExecuteReader<Beer>(cmd, Converter);
        }
    }
}
