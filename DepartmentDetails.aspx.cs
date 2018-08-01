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
    public partial class DepartmentDetails : System.Web.UI.Page
    {
        private Logger oLogger = new Logger();

        protected void Page_Load(object sender, EventArgs e)
        {
            EventHandler();
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["iDeptId"] != null)
                {
                    long iDeptId = Convert.ToInt64(Request.QueryString["iDeptId"]);
                    FillDepartmentDetails(iDeptId);
                }
                else
                {
                    FillDepartmentDetails(0);
                }
            }

        }


        private void FillDepartmentDetails(long iDeptId)
        {
            Department oDepartment = new Department();
            DepartmentDAL oDepartmentDAL = new DepartmentDAL();
            if (iDeptId > 0)
            {
                oDepartment.Cmd_Name = "SelectSingleDepartment";
                oDepartment.Dept_id = iDeptId;
                DataTable dt = oDepartmentDAL.GetDepartmentList(oDepartment);
                if (dt.Rows.Count > 0)
                {
                    txtDeptName.Text = dt.Rows[0]["Dept_Name"].ToString().Trim();
                }
                btnAdd.Visible = false;
                btnDelete.Visible = true;
                btnUpdate.Visible = true;
            }
            else
            {
                oDepartment.Cmd_Name = "SelectAllDepartment";
                DataTable dt = oDepartmentDAL.GetDepartmentList(oDepartment);
                grvDepartment.DataSource = dt;
                grvDepartment.DataBind();
                btnAdd.Visible = true;
                btnDelete.Visible = false;
                btnUpdate.Visible = false;
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Department oDepartment = new Department();
            oDepartment.Cmd_Name = "InsertDepartment";
            oDepartment.Dept_Name = txtDeptName.Text.ToString().Trim();
            DepartmentDAL oDepartmentDAL = new DepartmentDAL();
            if (oDepartmentDAL.InsertDeptMaster(oDepartment))
            {
                txtDeptName.Text = "";
                //   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "alert('Department Added Successfully')", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "Redirect('Department Added Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "Redirect('Error While Adding Department,Kindly Contact to Administrator')", true);
            }
        }


        private void EventHandler()
        {
            try
            {
                grvDepartment.RowDataBound += new GridViewRowEventHandler(grvDepartment_RowDataBound);
                grvDepartment.RowCommand += new GridViewCommandEventHandler(grvDepartment_RowCommand);
                grvDepartment.PreRender += new System.EventHandler(grvDepartment_PreRender);
            }
            catch (Exception ex)
            {
                oLogger.Log("DepartmentDetails.aspx:EventHandler()", ex.Message.ToString());
            }
        }

        void grvDepartment_PreRender(object sender, EventArgs e)
        {
            try
            {
                if (grvDepartment.Rows.Count > 0)
                {
                    grvDepartment.UseAccessibleHeader = true;
                    grvDepartment.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            catch (Exception ex)
            {
                oLogger.Log("DepartmentDetails.aspx:grvDepartment_PreRender()", ex.Message.ToString());
            }
        }

        void grvDepartment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                string sDeptId = grvDepartment.Rows[index].Cells[0].Text.ToString();

                String url = "DepartmentDetails.aspx?iDeptId=" + sDeptId;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "OpenWindow('" + url + "')", true);

            }
            catch (Exception ex)
            {
                oLogger.Log("DepartmentDetails.aspx:grvDepartment_RowCommand()", ex.Message.ToString());
            }
        }


        void grvDepartment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType != DataControlRowType.Header)
                {
                    e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(grvDepartment, "$" + e.Row.RowIndex.ToString(), false);
                }
            }
            catch (Exception ex)
            {
                oLogger.Log("DepartmentDetails.aspx:grvDepartment_RowDataBound()", ex.Message.ToString());
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Department oDepartment = new Department();
            oDepartment.Cmd_Name = "UpdateSingleDepartment";
            oDepartment.Dept_id = Convert.ToInt64(Request.QueryString["iDeptId"]);
            oDepartment.Dept_Name = txtDeptName.Text.ToString().Trim();
            DepartmentDAL oDepartmentDAL = new DepartmentDAL();
            if (oDepartmentDAL.InsertDeptMaster(oDepartment))
            {
                txtDeptName.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "Redirect('Department Details Updated Successfully')", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "Redirect('Error While Updating Department Details,Kindly Contact to Administrator')", true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Department oDepartment = new Department();
            oDepartment.Cmd_Name = "DeleteDepartment";
            oDepartment.Dept_id = Convert.ToInt64(Request.QueryString["iDeptId"]);
            DepartmentDAL oDepartmentDAL = new DepartmentDAL();
            if (oDepartmentDAL.InsertDeptMaster(oDepartment))
            {
                txtDeptName.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "Redirect('Department Deleted Successfully')", true);
            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "Redirect('Error While Deleting Department,Kindly Contact to Administrator')", true);
        }
    }
}