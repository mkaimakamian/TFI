USE [master]
GO
/****** Object:  Database [ubiquicity]    Script Date: 29/9/2018 07:29:22 ******/
CREATE DATABASE [ubiquicity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ubiquicity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ubiquicity.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ubiquicity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ubiquicity_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ubiquicity] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ubiquicity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ubiquicity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ubiquicity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ubiquicity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ubiquicity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ubiquicity] SET ARITHABORT OFF 
GO
ALTER DATABASE [ubiquicity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ubiquicity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ubiquicity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ubiquicity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ubiquicity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ubiquicity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ubiquicity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ubiquicity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ubiquicity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ubiquicity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ubiquicity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ubiquicity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ubiquicity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ubiquicity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ubiquicity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ubiquicity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ubiquicity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ubiquicity] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ubiquicity] SET  MULTI_USER 
GO
ALTER DATABASE [ubiquicity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ubiquicity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ubiquicity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ubiquicity] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ubiquicity] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ubiquicity] SET QUERY_STORE = OFF
GO
USE [ubiquicity]
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
USE [ubiquicity]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[city] [varchar](50) NULL,
	[countryISO] [varchar](50) NULL,
	[id] [int] NOT NULL,
	[line1] [varchar](50) NULL,
	[line2] [varchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[authorId] [int] NOT NULL,
	[content] [varchar](50) NULL,
	[deleted] [bit] NULL,
	[postDate] [date] NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppLink]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppLink](
	[code] [varchar](50) NOT NULL,
	[isLinked] [bit] NOT NULL,
	[userId] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_AppLink] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessType]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessType](
	[description] [varchar](50) NULL,
	[name] [varchar](50) NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_BusinessType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[firstName] [varchar](50) NOT NULL,
	[last] [date] NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[number] [varchar](50) NOT NULL,
	[security] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditNote]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditNote](
	[amount] [float] NOT NULL,
	[issuedDate] [date] NOT NULL,
	[observation] [varchar](50) NOT NULL,
	[status] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_CreditNote] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditNoteApprovalLevel]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditNoteApprovalLevel](
	[approverRoleId] [int] NOT NULL,
	[max] [float] NOT NULL,
	[min] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_CreditNoteApprovalLevel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[billingAddressId] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[total] [float] NOT NULL,
	[transactionState] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[id] [int] NOT NULL,
	[creditNoteId] [int] NULL,
	[cardId] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceItem]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceItem](
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[resourceId] [int] NOT NULL,
	[id] [int] NOT NULL,
	[invoiceId] [int] NOT NULL,
 CONSTRAINT [PK_InvoiceItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[available] [bit] NOT NULL,
	[price] [float] NOT NULL,
	[resourceId] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Label]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Label](
	[description] [varchar](50) NULL,
	[id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Label] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[name] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogEntry]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEntry](
	[created] [datetime] NOT NULL,
	[description] [varchar](250) NOT NULL,
	[entity] [varchar](50) NOT NULL,
	[logLevel] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LogEntry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mailing]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mailing](
	[disclamer] [varchar](50) NOT NULL,
	[filters] [varchar](50) NOT NULL,
	[imagePath] [varchar](50) NOT NULL,
	[lastEditorId] [int] NOT NULL,
	[preface] [varchar](50) NOT NULL,
	[reviewerId] [int] NOT NULL,
	[subject] [varchar](50) NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Mailing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Map]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Map](
	[sourcePath] [varchar](250) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sourceId] [int] NOT NULL,
 CONSTRAINT [PK_Map] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsAddressee]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsAddressee](
	[active] [bit] NOT NULL,
	[dropout] [date] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[singup] [date] NOT NULL,
 CONSTRAINT [PK_NewsAddressee] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[description] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urlAccess] [varchar](50) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalInformation]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalInformation](
	[birthday] [date] NOT NULL,
	[countryId] [int] NOT NULL,
	[description] [int] NOT NULL,
	[id] [int] NOT NULL,
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_PersonalInformation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[description] [varchar](50) NOT NULL,
	[discount] [int] NOT NULL,
	[endDate] [date] NOT NULL,
	[item] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[paused] [bit] NOT NULL,
	[startDate] [date] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion_Item]    Script Date: 29/9/2018 07:29:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion_Item](
	[promotionId] [int] NOT NULL,
	[itemId] [int] NOT NULL,
 CONSTRAINT [PK_Promotion_Item] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC,
	[promotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Redeem]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Redeem](
	[benefit] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[expired] [bit] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Redeem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RedeemCode]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedeemCode](
	[code] [varchar](50) NOT NULL,
	[userId] [int] NOT NULL,
	[id] [int] NOT NULL,
	[redeemId] [int] NOT NULL,
 CONSTRAINT [PK_RedeemCode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[image] [varchar](250) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[description] [varchar](250) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[forweb] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Permission]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Permission](
	[roleId] [int] NOT NULL,
	[permissionId] [int] NOT NULL,
 CONSTRAINT [PK_Role_Permission_1] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC,
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[elapsedHours] [int] NOT NULL,
	[paused] [bit] NOT NULL,
	[since] [date] NOT NULL,
	[source] [varchar](50) NOT NULL,
	[totalHours] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[labelId] [varchar](50) NOT NULL,
	[translation] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[active] [bit] NOT NULL,
	[languageId] [int] NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[lastupdate] [smalldatetime] NOT NULL,
	[locked] [bit] NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[userId] [int] NOT NULL,
	[roleId] [int] NOT NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Label] ([description], [id]) VALUES (N'No', N'lblNo')
INSERT [dbo].[Label] ([description], [id]) VALUES (N'Si', N'lblYes')
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([name], [id]) VALUES (N'Español', 1)
INSERT [dbo].[Language] ([name], [id]) VALUES (N'Inglés', 2)
SET IDENTITY_INSERT [dbo].[Language] OFF
SET IDENTITY_INSERT [dbo].[LogEntry] ON 

INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T21:54:05.520' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:36:13.717' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:36:13.757' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'k', 3, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:36:37.377' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 4, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:36:37.380' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 5, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:36:41.443' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'k', 6, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:36:41.457' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 7, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:36:54.377' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 8, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:36:54.377' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 9, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:37:50.183' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 10, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-08-31T22:37:50.197' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 11, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:02:11.427' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1002, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:02:11.437' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1003, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:12:24.910' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1004, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:12:24.910' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1005, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:13:32.990' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'k', 1006, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:13:32.990' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1007, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:13:39.953' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1008, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:16:15.487' AS DateTime), N'El usuario ff no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 1009, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:18:07.767' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1010, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:18:07.767' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1011, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:18:15.400' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1012, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:24:35.120' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1013, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:24:35.120' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1014, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:25:50.413' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1015, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:25:50.417' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1016, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:27:19.117' AS DateTime), N'El usuario u no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 1017, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:28:02.967' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1018, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:28:59.870' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1019, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:30:07.480' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1020, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:31:23.457' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1021, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:32:09.600' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1022, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:33:28.247' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1023, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:34:54.683' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1024, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:35:36.387' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1025, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T19:38:04.167' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1026, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T20:27:47.750' AS DateTime), N'El usuario apado no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 1027, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T20:28:23.787' AS DateTime), N'éxito', N'BL.SessionManager', N'INFO', N'unknown', 1028, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-03T20:35:48.557' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 1029, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T18:27:50.250' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2002, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T18:27:50.280' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2003, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:07:47.290' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2004, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:09:11.917' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2005, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:11:18.903' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2006, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:11:49.667' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2007, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:35:46.147' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2008, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:35:46.150' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2009, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:36:24.423' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2010, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:36:24.427' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2011, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:38:28.827' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2012, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:38:28.830' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2013, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:38:38.007' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2014, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-05T19:38:48.597' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2015, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:10:59.657' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2016, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:10:59.663' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2017, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:10:59.663' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2018, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:10:59.720' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2019, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:10:59.723' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2020, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:13:44.457' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2021, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:13:48.443' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2022, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:15:27.273' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2023, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:15:27.277' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2024, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:15:27.280' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2025, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:15:27.280' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2026, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:15:27.297' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2027, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:17:39.553' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2028, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:17:39.553' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2029, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:17:39.573' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2030, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:17:39.603' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2031, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:17:39.607' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2032, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:18:38.650' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2033, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:18:38.650' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2034, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:18:38.670' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2035, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:18:38.673' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2036, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:18:38.673' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2037, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:22:01.733' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2038, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:22:01.733' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2039, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:22:01.737' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2040, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:22:01.820' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2041, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T21:22:01.823' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2042, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T22:50:35.643' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 2043, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T22:58:20.670' AS DateTime), N'El usuario ya existe.', N'BL.UserManager', N'WARNING', N'unknown', 2044, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T22:58:32.730' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2045, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-06T22:59:23.300' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2046, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:22:34.053' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2047, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:26:18.177' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2048, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:31:52.730' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2049, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:32:43.547' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2050, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:32:44.290' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2051, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:35:50.403' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2052, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:38:12.990' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2053, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:38:31.033' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2054, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T18:41:13.167' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2055, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T19:00:13.793' AS DateTime), N'El usuario m no está bloqueado.', N'BL.SessionManager', N'WARNING', N'unknown', 2056, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T19:04:48.317' AS DateTime), N'Usuaerio m identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2057, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T19:07:40.793' AS DateTime), N'Usuaerio m identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2058, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T19:15:00.853' AS DateTime), N'El usuario ya existe.', N'BL.UserManager', N'WARNING', N'unknown', 2059, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T19:20:34.883' AS DateTime), N'El usuario ya existe.', N'BL.UserManager', N'WARNING', N'unknown', 2060, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T20:55:43.883' AS DateTime), N'El usuario h no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2061, N'LogIn')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T20:58:47.567' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2062, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T20:59:05.363' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2063, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T20:59:05.437' AS DateTime), N'El usuario h no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2064, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T20:59:13.233' AS DateTime), N'El usuario h no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2065, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:00:13.933' AS DateTime), N'El mail se encuentra en uso.', N'BL.UserManager', N'WARNING', N'unknown', 2066, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:00:24.023' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2067, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:00:38.943' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2068, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:01:20.963' AS DateTime), N'El mail se encuentra en uso.', N'BL.UserManager', N'WARNING', N'unknown', 2069, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:02:51.003' AS DateTime), N'El usuario ya existe.', N'BL.UserManager', N'WARNING', N'unknown', 2070, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:04:51.063' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2071, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:08:44.407' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2072, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:09:11.743' AS DateTime), N'El usuario ya existe.', N'BL.UserManager', N'WARNING', N'unknown', 2073, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:09:18.470' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2074, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:09:24.090' AS DateTime), N'El usuario ya existe.', N'BL.UserManager', N'WARNING', N'unknown', 2075, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:10:55.540' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2076, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:37:10.493' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2077, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:37:10.500' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2078, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:51:11.783' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2079, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:51:19.657' AS DateTime), N'El usuario z no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2080, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:55:16.967' AS DateTime), N'El usuario z no está bloqueado.', N'BL.SessionManager', N'WARNING', N'unknown', 2081, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:57:31.567' AS DateTime), N'Usuaerio z identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2082, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:58:29.740' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 2083, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T21:59:50.420' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2084, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T22:42:23.003' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2085, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T22:42:23.020' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2086, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T22:55:48.593' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2087, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T22:59:55.403' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2088, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T23:03:51.603' AS DateTime), N'Usuaerio q identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2089, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T23:09:52.710' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2090, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T23:09:52.710' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2091, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T23:09:52.713' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2092, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T23:09:52.720' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2093, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-07T23:09:52.773' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2094, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T00:57:13.333' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2095, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T00:57:13.337' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2096, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T00:57:13.337' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2097, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T00:57:13.397' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2098, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T00:57:13.397' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2099, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:22.830' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2100, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:22.830' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2101, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:22.853' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2102, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:22.853' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2103, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:22.857' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2104, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:51.423' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2105, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:55.250' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2106, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:58.533' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2107, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:58.533' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2108, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:22:58.537' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2109, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:25:57.920' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2110, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:25:57.923' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2111, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:25:57.927' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2112, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:25:57.927' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2113, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:25:57.953' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2114, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:30:43.750' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2115, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:30:43.753' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2116, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:30:43.753' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2117, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:30:43.780' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2118, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:30:43.780' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2119, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:32:47.330' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2120, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:32:47.333' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2121, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:32:47.380' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2122, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:32:47.380' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2123, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:32:47.383' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2124, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:44:00.270' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2125, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:44:00.273' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2126, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:44:00.320' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2127, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:44:00.347' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2128, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:44:00.350' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2129, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T01:44:30.980' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2130, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:07:01.347' AS DateTime), N'Debe completarse el nombre del rol.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2131, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:07:03.940' AS DateTime), N'El rol debe estar asociado a almenos un permiso.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2132, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:10:15.397' AS DateTime), N'Debe completarse el nombre del rol.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2133, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:10:15.413' AS DateTime), N'El rol debe estar asociado a almenos un permiso.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2134, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:11:34.183' AS DateTime), N'Debe completarse el nombre del rol.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2135, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:11:34.187' AS DateTime), N'El rol debe estar asociado a almenos un permiso.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2136, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:11:48.520' AS DateTime), N'El rol debe estar asociado a almenos un permiso.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2137, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:14:52.853' AS DateTime), N'Ya existe un rol con ese nombre.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2138, N'Save')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T02:24:52.253' AS DateTime), N'Ya existe un rol con ese nombre.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2139, N'Save')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T09:20:06.070' AS DateTime), N'Debe completarse el nombre del rol.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2140, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T09:20:06.073' AS DateTime), N'El rol debe estar asociado a almenos un permiso.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2141, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T09:33:26.573' AS DateTime), N'El rol debe estar asociado a almenos un permiso.', N'BL.RoleManager', N'CRITICAL', N'unknown', 2142, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T09:33:35.433' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2143, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T09:33:35.433' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2144, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T13:00:29.070' AS DateTime), N'El usuario q no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2145, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T13:00:41.067' AS DateTime), N'El usuario z no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2146, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T13:01:41.767' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2147, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T13:01:41.787' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2148, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T13:01:41.883' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2149, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T15:51:08.887' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2150, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T15:56:05.753' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2151, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T15:56:37.130' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2152, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:16:35.883' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2153, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:19:35.767' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2154, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:20:53.893' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2155, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:23:00.600' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2156, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:31:18.883' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2157, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:35:01.243' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2158, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:36:47.480' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2159, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:38.540' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2160, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:38.543' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2161, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:38.577' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2162, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:38.577' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2163, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:38.580' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2164, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:38.583' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2165, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:38.587' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2166, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:38.587' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2167, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:45.530' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2168, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:52.760' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2169, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:52.820' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2170, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:52.823' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2171, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:52.823' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2172, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:52.827' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2173, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:52.830' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2174, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:52.830' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2175, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:52.830' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2176, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:59.260' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2177, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:59.303' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2178, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:59.307' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2179, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:59.307' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2180, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:59.307' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2181, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:59.310' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2182, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:59.310' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2183, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:40:59.310' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2184, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:41:03.457' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2185, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:41:03.457' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2186, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:41:03.463' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2187, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:41:03.463' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2188, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:41:03.463' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2189, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:41:03.467' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2190, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:41:03.467' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2191, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:41:03.490' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2192, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:01.587' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2193, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:01.597' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2194, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:01.600' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2195, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:01.600' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2196, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:01.600' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2197, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:01.630' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2198, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:01.633' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2199, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:01.633' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2200, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:13.170' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2201, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:13.173' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2202, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:13.190' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2203, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:13.193' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2204, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:13.193' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2205, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:13.197' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2206, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:13.197' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2207, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:13.197' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 2208, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T16:42:22.477' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2209, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:00:01.733' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2210, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:01:22.617' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2211, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:02:19.253' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2212, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:02:19.360' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2213, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:03:02.863' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2214, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:03:02.867' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2215, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:04:41.953' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2216, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:08:13.183' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2217, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:08:20.927' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2218, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:08:25.823' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2219, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:08:39.177' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2220, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:18:11.247' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2221, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:25:46.120' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2222, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:26:23.300' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2223, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:26:23.353' AS DateTime), N'Usuaerio l identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2224, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:26:23.420' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 2225, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:26:58.937' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2226, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:27:42.143' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 2227, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T17:27:47.507' AS DateTime), N'Usuaerio l identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2228, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T19:24:59.550' AS DateTime), N'El usuario j no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 2229, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T19:25:05.833' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2230, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T19:49:09.533' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2231, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T19:49:09.557' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2232, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T19:49:15.990' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2233, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T19:49:15.993' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 2234, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T20:49:38.293' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 2235, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T20:49:38.297' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 2236, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T20:49:38.353' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 2237, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T20:49:38.357' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 2238, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T20:49:38.357' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 2239, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-08T23:51:47.257' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2240, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T00:00:21.443' AS DateTime), N'Usuaerio v identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2241, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T00:41:56.073' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2242, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T00:47:07.567' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2243, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T00:47:27.813' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2244, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T00:48:18.190' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2245, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T01:03:49.460' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 2246, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:13:16.110' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3045, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:06.630' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3046, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:10.527' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3047, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:10.527' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3048, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:10.550' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3049, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:10.550' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3050, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:10.550' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3051, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:10.553' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3052, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:10.553' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3053, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:15:10.553' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3054, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:18:29.880' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3055, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:18:29.880' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3056, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:18:29.887' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3057, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:18:29.890' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3058, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:18:29.890' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3059, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:18:29.893' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3060, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:18:29.893' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3061, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:18:29.897' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3062, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:19:50.673' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3063, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:20:03.743' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3064, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:06.007' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3065, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:09.830' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3066, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:09.877' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3067, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:09.907' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3068, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:09.933' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3069, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:09.933' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3070, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:09.940' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3071, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:09.967' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3072, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:30:09.990' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3073, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:39.280' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3074, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:41.730' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3075, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:41.730' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3076, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:41.760' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3077, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:42.090' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3078, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:42.100' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3079, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:42.167' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3080, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:42.530' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3081, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:31:42.540' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3082, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:37.223' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3083, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:40.850' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3084, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:40.853' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3085, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:40.860' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3086, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:40.860' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3087, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:40.860' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3088, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:40.863' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3089, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:40.863' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3090, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:40.863' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3091, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:43.927' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3092, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:43.930' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3093, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:43.933' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3094, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:43.947' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3095, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:43.947' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3096, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:43.950' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3097, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:43.950' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3098, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:37:43.950' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3099, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:27.040' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3100, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:29.617' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3101, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:29.617' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3102, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:29.620' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3103, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:29.623' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3104, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:29.623' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3105, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:29.623' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3106, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:29.627' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3107, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:44:29.627' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3108, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:33.590' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3109, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:36.473' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3110, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:36.477' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3111, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:36.480' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3112, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:36.480' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3113, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:36.480' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3114, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:36.483' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3115, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:36.483' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3116, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:46:36.483' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3117, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:47:52.697' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3118, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:48:01.327' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3119, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:48:01.327' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3120, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:48:01.330' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3121, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:48:01.330' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3122, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:48:01.333' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3123, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:48:01.333' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3124, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:48:01.333' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3125, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:48:01.333' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3126, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:51.903' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3127, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:53.790' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3128, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:53.793' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3129, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:53.800' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3130, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:53.800' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3131, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:53.800' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3132, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:53.803' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3133, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:53.803' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3134, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:53:53.807' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3135, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:38.423' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3136, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:42.610' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3137, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:42.610' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3138, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:42.613' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3139, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:42.617' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3140, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:42.617' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3141, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:42.620' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3142, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:42.620' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3143, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:56:42.620' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3144, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:35.070' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3145, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:37.220' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3146, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:37.223' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3147, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:37.227' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3148, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:37.227' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3149, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:37.227' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3150, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:37.230' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3151, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:37.230' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3152, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:57:37.270' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3153, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:52.550' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3154, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:54.373' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3155, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:54.377' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3156, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:54.400' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3157, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:54.400' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3158, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:54.403' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3159, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:54.407' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3160, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:54.407' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3161, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T11:58:54.410' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3162, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:20.253' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3163, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:22.240' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3164, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:22.243' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3165, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:22.270' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3166, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:22.293' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3167, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:22.293' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3168, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:22.297' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3169, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:22.297' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3170, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:00:22.300' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3171, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:24.020' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3172, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:25.583' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3173, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:25.587' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3174, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:25.590' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3175, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:25.590' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3176, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:25.590' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3177, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:25.593' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3178, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:25.593' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3179, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:01:25.597' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3180, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:15.553' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3181, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:17.650' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3182, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:17.650' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3183, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:17.653' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3184, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:17.653' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3185, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:17.657' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3186, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:17.657' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3187, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:17.660' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3188, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:02:17.660' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3189, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:11.927' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3190, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:13.323' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3191, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:13.327' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3192, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:13.330' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3193, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:13.330' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3194, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:13.333' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3195, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:13.337' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3196, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:13.337' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3197, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:12:13.340' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3198, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:03.693' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3199, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:09.160' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3200, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:09.160' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3201, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:09.163' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3202, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:09.163' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3203, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:09.163' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3204, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:09.167' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3205, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:09.167' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3206, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:13:09.167' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3207, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:45.687' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3208, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:47.650' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3209, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:47.650' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3210, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:47.657' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3211, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:47.657' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3212, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:47.660' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3213, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:47.660' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3214, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:47.660' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3215, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:15:47.660' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3216, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:23:23.687' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3217, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:24:58.410' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3218, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:26:07.770' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3219, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:28:58.743' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3220, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:29:01.053' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3221, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:29:01.053' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3222, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:29:01.060' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3223, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:29:01.060' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3224, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:29:01.060' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3225, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:29:01.063' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3226, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:29:01.063' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3227, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:29:01.063' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3228, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:41.407' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3229, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:45.277' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3230, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:45.280' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3231, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:45.283' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3232, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:45.283' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3233, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:45.287' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3234, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:45.287' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3235, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:45.287' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3236, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:31:45.287' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3237, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:32:04.560' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3238, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:35:15.670' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3239, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:45.143' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3240, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:46.720' AS DateTime), N'El usuario adm no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3241, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:46.723' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3242, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:46.747' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3243, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:46.747' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3244, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:46.750' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3245, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:46.750' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3246, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:46.753' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3247, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:46.753' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3248, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:53.480' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3249, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:53.483' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3250, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:53.483' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3251, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:53.487' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3252, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:53.490' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3253, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:53.493' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3254, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:36:53.493' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3255, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:01.470' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3256, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:01.477' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3257, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:01.477' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3258, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:01.480' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3259, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:01.480' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3260, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:01.493' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3261, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:01.530' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3262, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:15.590' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3263, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:15.600' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3264, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:15.600' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3265, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:15.607' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3266, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:15.607' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3267, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:15.607' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3268, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:24.493' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3269, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:24.500' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3270, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:24.500' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3271, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:24.507' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3272, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:24.510' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3273, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:37:24.510' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3274, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:40:56.017' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3275, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:07.940' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3276, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:07.950' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3277, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:07.950' AS DateTime), N'El usuario U1 no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3278, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:07.953' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3279, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:07.953' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3280, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:07.953' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3281, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:32.143' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3282, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:32.163' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3283, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:32.167' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3284, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:32.167' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3285, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:32.170' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3286, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:47.020' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3287, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:47.030' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3288, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:47.067' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3289, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:47.080' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3290, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:41:47.083' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3291, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:43:33.947' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3292, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:43:36.353' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3293, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:43:36.357' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3294, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:43:36.360' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3295, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:43:36.360' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3296, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:43:36.360' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3297, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:45:59.517' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3298, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:46:01.860' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3299, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:46:01.867' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3300, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:46:01.867' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3301, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:46:01.867' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3302, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:46:01.900' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3303, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:47:53.927' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3304, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:47:56.137' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3305, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:47:56.140' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3306, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:47:56.140' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3307, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:47:56.140' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3308, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:47:56.143' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3309, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:58:23.050' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3310, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:58:25.993' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3311, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:58:25.997' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3312, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:58:26.000' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3313, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:58:26.000' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3314, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:58:26.000' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3315, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:59:43.167' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3316, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:59:43.173' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3317, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:59:43.177' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3318, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:59:43.177' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3319, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T12:59:43.180' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3320, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:04:59.513' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3321, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:05:07.600' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3322, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:05:07.607' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3323, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:05:07.610' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3324, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:05:07.610' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3325, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:05:07.610' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3326, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:07:12.557' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3327, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:10:10.953' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3328, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:10:14.717' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3329, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:10:14.723' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3330, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:10:14.723' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3331, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:10:14.723' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3332, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:10:14.727' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3333, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:13:00.370' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3334, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:13:02.093' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3335, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:13:02.100' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3336, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:13:02.113' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3337, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:13:02.140' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3338, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:13:02.143' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3339, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:20:17.310' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3340, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:20:19.387' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3341, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:20:19.390' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3342, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:20:19.390' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3343, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:20:19.390' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3344, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:20:19.393' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3345, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:23:51.103' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3346, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:23:53.193' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3347, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:23:53.200' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3348, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:23:53.200' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3349, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:23:53.200' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3350, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:23:53.200' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3351, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:30:42.507' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3352, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:30:44.570' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3353, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:30:44.577' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3354, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:30:44.580' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3355, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:30:44.580' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3356, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:30:44.580' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3357, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:32:08.007' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3358, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:32:10.063' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3359, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:32:10.117' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3360, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:32:10.147' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3361, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:32:10.153' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3362, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:32:10.157' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3363, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:34:58.337' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3364, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:35:00.613' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3365, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:35:00.620' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3366, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:35:00.623' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3367, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:35:00.623' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3368, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:35:00.623' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3369, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:37:28.573' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3370, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:37:31.130' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3371, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:37:31.137' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3372, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:37:31.140' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3373, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:37:31.140' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3374, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:37:31.140' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3375, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:39:34.620' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3376, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:39:36.830' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3377, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:39:36.833' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3378, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:39:36.837' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3379, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:39:36.837' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3380, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:39:36.837' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3381, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:40:41.277' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3382, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:40:43.490' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3383, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:40:43.493' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3384, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:40:43.493' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3385, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:40:43.497' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3386, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:40:43.497' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3387, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:44:42.710' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3388, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:44:47.030' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3389, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:44:47.037' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3390, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:44:47.037' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3391, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:44:47.037' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3392, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:44:47.040' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3393, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:45:55.737' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3394, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:45:57.587' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3395, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:45:57.590' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3396, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:45:57.590' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3397, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:45:57.590' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3398, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:45:57.593' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3399, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:56:37.180' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3400, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:56:39.107' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3401, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:56:39.110' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3402, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:56:39.130' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3403, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:56:39.130' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3404, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:56:39.130' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3405, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:59:05.480' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3406, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:59:06.810' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3407, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:59:06.817' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3408, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:59:06.820' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3409, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:59:06.820' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3410, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:59:06.820' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3411, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T13:59:58.263' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3412, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:00:00.247' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3413, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:00:00.250' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3414, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:00:00.250' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3415, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:00:00.253' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3416, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:00:00.253' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3417, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:01:05.523' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3418, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:01:07.393' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3419, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:01:07.400' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3420, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:01:07.400' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3421, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:01:07.403' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3422, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T14:01:07.403' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3423, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:44:38.517' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3424, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:44:47.853' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3425, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:44:47.860' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3426, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:44:47.863' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3427, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:44:47.863' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3428, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:44:47.863' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3429, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:09.860' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3430, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:12.273' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3431, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:12.277' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3432, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:12.280' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3433, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:12.280' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3434, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:12.280' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3435, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:14.623' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3436, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:14.630' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3437, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:14.630' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3438, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:14.633' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3439, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:47:14.633' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3440, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:52:30.427' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3441, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:52:34.590' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3442, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:52:34.593' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3443, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:52:34.597' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3444, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:52:34.597' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3445, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T15:52:34.597' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3446, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:38.440' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3447, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:40.280' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3448, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:40.290' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3449, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:40.290' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3450, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:40.290' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3451, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:40.293' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3452, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:49.653' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3453, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:49.730' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3454, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:49.733' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3455, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:49.733' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3456, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:49.737' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3457, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:56.120' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3458, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:56.127' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3459, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:56.130' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3460, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:56.130' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3461, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:02:56.130' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3462, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:06:35.070' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3463, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:06:36.807' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3464, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:06:36.810' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3465, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:06:36.813' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3466, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:06:36.813' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3467, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:06:36.813' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3468, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:07:46.090' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3469, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:07:46.100' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3470, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:07:46.113' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3471, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:07:46.117' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3472, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:07:46.117' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3473, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:09:19.210' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3474, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:09:19.220' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3475, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:09:19.220' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3476, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:09:19.220' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3477, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:09:19.223' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3478, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:13:24.873' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3479, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:14:02.327' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3480, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:14:02.333' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3481, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:14:02.350' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3482, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:14:02.350' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3483, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:14:02.353' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3484, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:15:00.153' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3485, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:15:04.690' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3486, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:15:04.697' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3487, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:15:04.697' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3488, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:15:04.700' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3489, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:15:04.700' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3490, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:17:16.077' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3491, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:18:06.863' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3492, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:21:55.813' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3493, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:21:58.247' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3494, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:21:58.253' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3495, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:21:58.257' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3496, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:21:58.260' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3497, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:21:58.260' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3498, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:01.897' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3499, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:07.950' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3500, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:07.953' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3501, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:07.957' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3502, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:07.957' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3503, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:07.957' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3504, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:10.530' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3505, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:10.537' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3506, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:10.540' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3507, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:10.540' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3508, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:10.540' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3509, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:12.087' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3510, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:12.090' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3511, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:12.090' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3512, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:12.093' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3513, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:25:12.093' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3514, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:26:40.120' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3515, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:26:41.517' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3516, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:26:41.523' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3517, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:26:41.523' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3518, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:26:41.523' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3519, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:26:41.523' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3520, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:00.233' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3521, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:00.237' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3522, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:00.240' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3523, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:00.240' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3524, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:00.240' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3525, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:01.350' AS DateTime), N'El usuario dfgdfg no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3526, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:01.353' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3527, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:01.370' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3528, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:01.373' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3529, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:01.373' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3530, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:15.653' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3531, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:15.657' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3532, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:15.657' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3533, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:15.657' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3534, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:21.507' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3535, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:21.507' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3536, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:21.507' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3537, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:29:21.507' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3538, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:35:18.013' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 3539, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:35:23.873' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 3540, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:35:44.043' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3541, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:35:47.250' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3542, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:35:47.250' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3543, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:35:47.270' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3544, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:35:47.273' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3545, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:36:03.117' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3546, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:36:03.117' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3547, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:36:03.140' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3548, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:36:03.140' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3549, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:08.777' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3550, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:32.337' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3551, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:32.340' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3552, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:32.340' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3553, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:32.340' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3554, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:36.050' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3555, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:36.050' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3556, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:36.053' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3557, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:36.053' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3558, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:37.883' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3559, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:37.890' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3560, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:37.890' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3561, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:37.890' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3562, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:39.267' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3563, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:39.270' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3564, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:39.270' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3565, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:39.270' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3566, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:42.377' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3567, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:42.380' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3568, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:42.443' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3569, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:42.510' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3570, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:43.680' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3571, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:43.683' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3572, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:43.683' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3573, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:40:43.683' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3574, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:54:37.603' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3575, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:54:38.997' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3576, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:54:39.000' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3577, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:54:39.000' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3578, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T16:54:39.003' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3579, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:31:13.910' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3580, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:31:17.193' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3581, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:31:17.197' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3582, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:31:17.197' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3583, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:31:17.200' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3584, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:41.353' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3585, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:45.417' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3586, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:45.420' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3587, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:45.420' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3588, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:45.420' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3589, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:55.160' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3590, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:55.160' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3591, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:55.160' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3592, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:32:55.163' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3593, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:43:08.633' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3594, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:43:10.753' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3595, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:43:10.757' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3596, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:43:10.757' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3597, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T19:43:10.757' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3598, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:26:56.130' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3599, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:27:13.427' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3600, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:27:13.430' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3601, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:27:13.450' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3602, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:27:13.450' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3603, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:27:30.373' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3604, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:27:30.377' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3605, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:27:30.377' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3606, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:27:30.380' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3607, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:28:05.363' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3608, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:28:05.367' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3609, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:28:05.387' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3610, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:28:05.387' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3611, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:28:47.523' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3612, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:28:47.527' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3613, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:28:47.547' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3614, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:28:47.547' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3615, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:29:51.957' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3616, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:29:53.320' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3617, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:29:53.333' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3618, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:29:53.333' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3619, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:29:53.333' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3620, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:30:15.873' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3621, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:30:15.877' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3622, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:30:15.897' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3623, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:30:15.897' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3624, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:45:02.833' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3625, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:45:08.217' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3626, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:45:08.220' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3627, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:45:08.220' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3628, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:45:08.220' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3629, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:51:54.463' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3630, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:52:08.807' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3631, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:52:08.810' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3632, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:52:08.810' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3633, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:52:08.813' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3634, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:52:26.440' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3635, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:52:26.443' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3636, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:52:26.443' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3637, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:52:26.447' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3638, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:55:32.350' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3639, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:55:34.857' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3640, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:55:34.860' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3641, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:55:34.860' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3642, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:55:34.860' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3643, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:57:43.330' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3644, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:57:46.063' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3645, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:57:46.067' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3646, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:57:46.067' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3647, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T20:57:46.067' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3648, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:00:46.663' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3649, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:00:52.440' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3650, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:00:52.443' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3651, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:00:52.443' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3652, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:00:52.447' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3653, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:03:12.207' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3654, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:03:16.770' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3655, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:03:16.773' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3656, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:03:16.773' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3657, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:03:16.777' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3658, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:05:41.433' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3659, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:05:41.433' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3660, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:05:41.433' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3661, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:05:41.437' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3662, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:10:24.210' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3663, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:23:09.080' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3664, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:23:11.120' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3665, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:23:11.127' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3666, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:23:11.127' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3667, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:23:11.127' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3668, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:48:24.413' AS DateTime), N'El usuario h no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 3669, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:48:33.950' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3670, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:55:20.470' AS DateTime), N'El usuario h no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 3671, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:55:27.447' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3672, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:57:01.190' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3673, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T21:58:15.547' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3674, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:00:30.477' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3675, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:00:54.310' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3676, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:01:33.267' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3677, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:02:21.563' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3678, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:05:17.413' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3679, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:29:01.000' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3680, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:29:34.813' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3681, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:38:52.257' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3682, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:39:43.347' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3683, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:43:51.610' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3684, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:44:56.353' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3685, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:45:41.837' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3686, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:46:40.577' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3687, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:47:44.477' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3688, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:47:52.457' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3689, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:47:52.460' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3690, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:47:52.480' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3691, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:47:52.483' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3692, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:48:03.747' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3693, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:48:03.750' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3694, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:48:03.753' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3695, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:48:03.753' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3696, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:52:01.857' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3697, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:52:01.860' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3698, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:52:01.860' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3699, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:52:01.860' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3700, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:52:22.387' AS DateTime), N'El usuario h no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 3701, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:52:28.700' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3702, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:53:00.847' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3703, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:54:46.947' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3704, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:54:46.950' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3705, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:54:46.980' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3706, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:54:47.007' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3707, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:55:26.740' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3708, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:55:26.740' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3709, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:55:26.740' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3710, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:55:26.743' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3711, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:31.180' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3712, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:31.183' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3713, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:31.183' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3714, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:31.183' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3715, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:40.223' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3716, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:40.227' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3717, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:40.230' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3718, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:40.230' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3719, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:56.143' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3720, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:56.147' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3721, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:56.167' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3722, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:57:56.167' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3723, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:01.327' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3724, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:01.330' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3725, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:01.330' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3726, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:01.333' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3727, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:07.260' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3728, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:07.260' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3729, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:07.263' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3730, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:07.263' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3731, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:30.993' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3732, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:31.000' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3733, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:31.020' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3734, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:31.020' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3735, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:32.320' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3736, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:32.327' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3737, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:32.347' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3738, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:32.350' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3739, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:49.110' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3740, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:49.110' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3741, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:49.110' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3742, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:49.113' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3743, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:56.393' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3744, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:56.397' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3745, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:56.397' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3746, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:56.397' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3747, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:57.477' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3748, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:57.477' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3749, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:57.480' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3750, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:57.480' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3751, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:59.233' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3752, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:59.257' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3753, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:59.280' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3754, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:58:59.280' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3755, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:59:30.047' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3756, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:59:30.050' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3757, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:59:30.070' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3758, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T22:59:30.070' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3759, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:00:13.697' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3760, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:00:13.700' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3761, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:00:13.700' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3762, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:00:13.703' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3763, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:26.697' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3764, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:26.730' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3765, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:26.740' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3766, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:26.750' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3767, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:27.510' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3768, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:27.510' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3769, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:27.513' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3770, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:27.513' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3771, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:27.943' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3772, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:27.957' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3773, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:27.960' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3774, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:27.960' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3775, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:28.490' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3776, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:28.523' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3777, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:28.537' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3778, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:06:28.540' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3779, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:10:54.960' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3780, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:10:54.963' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3781, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:10:54.967' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3782, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:10:54.967' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3783, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:12:04.363' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3784, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:12:04.377' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3785, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:12:04.377' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3786, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:12:04.380' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3787, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:44.180' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3788, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:44.183' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3789, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:44.183' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3790, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:44.183' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3791, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.053' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3792, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.060' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3793, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.060' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3794, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.063' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3795, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.203' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3796, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.203' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3797, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.207' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3798, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.207' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3799, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.860' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3800, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.863' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3801, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.863' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3802, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.863' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3803, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.903' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3804, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.910' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3805, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.913' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3806, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:46.920' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3807, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:47.017' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3808, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:47.030' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3809, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:47.033' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3810, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:16:47.037' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3811, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:17:52.590' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3812, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:17:52.613' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3813, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:17:52.643' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3814, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:17:52.673' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3815, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:17:52.767' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3816, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:17:52.767' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3817, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:17:52.773' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3818, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:17:52.777' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3819, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:23.147' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3820, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:23.223' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3821, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:23.223' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3822, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:23.227' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3823, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:23.227' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3824, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:55.120' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3825, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:55.123' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3826, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:55.123' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3827, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:19:55.130' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3828, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:20:14.160' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3829, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:20:14.163' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3830, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:20:14.183' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3831, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:20:14.183' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3832, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:24:41.920' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3833, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:24:51.503' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3834, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:24:51.507' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3835, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:24:51.530' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3836, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-09T23:24:51.530' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3837, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:33:57.417' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3838, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:34:08.330' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3839, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:34:08.337' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3840, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:34:08.337' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3841, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:34:08.340' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3842, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:34:21.940' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3843, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:34:21.943' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3844, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:34:21.963' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3845, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:34:21.967' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3846, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:35:36.600' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3847, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:35:38.747' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3848, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:35:38.750' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3849, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:35:38.750' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3850, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:35:38.750' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3851, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:45:54.203' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3852, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:46:48.110' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3853, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:47:34.800' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3854, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:47:34.803' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3855, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:47:34.803' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3856, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:47:34.803' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3857, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T00:48:15.857' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3858, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:42:54.253' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3859, N'LogIn')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:42:55.687' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3860, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:42:55.707' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3861, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:42:55.737' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3862, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:42:55.737' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3863, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:58:38.207' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3864, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:58:38.217' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3865, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:58:38.217' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3866, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-10T01:58:38.220' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3867, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T20:25:46.923' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3868, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T20:26:06.620' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3869, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T20:26:06.710' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3870, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T20:26:06.713' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3871, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T20:26:06.747' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3872, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T20:48:50.557' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3873, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T20:54:38.557' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3874, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T21:51:32.397' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3875, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T22:02:11.270' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3876, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T22:05:24.017' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3877, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T22:05:25.750' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3878, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T22:05:25.757' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3879, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T22:05:25.760' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3880, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T22:05:25.773' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3881, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T22:13:58.510' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3882, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T22:37:39.037' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3883, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:11:44.310' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3884, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:23:43.340' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3885, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:44.493' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3886, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:46.947' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3887, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:46.953' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3888, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:47.000' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3889, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:47.033' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3890, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:53.100' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3891, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:53.103' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3892, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:53.107' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3893, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-11T23:59:53.107' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3894, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T00:03:23.127' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3895, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T00:05:44.730' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3896, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T00:08:42.123' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3897, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:22:18.557' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 3898, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:22:18.557' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 3899, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:22:36.223' AS DateTime), N'Nombre de usuario incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 3900, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:22:36.227' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 3901, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:00.733' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3902, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:04.680' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3903, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:04.693' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3904, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:04.697' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3905, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:04.700' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3906, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:08.790' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3907, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:08.837' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3908, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:08.843' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3909, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:08.893' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3910, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:23:55.437' AS DateTime), N'El rol debe estar asociado a almenos un permiso.', N'BL.RoleManager', N'CRITICAL', N'unknown', 3911, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:24:54.277' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3912, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:29:26.880' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3913, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:29:26.920' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3914, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:29:26.920' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3915, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:29:26.920' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3916, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:36:13.447' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3917, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:36:18.083' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3918, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:36:18.087' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3919, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:36:18.087' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3920, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:36:18.090' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3921, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:02.720' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3922, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:02.720' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3923, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:02.740' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3924, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:02.743' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3925, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:08.557' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3926, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:08.557' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3927, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:08.560' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3928, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:08.560' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3929, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:12.590' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3930, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:12.593' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3931, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:12.593' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3932, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:12.597' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3933, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:16.990' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3934, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:16.993' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3935, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:16.993' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3936, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:16.993' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3937, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:24.227' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3938, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:24.230' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3939, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:24.230' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3940, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:37:24.230' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3941, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:44:47.383' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3942, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:44:49.060' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3943, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:44:49.063' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3944, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:44:49.063' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3945, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:44:49.093' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3946, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:47:27.637' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3947, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:47:32.993' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3948, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:47:32.997' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3949, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:47:33.043' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3950, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:47:33.047' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3951, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:59:04.230' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3952, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:59:07.703' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3953, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:59:07.730' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3954, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:59:07.730' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3955, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T01:59:07.730' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3956, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:13.763' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3957, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:13.813' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3958, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:13.817' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3959, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:13.820' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3960, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:13.820' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3961, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:27.927' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3962, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:27.930' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3963, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:27.930' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3964, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:27.930' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3965, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:01:27.933' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3966, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:08:38.617' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3967, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:08:40.727' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3968, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:08:40.727' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3969, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:08:40.727' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3970, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:08:40.730' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3971, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:08:40.743' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3972, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:09:55.313' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3973, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:09:56.743' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3974, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:09:56.743' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3975, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:09:56.770' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3976, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:09:56.773' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3977, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:09:56.773' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3978, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:12:30.950' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3979, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:12:32.497' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3980, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:12:32.497' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3981, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:12:32.500' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3982, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:12:32.500' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3983, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:12:32.500' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3984, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:13:33.280' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3985, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:13:33.280' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3986, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:13:33.283' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3987, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:13:33.337' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3988, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:13:33.340' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3989, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:14:56.390' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3990, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:14:56.390' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3991, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:14:56.450' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3992, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:14:56.453' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3993, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:14:56.457' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3994, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:17:14.603' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 3995, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:17:16.430' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3996, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:17:16.433' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3997, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:17:16.433' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3998, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:17:16.433' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 3999, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:17:16.463' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4000, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:17:52.753' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 4001, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:08.930' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4002, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:08.977' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4003, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:08.980' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4004, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:08.980' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4005, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:08.983' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4006, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:41.650' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4007, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:49.837' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4008, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:49.850' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 4009, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:18:54.077' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4010, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:19:05.020' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4011, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:19:05.097' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4012, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:19:05.097' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4013, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:19:05.117' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4014, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:19:05.117' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4015, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:19:05.120' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4016, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:22:37.063' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4017, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:22:38.973' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4018, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:22:38.977' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4019, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:22:39.037' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4020, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:22:39.070' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4021, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:22:39.137' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4022, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:24:53.673' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4023, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:24:53.673' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4024, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:24:53.677' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4025, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:24:53.680' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4026, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:24:53.690' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4027, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:04.423' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4028, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:04.423' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4029, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:04.427' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4030, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:04.457' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4031, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:04.460' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4032, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:07.957' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4033, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:07.960' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4034, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:08.007' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4035, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:08.053' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4036, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:08.087' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4037, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:10.283' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4038, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:10.287' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4039, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:10.287' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4040, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:10.287' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4041, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:10.290' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4042, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:39.257' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4043, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:41.013' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4044, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:41.013' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4045, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:41.017' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4046, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:41.033' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4047, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:25:41.033' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4048, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:26:44.610' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4049, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:26:46.967' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4050, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:26:47.007' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4051, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:26:47.010' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4052, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:26:47.010' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4053, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:26:47.013' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4054, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:28:21.280' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4055, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:28:21.283' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4056, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:28:21.287' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4057, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:28:21.300' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4058, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:28:21.300' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4059, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:28:21.303' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4060, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:29:08.183' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4061, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:29:08.233' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4062, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:29:08.253' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4063, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:29:08.257' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4064, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:29:08.257' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4065, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:29:08.257' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4066, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:29:24.490' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4067, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:00.460' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4068, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:02.497' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4069, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:02.500' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4070, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:02.500' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4071, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:02.503' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4072, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:02.517' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4073, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:02.517' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4074, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:10.990' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 4075, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:18.733' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4076, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:18.760' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4077, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:18.777' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4078, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:18.780' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4079, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:18.780' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4080, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:18.783' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4081, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:28.200' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4082, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:43.360' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4083, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:43.520' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4084, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:43.523' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4085, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:43.523' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4086, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:43.527' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4087, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:43.527' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4088, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:31:43.530' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4089, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:33:52.200' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4090, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:33:55.300' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4091, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:33:55.307' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4092, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:33:55.307' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4093, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:33:55.310' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4094, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:33:55.363' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4095, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:33:55.417' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4096, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:07.440' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4097, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:07.447' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4098, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:07.493' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4099, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:07.497' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4100, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:07.497' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4101, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:07.500' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4102, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:15.420' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4103, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:15.423' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4104, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:15.423' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4105, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:15.427' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4106, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:15.443' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4107, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:34:15.443' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4108, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:07.813' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4109, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:09.853' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4110, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:09.870' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4111, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:09.873' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4112, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:09.873' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4113, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:09.873' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4114, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:09.877' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4115, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:33.567' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4116, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:33.573' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4117, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:33.573' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4118, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:33.587' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4119, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:33.590' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4120, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T02:44:33.590' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4121, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:18.627' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4885, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:27.183' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4886, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:27.190' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4887, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:27.190' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4888, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:27.193' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4889, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:27.197' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4890, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:27.197' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4891, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:34.460' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4892, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:34.493' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4893, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:34.557' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4894, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:34.577' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4895, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:34.633' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4896, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:34.637' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4897, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:51.980' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4898, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:51.990' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4899, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:51.990' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4900, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:51.993' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4901, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:51.993' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4902, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:49:51.997' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4903, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:51:02.333' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4904, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:51:06.547' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4905, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:51:06.553' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4906, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:51:06.557' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4907, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:51:06.560' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4908, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:51:06.563' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4909, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:51:06.563' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4910, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:15.633' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4911, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:21.920' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4912, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:21.930' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4913, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:21.930' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4914, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:21.937' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4915, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:21.937' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4916, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:21.940' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4917, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:37.120' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4918, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:37.140' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4919, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:37.163' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4920, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:37.190' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4921, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:37.203' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4922, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:53:37.207' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4923, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-12T16:55:57.870' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4924, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:10:56.127' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4925, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:10:56.137' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4926, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:10:56.137' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4927, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:10:56.140' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4928, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:10:56.140' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4929, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:10:56.140' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4930, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:15:32.253' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4931, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:15:38.730' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4932, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:15:38.733' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4933, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:15:38.753' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4934, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:15:38.757' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4935, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:15:38.757' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4936, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:15:38.760' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4937, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:07.937' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4938, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:09.950' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4939, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:09.963' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4940, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:09.967' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4941, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:09.967' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4942, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:09.967' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4943, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:09.967' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4944, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:49.423' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4945, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:49.430' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4946, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:49.430' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4947, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:49.433' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4948, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:49.433' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4949, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:18:49.433' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4950, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:07.227' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4951, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:07.923' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4952, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:08.080' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4953, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:08.233' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4954, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:17.317' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4955, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:17.320' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4956, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:17.323' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4957, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:17.327' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4958, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:17.327' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4959, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:17.327' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4960, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:50.080' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 4961, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:51.990' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4962, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:51.997' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4963, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:51.997' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4964, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:52.000' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4965, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:52.000' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4966, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:19:52.000' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4967, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:02.443' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4968, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:02.447' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4969, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:02.447' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4970, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:02.447' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4971, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:02.450' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4972, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:02.450' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4973, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:22.787' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4974, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:22.797' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4975, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:22.797' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4976, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:22.800' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4977, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:22.800' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4978, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:22.800' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4979, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:52.577' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4980, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:52.590' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4981, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:52.593' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4982, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:52.593' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4983, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:52.593' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4984, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:52.597' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4985, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:54.127' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4986, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:54.133' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4987, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:54.133' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4988, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:54.137' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4989, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:54.137' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4990, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:22:54.137' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4991, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:57.150' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4992, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:57.153' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4993, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:57.153' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4994, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:57.157' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4995, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:57.157' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4996, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:57.160' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4997, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:59.580' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4998, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:59.583' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 4999, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:59.587' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5000, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:59.587' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5001, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:59.590' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5002, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:24:59.590' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5003, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:25:43.747' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5004, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:25:43.753' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5005, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:25:43.753' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5006, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:25:43.757' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5007, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:25:43.757' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5008, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:25:43.757' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5009, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:45:32.110' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5010, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:45:37.700' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5011, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:45:37.710' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5012, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:45:37.720' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5013, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:45:37.723' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5014, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:45:37.727' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5015, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:45:37.727' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5016, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:46:04.500' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5017, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:46:04.503' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5018, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:46:04.503' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5019, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:46:04.503' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5020, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:46:04.503' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5021, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:46:04.503' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5022, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:32.310' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5023, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:35.360' AS DateTime), N'El usuario Jalberto2| no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5024, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:35.363' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5025, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:35.363' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5026, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:35.367' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5027, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:35.370' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5028, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:35.370' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5029, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:47.937' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5030, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:47.937' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5031, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:47.940' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5032, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:47.940' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5033, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:47:47.940' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5034, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:05.857' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5035, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:05.857' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5036, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:05.857' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5037, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:05.860' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5038, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:05.860' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5039, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:12.400' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 5040, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:12.400' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 5041, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:12.403' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 5042, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:48:12.403' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 5043, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:17.703' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5044, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:19.293' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5045, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:19.293' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5046, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:19.297' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5047, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:19.297' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5048, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:19.297' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5049, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:41.860' AS DateTime), N'Debe completarse el nombre.', N'BL.UserManager', N'WARNING', N'unknown', 5050, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:41.860' AS DateTime), N'Debe completarse el apellido.', N'BL.UserManager', N'WARNING', N'unknown', 5051, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:41.863' AS DateTime), N'Debe completarse el usuario.', N'BL.UserManager', N'WARNING', N'unknown', 5052, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:41.863' AS DateTime), N'Debe completarse el correo electrónico.', N'BL.UserManager', N'WARNING', N'unknown', 5053, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:50:41.867' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 5054, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:51:44.143' AS DateTime), N'El usuario ee no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5055, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:51:44.153' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5056, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:51:44.153' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5057, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:51:44.153' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5058, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:51:44.153' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5059, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:51:44.157' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5060, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:41.840' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5061, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:43.833' AS DateTime), N'El usuario ee no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5062, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:43.840' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5063, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:43.840' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5064, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:43.840' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5065, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:43.840' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5066, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:43.843' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5067, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:54.717' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5068, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:54.717' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5069, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:54.720' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5070, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:54.720' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5071, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:56:54.723' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5072, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:57:21.347' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5073, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:57:21.357' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5074, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:57:21.400' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5075, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:57:21.440' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5076, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:57:21.467' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5077, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:58:15.137' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5078, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:58:15.137' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5079, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:58:15.190' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5080, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:58:15.190' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5081, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T01:58:15.193' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5082, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:00:48.867' AS DateTime), N'Debe completarse el password.', N'BL.UserManager', N'WARNING', N'unknown', 5083, N'IsValidForSave')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:01:33.190' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5084, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:01:33.207' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5085, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:01:33.247' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5086, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:01:33.280' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5087, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:01:33.397' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5088, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:05:08.890' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5089, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:05:09.987' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5090, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:05:09.987' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5091, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:05:10.007' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5092, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:05:10.007' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5093, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:05:10.007' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5094, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:06:47.017' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5095, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:06:48.553' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5096, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:06:48.557' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5097, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:06:48.560' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5098, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:06:48.613' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5099, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:06:48.617' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5100, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:06:56.420' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5101, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:07:06.850' AS DateTime), N'El usuario ttt no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5102, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:07:06.983' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5103, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:07:06.993' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5104, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:07:06.993' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5105, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:07:06.993' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5106, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:07:06.997' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5107, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:13.847' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5108, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:15.107' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5109, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:15.143' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5110, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:15.147' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5111, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:15.147' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5112, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:15.147' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5113, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:32.250' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5114, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:32.257' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5115, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:32.260' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5116, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:32.280' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5117, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:10:32.280' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5118, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:11:02.133' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 5119, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:11:02.210' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 5120, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:13:17.800' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 5121, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:13:23.870' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 5122, N'Edit')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:13:46.050' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 5123, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:20.520' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 5124, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:26.160' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 5125, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:35.623' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5126, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:38.223' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5127, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:38.277' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5128, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:38.277' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5129, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:38.280' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5130, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:38.280' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5131, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:59.970' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5132, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:59.970' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5133, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:14:59.973' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5134, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:15:00.047' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5135, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:15:00.050' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5136, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:15:00.050' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5137, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:15:14.750' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 5138, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:15:14.810' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 5139, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:03.820' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5140, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:06.533' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5141, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:06.540' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5142, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:06.543' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5143, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:06.547' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5144, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:06.547' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5145, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:06.550' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5146, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:32.033' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5147, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:32.033' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5148, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:32.083' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5149, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:32.087' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5150, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:32.087' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5151, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:32.090' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5152, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:18:32.090' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5153, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:19:00.683' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 5154, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:11.010' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5155, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:12.953' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5156, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:12.957' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5157, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:12.980' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5158, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:12.980' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5159, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:13.007' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5160, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:13.007' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5161, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:13.010' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5162, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:31.553' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5163, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:31.580' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5164, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:31.620' AS DateTime), N'El usuario pv no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5165, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:31.657' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5166, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:31.680' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5167, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:31.683' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5168, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:31.683' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5169, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:31.683' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5170, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:46.597' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 5171, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:46.713' AS DateTime), N'El usuario pv no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5172, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:46.740' AS DateTime), N'Usuaerio pv identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5173, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:22:46.800' AS DateTime), N'Excelente! gracias por recuperar tu password :D', N'BL.UserManager', N'WARNING', N'unknown', 5174, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:01.907' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5175, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:05.573' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5176, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:05.577' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5177, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:05.630' AS DateTime), N'El usuario pv no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5178, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:05.630' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5179, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:05.630' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5180, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:05.633' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5181, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:05.633' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5182, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:05.633' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5183, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:25.780' AS DateTime), N'El usuario pv no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5184, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:30.750' AS DateTime), N'El usuario pv no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5185, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:30.830' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5186, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:30.833' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5187, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:30.840' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5188, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:30.843' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5189, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:30.843' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5190, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:30.843' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5191, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:30.843' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5192, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:39.150' AS DateTime), N'Usuaerio pv identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 5193, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:47.943' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5194, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:47.943' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5195, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:47.947' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5196, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:47.967' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5197, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:47.967' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5198, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:47.970' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5199, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T02:23:47.970' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 5200, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T17:27:37.457' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6084, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T18:22:37.797' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6085, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T18:24:48.443' AS DateTime), N'No se ha podido guardar la nómina de permisos asociados al rol.', N'BL.RoleManager', N'CRITICAL', N'unknown', 6086, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T18:25:50.810' AS DateTime), N'No se ha podido guardar la nómina de permisos asociados al rol.', N'BL.RoleManager', N'CRITICAL', N'unknown', 6087, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T18:26:19.610' AS DateTime), N'No se ha podido guardar la nómina de permisos asociados al rol.', N'BL.RoleManager', N'CRITICAL', N'unknown', 6088, N'Edit')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T18:36:20.313' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6089, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:21:46.557' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6090, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:22:20.973' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6091, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:22:20.977' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6092, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:22:20.997' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6093, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:22:21.000' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6094, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:22:21.000' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6095, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:22:21.020' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6096, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:22:21.023' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6097, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:23:44.557' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6098, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:00.437' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6099, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:24.303' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6100, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:24.310' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6101, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:24.353' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6102, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:24.357' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6103, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:24.363' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6104, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:24.367' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6105, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:24.367' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6106, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:45.547' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6107, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:45.590' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6108, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:45.643' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6109, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:45.650' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6110, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:45.673' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6111, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:45.697' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6112, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:25:45.700' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6113, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:26:51.010' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6114, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:26:51.017' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6115, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:26:51.060' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6116, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:26:51.060' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6117, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:26:51.070' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6118, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:26:51.070' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6119, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:26:51.073' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6120, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:28:45.627' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6121, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:28:50.020' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6122, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:28:50.023' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6123, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:28:50.030' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6124, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:28:50.033' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6125, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:28:50.037' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6126, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:28:50.037' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6127, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:28:50.040' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 6128, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:33:48.160' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6129, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:36:41.957' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6130, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-13T19:40:39.753' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 6131, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:17:03.267' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7084, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:17:03.267' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7085, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:18:40.360' AS DateTime), N'Usuaerio k identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7086, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:10.107' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7087, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:10.120' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7088, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:10.127' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7089, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:10.127' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7090, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:10.130' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7091, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:10.130' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7092, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:10.133' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7093, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:27.560' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7094, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:50.907' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7095, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:50.920' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7096, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:50.927' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7097, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:50.927' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7098, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:50.930' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7099, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:50.930' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7100, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:22:50.930' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7101, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:43.813' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7102, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:43.813' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7103, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:43.840' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7104, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:43.843' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7105, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:43.843' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7106, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:43.847' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7107, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:43.847' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7108, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:51.083' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7109, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:51.087' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7110, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:51.130' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7111, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:51.147' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7112, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:51.150' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7113, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:51.150' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7114, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:51.150' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7115, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:23:53.260' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7116, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:03.800' AS DateTime), N'El usuario am no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7117, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:03.833' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7118, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:03.853' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7119, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:03.897' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7120, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:03.900' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7121, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:03.910' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7122, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:03.917' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7123, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:10.500' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7124, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:10.503' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7125, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:10.507' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7126, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:10.523' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7127, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:10.523' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7128, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:10.527' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7129, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:16.040' AS DateTime), N'El usuario ff no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7130, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:16.057' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7131, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:16.057' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7132, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:16.063' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7133, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:16.067' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7134, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:16.067' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7135, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:19.570' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7136, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:19.613' AS DateTime), N'El usuario t no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7137, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:19.617' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7138, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:19.620' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7139, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:19.620' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7140, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:26.353' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7141, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:26.357' AS DateTime), N'El usuario wd no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7142, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:26.357' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7143, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:26.390' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7144, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:32.260' AS DateTime), N'El usuario scorcho no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7145, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:32.263' AS DateTime), N'El usuario x no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7146, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:24:32.280' AS DateTime), N'El usuario z no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7147, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:48:21.420' AS DateTime), N'Nombre de usuario (mail) incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 7148, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:48:21.423' AS DateTime), N'Password incompleto', N'BL.SessionManager', N'WARNING', N'unknown', 7149, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:48:32.150' AS DateTime), N'El usuario mkc@outlook.com.ar no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 7150, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:49:26.830' AS DateTime), N'El usuario mkc@outlook.com.ar no está activo.', N'BL.SessionManager', N'WARNING', N'unknown', 7151, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:54:49.080' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7152, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:57:53.097' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7153, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T19:59:50.513' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7154, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T20:05:32.450' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7155, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T23:54:23.517' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7156, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-21T23:54:46.540' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7157, N'LogIn')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T11:49:46.677' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7158, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T12:01:14.310' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7159, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T12:11:26.840' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7160, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T14:26:05.983' AS DateTime), N'El usuario no existe.', N'BL.SessionManager', N'WARNING', N'unknown', 7161, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T14:28:53.620' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7162, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T14:33:51.173' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7163, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:05:57.223' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7164, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:08:47.767' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7165, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:10:27.690' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7166, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:12:07.913' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7167, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:13:01.050' AS DateTime), N'Cannot open backup device ''C:\Users\Kokumo\Documents\UAI\5to\TFI\plataforma\Ubiquicity\Ubiquicity\Resources/636732259145219311.bkp''. Operating system error 5(Acceso denegado.).
BACKUP DATABASE is terminating abnormally.', N'BL.BackupManager', N'CRITICAL', N'unknown', 7168, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:29:12.267' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7169, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:36:50.080' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7170, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:37:03.570' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7171, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:42:27.743' AS DateTime), N'Cannot open backup device ''C:\Users\Kokumo\Documents\UAI\5to\TFI\plataforma\Ubiquicity\Ubiquicity\Resources/636732274235724109.bkp''. Operating system error 5(Acceso denegado.).
BACKUP DATABASE is terminating abnormally.', N'BL.BackupManager', N'CRITICAL', N'unknown', 7172, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:42:28.280' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7173, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:42:36.980' AS DateTime), N'Cannot open backup device ''C:\Users\Kokumo\Documents\UAI\5to\TFI\plataforma\Ubiquicity\Ubiquicity\Resources/636732277482820832.bkp''. Operating system error 5(Acceso denegado.).
BACKUP DATABASE is terminating abnormally.', N'BL.BackupManager', N'CRITICAL', N'unknown', 7174, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:43:33.517' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7175, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:43:39.473' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7176, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:43:42.113' AS DateTime), N'Cannot open backup device ''C:	mp''. Operating system error 123(El nombre de archivo, el nombre de directorio o la sintaxis de la etiqueta del volumen no son correctos.).
BACKUP DATABASE is terminating abnormally.', N'BL.BackupManager', N'CRITICAL', N'unknown', 7177, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:44:55.617' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7178, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:45:01.827' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7179, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T15:45:06.560' AS DateTime), N'No se ha podido generar el respaldo.', N'BL.BackupManager', N'CRITICAL', N'unknown', 7180, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:06:28.780' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7181, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:08:13.777' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7182, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:08:33.203' AS DateTime), N'No se ha podido generar el respaldo.', N'BL.BackupManager', N'CRITICAL', N'unknown', 7183, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:09:38.483' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7184, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:09:55.607' AS DateTime), N'No se ha podido generar el respaldo.', N'BL.BackupManager', N'CRITICAL', N'unknown', 7185, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:11:50.363' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7186, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:12:07.933' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7187, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:12:13.697' AS DateTime), N'El respaldo se ha generado exitosamente.', N'BL.BackupManager', N'INFO', N'unknown', 7188, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:30:06.743' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7189, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:31:30.400' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7190, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:41:47.300' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7191, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:51:36.940' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7192, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:53:07.427' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7193, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T16:59:16.223' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7194, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:15:19.950' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7195, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:15:36.820' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7196, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:15:37.200' AS DateTime), N'El respaldo se ha generado exitosamente.', N'BL.BackupManager', N'INFO', N'unknown', 7197, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:20:38.100' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7198, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:20:44.473' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7199, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:20:44.857' AS DateTime), N'El respaldo se ha generado exitosamente.', N'BL.BackupManager', N'INFO', N'unknown', 7200, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:21:33.110' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7201, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:22:04.317' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7202, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:22:04.760' AS DateTime), N'El respaldo se ha generado exitosamente.', N'BL.BackupManager', N'INFO', N'unknown', 7203, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:23:07.817' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7204, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:23:16.147' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7205, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:23:16.607' AS DateTime), N'El respaldo se ha generado exitosamente.', N'BL.BackupManager', N'INFO', N'unknown', 7206, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:24:09.680' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7207, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:24:10.063' AS DateTime), N'El respaldo se ha generado exitosamente.', N'BL.BackupManager', N'INFO', N'unknown', 7208, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:24:50.237' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7209, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:24:59.233' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 7210, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T17:29:09.650' AS DateTime), N'El respaldo se ha restaurado exitosamente.', N'BL.BackupManager', N'INFO', N'unknown', 7211, N'PerformRestore')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:06:23.040' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7212, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:16:29.037' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7213, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:19:07.327' AS DateTime), N'El usuario ya existe.', N'BL.UserManager', N'WARNING', N'unknown', 7214, N'SaveForWeb')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:19:41.810' AS DateTime), N'El usuario notengo@mismo.com no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7215, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:19:46.633' AS DateTime), N'El usuario notengo@mismo.com no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7216, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:26:05.800' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7217, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:26:09.633' AS DateTime), N'El usuario notengo@mismo.com no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7218, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:26:12.780' AS DateTime), N'El usuario notengo@mismo.com no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 7219, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:37:21.683' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7220, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-22T18:39:37.043' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 7221, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-27T21:25:08.023' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8211, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-27T21:52:15.880' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8212, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-27T22:18:05.790' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8213, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-27T22:25:48.710' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8214, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-27T22:26:43.253' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8215, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-27T23:01:46.020' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8216, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-27T23:06:03.230' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8217, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-27T23:18:47.347' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8218, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:20:30.333' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8219, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:38:35.287' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8220, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:41:06.400' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8221, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:42:01.043' AS DateTime), N'Debe asociarse una imagen al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8222, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:46:42.400' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8223, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:47:52.817' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8224, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:48:22.827' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8225, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:49:24.427' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8226, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:53:50.677' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8227, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:54:04.550' AS DateTime), N'Debe completarse el nombre.', N'BL.MapManager', N'WARNING', N'unknown', 8228, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:54:04.553' AS DateTime), N'Debe completarse la descripción.', N'BL.MapManager', N'WARNING', N'unknown', 8229, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:54:04.553' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8230, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:54:04.553' AS DateTime), N'Debe asociarse una imagen al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8231, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:57:12.123' AS DateTime), N'Debe completarse el nombre.', N'BL.MapManager', N'WARNING', N'unknown', 8232, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:57:12.127' AS DateTime), N'Debe completarse la descripción.', N'BL.MapManager', N'WARNING', N'unknown', 8233, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:57:12.147' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8234, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:57:12.150' AS DateTime), N'Debe asociarse una imagen al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8235, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T00:58:44.253' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8236, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:01:36.373' AS DateTime), N'Debe completarse el nombre.', N'BL.MapManager', N'WARNING', N'unknown', 8237, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:01:36.427' AS DateTime), N'Debe completarse la descripción.', N'BL.MapManager', N'WARNING', N'unknown', 8238, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:01:36.427' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8239, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:01:36.427' AS DateTime), N'Debe asociarse una imagen al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8240, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:01:37.427' AS DateTime), N'El usuario notengo@mismo.com no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 8241, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:01:37.887' AS DateTime), N'El usuario notengo@mismo.com no posee permisos asociados.', N'BL.RoleManager', N'INFO', N'unknown', 8242, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:01:46.950' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8243, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:10:37.080' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8244, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:11:27.157' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 8245, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:12:21.930' AS DateTime), N'Debe completarse el nombre.', N'BL.MapManager', N'WARNING', N'unknown', 8246, N'IsValid')
GO
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:12:21.953' AS DateTime), N'Debe completarse la descripción.', N'BL.MapManager', N'WARNING', N'unknown', 8247, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:12:21.957' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8248, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:17:18.280' AS DateTime), N'Debe completarse el nombre.', N'BL.MapManager', N'WARNING', N'unknown', 8249, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:17:18.280' AS DateTime), N'Debe completarse la descripción.', N'BL.MapManager', N'WARNING', N'unknown', 8250, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:17:18.280' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8251, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:17:48.613' AS DateTime), N'Debe completarse el nombre.', N'BL.MapManager', N'WARNING', N'unknown', 8252, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:17:48.627' AS DateTime), N'Debe completarse la descripción.', N'BL.MapManager', N'WARNING', N'unknown', 8253, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:17:48.650' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8254, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:18:44.777' AS DateTime), N'Debe completarse el nombre.', N'BL.MapManager', N'WARNING', N'unknown', 8255, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:18:44.780' AS DateTime), N'Debe completarse la descripción.', N'BL.MapManager', N'WARNING', N'unknown', 8256, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-28T01:18:44.780' AS DateTime), N'Debe asociarse un archivo al mapa.', N'BL.MapManager', N'WARNING', N'unknown', 8257, N'IsValid')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-29T05:56:38.327' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 9220, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-29T06:28:24.413' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 9221, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-29T07:18:42.560' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 9222, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-29T07:23:41.350' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 9223, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-29T07:27:13.060' AS DateTime), N'Usuario mkc@outlook.com.ar identificado exitosamente.', N'BL.SessionManager', N'INFO', N'unknown', 9224, N'LogIn')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-29T07:27:25.110' AS DateTime), N'Creando respaldo...', N'BL.BackupManager', N'INFO', N'unknown', 9225, N'PerformBackup')
INSERT [dbo].[LogEntry] ([created], [description], [entity], [logLevel], [userName], [id], [action]) VALUES (CAST(N'2018-09-29T07:27:26.233' AS DateTime), N'El respaldo se ha generado exitosamente.', N'BL.BackupManager', N'INFO', N'unknown', 9226, N'PerformBackup')
SET IDENTITY_INSERT [dbo].[LogEntry] OFF
SET IDENTITY_INSERT [dbo].[Map] ON 

