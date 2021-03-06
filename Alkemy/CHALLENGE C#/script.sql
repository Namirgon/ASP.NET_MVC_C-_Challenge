USE [master]
GO
/****** Object:  Database [College]    Script Date: 7/3/2021 17:43:37 ******/
CREATE DATABASE [College]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'College', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\College.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'College_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\College_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [College] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [College].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [College] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [College] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [College] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [College] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [College] SET ARITHABORT OFF 
GO
ALTER DATABASE [College] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [College] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [College] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [College] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [College] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [College] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [College] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [College] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [College] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [College] SET  DISABLE_BROKER 
GO
ALTER DATABASE [College] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [College] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [College] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [College] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [College] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [College] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [College] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [College] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [College] SET  MULTI_USER 
GO
ALTER DATABASE [College] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [College] SET DB_CHAINING OFF 
GO
ALTER DATABASE [College] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [College] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [College] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [College] SET QUERY_STORE = OFF
GO
USE [College]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [College]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/3/2021 17:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id_Course] [int] IDENTITY(1,1) NOT NULL,
	[Name_Course] [nvarchar](50) NULL,
	[Time_Course] [time](7) NULL,
	[Day] [nvarchar](50) NULL,
	[Id_Teacher] [int] NULL,
	[Maximun_Number_Of_Students] [int] NULL,
	[Detail] [nvarchar](500) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id_Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Student]    Script Date: 7/3/2021 17:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Student](
	[Id_Inscription] [int] IDENTITY(1,1) NOT NULL,
	[Id_Course] [int] NOT NULL,
	[Id_Student] [int] NOT NULL,
 CONSTRAINT [PK_Course_Student] PRIMARY KEY CLUSTERED 
(
	[Id_Inscription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Family]    Script Date: 7/3/2021 17:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Family](
	[Id_Family] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Family] PRIMARY KEY CLUSTERED 
(
	[Id_Family] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 7/3/2021 17:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[Id_module] [int] NOT NULL,
	[Name_Module] [nvarchar](50) NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[Id_module] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patent]    Script Date: 7/3/2021 17:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patent](
	[Id_Patent] [int] IDENTITY(1,1) NOT NULL,
	[Patent_Name] [nvarchar](50) NULL,
	[Id_Module] [int] NOT NULL,
 CONSTRAINT [PK_Patent] PRIMARY KEY CLUSTERED 
(
	[Id_Patent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patent_Family]    Script Date: 7/3/2021 17:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patent_Family](
	[Id_Role] [int] IDENTITY(1,1) NOT NULL,
	[Id_Family] [int] NULL,
	[Id_Patent] [int] NULL,
 CONSTRAINT [PK_Patent_Family] PRIMARY KEY CLUSTERED 
(
	[Id_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/3/2021 17:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id_Student] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Docket] [int] NULL,
	[National_Identity_Document] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IdFamilia] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/3/2021 17:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id_Teacher] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[National_Identity_Document] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id_Teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id_Course], [Name_Course], [Time_Course], [Day], [Id_Teacher], [Maximun_Number_Of_Students], [Detail]) VALUES (1, N'Matematicas I', CAST(N'08:00:00' AS Time), N'Lunes', 1, 25, N'Numeros enteros, Combinatorios, Numeros racionales, Álgebra y funciones. Función lineal. Ecuaciones e inecuaciones lineales en una variable. Ecuación de la recta. Ecuaciones e inecuaciones lineales en dos variables ')
