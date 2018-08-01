using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EmployeeManagement.Model;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace EmployeeManagement.DAL
{
    public class EmployeeDAL
    {

        private readonly string sConnectionstring = ConfigurationManager.AppSettings["ConnString"];
        private Logger objLogger = new Logger();
        public bool InsertEmpMaster(Employee oEmployee)
        {
            SqlConnection conn = new SqlConnection(sConnectionstring);
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.CommandText = "EmployeeSIUD";
                cmd.Parameters.AddWithValue("@Emp_name", oEmployee.Emp_name == null ? "" : oEmployee.Emp_name.Trim());
                cmd.Parameters.AddWithValue("@Emp_Surname", oEmployee.Emp_Surname == null ? "" : oEmployee.Emp_Surname.Trim());
                cmd.Parameters.AddWithValue("@Address", oEmployee.Address == null ? "" : oEmployee.Address.Trim());
                cmd.Parameters.AddWithValue("@Qualification", oEmployee.Qualification == null ? "" : oEmployee.Qualification.Trim());
                cmd.Parameters.AddWithValue("@Contact_number", oEmployee.Contact_number == null ? "0" : oEmployee.Contact_number.Trim());
                cmd.Parameters.AddWithValue("@Dept_Id", oEmployee.Dept_Id);
                cmd.Parameters.AddWithValue("@Cmd_Name", oEmployee.Cmd_Name == null ? "" : oEmployee.Cmd_Name.Trim());
                cmd.Parameters.AddWithValue("@Emp_id", oEmployee.Emp_id);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                objLogger.Log("InsertEmpMaster", ex.ToString());
                return false;
            }
            finally
            {
                conn.Close();
                cmd.Dispose();
            }
        }



        public DataTable GetEmployeeList(Employee oEmployee)
        {
            SqlConnection conn = new SqlConnection(sConnectionstring);
            DataTable dtEmployee = new DataTable();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn.Open();
                cmd.Parameters.AddWithValue("@Emp_id", oEmployee.Emp_id);
                cmd.Parameters.AddWithValue("@Cmd_Name", oEmployee.Cmd_Name.Trim());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "EmployeeSIUD";
                cmd.Connection = conn;
                SqlDataAdapter oSqlDataAdapter = new SqlDataAdapter(cmd);
                oSqlDataAdapter.Fill(dtEmployee);
                return dtEmployee;
            }
            catch (Exception ex)
            {
                objLogger.Log("GetEmployeeList", ex.ToString());
                return dtEmployee;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}