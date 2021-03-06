USE [master]
GO
/****** Object:  Database [OMTTTE-db]    Script Date: 6/28/2021 7:48:37 PM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 6/28/2021 7:48:37 PM ******/
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
/****** Object:  Table [dbo].[Corals]    Script Date: 6/28/2021 7:48:37 PM ******/
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
	[description] [nvarchar](350) NULL,
	[images] [varchar](50) NULL,
 CONSTRAINT [PK_Corals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EndangeredStatus]    Script Date: 6/28/2021 7:48:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EndangeredStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[coralId] [int] NOT NULL,
	[least_concern] [bit] NULL,
	[near_threatend] [bit] NULL,
	[threatend] [bit] NULL,
	[extinct] [bit] NULL,
 CONSTRAINT [PK_EndangeredStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/28/2021 7:48:37 PM ******/
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
	[email] [nvarchar](64) NOT NULL,
	[password] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [username], [email], [password]) VALUES (3, N'admin', N'admin@admin.bg', N'12345678')
INSERT [dbo].[Admin] ([Id], [username], [email], [password]) VALUES (4, N'beta-admin', N'beta_admin@test.test', N'00000000')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Corals] ON 

INSERT [dbo].[Corals] ([Id], [typeName], [body_shape], [size], [color], [description], [images]) VALUES (1, N'Acropora humilis', N'dome', N'large     ', N'purple    ', N'The species is found in digitate colonies of thick tapering branches. The branches contain one or more axial corallites that are large and dome-shaped, and either incipient axial corallites or branchlets at their bases.', N'acropora-humilis.jpg')
INSERT [dbo].[Corals] ([Id], [typeName], [body_shape], [size], [color], [description], [images]) VALUES (2, N'Staghorn coral', N'cylindrical ', N'large     ', N'yellow    ', N'The staghorn coral (Acropora cervicornis) is a branching, stony coral with cylindrical branches ranging from a few centimetres to over two metres in length and height. It occurs in back reef and fore reef environments from 0 to 30 m depth. Staghorn coral is found throughout the Florida Keys, the Bahamas, and the Caribbean islands.', N'staghorn-coral.jpg')
INSERT [dbo].[Corals] ([Id], [typeName], [body_shape], [size], [color], [description], [images]) VALUES (3, N'Pillar coral', N'pillar', N'medium    ', N'brown     ', N'Pillar corals are found in the warmer parts of the western Atlantic Ocean and the Caribbean Sea. They form an encrusted base from which grow vertical cylindrical, round-ended columns. This coral can grow to a height of 3 m with pillars more than 10 cm wide but is usually smaller than this. ', N'pillar-coral.jpg')
SET IDENTITY_INSERT [dbo].[Corals] OFF
GO
SET IDENTITY_INSERT [dbo].[EndangeredStatus] ON 

INSERT [dbo].[EndangeredStatus] ([Id], [coralId], [least_concern], [near_threatend], [threatend], [extinct]) VALUES (1, 1, NULL, 1, NULL, NULL)
INSERT [dbo].[EndangeredStatus] ([Id], [coralId], [least_concern], [near_threatend], [threatend], [extinct]) VALUES (2, 2, NULL, NULL, 1, NULL)
INSERT [dbo].[EndangeredStatus] ([Id], [coralId], [least_concern], [near_threatend], [threatend], [extinct]) VALUES (3, 3, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[EndangeredStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (1, N'Kisha123', N'Radomir', N'Kishishev', 23, N'RKish@abv.bg', N'f2831601b1429a2692add6ac150c6992989607caa6ea8599af73134d9cbf871d')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (7, N'Borkata', N'Borislav', N'Petkov', 28, N'bpetkov@gmail.com', N'1eb7e1dd732e4104a3a15717685ebdd8ea4fc30b8b7b72906c136190a1fb0659')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (8, N'GreyCoral', N'Dimitur', N'Malinov', 19, N'dimmalin@yahoo.com', N'fc4708f4bada3697b860fb5b0ebc57ec448a6e7f3d1d618063d0e753faf0fcb3')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (22, N'Asim1234', N'Gito', N'Asmanov', 54, N'gitoasmanov@gmail.bg', N'49b373cae9725a2d1bccf0d64ba282f558acdc13a3ad09734c0a368d7b17eeeb')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (23, N'georgisk', N'Georgi', N'Kalchev', 17, N'georgikalchev04@abv.bg', N'be4ca9e86be73eecafcd0e033f8e7e91b267e14375d034fae659dce9d2bb0520')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (24, N'MirageSpyral', N'Anton', N'Animanov', 23, N'antonanimanov@abv.bg', N'28c1c2923a62f814e731335edd37af445fdf2b8aab4d1014d7462b33616734b5')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (25, N'MrSeaTurtle', N'Mihail', N'Arabajiev', 15, N'mishoevelik@abv.bg', N'2bc9b7f74df5874f63416b78b5e375d904b0767edc16cbb4a9663159c81d4d59')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (30, N'TrainingSing', N'Galin', N'Osmanov', 33, N'galinosman0v@gmail.com', N'817ea140cfe359c98f2020e5701f45f2bbd9c511969c44c29425d41c1b3443c3')
INSERT [dbo].[Users] ([Id], [username], [first_name], [last_name], [age], [email], [password]) VALUES (31, N'Coral123', N'Kristiqn', N'Kristiqnov', 23, N'kkkristiqnov@abv.bg', N'b6ffcde62ab8102de7f70b9618defa20914e75b4426be3e7036b7bfb270e27a4')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[EndangeredStatus]  WITH CHECK ADD  CONSTRAINT [FK_EndangeredStatus_Corals] FOREIGN KEY([coralId])
REFERENCES [dbo].[Corals] ([Id])
GO
ALTER TABLE [dbo].[EndangeredStatus] CHECK CONSTRAINT [FK_EndangeredStatus_Corals]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [CK_Admin_email] CHECK  (([email] like '%__@__%.__%'))
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [CK_Admin_email]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [CK_Admin_password] CHECK  ((len([password])>=(8)))
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [CK_Admin_password]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [CK_Admin_username] CHECK  ((len([username])>=(5) AND len([username])<(13)))
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [CK_Admin_username]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_age] CHECK  (([age]<=(110)))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_age]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_email] CHECK  (([email] like '%__@__%.__%'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_email]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_password] CHECK  ((len([password])>=(8) AND len([password])<=(256)))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_password]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_username] CHECK  ((len([username])>=(6) AND len([username])<=(14)))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_username]
GO
USE [master]
GO
ALTER DATABASE [OMTTTE-db] SET  READ_WRITE 
GO
