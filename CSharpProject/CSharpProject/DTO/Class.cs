using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpProject.DTO
{
    public class Class
    {
        public required string ID { get; set; }
        public required string Name { get; set; }
        public required string GradeID { get; set; }
        public int maxStudent { get; set; }
        public int realStudent { get; set; }
        public int quantityMale {  get; set; }
        public int quantityFemale { get; set; }
        public Class() { }

    }
}
