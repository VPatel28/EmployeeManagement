<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="EmployeeList.aspx.cs"
    Inherits="EmployeeManagement.EmployeeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="Style/JQuery.js" type="text/javascript" type="text/javascript"></script>
    <script src="Style/Bootstrap.js" type="text/javascript" type="text/javascript"></script>
    <link href="Style/Bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="/Style/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css"
        type="text/javascript" />
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet'
        type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css' />
    <title>Employee Summary</title>
</head>
<body>
    <form id="Form1" runat="server">
    <asp:ScriptManager ID="EmScriptManager" EnablePartialRendering="true" runat="server"
        AsyncPostBackTimeout="36000" EnablePageMethods="true">
    </asp:ScriptManager>
    <div class="container">
        <div class="row main">
            <div class="panel-heading">
                <div class="panel-title text-center">
                    <h1 class="title">
                        Employee Management</h1>
                    <hr />
                </div>
            </div>
            <br />
            <div >
               <a href="Index.aspx" class="btn btn-default">Home Page</a>
            </div>
             <br />
            <div class="main-login main-center">
                <div class="row">
                    <asp:GridView ID="grvEmpList" CssClass="table table-striped table-hover" runat="server"
                        AutoGenerateColumns="False" ClientIDMode="Static">
                        <HeaderStyle CssClass="sorting" />
                        <RowStyle CssClass="itemstyletext" />
                        <Columns>
                            <asp:BoundField DataField="Emp_id" HeaderText=" ID" />
                            <asp:BoundField DataField="Emp_name" HeaderText="Employee Name" />
                            <asp:BoundField DataField="Emp_Surname" HeaderText="Surname" />
                            <asp:BoundField DataField="Dept_Name" HeaderText="Department Name" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    </form>
    <script type="text/javascript">
        function OpenWindow(s) {
            try {
                window.open(s);
            } catch (e) {

            }

        }
    </script>
</body>
</html>
