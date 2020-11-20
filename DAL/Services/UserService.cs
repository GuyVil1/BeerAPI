using ADOLibrary;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL.Services
{
    public class UserService : ServiceBase<int, User>
    {
        private User Converter(SqlDataReader reader)
        {
            return new User(
                (int)reader["Id"],
                reader["LastName"].ToString(),
                reader["FirstName"].ToString(),
                reader["Email"].ToString(),
                reader["Password"].ToString()
                //(DateTime)reader["CreationDate"]
                );
        }

        public override bool Delete(int key)
        {
            Command cmd = new Command("DeleteUser", true);
            cmd.AddParameter("Id", key);

            return connection.ExecuteNonQuery(cmd) == 1;
        }

        public override IEnumerable<User> GetAll()
        {
            Command cmd = new Command("GetAllUser", true);

            return connection.ExecuteReader<User>(cmd, Converter);
        }

        public override User GetById(int key)
        {
            Command cmd = new Command("GetUserById", true);
            cmd.AddParameter("Id", key);

            return connection.ExecuteReader<User>(cmd, Converter).FirstOrDefault();
        }

        public override int Insert(User entity)
        {
            Command cmd = new Command("AddUser", true);
            cmd.AddParameter("LastName", entity.LastName);
            cmd.AddParameter("FirstName", entity.FirstName);
            cmd.AddParameter("Email", entity.Email);
            cmd.AddParameter("Password", entity.Password);
            //cmd.AddParameter("CreationDate", entity.CreationDate);

            return connection.ExecuteNonQuery(cmd);
        }

        public override bool Update(User entity)
        {
            Command cmd = new Command("UpdateUser", true);
            cmd.AddParameter("LastName", entity.LastName);
            cmd.AddParameter("FirstName", entity.FirstName);
            cmd.AddParameter("Email", entity.Email);
            cmd.AddParameter("Password", entity.Password);
            //cmd.AddParameter("CreationDate", entity.CreationDate);

            // Attention
            cmd.AddParameter("Id", entity.Id);

            return connection.ExecuteNonQuery(cmd) == 1;
        }
    }
}
