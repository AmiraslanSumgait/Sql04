USE [master]
GO
/****** Object:  Database [Academy2]    Script Date: 11/8/2021 5:38:41 AM ******/
CREATE DATABASE [Academy2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Academy2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Academy2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Academy2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Academy2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Academy2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Academy2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Academy2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Academy2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Academy2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Academy2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Academy2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Academy2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Academy2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Academy2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Academy2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Academy2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Academy2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Academy2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Academy2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Academy2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Academy2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Academy2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Academy2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Academy2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Academy2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Academy2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Academy2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Academy2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Academy2] SET RECOVERY FULL 
GO
ALTER DATABASE [Academy2] SET  MULTI_USER 
GO
ALTER DATABASE [Academy2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Academy2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Academy2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Academy2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Academy2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Academy2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Academy2', N'ON'
GO
ALTER DATABASE [Academy2] SET QUERY_STORE = OFF
GO
USE [Academy2]
GO
/****** Object:  Table [dbo].[Curators]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Financing] [money] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[FacultyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Financing] [money] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsCurators]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsCurators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CuratorId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsLectures]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsLectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LectureId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LectureRoom] [nvarchar](max) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 11/8/2021 5:38:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Salary] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Curators] ON 

INSERT [dbo].[Curators] ([Id], [Name], [Surname]) VALUES (1, N'Jamal', N'Hogan')
INSERT [dbo].[Curators] ([Id], [Name], [Surname]) VALUES (2, N'Kalia', N'Beck')
INSERT [dbo].[Curators] ([Id], [Name], [Surname]) VALUES (3, N'Aaron', N'Ward')
INSERT [dbo].[Curators] ([Id], [Name], [Surname]) VALUES (4, N'Claudia', N'Adkins')
SET IDENTITY_INSERT [dbo].[Curators] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (1, 1600.0000, N'Electrical and Electronic', 1)
INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (2, 2800.0000, N'Computer and information technologies', 2)
INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (3, 1800.0000, N'Mechanical Engineering', 1)
INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (4, 2200.0000, N'Biochemistry', 3)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([Id], [Financing], [Name]) VALUES (1, 2500.0000, N'Engineering')
INSERT [dbo].[Faculties] ([Id], [Financing], [Name]) VALUES (2, 1500.0000, N'Computer Science')
INSERT [dbo].[Faculties] ([Id], [Financing], [Name]) VALUES (3, 2250.0000, N'Biochemistry')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (1, N'G430', 1, 2)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (2, N'P107', 2, 2)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (3, N'P150', 4, 1)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (4, N'C225', 3, 4)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (5, N'F104', 5, 1)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (6, N'F106', 5, 3)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsCurators] ON 

INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (1, 1, 2)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (2, 1, 6)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (3, 2, 1)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (4, 2, 5)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (5, 3, 4)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (6, 3, 1)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (7, 4, 3)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (8, 4, 5)
SET IDENTITY_INSERT [dbo].[GroupsCurators] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsLectures] ON 

INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (1, 2, 1)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (2, 3, 1)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (3, 1, 2)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (4, 5, 2)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (5, 4, 3)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (6, 1, 3)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (7, 3, 4)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (8, 5, 4)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (9, 6, 5)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (10, 2, 6)
INSERT [dbo].[GroupsLectures] ([Id], [LectureId], [GroupId]) VALUES (11, 3, 6)
SET IDENTITY_INSERT [dbo].[GroupsLectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Lectures] ON 

INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (1, N'B103', 3, 1)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (2, N'A101', 3, 6)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (3, N'B102', 2, 5)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (4, N'B105', 4, 3)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (5, N'C105', 1, 2)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (6, N'D104', 1, 4)
SET IDENTITY_INSERT [dbo].[Lectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (1, N'Database Theory')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (4, N'Planetary Environmental Science')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (2, N'Programming')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (3, N'Speech')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [Salary]) VALUES (1, N'Jasper', N'Mckenzie', 556.0000)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [Salary]) VALUES (2, N'Walker', N'Brennan', 623.0000)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [Salary]) VALUES (3, N'Marah', N'Norman', 462.0000)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [Salary]) VALUES (4, N'Gwendolyn', N'Graves', 1207.0000)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [Salary]) VALUES (5, N'Halee', N'Foster', 1311.0000)
INSERT [dbo].[Teachers] ([Id], [Name], [Surname], [Salary]) VALUES (6, N'Samantha', N'Adams', 940.0000)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__737584F6BF9865CF]    Script Date: 11/8/2021 5:38:41 AM ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Facultie__737584F69F98C1F4]    Script Date: 11/8/2021 5:38:41 AM ******/
ALTER TABLE [dbo].[Faculties] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Groups__737584F69F825A87]    Script Date: 11/8/2021 5:38:41 AM ******/
ALTER TABLE [dbo].[Groups] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__737584F639BC3ED3]    Script Date: 11/8/2021 5:38:41 AM ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ((0)) FOR [Financing]
GO
ALTER TABLE [dbo].[Faculties] ADD  DEFAULT ((0)) FOR [Financing]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([CuratorId])
REFERENCES [dbo].[Curators] ([Id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Curators]  WITH CHECK ADD CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Curators]  WITH CHECK ADD CHECK  (([Surname]<>''))
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Financing]>=(0)))
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD CHECK  (([Financing]>=(0)))
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Year]>=(1) AND [Year]<=(5)))
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD CHECK  (([LectureRoom]<>''))
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Name]<>''))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Salary]>(0)))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Surname]<>''))
GO
USE [master]
GO
ALTER DATABASE [Academy2] SET  READ_WRITE 
GO
