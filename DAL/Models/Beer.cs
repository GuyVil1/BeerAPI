using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Models
{
    public class Beer : IEntity<int>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Degree { get; set; }
        public string Type { get; set; }
        public int BrandId { get; set; }

        public Beer()
        {

        }

        public Beer(string name, double degree, string type, int brandId)
        {
            Name = name;
            Degree = degree;
            Type = type;
            BrandId = brandId;
        }

        internal Beer(int id, string name, double degree, string type, int brandId)
            :this(name, degree, type, brandId)
        {
            Id = id;
        }
    }
}
