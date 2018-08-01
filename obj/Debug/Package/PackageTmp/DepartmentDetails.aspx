<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentDetails.aspx.cs"
    Inherits="EmployeeManagement.DepartmentDetails" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet"
        id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="Style/JQuery.js" type="text/javascript"></script>
    <script src="Style/Bootstrap.js" type="text/javascript"></script>
    <link href="Style/Bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="/Style/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet'
        type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    <title>Department Details</title>
</head>
<body>
    <form runat="server">
    <asp:ScriptManager ID="mainScriptManager" EnablePartialRendering="true" runat="server"
        AsyncPostBackTimeout="36000" EnablePageMethods="true">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="upTaxInvoiceDetails" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row main">
                    <div class="panel-heading">
                        <div class="panel-title text-center">
                            <h1 class="title">
                                Employee Management</h1>
                            <hr />
                        </div>
                    </div>
                    <div>
                        <a href="Index.aspx" class="btn btn-default">Home Page</a>
                    </div>
                    <br />
                    <div class="main-login main-center">
                        <div class="form-group">
                            <label class="cols-sm-2 control-label" for="deptname">
                                Department Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i aria-hidden="true" class="fa fa-user fa"></i>
                                    </span>
                                    <asp:TextBox ID="txtDeptName" runat="server" class="form-control" placeholder="Enter Department Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group ">
                            <asp:Button ID="btnAdd" runat="server" class="btn btn-primary" OnClick="btnAdd_Click"
                                Text="Add" />
                        </div>
                        <div class="form-group ">
                            <div class="col-lg-2">
                                <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary" OnClick="btnUpdate_Click"
                                    Text="Update" />
                            </div>
                            <div class="col-lg-2">
                                <asp:Button ID="btnDelete" runat="server" class="btn btn-primary" OnClick="btnDelete_Click"
                                    Text="Delete" />
                            </div>
                        </div>
                        <div class="row">
                            <asp:GridView ID="grvDepartment" CssClass="table table-striped table-hover" runat="server"
                                AutoGenerateColumns="False" ClientIDMode="Static">
                                <HeaderStyle CssClass="sorting" />
                                <RowStyle CssClass="itemstyletext" />
                                <Columns>
                                    <asp:BoundField DataField="Dept_id" HeaderText="ID" />
                                    <asp:BoundField DataField="Dept_Name" HeaderText="Department Name" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    <script type="text/javascript">
        function OpenWindow(s) {
            try {
                window.open(s);
            } catch (e) {

            }

        }
        function Redirect(s) {
            alert(s);
            window.location.reload();
            document.getElementById("txtDeptName").value = "";

        }
    </script>
</body>
</html>
