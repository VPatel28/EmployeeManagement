USE [master]
GO
/****** Object:  Database [EmployeeManagement]    Script Date: 8/1/2018 3:07:55 AM ******/
CREATE DATABASE [EmployeeManagement]
GO
ALTER DATABASE [EmployeeManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmployeeManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmployeeManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeManagement] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EmployeeManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EmployeeManagement]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/1/2018 3:07:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Dept_Name] [varchar](100) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK__Departme__72A8C6A410C64F0E] PRIMARY KEY CLUSTERED 
(
	[Dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/1/2018 3:07:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Emp_name] [varchar](50) NOT NULL,
	[Emp_Surname] [varchar](50) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Qualification] [varchar](50) NULL,
	[Contact_number] [numeric](12, 0) NULL,
	[Dept_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Dept_id], [Dept_Name], [CreatedOn]) VALUES (5, N'Account', CAST(N'2018-08-01 02:45:00.000' AS DateTime))
INSERT [dbo].[Department] ([Dept_id], [Dept_Name], [CreatedOn]) VALUES (7, N'Account 2', CAST(N'2018-08-01 02:48:00.000' AS DateTime))
INSERT [dbo].[Department] ([Dept_id], [Dept_Name], [CreatedOn]) VALUES (8, N'IT dept', CAST(N'2018-08-01 02:49:00.000' AS DateTime))
INSERT [dbo].[Department] ([Dept_id], [Dept_Name], [CreatedOn]) VALUES (9, N'Implementation', CAST(N'2018-08-01 02:50:00.000' AS DateTime))
INSERT [dbo].[Department] ([Dept_id], [Dept_Name], [CreatedOn]) VALUES (10, N'System Admin', CAST(N'2018-08-01 02:54:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Emp_id], [Emp_name], [Emp_Surname], [Address], [Qualification], [Contact_number], [Dept_Id]) VALUES (1, N'Test 1', N'User N a', N'Address 12', N'Bechlors', CAST(875457878 AS Numeric(12, 0)), 7)
INSERT [dbo].[Employee] ([Emp_id], [Emp_name], [Emp_Surname], [Address], [Qualification], [Contact_number], [Dept_Id]) VALUES (2, N'Test 2', N'User Name', N'Address 12', N'Masters', CAST(875878 AS Numeric(12, 0)), 10)
SET IDENTITY_INSERT [dbo].[Employee] OFF
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department] ([Dept_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
/****** Object:  StoredProcedure [dbo].[DepartmentSIUD]    Script Date: 8/1/2018 3:07:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[DepartmentSIUD]    Script Date: 7/31/2018 11:58:36 PM ******/

CREATE PROCEDURE [dbo].[DepartmentSIUD]
	@Dept_id bigint=null,
	@Dept_Name varchar(50)=null,
	@CreatedOn varchar(50)=null,
	@Cmd_Name varchar(40)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
--	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	if @Cmd_Name ='SelectAllDepartment'
	begin
		Select * from Department
	end

	if @Cmd_Name ='InsertDepartment'
	begin
		insert into Department values(@Dept_Name,@CreatedOn)
	end

	if @Cmd_Name ='SelectSingleDepartment'
	begin
		Select * from Department where Dept_Id =@Dept_id
	end

	if @Cmd_Name ='UpdateSingleDepartment'
	begin
		Update Department set Dept_Name=@Dept_Name where Dept_Id =@Dept_id
	end

	if @Cmd_Name ='DeleteDepartment'
	begin
		Delete from Department where Dept_id=@Dept_id
	end
END

GO
/****** Object:  StoredProcedure [dbo].[EmployeeSIUD]    Script Date: 8/1/2018 3:07:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmployeeSIUD]
	@Emp_id bigint=null,
	@Emp_name varchar(50)=null,
	@Emp_Surname varchar(50)=null,
	@Address nvarchar(200)=null,
	@Qualification varchar(50)=null,
	@Contact_number numeric(10)=null,
	@Dept_Id bigint=null,
	@Cmd_Name varchar(40)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	if @Cmd_Name ='SelectAllEmployee'
	begin
		Select *,Dept.Dept_Name from Employee Emp INNER JOIN Department Dept ON Emp.Dept_Id= Dept.Dept_id
	end

	if @Cmd_Name ='InsertEmployee'
	begin
		insert into Employee values(@Emp_name,@Emp_Surname,@Address,@Qualification,@Contact_number,@Dept_Id)
	end

	if @Cmd_Name ='UpdateEmployee'
	begin
		Update Employee set Emp_name=@Emp_name,Emp_Surname=@Emp_Surname,Address=@Address,Qualification=@Qualification,Contact_number=@Contact_number,
		Dept_Id=@Dept_Id where Emp_id=@Emp_id
	end

	if @Cmd_Name ='SelectSingleEmployee'
	begin
		Select * from Employee where Emp_id =@Emp_id
	end

	if @Cmd_Name ='DeleteEmployee'
	begin
		Delete from Employee where Emp_id=@Emp_id
	end
END

GO
USE [master]
GO
ALTER DATABASE [EmployeeManagement] SET  READ_WRITE 
GO