INSERT [dbo].[Map] ([sourcePath], [id], [sourceId]) VALUES (N'family.png', 1, 1)
SET IDENTITY_INSERT [dbo].[Map] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de usuarios', 1, N'user_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de roles', 2, N'role_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de roles - usuarios', 3, N'user_role_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Bitácora', 5, N'log_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestion de mapas', 6, N'map_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de novedades', 7, N'news_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Dashboard', 8, N'dashboard.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de categorías de negocio', 9, N'business_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Marketing mix', 10, N'marketing_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Perfil de usuario', 11, N'user_profile.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Recuperar contraseña', 12, N'password_recovery.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de crédito / débito', 13, N'credit_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de promoción de ventas', 14, N'promotion_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de códigos de canje', 15, N'redeem_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de suscripción', 16, N'suscription_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de niveles de aprobación', 17, N'approval_manager.aspx')
INSERT [dbo].[Permission] ([description], [id], [urlAccess]) VALUES (N'Gestión de copia de respaldo', 18, N'backup_manager.aspx')
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[Resource] ON 

INSERT [dbo].[Resource] ([image], [description], [name], [id]) VALUES (N'home.png', N'Mapa loco', N'Ciudad de buenos aires', 1)
SET IDENTITY_INSERT [dbo].[Resource] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([description], [name], [id], [forweb]) VALUES (N'Ventas', N'Ventas', 22, 0)
INSERT [dbo].[Role] ([description], [name], [id], [forweb]) VALUES (N'Administrador de la plataforma (acceso total)', N'Administrador', 23, 0)
INSERT [dbo].[Role] ([description], [name], [id], [forweb]) VALUES (N'Rol de los usuarios que se registran en la web.', N'Usuario web', 24, 1)
INSERT [dbo].[Role] ([description], [name], [id], [forweb]) VALUES (N'Rol para el manejo del contenido de la plataforma.', N'Contenido', 25, 0)
INSERT [dbo].[Role] ([description], [name], [id], [forweb]) VALUES (N'Rol para la aprobación de los créditos que superen', N'Aprobador de crédito', 26, 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (22, 11)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (22, 12)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (22, 13)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (22, 14)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (22, 15)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 1)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 2)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 3)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 5)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 6)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 7)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 8)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 9)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 10)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 11)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 12)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 13)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 14)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 15)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 16)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 17)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (23, 18)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (24, 11)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (24, 12)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (24, 16)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (25, 6)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (25, 7)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (25, 8)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (25, 9)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (25, 10)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (25, 11)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (25, 12)
INSERT [dbo].[Role_Permission] ([roleId], [permissionId]) VALUES (26, 13)
SET IDENTITY_INSERT [dbo].[Translation] ON 

