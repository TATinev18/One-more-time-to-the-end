USE [master]
GO
/****** Object:  Database [OMTTTE-db]    Script Date: 6/20/2021 9:05:57 AM ******/
CREATE DATABASE [OMTTTE-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OMTTTE-db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OMTTTE-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OMTTTE-db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OMTTTE-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OMTTTE-db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OMTTTE-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OMTTTE-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OMTTTE-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OMTTTE-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OMTTTE-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [OMTTTE-db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OMTTTE-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OMTTTE-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OMTTTE-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OMTTTE-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OMTTTE-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OMTTTE-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OMTTTE-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OMTTTE-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OMTTTE-db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OMTTTE-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OMTTTE-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OMTTTE-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OMTTTE-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OMTTTE-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OMTTTE-db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OMTTTE-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OMTTTE-db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OMTTTE-db] SET  MULTI_USER 
GO
ALTER DATABASE [OMTTTE-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OMTTTE-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OMTTTE-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OMTTTE-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OMTTTE-db] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OMTTTE-db]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 6/20/2021 9:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Corals]    Script Date: 6/20/2021 9:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [nvarchar](50) NOT NULL,
	[body_shape] [nvarchar](50) NOT NULL,
	[size] [nchar](10) NOT NULL,
	[color] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Corals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EndangeredStatus]    Script Date: 6/20/2021 9:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndangeredStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[coralId] [int] NOT NULL,
	[least_concern] [bit] NOT NULL,
	[near_threatend] [bit] NOT NULL,
	[threatend] [bit] NOT NULL,
	[extinct] [bit] NOT NULL,
 CONSTRAINT [PK_EndangeredStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/20/2021 9:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[age] [tinyint] NULL,
	[city] [varchar](255) NOT NULL,
	[phone] [varchar](255) NULL,
	[email] [nvarchar](64) NOT NULL,
	[password] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [username], [email], [password]) VALUES (1, N'admin', N'admin@abv.bg', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Corals] ON 

INSERT [dbo].[Corals] ([Id], [typeName], [body_shape], [size], [color]) VALUES (1, N'Acropora humilis', N'dome', N'large     ', N'purple    ')
SET IDENTITY_INSERT [dbo].[Corals] OFF
GO
SET IDENTITY_INSERT [dbo].[EndangeredStatus] ON 

INSERT [dbo].[EndangeredStatus] ([Id], [coralId], [least_concern], [near_threatend], [threatend], [extinct]) VALUES (1, 1, 0, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[EndangeredStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [city], [phone], [email], [password]) VALUES (1, N'Kish', N'Radomir', N'Kishishev', 26, N'Burgas', N'(+359) 8827345', N'RKish@abv.bg', N'rkish')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [city], [phone], [email], [password]) VALUES (2, N'BP', N'Borislav', N'Petkov', 19, N'Sofia', N'(+359) 890123432', N'bpetkov@gmail.com', N'neshto')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[EndangeredStatus]  WITH CHECK ADD  CONSTRAINT [FK_EndangeredStatus_Corals] FOREIGN KEY([coralId])
REFERENCES [dbo].[Corals] ([Id])
GO
ALTER TABLE [dbo].[EndangeredStatus] CHECK CONSTRAINT [FK_EndangeredStatus_Corals]
GO
USE [master]
GO
ALTER DATABASE [OMTTTE-db] SET  READ_WRITE 
GO
