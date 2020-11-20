using ADOLibrary;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL.Services
{
    public class BrandService : ServiceBase<int, Brand>
    {
        private Brand Converter(SqlDataReader reader)
        {
            return new Brand(
                (int)reader["Id"],
                reader["Name"].ToString()
                //reader["CompanyName"].ToString()
                );
        }

        public override bool Delete(int key)
        {
            Command cmd = new Command("DeleteBrand", true);
            cmd.AddParameter("Id", key);

            return connection.ExecuteNonQuery(cmd) == 1;
        }

        public override IEnumerable<Brand> GetAll()
        {
            Command cmd = new Command("GetAllBrand", true);

            return connection.ExecuteReader<Brand>(cmd, Converter);
        }

        public override Brand GetById(int key)
        {
            Command cmd = new Command("GetBrandById", true);
            cmd.AddParameter("Id", key);

            return connection.ExecuteReader<Brand>(cmd, Converter).FirstOrDefault();
        }

        public override int Insert(Brand entity)
        {
            Command cmd = new Command("AddBrand", true);
            cmd.AddParameter("Name", entity.Name);
            //cmd.AddParameter("CompanyName", entity.CompanyName);

            return connection.ExecuteNonQuery(cmd);
        }

        public override bool Update(Brand entity)
        {
            Command cmd = new Command("UpdateBrand", true);
            cmd.AddParameter("Name", entity.Name);
            //cmd.AddParameter("CompanyName", entity.CompanyName);

            // Attention
            cmd.AddParameter("Id", entity.Id);

            return connection.ExecuteNonQuery(cmd) == 1;
        }
    }
}
