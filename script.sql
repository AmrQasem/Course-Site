USE [CourseSite]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/12/2019 11:33:57 AM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 4/12/2019 11:33:57 AM ******/
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
/****** Object:  Table [dbo].[CoursesVideo]    Script Date: 4/12/2019 11:33:57 AM ******/
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
/****** Object:  Table [dbo].[Lessons]    Script Date: 4/12/2019 11:33:57 AM ******/
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
/****** Object:  Table [dbo].[LessonVideos]    Script Date: 4/12/2019 11:33:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonVideos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VideoTitle] [nvarchar](200) NULL,
	[VideoPath] [nvarchar](200) NULL,
	[LessonID] [int] NOT NULL,
 CONSTRAINT [PK_LessonVideos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/12/2019 11:33:57 AM ******/
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
	[IsInstructor] [bit] NULL CONSTRAINT [DF_Users_IsInstructor]  DEFAULT ((0)),
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

INSERT [dbo].[Courses] ([ID], [CourseName], [CourseDescription], [Price], [Duration], [CategoryID], [Instructor]) VALUES (1, N'C#', N'C# is a programming language', 0, 32, 1, N'Amr')
INSERT [dbo].[Courses] ([ID], [CourseName], [CourseDescription], [Price], [Duration], [CategoryID], [Instructor]) VALUES (2, N'C++', N'C++ is a programming language', 0, 30, 1, N'Amr')
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
SET IDENTITY_INSERT [dbo].[LessonVideos] ON 

INSERT [dbo].[LessonVideos] ([ID], [VideoTitle], [VideoPath], [LessonID]) VALUES (1, N'Video One', N'vids\1.mp4', 1)
INSERT [dbo].[LessonVideos] ([ID], [VideoTitle], [VideoPath], [LessonID]) VALUES (2, N'Video Two', N'vids\2.mp4', 1)
INSERT [dbo].[LessonVideos] ([ID], [VideoTitle], [VideoPath], [LessonID]) VALUES (3, N'Video Three', N'vids\2.mp4', 2)
INSERT [dbo].[LessonVideos] ([ID], [VideoTitle], [VideoPath], [LessonID]) VALUES (4, N'Video Four', N'C:\Users\Dev-lap1\Downloads\courses-site-master\courses-site-master\vids\1.mp4', 2)
INSERT [dbo].[LessonVideos] ([ID], [VideoTitle], [VideoPath], [LessonID]) VALUES (5, N'Video Five', N'C:\Users\Dev-lap1\Downloads\courses-site-master\courses-site-master\vids\1.mp4', 3)
INSERT [dbo].[LessonVideos] ([ID], [VideoTitle], [VideoPath], [LessonID]) VALUES (6, N'Video Six', N'C:\Users\Dev-lap1\Downloads\courses-site-master\courses-site-master\vids\1.mp4', 4)
INSERT [dbo].[LessonVideos] ([ID], [VideoTitle], [VideoPath], [LessonID]) VALUES (7, N'Video Seven', N'C:\Users\Dev-lap1\Downloads\courses-site-master\courses-site-master\vids\1.mp4', 4)
SET IDENTITY_INSERT [dbo].[LessonVideos] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName], [IsInstructor]) VALUES (1, N'Amr Qasem', N'amrkasem47@yahoo.com', N'01020807249', N'01020807249', N'Amr', N'Qasem', NULL)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName], [IsInstructor]) VALUES (2, N'Amr Qasaem', N'amrkasem63@gmail.com', N'01020807249', N'01020807249', N'Amr', N'Qasem', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName], [IsInstructor]) VALUES (3, N'taghreedQasem', N'taghreed@yahoo.com', N'01020807249', N'01020807249', N'Taghreed', N'Ahmed', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName], [IsInstructor]) VALUES (4, N'm,Amr', N'm.amr@yahas.com', N'01020807249', N'01020807249', N'mohamed', N'Amr', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName], [IsInstructor]) VALUES (1004, N'TBE', N'tbe@yahoo.com', N'01020807249', N'01020807249', N'test', N'backend', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName], [IsInstructor]) VALUES (1005, N'test1', N'amrkasem47@yahoo.com', N'01020807249', N'01020807249', N'test', N'test', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName], [IsInstructor]) VALUES (1006, N'test1', N'amrkasem47@yahoo.com', N'01020807249', N'01020807249', N'test', N'test', 0)
INSERT [dbo].[Users] ([ID], [UserName], [Email], [Phone], [Password], [FirstName], [LastName], [IsInstructor]) VALUES (1007, N'ahmed samir', N'ahmdsamir@batekha.com', N'01020807249', N'123456789', N'Samir', N'Ahmed', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 4/12/2019 11:33:57 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetCategoryCourses]    Script Date: 4/12/2019 11:33:57 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetCourseDetails]    Script Date: 4/12/2019 11:33:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCourseDetails] 
	-- Add the parameters for the stored procedure here
	@CourseID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.CourseName, c.CourseDescription, c.ID , c.Price, c.Duration, c.[CategoryID], cat.[CategoryName], c.Instructor,
	l.LessonName
	from Courses as c
	inner join [dbo].[Categories] as cat on c.[CategoryID] = cat.[ID]
	inner join [dbo].[Lessons] as l on c.[ID] = l.[CourseID]

	where c.[ID] = @CourseID
END

GO
/****** Object:  StoredProcedure [dbo].[GetCourseLesson]    Script Date: 4/12/2019 11:33:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCourseLesson] 
	-- Add the parameters for the stored procedure here
	@CourseID int

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT l.ID, l.CourseID, l.LessonName, c.CourseName
	From Lessons l
	inner join [dbo].[Courses] as c on l.CourseID = c.[ID]
	where l.CourseID = @CourseID
END

GO
/****** Object:  StoredProcedure [dbo].[GetCoursesByInstructor]    Script Date: 4/12/2019 11:33:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCoursesByInstructor] 
	-- Add the parameters for the stored procedure here
	@InstructorID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dbo].[Courses].[ID], [CourseName], [CourseDescription], [Price], [Duration], [InstructorID], [CategoryID]
	from [dbo].[Courses]
	inner join [dbo].[Users] as u on [dbo].[Courses].[InstructorID] = u.ID

	where [dbo].[Courses].[InstructorID] = @InstructorID
END

GO
/****** Object:  StoredProcedure [dbo].[GetLessonVideos]    Script Date: 4/12/2019 11:33:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLessonVideos] 
	-- Add the parameters for the stored procedure here
	@LessonID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT l.ID, l.LessonName, lv.[VideoTitle],lv.[VideoPath]
	from Lessons  l
	inner join [dbo].[LessonVideos] as lv on l.[ID] = lv.[LessonID]

	where l.[ID] = @LessonID
END

GO
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 4/12/2019 11:33:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByID] 
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	from [dbo].[Users] u
	where u.ID = ID
END

GO
/****** Object:  StoredProcedure [dbo].[GetVideoByCourses]    Script Date: 4/12/2019 11:33:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetVideoByCourses] 
	-- Add the parameters for the stored procedure here
	@CourseID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT lv.[ID], lv.[VideoTitle], lv.VideoPath, l.LessonName, c.CourseName, lv.[LessonID]
	from [dbo].[LessonVideos] lv
	inner join Lessons as l on lv.LessonID = l.ID
	inner join Courses as c on l.CourseID = c.ID

	where c.ID = @CourseID
END

GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 4/12/2019 11:33:57 AM ******/
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
