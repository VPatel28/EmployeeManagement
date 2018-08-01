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
    public partial class EmployeeList : System.Web.UI.Page
    {
        private Logger oLogger = new Logger();
        protected void Page_Load(object sender, EventArgs e)
        {
            EventHandler();
            if (!Page.IsPostBack)
            {
                BindGridData();
            }
        }
        private void BindGridData()
        {
            Employee oEmployee = new Employee();
            oEmployee.Cmd_Name = "SelectAllEmployee";
            EmployeeDAL oEmployeeDAL = new EmployeeDAL();
            DataTable dt = oEmployeeDAL.GetEmployeeList(oEmployee);
            grvEmpList.DataSource = dt;
            grvEmpList.DataBind();
        }
        private void EventHandler()
        {
            try
            {
                grvEmpList.RowDataBound += new GridViewRowEventHandler(grvEmpList_RowDataBound);
                grvEmpList.RowCommand += new GridViewCommandEventHandler(grvEmpList_RowCommand);
                grvEmpList.PreRender += new System.EventHandler(grvEmpList_PreRender);
            }
            catch (Exception ex)
            {
                oLogger.Log("EmployeeList.aspx:EventHandler()", ex.Message.ToString());
            }
        }

        void grvEmpList_PreRender(object sender, EventArgs e)
        {
            try
            {
                if (grvEmpList.Rows.Count > 0)
                {
                    grvEmpList.UseAccessibleHeader = true;
                    grvEmpList.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            catch (Exception ex)
            {
                oLogger.Log("EmployeeList.aspx:grvEmpList_PreRender()", ex.Message.ToString());
            }
        }

        public void grvEmpList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                string sEmpId = grvEmpList.Rows[index].Cells[0].Text.ToString();

                String url = "EmployeeDetails.aspx?iEmpId=" + sEmpId;
                 Response.Redirect(url);
                //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", "OpenWindow('" + url + "')", true);

            }
            catch (Exception ex)
            {
                oLogger.Log("EmployeeList.aspx:grvEmpList_RowCommand()", ex.Message.ToString());
            }
        }


        protected override void OnPreRenderComplete(EventArgs e)
        {
            try
            {
                base.OnPreRenderComplete(e);
            }
            catch (Exception ex)
            {
                oLogger.Log("EmployeeList.aspx:OnPreRenderComplete()", ex.Message.ToString());
            }
        }

        void grvEmpList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType != DataControlRowType.Header)
                {
                    e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(grvEmpList, "$" + e.Row.RowIndex.ToString(), false);
                }
            }
            catch (Exception ex)
            {
                oLogger.Log("EmployeeList.aspx:grvEmpList_RowDataBound()", ex.Message.ToString());
            }
        }
    }
}