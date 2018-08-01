using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeManagement.Model
{
    public class Department
    {
        public long Dept_id { get; set; }
        public string Dept_Name { get; set; }
        public DateTime CreatedOn { get; set; }
        public string Cmd_Name { get; set; }
    }
}