INSERT [dbo].[Course] ([Id_Course], [Name_Course], [Time_Course], [Day], [Id_Teacher], [Maximun_Number_Of_Students], [Detail]) VALUES (2, N'Lengua I', CAST(N'08:00:00' AS Time), N'Martes', 4, 20, N'Los mitos, las leyendas y sus características. Las narraciones y el narrador. El protagonista y el antagonista. Marco. Secuencia narrativa (situación inicial, conflicto y resolución). Dioses, semidioses, héroes. Diferencia entre mito y leyenda')
INSERT [dbo].[Course] ([Id_Course], [Name_Course], [Time_Course], [Day], [Id_Teacher], [Maximun_Number_Of_Students], [Detail]) VALUES (3, N'Geografia', CAST(N'10:00:00' AS Time), N'Viernes', 4, 10, N'America Latina, Ambiente y recursos en América Latina, La inserción de América Latina en la
economía-mundo contemporánea, loques regionales, geopolítica de los
recursos estratégicos y movimientos sociales
de base territorial.')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Course_Student] ON 

INSERT [dbo].[Course_Student] ([Id_Inscription], [Id_Course], [Id_Student]) VALUES (1, 2, 3)
INSERT [dbo].[Course_Student] ([Id_Inscription], [Id_Course], [Id_Student]) VALUES (2, 2, 5)
INSERT [dbo].[Course_Student] ([Id_Inscription], [Id_Course], [Id_Student]) VALUES (3, 2, 1)
SET IDENTITY_INSERT [dbo].[Course_Student] OFF
INSERT [dbo].[Family] ([Id_Family], [Description]) VALUES (1, N'Student')
INSERT [dbo].[Family] ([Id_Family], [Description]) VALUES (2, N'Admin')
INSERT [dbo].[Module] ([Id_module], [Name_Module]) VALUES (1, N'Student')
INSERT [dbo].[Module] ([Id_module], [Name_Module]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Patent] ON 

INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (1, N'1', 1)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (2, N'2', 1)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (3, N'3', 1)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (4, N'4', 1)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (5, N'5', 1)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (6, N'6', 1)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (7, N'1', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (8, N'2', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (9, N'3', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (13, N'7', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (14, N'8', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (15, N'9', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (16, N'10', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (17, N'11', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (18, N'12', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (19, N'13', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (20, N'14', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (21, N'15', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (22, N'16', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (23, N'17', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (25, N'18', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (26, N'19', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (27, N'20', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (28, N'21', 2)
INSERT [dbo].[Patent] ([Id_Patent], [Patent_Name], [Id_Module]) VALUES (29, N'21', 1)
SET IDENTITY_INSERT [dbo].[Patent] OFF
SET IDENTITY_INSERT [dbo].[Patent_Family] ON 

INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (5, 1, 1)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (6, 1, 2)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (7, 1, 3)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (8, 1, 4)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (9, 1, 5)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (10, 1, 6)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (11, 2, 1)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (12, 2, 2)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (13, 2, 3)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (17, 2, 7)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (18, 2, 8)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (19, 2, 9)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (20, 2, 10)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (21, 2, 11)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (22, 2, 12)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (23, 2, 13)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (24, 2, 14)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (25, 2, 15)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (26, 2, 16)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (27, 2, 17)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (28, 2, 18)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (29, 2, 19)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (30, 2, 29)
INSERT [dbo].[Patent_Family] ([Id_Role], [Id_Family], [Id_Patent]) VALUES (31, 2, 20)
SET IDENTITY_INSERT [dbo].[Patent_Family] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id_Student], [Name], [Surname], [Docket], [National_Identity_Document], [Email], [Password], [IdFamilia]) VALUES (1, N'Carlos', N'Alonso', 1, 23788657, N'carlosalonso@gmail.com', N'carlosalonso2020', 1)
INSERT [dbo].[Student] ([Id_Student], [Name], [Surname], [Docket], [National_Identity_Document], [Email], [Password], [IdFamilia]) VALUES (3, N'Juliana', N'Lopez', 3, 34788655, N'julianaLopez@gmail.com', N'julianalopez2020', 1)
INSERT [dbo].[Student] ([Id_Student], [Name], [Surname], [Docket], [National_Identity_Document], [Email], [Password], [IdFamilia]) VALUES (4, N'Natalia', N'Gonzalez ', 4, 29017810, N'namirgon@gmail.com', N'nataliagonzalez2020', 2)
INSERT [dbo].[Student] ([Id_Student], [Name], [Surname], [Docket], [National_Identity_Document], [Email], [Password], [IdFamilia]) VALUES (5, N'Lucia', N'Chiappa', 5, 31000111, N'luciachiapa@gmail.com', N'luciachiapa2020', 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id_Teacher], [Name], [Surname], [National_Identity_Document], [Status]) VALUES (1, N'Olivia', N'Baez', 29111999, N'Activa')
INSERT [dbo].[Teacher] ([Id_Teacher], [Name], [Surname], [National_Identity_Document], [Status]) VALUES (2, N'Carlos', N'Baez', 27890111, N'Activo')
INSERT [dbo].[Teacher] ([Id_Teacher], [Name], [Surname], [National_Identity_Document], [Status]) VALUES (4, N'Marisa', N'Del Carmen', 32333556, N'Activo')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher] FOREIGN KEY([Id_Teacher])
REFERENCES [dbo].[Teacher] ([Id_Teacher])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Teacher]
GO
ALTER TABLE [dbo].[Course_Student]  WITH CHECK ADD  CONSTRAINT [FK_Course_Student_Course] FOREIGN KEY([Id_Course])
REFERENCES [dbo].[Course] ([Id_Course])
GO
ALTER TABLE [dbo].[Course_Student] CHECK CONSTRAINT [FK_Course_Student_Course]
GO
ALTER TABLE [dbo].[Course_Student]  WITH CHECK ADD  CONSTRAINT [FK_Course_Student_Student] FOREIGN KEY([Id_Student])
REFERENCES [dbo].[Student] ([Id_Student])
GO
ALTER TABLE [dbo].[Course_Student] CHECK CONSTRAINT [FK_Course_Student_Student]
GO
ALTER TABLE [dbo].[Patent]  WITH CHECK ADD  CONSTRAINT [FK_Patent_Module] FOREIGN KEY([Id_Module])
REFERENCES [dbo].[Module] ([Id_module])
GO
ALTER TABLE [dbo].[Patent] CHECK CONSTRAINT [FK_Patent_Module]
GO
ALTER TABLE [dbo].[Patent_Family]  WITH CHECK ADD  CONSTRAINT [FK_Patent_Family_Family] FOREIGN KEY([Id_Family])
REFERENCES [dbo].[Family] ([Id_Family])
GO
ALTER TABLE [dbo].[Patent_Family] CHECK CONSTRAINT [FK_Patent_Family_Family]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Family] FOREIGN KEY([IdFamilia])
REFERENCES [dbo].[Family] ([Id_Family])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Family]
GO
USE [master]
GO
ALTER DATABASE [College] SET  READ_WRITE 
GO
