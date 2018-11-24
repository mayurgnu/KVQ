using System;
using System.Collections.Generic;

namespace KVDemoApi.Core.Entities
{
    public partial class TblRole
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public DateTime? Createddate { get; set; }
    }
}
