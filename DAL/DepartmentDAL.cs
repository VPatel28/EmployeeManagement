using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EmployeeManagement.Model;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace EmployeeManagement.DAL
{
    public class DepartmentDAL
    {
        private Logger objLogger = new Logger();
        private readonly string sConnectionstring = ConfigurationManager.AppSettings["ConnString"];
        public bool InsertDeptMaster(Department oDepartment)
        {

            SqlConnection conn = new SqlConnection(sConnectionstring);
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                cmd.CommandText = "DepartmentSIUD";
                cmd.Parameters.AddWithValue("@Dept_id", oDepartment.Dept_id);
                cmd.Parameters.AddWithValue("@Dept_Name", oDepartment.Dept_Name);
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                cmd.Parameters.AddWithValue("@Cmd_Name", oDepartment.Cmd_Name);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                objLogger.Log("InsertDeptMaster", ex.ToString());
                return false;
            }
            finally
            {
                conn.Close();
                cmd.Dispose();
            }
        }



        public DataTable GetDepartmentList(Department oDepartment)
        {
            SqlConnection conn = new SqlConnection(sConnectionstring);
            DataTable dtDepartment = new DataTable();
            SqlCommand cmd = new SqlCommand();
            try
            {
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DepartmentSIUD";
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Cmd_Name", oDepartment.Cmd_Name);
                cmd.Parameters.AddWithValue("@Dept_id", oDepartment.Dept_id);
                SqlDataAdapter oSqlDataAdapter = new SqlDataAdapter(cmd);
                oSqlDataAdapter.Fill(dtDepartment);
                return dtDepartment;
            }
            catch (Exception ex)
            {
                objLogger.Log("GetDepartmentList", ex.ToString());
                return dtDepartment;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}