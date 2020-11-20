using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Models
{
    public class Brand : IEntity<int>
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public Brand()
        {

        }

        public Brand(string name)
        {
            Id = 0;
            Name = name;
        }

        internal Brand(int id, string name)
        {
            Id = id;
            Name = name;
        }
    }
}
