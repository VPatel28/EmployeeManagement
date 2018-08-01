<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="EmployeeDetails.aspx.cs"
    Inherits="EmployeeManagement.EmployeeDetails" %>

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
    <title>Employee Details</title>
</head>
<body>
    <form id="Form1" runat="server">
    <div class="container">
        <div class="row main">
            <div class="panel-heading">
                <div class="panel-title text-center">
                    <h1 class="title">
                        Employee Management</h1>
                    <hr />
                </div>
            </div>
            <div >
               <a href="Index.aspx" class="btn btn-default">Home Page</a>
            </div>
             
            <div class="main-login main-center">
                <form class="form-horizontal" method="post" action="#">
                <div class="form-group">
                    <label for="name" class="cols-sm-2 control-label">
                        Employee Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox ID="txtEmpName" runat="server" class="form-control" placeholder="Enter your Name"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="surname" class="cols-sm-2 control-label">
                        Employee Surname</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox ID="txtSurname" runat="server" class="form-control" placeholder="Enter your Surname"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Address" class="cols-sm-2 control-label">
                        Address</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Enter your Address"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Qualification" class="cols-sm-2 control-label">
                        Qualification</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox ID="txtQualification" runat="server" class="form-control" placeholder="Enter your Qualification"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ContactNum" class="cols-sm-2 control-label">
                        Contact Number</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i>
                            </span>
                            <asp:TextBox ID="txtContactNum" runat="server" class="form-control" placeholder="Enter your Contact Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Dept" class="cols-sm-2 control-label">
                        Department
                    </label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i>
                            </span>
                            <asp:DropDownList ID="ddlDept" class="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-primary" Text="Add" OnClick="btnAdd_Click" />
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
                </form>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
