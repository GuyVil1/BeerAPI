using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Models
{
    public class User : IEntity<int>
    {
        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        //public DateTime CreationDate { get; set; }

        public User()
        {

        }

        public User(string lastName, string firstName, string email, string password)
        {
            LastName = lastName;
            FirstName = firstName;
            Email = email;
            Password = password;
        }

        internal User(int id, string lastName, string firstName, string email, string password)
            :this(lastName, firstName, email, password)
        {
            Id = id;
        }
    }
}