INSERT [dbo].[Translation] ([labelId], [translation], [id], [languageId]) VALUES (N'lblYes', N'Yes', 1, 2)
INSERT [dbo].[Translation] ([labelId], [translation], [id], [languageId]) VALUES (N'lblYes', N'Si', 3, 1)
INSERT [dbo].[Translation] ([labelId], [translation], [id], [languageId]) VALUES (N'lblNo', N'No', 5, 1)
INSERT [dbo].[Translation] ([labelId], [translation], [id], [languageId]) VALUES (N'lblNo', N'No', 7, 2)
SET IDENTITY_INSERT [dbo].[Translation] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([active], [languageId], [lastname], [lastupdate], [locked], [mail], [name], [password], [id], [deleted]) VALUES (0, 2, N'Agustín', CAST(N'2018-08-29T00:00:00' AS SmallDateTime), 1, N'mail@mail.com', N'Felipe', N'123', 2021, 1)
INSERT [dbo].[User] ([active], [languageId], [lastname], [lastupdate], [locked], [mail], [name], [password], [id], [deleted]) VALUES (0, 1, N'brtb', CAST(N'2018-09-02T00:00:00' AS SmallDateTime), 1, N'mail@correo.com', N'brt', N'789', 2026, 1)
INSERT [dbo].[User] ([active], [languageId], [lastname], [lastupdate], [locked], [mail], [name], [password], [id], [deleted]) VALUES (0, 1, N'swsws', CAST(N'2018-09-03T00:00:00' AS SmallDateTime), 1, N'mkc@outlook.com.ar', N'wsw', N'202cb962ac59075b964b07152d234b70', 2031, 1)
INSERT [dbo].[User] ([active], [languageId], [lastname], [lastupdate], [locked], [mail], [name], [password], [id], [deleted]) VALUES (1, 1, N'Antonio', CAST(N'2018-09-21T00:00:00' AS SmallDateTime), 0, N'mkc@outlook.com.ar', N'Felipe', N'8ce4b16b22b58894aa86c421e8759df3', 3065, 0)
INSERT [dbo].[User] ([active], [languageId], [lastname], [lastupdate], [locked], [mail], [name], [password], [id], [deleted]) VALUES (0, 1, N'Peladilla', CAST(N'2018-09-22T18:20:00' AS SmallDateTime), 1, N'notengo@mismo.com', N'Augusto', N'0cc175b9c0f1b6a831c399e269772661', 6055, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[User_Role] ([userId], [roleId]) VALUES (2021, 23)
INSERT [dbo].[User_Role] ([userId], [roleId]) VALUES (2026, 23)
INSERT [dbo].[User_Role] ([userId], [roleId]) VALUES (2031, 23)
INSERT [dbo].[User_Role] ([userId], [roleId]) VALUES (3065, 23)
/****** Object:  Index [IXFK_Announcement_User]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Announcement_User] ON [dbo].[Announcement]
(
	[authorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_CreditNoteApprovalLevel_Role]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_CreditNoteApprovalLevel_Role] ON [dbo].[CreditNoteApprovalLevel]
(
	[approverRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Invoice_Address]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Invoice_Address] ON [dbo].[Invoice]
(
	[billingAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Invoice_Card]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Invoice_Card] ON [dbo].[Invoice]
(
	[cardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Invoice_CreditNote]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Invoice_CreditNote] ON [dbo].[Invoice]
(
	[creditNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Invoice_User]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Invoice_User] ON [dbo].[Invoice]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_InvoiceItem_Invoice]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_InvoiceItem_Invoice] ON [dbo].[InvoiceItem]
(
	[invoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Item_Resource]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Item_Resource] ON [dbo].[Item]
(
	[resourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mailing_User]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mailing_User] ON [dbo].[Mailing]
(
	[lastEditorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mailing_User_02]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mailing_User_02] ON [dbo].[Mailing]
(
	[reviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Map_Resource]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Map_Resource] ON [dbo].[Map]
(
	[sourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_PersonalInformation_User]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_PersonalInformation_User] ON [dbo].[PersonalInformation]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Promotion_Item_Item]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Promotion_Item_Item] ON [dbo].[Promotion_Item]
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Promotion_Item_Promotion]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Promotion_Item_Promotion] ON [dbo].[Promotion_Item]
(
	[promotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_RedeemCode_Redeem]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_RedeemCode_Redeem] ON [dbo].[RedeemCode]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_RedeemCode_User]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_RedeemCode_User] ON [dbo].[RedeemCode]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Role]    Script Date: 29/9/2018 07:29:23 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [IX_Role] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Role_Permission_Permission]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Role_Permission_Permission] ON [dbo].[Role_Permission]
(
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Role_Permission_Role]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Role_Permission_Role] ON [dbo].[Role_Permission]
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Translation]    Script Date: 29/9/2018 07:29:23 ******/
ALTER TABLE [dbo].[Translation] ADD  CONSTRAINT [AK_Translation] UNIQUE NONCLUSTERED 
(
	[labelId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IXFK_Translation_Label]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Translation_Label] ON [dbo].[Translation]
(
	[labelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Translation_Language]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_Translation_Language] ON [dbo].[Translation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_User_Language]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_User_Language] ON [dbo].[User]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_User_Role_Role]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_User_Role_Role] ON [dbo].[User_Role]
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_User_Role_User]    Script Date: 29/9/2018 07:29:23 ******/
CREATE NONCLUSTERED INDEX [IXFK_User_Role_User] ON [dbo].[User_Role]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LogEntry] ADD  CONSTRAINT [DF_LogEntry_created]  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_forweb]  DEFAULT ((0)) FOR [forweb]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_active]  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_locked]  DEFAULT ((1)) FOR [locked]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK_Announcement_User] FOREIGN KEY([authorId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Announcement] CHECK CONSTRAINT [FK_Announcement_User]
GO
ALTER TABLE [dbo].[AppLink]  WITH CHECK ADD  CONSTRAINT [FK_AppLink_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[AppLink] CHECK CONSTRAINT [FK_AppLink_User]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Address] FOREIGN KEY([billingAddressId])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Address]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Card] FOREIGN KEY([cardId])
REFERENCES [dbo].[Card] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Card]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_CreditNote] FOREIGN KEY([creditNoteId])
REFERENCES [dbo].[CreditNote] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_CreditNote]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_User]
GO
ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_Invoice] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[Invoice] ([id])
GO
ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_Invoice]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Resource] FOREIGN KEY([resourceId])
REFERENCES [dbo].[Resource] ([id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Resource]
GO
ALTER TABLE [dbo].[Mailing]  WITH CHECK ADD  CONSTRAINT [FK_Mailing_User] FOREIGN KEY([lastEditorId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Mailing] CHECK CONSTRAINT [FK_Mailing_User]
GO
ALTER TABLE [dbo].[Mailing]  WITH CHECK ADD  CONSTRAINT [FK_Mailing_User_02] FOREIGN KEY([reviewerId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Mailing] CHECK CONSTRAINT [FK_Mailing_User_02]
GO
ALTER TABLE [dbo].[Map]  WITH CHECK ADD  CONSTRAINT [FK_Map_Resource] FOREIGN KEY([sourceId])
REFERENCES [dbo].[Resource] ([id])
GO
ALTER TABLE [dbo].[Map] CHECK CONSTRAINT [FK_Map_Resource]
GO
ALTER TABLE [dbo].[PersonalInformation]  WITH CHECK ADD  CONSTRAINT [FK_PersonalInformation_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[PersonalInformation] CHECK CONSTRAINT [FK_PersonalInformation_User]
GO
ALTER TABLE [dbo].[Promotion_Item]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_Item_Item] FOREIGN KEY([itemId])
REFERENCES [dbo].[Item] ([id])
GO
ALTER TABLE [dbo].[Promotion_Item] CHECK CONSTRAINT [FK_Promotion_Item_Item]
GO
ALTER TABLE [dbo].[Promotion_Item]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_Item_Promotion] FOREIGN KEY([promotionId])
REFERENCES [dbo].[Promotion] ([id])
GO
ALTER TABLE [dbo].[Promotion_Item] CHECK CONSTRAINT [FK_Promotion_Item_Promotion]
GO
ALTER TABLE [dbo].[RedeemCode]  WITH CHECK ADD  CONSTRAINT [FK_RedeemCode_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[RedeemCode] CHECK CONSTRAINT [FK_RedeemCode_User]
GO
ALTER TABLE [dbo].[Role_Permission]  WITH CHECK ADD  CONSTRAINT [FK_Role_Permission_Permission] FOREIGN KEY([permissionId])
REFERENCES [dbo].[Permission] ([id])
GO
ALTER TABLE [dbo].[Role_Permission] CHECK CONSTRAINT [FK_Role_Permission_Permission]
GO
ALTER TABLE [dbo].[Role_Permission]  WITH CHECK ADD  CONSTRAINT [FK_Role_Permission_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Role_Permission] CHECK CONSTRAINT [FK_Role_Permission_Role]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Label] FOREIGN KEY([labelId])
REFERENCES [dbo].[Label] ([id])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Label]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Language] FOREIGN KEY([languageId])
REFERENCES [dbo].[Language] ([id])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Language]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_Role]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_User]
GO
/****** Object:  StoredProcedure [dbo].[spCheckRoleExistence]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCheckRoleExistence]
@roleId int, @roleName varchar(50)
AS
	SET NOCOUNT ON;

	SELECT * FROM [role] WHERE [name] = @roleName AND id <> @roleId
GO
/****** Object:  StoredProcedure [dbo].[spDeleteLabel]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteLabel]
(
	@IsNull_description Int,
	@Original_description varchar(50),
	@Original_id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [label] WHERE (((@IsNull_description = 1 AND [description] IS NULL) OR ([description] = @Original_description)) AND ([id] = @Original_id))
GO
/****** Object:  StoredProcedure [dbo].[spDeleteLanguage]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteLanguage]
(
	@Original_name varchar(50),
	@Original_id int
)
AS
	SET NOCOUNT OFF;
	-- Eliminar traducciones
	-- Eliminar idioma
DELETE FROM [language] WHERE (([name] = @Original_name) AND ([id] = @Original_id))
GO
/****** Object:  StoredProcedure [dbo].[spDeleteMap]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteMap]
(
	@id int
)
AS
	SET NOCOUNT OFF;
	
	DECLARE @sourceId int;
	SELECT @sourceId = sourceId from [Map] WHERE [id] = @id;

	DELETE [Map] WHERE [id] = @id;
	DELETE [Resource] WHERE [id] = @sourceId;
	
	SELECT @@ROWCOUNT;
GO
/****** Object:  StoredProcedure [dbo].[spDeleteRole]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteRole]
(
	@roleId int
)
AS
	SET NOCOUNT OFF;
	DELETE FROM [role] WHERE [id] = @roleId

	SELECT @@ROWCOUNT
GO
/****** Object:  StoredProcedure [dbo].[spDeleteRolePermission]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteRolePermission]
(
	@roleId int
)
AS
	SET NOCOUNT OFF;
	DELETE FROM Role_Permission WHERE roleId = @roleId
	
	SELECT @@ROWCOUNT 
GO
/****** Object:  StoredProcedure [dbo].[spDeleteTranslation]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteTranslation]
(
	@Original_labelId varchar(50),
	@Original_translation varchar(50),
	@Original_id int,
	@Original_languageId int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [translation] WHERE (([labelId] = @Original_labelId) AND ([translation] = @Original_translation) AND ([id] = @Original_id) AND ([languageId] = @Original_languageId))
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUser]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteUser]
(
	@id int
)
AS
	SET NOCOUNT OFF;
	UPDATE [user] SET deleted = 1, active = 0, locked = 1 WHERE id = @id

	SELECT @@ROWCOUNT
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUserRole]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteUserRole]
(
	@userId int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [user_role] WHERE [userId] = @userId

SELECT @@ROWCOUNT
GO
/****** Object:  StoredProcedure [dbo].[spLoginUser]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<MKC>
-- Create date: <Create Date,,>
-- Description:	<SP utilizado para recuperar los datos de un usuario dependiendo>
-- =============================================
CREATE PROCEDURE [dbo].[spLoginUser]
@mail varchar(50), @password varchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT
		*
	FROM
		[user]
	WHERE
		mail = @mail AND [password] = @password
END
GO
/****** Object:  StoredProcedure [dbo].[spModifyLabel]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModifyLabel]
(
	@description varchar(50),
	@id int,
	@IsNull_description Int,
	@Original_description varchar(50),
	@Original_id int
)
AS
	SET NOCOUNT OFF;
UPDATE [label] SET [description] = @description, [id] = @id WHERE (((@IsNull_description = 1 AND [description] IS NULL) OR ([description] = @Original_description)) AND ([id] = @Original_id));
	
SELECT description, id FROM Label WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[spModifyLanguage]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModifyLanguage]
(
	@name varchar(50),
	@Original_name varchar(50),
	@Original_id int,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [language] SET [name] = @name WHERE (([name] = @Original_name) AND ([id] = @Original_id));
	
SELECT name, id FROM Language WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[spModifyMap]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModifyMap]
(
	@id as int,
	@name as varchar(50),
	@description as varchar(250),
	@imagePath varchar(250),
	@sourcePath varchar(250)
)
AS
	SET NOCOUNT OFF;

	DECLARE @sourceId int;
	SELECT @sourceId = sourceId from [Map] WHERE [id] = @id;

	UPDATE [Map] SET [sourcePath] = @sourcePath WHERE [id] = @id;
	UPDATE [Resource] SET [name] = @name, [description] = @description, [image] = @imagePath WHERE [id] = @sourceId;
	
	SELECT @@ROWCOUNT;
GO
/****** Object:  StoredProcedure [dbo].[spModifyRole]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModifyRole]
(
	@description varchar(50),
	@name varchar(50),
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [role] SET [description] = @description, [name] = @name WHERE id = @id

SELECT @id
GO
/****** Object:  StoredProcedure [dbo].[spModifyRolePermission]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModifyRolePermission]
(
	@description varchar(50),
	@urlAccess varchar(50),
	@Original_description varchar(50),
	@Original_id int,
	@IsNull_urlAccess Int,
	@Original_urlAccess varchar(50),
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [permission] SET [description] = @description, [urlAccess] = @urlAccess WHERE (([description] = @Original_description) AND ([id] = @Original_id) AND ((@IsNull_urlAccess = 1 AND [urlAccess] IS NULL) OR ([urlAccess] = @Original_urlAccess)));
	
SELECT description, id, urlAccess FROM Permission WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[spModifyTranslation]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModifyTranslation]
(
	@labelId varchar(50),
	@translation varchar(50),
	@languageId int,
	@Original_labelId varchar(50),
	@Original_translation varchar(50),
	@Original_id int,
	@Original_languageId int,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [translation] SET [labelId] = @labelId, [translation] = @translation, [languageId] = @languageId WHERE (([labelId] = @Original_labelId) AND ([translation] = @Original_translation) AND ([id] = @Original_id) AND ([languageId] = @Original_languageId));
	
SELECT labelId, translation, id, languageId FROM Translation WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[spModifyUser]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModifyUser]
(
	@active bit,
	@languageId int,
	@lastname varchar(50),
	@lastupdate date,
	@locked bit,
	@mail varchar(50),
	@name varchar(50),
	@password varchar(50) = NULL,
	@id int
)
AS
	SET NOCOUNT OFF;

	IF @password IS NULL
		-- No se actualiza la clave
		UPDATE [user] SET [active] = @active, [languageId] = @languageId, [lastname] = @lastname, [lastupdate] = @lastupdate, [locked] = @locked, [mail] = @mail, [name] = @name WHERE [id] = @id;
	ELSE
		-- Se actualiza todo
		UPDATE [user] SET [active] = @active, [languageId] = @languageId, [lastname] = @lastname, [lastupdate] = @lastupdate, [locked] = @locked, [mail] = @mail, [name] = @name, [password] = @password WHERE [id] = @id;

SELECT @@ROWCOUNT	
--SELECT active, languageId, lastname, lastupdate, locked, mail, name, password, username, id FROM [User] WHERE (id = @id) ORDER BY username
GO
/****** Object:  StoredProcedure [dbo].[spModifyUserRole]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModifyUserRole]
(
	@userId int,
	@roleId int,
	@Original_userId int,
	@Original_roleId int
)
AS
	SET NOCOUNT OFF;
UPDATE [user_role] SET [userId] = @userId, [roleId] = @roleId WHERE (([userId] = @Original_userId) AND ([roleId] = @Original_roleId));
	
SELECT userId, roleId FROM User_Role WHERE (roleId = @roleId) AND (userId = @userId)
GO
/****** Object:  StoredProcedure [dbo].[spReadLabel]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadLabel]
AS
	SET NOCOUNT ON;
SELECT * FROM label
GO
/****** Object:  StoredProcedure [dbo].[spReadLanguage]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<MKC>
-- Create date: <Create Date,,>
-- Description:	<SP utilizado para recuperar los idiomas.>
-- =============================================
CREATE PROCEDURE [dbo].[spReadLanguage]
@id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @id IS NULL 
		SELECT * FROM [LANGUAGE] ORDER BY [name] ASC;
	ELSE
		SELECT * FROM [LANGUAGE] WHERE id = @id ORDER BY [name] ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[spReadLog]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadLog]
@action varchar(50) = NULL,
@username varchar(50) = NULL,
@logLevel varchar(50) = NULL,
@description varchar(250) = NULL,
@entity varchar(50) = NULL

AS
	SET NOCOUNT ON;

	IF @logLevel IS NULL AND @action IS NULL AND @description IS NULL AND @entity IS NULL AND @username IS NULL 
		SELECT * FROM LogEntry
	ELSE
		BEGIN
			DECLARE @actionWhere VARCHAR(50)
			SET @actionWhere = ''
			DECLARE @usernameWhere VARCHAR(50)
			SET @usernameWhere = ''
			DECLARE @logLevelWhere VARCHAR(50)
			SET @logLevelWhere = ''
			DECLARE @descriptionWhere VARCHAR(250)
			SET  @descriptionWhere = ''
			DECLARE @entityWhere VARCHAR(50)
			SET @entityWhere = ''			
			DECLARE @finalSql VARCHAR(500)

			SET QUOTED_IDENTIFIER OFF;
						
			IF @action IS NOT NULL
				SET @actionWhere = ' [action] = ''' + @action + ''' AND '

			IF @username IS NOT NULL
				SET @usernameWhere = ' [userName] = ''' + @username + ''' AND '

			IF @logLevel IS NOT NULL
				SET @logLevelWhere = ' [logLevel] = ''' + @logLevel + ''' AND '

			IF @description IS NOT NULL
				SET @descriptionWhere = ' [description] = ''' + @description + ''' AND '

			IF @entity IS NOT NULL
				SET @entityWhere = ' [entity] = ''' + @entity + ''' AND '

			SET @finalSql = 'SELECT * FROM LogEntry WHERE ' + @actionWhere + @usernameWhere +
			@logLevelWhere + @descriptionWhere + @entityWhere
			
			--SET @finalSql = 'SELECT * FROM LogEntry WHERE ' + @actionWhere
			SET @finalSql = LEFT(@finalSql, LEN(@finalSql)-4)
			--print(LEFT(@finalSql, LEN(@finalSql)-4))
			--print(@finalSql)

			EXEC(@finalSql)
			SET QUOTED_IDENTIFIER ON;
		END
GO
/****** Object:  StoredProcedure [dbo].[spReadMap]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadMap]
@id as int
AS
	SET NOCOUNT ON;

	IF @id IS NOT NULL
		SELECT m.id, r.name, r.description, r.image,  m.sourcePath FROM Map m INNER JOIN [Resource] r ON r.id = m.sourceId WHERE m.id = @id;
	ELSE
		SELECT m.id, r.name, r.description, r.image,  m.sourcePath FROM Map m INNER JOIN [Resource] r ON r.id = m.sourceId;
GO
/****** Object:  StoredProcedure [dbo].[spReadRole]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadRole]
@id int, @userId int, @name varchar(50), @userOnly bit
AS
BEGIN
	SET NOCOUNT ON;

	IF @name IS NOT NULL AND @userOnly = 0
		SELECT * FROM [role] WHERE name = @name;
	ELSE IF @userId IS NOT NULL AND @userOnly = 0
		SELECT r.* FROM [role] r INNER JOIN User_Role ur 
		ON ur.roleId = r.id WHERE ur.userId = @userId ORDER BY [name] ASC;
	ELSE IF @id IS NOT NULL AND @userOnly = 0
		SELECT * FROM [role] WHERE id = @id ORDER BY [name] ASC;
	ELSE IF @userOnly = 1
		SELECT * FROM [role] WHERE forweb = @userOnly ORDER BY [name] ASC;
	ELSE
		SELECT * FROM [role] ORDER BY [name] ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[spReadRolePermission]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadRolePermission]
@roleId int, @unassigned bit
AS
	SET NOCOUNT ON;

	IF @roleId IS NOT NULL AND @unassigned = 1
		SELECT * FROM permission p WHERE p.id NOT IN 
		(SELECT permissionId FROM Role_Permission WHERE roleId = @roleId )
	ELSE IF @roleId IS NOT NULL AND @unassigned = 0
		SELECT P.* FROM permission p INNER JOIN Role_Permission rp ON rp.permissionId = p.id
		WHERE rp.roleId = @roleId
	ELSE
		SELECT * FROM Permission ORDER BY [description] ASC; 
GO
/****** Object:  StoredProcedure [dbo].[spReadTest]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<MKC>
-- Create date: <Create Date,,>
-- Description:	<SP utilizado para ejecutar pruebas de lectura>
-- =============================================
CREATE   PROCEDURE [dbo].[spReadTest]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 'Ejecutado' result;
END
GO
/****** Object:  StoredProcedure [dbo].[spReadTranslation]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadTranslation]
@languageId int

AS
	SET NOCOUNT ON;
	IF @languageId IS NULL
		SELECT t.*, l.description FROM translation t INNER JOIN label l ON t.labelId = l.id
	ELSE
		SELECT t.*, l.description FROM translation t INNER JOIN label l ON t.labelId = l.id
		WHERE languageId = @languageId
GO
/****** Object:  StoredProcedure [dbo].[spReadUser]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadUser]
@id int,
@mail varchar(50)
AS
	SET NOCOUNT ON;

	IF @id IS NOT NULL
		SELECT * FROM [user] WHERE id = @id;
	ELSE IF @mail IS NOT NULL
		SELECT * FROM [user] WHERE deleted = 0 AND mail = @mail
	ELSE
		SELECT * FROM [user] WHERE deleted = 0 order by mail ASC
GO
/****** Object:  StoredProcedure [dbo].[spReadUserRole]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadUserRole]
@userId int, @roleId int, @inUse bit
AS
	SET NOCOUNT ON;
	
	IF @inUse IS NULL AND @roleId IS NULL AND @userId IS NULL
		SELECT * FROM user_role

	ELSE IF @inUse = 1 AND @roleId IS NOT NULL
		-- Chequea si el rol está siendo usando a través de la existencia de relaciones
		SELECT * FROM user_role WHERE roleId = @roleId
	ELSE IF @inUse = 0 AND @userId IS NOT NULL
		-- Recupera todos los roles sin usar a un usuario
		SELECT * FROM [role] WHERE id NOT IN (SELECT roleId FROM User_Role WHERE userId = @userid)
	ELSE IF @inUse = 0 AND @userId IS NULL
		-- Lista de usuarios sin roles
		SELECT * FROM [User] u LEFT JOIN user_role ur ON ur.userId = u.id
		WHERE ur.userId IS NULL

	ELSE IF @userId IS NOT NULL
		-- Recupera los roles de un usario
		SELECT r.* FROM [role] r INNER JOIN User_Role ur ON ur.roleId = r.id WHERE ur.userId = @userId
	
	

	
GO
/****** Object:  StoredProcedure [dbo].[spWriteLabel]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWriteLabel]
(
	@description varchar(50),
	@id int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [label] ([description], [id]) VALUES (@description, @id);
	
SELECT description, id FROM Label WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[spWriteLanguage]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWriteLanguage]
(
	@name varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [language] ([name]) VALUES (@name);
	
SELECT name, id FROM Language WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[spWriteLog]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWriteLog]
(
	@description varchar(250),
	@entity varchar(50),
	@logLevel varchar(50),
	@userName varchar(50),
	@action varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [LogEntry] ([description], [entity], [logLevel], [userName], [action]) VALUES (@description, @entity, @logLevel, @userName, @action);

SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[spWriteMap]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWriteMap]
(
	@name as varchar(50),
	@description as varchar(250),
	@imagePath varchar(250),
	@sourcePath varchar(250)	
	
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Resource] ([name], [description], [image]) VALUES (@name, @description, @imagePath);
INSERT INTO [Map] ([sourceId], [sourcePath]) VALUES (SCOPE_IDENTITY(), @sourcePath);
SELECT SCOPE_IDENTITY()	
GO
/****** Object:  StoredProcedure [dbo].[spWriteRole]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWriteRole]
(
	@description varchar(250),
	@name varchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [role] ([description], [name]) VALUES (@description, @name);
	
SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[spWriteRolePermission]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWriteRolePermission]
(
	@roleId int,
	@permissionId int
)
AS
	SET NOCOUNT OFF;
INSERT INTO Role_Permission(roleId, permissionId) VALUES (@roleId, @permissionId);
	
SELECT roleId, permissionId FROM Role_Permission WHERE (roleId = @roleId AND permissionId = @permissionId)
GO
/****** Object:  StoredProcedure [dbo].[spWriteTest]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<MKC>
-- Create date: <Create Date,,>
-- Description:	<SP utilizado para ejecutar pruebas de lectura>
-- =============================================
CREATE   PROCEDURE [dbo].[spWriteTest]
@key varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT 'Ejecutado' result;
END
GO
/****** Object:  StoredProcedure [dbo].[spWriteTranslation]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWriteTranslation]
(
	@labelId varchar(50),
	@translation varchar(50),
	@languageId int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [translation] ([labelId], [translation], [languageId]) VALUES (@labelId, @translation, @languageId);
	
SELECT labelId, translation, id, languageId FROM Translation WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[spWriteUser]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<MKC>
-- Create date: <Create Date,,>
-- Description:	<SP utilizado para ejecutar pruebas de lectura>
-- =============================================
CREATE   PROCEDURE [dbo].[spWriteUser]
@password varchar(50), @mail varchar(50), @active bit, @locked bit,
@language int, @name varchar(50), @lastname varchar(50), @lastupdate datetime 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO 
[User] ([active] ,[languageId] ,[lastname] ,[lastupdate] ,[locked] ,[mail] ,[name] ,[password])
VALUES 
(@active, @language, @lastname, @lastupdate, @locked, @mail, @name, @password)

SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[spWriteUserRole]    Script Date: 29/9/2018 07:29:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWriteUserRole]
(
	@userId int,
	@roleId int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [user_role] ([userId], [roleId]) VALUES (@userId, @roleId);
	
SELECT @@ROWCOUNT
GO
USE [master]
GO
ALTER DATABASE [ubiquicity] SET  READ_WRITE 
GO
