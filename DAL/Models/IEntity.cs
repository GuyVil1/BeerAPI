using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Models
{
    public interface IEntity<Tkey>
    {
        Tkey Id { get; }
    }
}
