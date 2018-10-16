USE [master]
GO
/****** Object:  Database [CourseSite]    Script Date: 9/12/2018 9:57:06 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 9/12/2018 9:57:06 PM ******/
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
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName]) VALUES (1, N'AmrQasem', N'amrkasem47@yahoo.com', N'01020807249', N'01020807249', N'Amr', N'Qasem')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 9/12/2018 9:57:06 PM ******/
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
	@UserName Nvarchar(100),
	@Password Nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Users.ID , Users.UserName
	from Users
	where Users.UserName = @UserName and Users.Password = @Password
END


GO
USE [master]
GO
ALTER DATABASE [CourseSite] SET  READ_WRITE 
GO
