using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeManagement.Model
{
    public class Employee
    {
        public long Emp_id { get; set; }
        public string Emp_name { get; set; }
        public string Emp_Surname { get; set; }
        public string Address { get; set; }
        public string Qualification { get; set; }
        public string Contact_number { get; set; }
        public int Dept_Id { get; set; }
        public string Cmd_Name { get; set; }
    }
}