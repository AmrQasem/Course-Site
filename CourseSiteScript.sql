USE [master]
GO
/****** Object:  Database [CourseSite]    Script Date: 10/16/2018 5:31:02 PM ******/
CREATE DATABASE [CourseSite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourseSite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CourseSite.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CourseSite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CourseSite_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CourseSite] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourseSite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourseSite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourseSite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourseSite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourseSite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourseSite] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourseSite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CourseSite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourseSite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourseSite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourseSite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourseSite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourseSite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourseSite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourseSite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourseSite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CourseSite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourseSite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourseSite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourseSite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourseSite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourseSite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourseSite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourseSite] SET RECOVERY FULL 
GO
ALTER DATABASE [CourseSite] SET  MULTI_USER 
GO
ALTER DATABASE [CourseSite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourseSite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourseSite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourseSite] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CourseSite] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CourseSite', N'ON'
GO
USE [CourseSite]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/16/2018 5:31:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/16/2018 5:31:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](200) NULL,
	[CourseDescription] [nvarchar](2000) NULL,
	[Price] [int] NULL,
	[Duration] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Instructor] [nvarchar](200) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoursesVideo]    Script Date: 10/16/2018 5:31:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursesVideo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Videos] [nvarchar](200) NOT NULL,
	[LessonID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_CoursesVideo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 10/16/2018 5:31:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LessonName] [nvarchar](200) NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/16/2018 5:31:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Phone] [nvarchar](200) NULL,
	[Password] [nvarchar](2000) NOT NULL,
	[FirstName] [nvarchar](2000) NULL,
	[LastName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [CategoryName], [CourseID]) VALUES (1, N'Programming Language', 1)
INSERT [dbo].[Categories] ([ID], [CategoryName], [CourseID]) VALUES (2, N'Science', 2)
INSERT [dbo].[Categories] ([ID], [CategoryName], [CourseID]) VALUES (3, N'Languages', 3)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([ID], [CourseName], [CourseDescription], [Price], [Duration], [CategoryID], [Instructor]) VALUES (1, N'C#', N'C# is a high level Programming language', 0, 32, 1, N'Amr')
INSERT [dbo].[Courses] ([ID], [CourseName], [CourseDescription], [Price], [Duration], [CategoryID], [Instructor]) VALUES (2, N'Physics', N'New Physics', 0, 30, 2, N'Amr')
INSERT [dbo].[Courses] ([ID], [CourseName], [CourseDescription], [Price], [Duration], [CategoryID], [Instructor]) VALUES (3, N'English', N'Languages', 0, 20, 3, N'Amr')
INSERT [dbo].[Courses] ([ID], [CourseName], [CourseDescription], [Price], [Duration], [CategoryID], [Instructor]) VALUES (5, N'C++', N'C# is a high level Programming language', 0, 22, 1, N'Amr')
INSERT [dbo].[Courses] ([ID], [CourseName], [CourseDescription], [Price], [Duration], [CategoryID], [Instructor]) VALUES (6, N'Python', N'C# is a high level Programming language', 0, 44, 1, N'Amr')
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[CoursesVideo] ON 

INSERT [dbo].[CoursesVideo] ([ID], [Videos], [LessonID], [CourseID]) VALUES (1, N'First', 1, 1)
INSERT [dbo].[CoursesVideo] ([ID], [Videos], [LessonID], [CourseID]) VALUES (2, N'Seconed', 2, 1)
INSERT [dbo].[CoursesVideo] ([ID], [Videos], [LessonID], [CourseID]) VALUES (3, N'Third', 3, 1)
SET IDENTITY_INSERT [dbo].[CoursesVideo] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([ID], [LessonName], [CourseID]) VALUES (1, N'Lesson 1', 1)
INSERT [dbo].[Lessons] ([ID], [LessonName], [CourseID]) VALUES (2, N'Lesson 2', 1)
INSERT [dbo].[Lessons] ([ID], [LessonName], [CourseID]) VALUES (3, N'Lesson 3', 1)
INSERT [dbo].[Lessons] ([ID], [LessonName], [CourseID]) VALUES (4, N'Lesson 4', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName]) VALUES (1, N'AmrQasem', N'amrkasem47@yahoo.com', N'01020807249', N'01020807249', N'Amr', N'Qasem')
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName]) VALUES (2, N'Amr Qasaem', N'amrkasem63@gmail.com', N'01020807249', N'01020807249', N'Amr', N'Qasem')
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName]) VALUES (3, N'taghreedQasem', N'taghreed@yahoo.com', N'01020807249', N'01020807249', N'Taghreed', N'Ahmed')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 10/16/2018 5:31:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCategories] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT cat.ID, cat.CategoryName, cat.CourseID , c.CourseName, c.Duration, c.Instructor
	from [dbo].[Categories] as cat
	inner join [dbo].[Courses] as c on c.ID = cat.CourseID
END

GO
/****** Object:  StoredProcedure [dbo].[GetCategoryCourses]    Script Date: 10/16/2018 5:31:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoryCourses] 
	-- Add the parameters for the stored procedure here
	@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.CourseName, c.CourseDescription, c.ID , c.Price, c.Duration, c.[CategoryID], cat.[CategoryName], c.Instructor
	from Courses as c
	inner join [dbo].[Categories] as cat on c.[CategoryID] = cat.[ID]
	where c.[CategoryID] = @CategoryID
END

GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 10/16/2018 5:31:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin] 
	-- Add the parameters for the stored procedure here
	@Email Nvarchar(100),
	@Password Nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Users.ID , Users.UserName
	from Users
	where Users.Email = @Email and Users.Password = @Password
END


GO
USE [master]
GO
ALTER DATABASE [CourseSite] SET  READ_WRITE 
GO
