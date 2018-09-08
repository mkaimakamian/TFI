USE [master]
GO
/****** Object:  Database [ubiquicity]    Script Date: 8/9/2018 03:19:03 ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 8/9/2018 03:19:04 ******/
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
/****** Object:  Table [dbo].[Announcement]    Script Date: 8/9/2018 03:19:04 ******/
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
/****** Object:  Table [dbo].[AppLink]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[BusinessType]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[Card]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[CreditNote]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[CreditNoteApprovalLevel]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[InvoiceItem]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[Label]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[LogEntry]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[Mailing]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[Map]    Script Date: 8/9/2018 03:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Map](
	[sourcePath] [varchar](50) NOT NULL,
	[id] [int] NOT NULL,
	[sourceId] [int] NOT NULL,
 CONSTRAINT [PK_Map] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsAddressee]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 8/9/2018 03:19:05 ******/
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
/****** Object:  Table [dbo].[PersonalInformation]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  Table [dbo].[Promotion]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  Table [dbo].[Promotion_Item]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  Table [dbo].[Redeem]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  Table [dbo].[RedeemCode]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  Table [dbo].[Resource]    Script Date: 8/9/2018 03:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[description] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/9/2018 03:19:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Role] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Permission]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  Table [dbo].[Subscription]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  Table [dbo].[Translation]    Script Date: 8/9/2018 03:19:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Translation] UNIQUE NONCLUSTERED 
(
	[labelId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/9/2018 03:19:06 ******/
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
	[username] [varchar](50) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  Index [IXFK_Announcement_User]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Announcement_User] ON [dbo].[Announcement]
(
	[authorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_CreditNoteApprovalLevel_Role]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_CreditNoteApprovalLevel_Role] ON [dbo].[CreditNoteApprovalLevel]
(
	[approverRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Invoice_Address]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Invoice_Address] ON [dbo].[Invoice]
(
	[billingAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Invoice_Card]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Invoice_Card] ON [dbo].[Invoice]
(
	[cardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Invoice_CreditNote]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Invoice_CreditNote] ON [dbo].[Invoice]
(
	[creditNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Invoice_User]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Invoice_User] ON [dbo].[Invoice]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_InvoiceItem_Invoice]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_InvoiceItem_Invoice] ON [dbo].[InvoiceItem]
(
	[invoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Item_Resource]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Item_Resource] ON [dbo].[Item]
(
	[resourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mailing_User]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mailing_User] ON [dbo].[Mailing]
(
	[lastEditorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Mailing_User_02]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Mailing_User_02] ON [dbo].[Mailing]
(
	[reviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Map_Resource]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Map_Resource] ON [dbo].[Map]
(
	[sourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_PersonalInformation_User]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_PersonalInformation_User] ON [dbo].[PersonalInformation]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Promotion_Item_Item]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Promotion_Item_Item] ON [dbo].[Promotion_Item]
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Promotion_Item_Promotion]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Promotion_Item_Promotion] ON [dbo].[Promotion_Item]
(
	[promotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_RedeemCode_Redeem]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_RedeemCode_Redeem] ON [dbo].[RedeemCode]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_RedeemCode_User]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_RedeemCode_User] ON [dbo].[RedeemCode]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Role_Permission_Permission]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Role_Permission_Permission] ON [dbo].[Role_Permission]
(
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Role_Permission_Role]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Role_Permission_Role] ON [dbo].[Role_Permission]
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IXFK_Translation_Label]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Translation_Label] ON [dbo].[Translation]
(
	[labelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_Translation_Language]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_Translation_Language] ON [dbo].[Translation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_User_Language]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_User_Language] ON [dbo].[User]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_User_Role_Role]    Script Date: 8/9/2018 03:19:06 ******/
CREATE NONCLUSTERED INDEX [IXFK_User_Role_Role] ON [dbo].[User_Role]
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_User_Role_User]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spCheckRoleExistence]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteLabel]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteLanguage]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteRole]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteRolePermission]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteTranslation]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteUser]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteUserRole]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spLoginUser]    Script Date: 8/9/2018 03:19:06 ******/
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
@username varchar(50), @password varchar(50) 
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
		username = @username AND [password] = @password
END
GO
/****** Object:  StoredProcedure [dbo].[spModifyLabel]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spModifyLanguage]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spModifyRole]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spModifyRolePermission]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spModifyTranslation]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spModifyUser]    Script Date: 8/9/2018 03:19:06 ******/
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
	@password varchar(50),
	@username varchar(50),
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [user] SET [active] = @active, [languageId] = @languageId, [lastname] = @lastname, [lastupdate] = @lastupdate, [locked] = @locked, [mail] = @mail, [name] = @name, [password] = @password, [username] = @username WHERE [id] = @id;

SELECT @@ROWCOUNT	
--SELECT active, languageId, lastname, lastupdate, locked, mail, name, password, username, id FROM [User] WHERE (id = @id) ORDER BY username
GO
/****** Object:  StoredProcedure [dbo].[spModifyUserRole]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spReadLabel]    Script Date: 8/9/2018 03:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadLabel]
AS
	SET NOCOUNT ON;
SELECT * FROM label
GO
/****** Object:  StoredProcedure [dbo].[spReadLanguage]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spReadLog]    Script Date: 8/9/2018 03:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadLog]
AS
	SET NOCOUNT ON;
SELECT * FROM LogEntry
GO
/****** Object:  StoredProcedure [dbo].[spReadRole]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spReadRolePermission]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spReadTest]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spReadTranslation]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spReadUser]    Script Date: 8/9/2018 03:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReadUser]
@id int,
@userName varchar(50),
@mail varchar(50)
AS
	SET NOCOUNT ON;

	IF @id IS NOT NULL
		SELECT * FROM [user] WHERE id = @id;
	ELSE IF @userName IS NOT NULL
		SELECT * FROM [user] WHERE deleted = 0 AND [username] = @userName
	ELSE IF @mail IS NOT NULL
		SELECT * FROM [user] WHERE deleted = 0 AND mail = @mail
	ELSE
		SELECT * FROM [user] WHERE deleted = 0 order by username ASC
GO
/****** Object:  StoredProcedure [dbo].[spReadUserRole]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spWriteLabel]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spWriteLanguage]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spWriteLog]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spWriteRole]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spWriteRolePermission]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spWriteTest]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spWriteTranslation]    Script Date: 8/9/2018 03:19:06 ******/
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
/****** Object:  StoredProcedure [dbo].[spWriteUser]    Script Date: 8/9/2018 03:19:06 ******/
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
@username varchar(50), @password varchar(50), @mail varchar(50), @active bit, @locked bit,
@language int, @name varchar(50), @lastname varchar(50), @lastupdate datetime 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

INSERT INTO 
[User] ([active] ,[languageId] ,[lastname] ,[lastupdate] ,[locked] ,[mail] ,[name] ,[password] ,[username])
VALUES 
(@active, @language, @lastname, @lastupdate, @locked, @mail, @name, @password, @username)

SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[spWriteUserRole]    Script Date: 8/9/2018 03:19:06 ******/
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
