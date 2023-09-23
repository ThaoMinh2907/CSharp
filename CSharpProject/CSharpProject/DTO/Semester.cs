using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpProject.DTO
{
    public class Semester
    {
        public int ID { get; set; }
        public required string Name { get; set; }
        public required string Coefficient { get; set; }
        public DateTime startDate { get; set; }
        public DateTime finishDate { get; set; }
        public Semester() { }
    }
}
