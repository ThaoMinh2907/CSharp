using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpProject.DTO
{
    public class Grade
    {
        public required string ID { get; set; }
        public required string Name { get; set; }
        public int maxClassOfGrade { get; set; }
        public int realClassOfGrade { get; set; }
        public Grade() { }
    }
}
