<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Index.aspx.cs"
    Inherits="EmployeeManagement.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="Style/JQuery.js" type="text/javascript"></script>
    <script src="Style/Bootstrap.js" type="text/javascript"></script>
    <link href="Style/Bootstrap.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/Style/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet'
        type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    <title>Employee Management</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="container">
            <div class="row">
                <br />
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-body">
                            <h4>
                                <a href="EmployeeList.aspx">Employee Summary </a>
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <div class="panel-body">
                            <h4>
                                <a href="DepartmentDetails.aspx">Department Summary</a></h4>
                        </div>
                    </div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-body">
                            <h4>
                                <a href="EmployeeDetails.aspx">New Employee</a></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
