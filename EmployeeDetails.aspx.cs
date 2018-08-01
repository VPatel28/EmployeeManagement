using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmployeeManagement.Model;
using EmployeeManagement.DAL;
using System.Data;

namespace EmployeeManagement
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDepartment();
                if (Request.QueryString["iEmpId"] != null)
                {
                    long iEmpId = Convert.ToInt64(Request.QueryString["iEmpId"]);
                    FillEmployeeDetails(iEmpId);
                    btnAdd.Visible = false;
                    btnDelete.Visible = true;
                    btnUpdate.Visible = true;
                }
                else
                {
                    btnAdd.Visible = true;
                    btnDelete.Visible = false;
                    btnUpdate.Visible = false;
                }
            }
        }

        void FillEmployeeDetails(long EmpId)
        {

            Employee oEmployee = new Employee();
            oEmployee.Emp_id = EmpId;
            oEmployee.Cmd_Name = "SelectSingleEmployee";
            EmployeeDAL oEmployeeDAL = new EmployeeDAL();
            DataTable dt = oEmployeeDAL.GetEmployeeList(oEmployee);
            if (dt.Rows.Count > 0)
            {
                ddlDept.SelectedValue = dt.Rows[0]["Dept_Id"].ToString();
                txtEmpName.Text = dt.Rows[0]["Emp_name"].ToString();
                txtSurname.Text = dt.Rows[0]["Emp_Surname"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtQualification.Text = dt.Rows[0]["Qualification"].ToString();
                txtContactNum.Text = dt.Rows[0]["Contact_number"].ToString();

            }
        }
        void BindDepartment()
        {
            try
            {
                Department oDepartment = new Department();
                oDepartment.Cmd_Name = "SelectAllDepartment";
                DepartmentDAL oDepartmentDal = new DepartmentDAL();
                DataTable dt = oDepartmentDal.GetDepartmentList(oDepartment);
                ddlDept.DataTextField = "Dept_Name";
                ddlDept.DataValueField = "Dept_Id";
                ddlDept.DataSource = dt;
                ddlDept.DataBind();
            }
            catch (Exception)
            {
                throw new Exception("Department Cannot Load, Please Try Again Later");
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Employee oEmployee = new Employee();
            oEmployee.Emp_name = txtEmpName.Text;
            oEmployee.Emp_Surname = txtSurname.Text;
            oEmployee.Qualification = txtQualification.Text;
            oEmployee.Contact_number = txtContactNum.Text;
            oEmployee.Address = txtAddress.Text;
            oEmployee.Dept_Id = Convert.ToInt32(ddlDept.SelectedValue);
            oEmployee.Cmd_Name = "InsertEmployee";
            EmployeeDAL oEmployeeDAL = new EmployeeDAL();
            if (oEmployeeDAL.InsertEmpMaster(oEmployee))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Employee Added Successfully')", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error While Adding Employee, Kindly Contact to Administrator')", true);

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Employee oEmployee = new Employee();
            oEmployee.Emp_name = txtEmpName.Text;
            oEmployee.Emp_Surname = txtSurname.Text;
            oEmployee.Qualification = txtQualification.Text;
            oEmployee.Contact_number = txtContactNum.Text;
            oEmployee.Address = txtAddress.Text;
            oEmployee.Emp_id = Convert.ToInt64(Request.QueryString["iEmpId"]);
            oEmployee.Dept_Id = Convert.ToInt32(ddlDept.SelectedValue);
            oEmployee.Cmd_Name = "UpdateEmployee";
            EmployeeDAL oEmployeeDAL = new EmployeeDAL();
            oEmployeeDAL.InsertEmpMaster(oEmployee);
            if (oEmployeeDAL.InsertEmpMaster(oEmployee))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Employee Details Updated Successfully')", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error While Updating Employee Details, Kindly Contact to Administrator')", true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Employee oEmployee = new Employee();
            oEmployee.Emp_id = Convert.ToInt64(Request.QueryString["iEmpId"]);
            oEmployee.Cmd_Name = "DeleteEmployee";
            EmployeeDAL oEmployeeDAL = new EmployeeDAL();
            if (oEmployeeDAL.InsertEmpMaster(oEmployee))
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Employee Deleted Successfully')", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Error While Deleting Employee, Kindly Contact to Administrator')", true);
        }
    }
}