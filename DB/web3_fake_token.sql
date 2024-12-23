USE [master]
GO
/****** Object:  Database [Web 3_fake tokens]    Script Date: 12/13/2024 10:03:12 PM ******/
CREATE DATABASE [Web 3_fake tokens]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web 3_fake tokens', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Web 3_fake tokens.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web 3_fake tokens_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Web 3_fake tokens_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Web 3_fake tokens] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web 3_fake tokens].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web 3_fake tokens] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web 3_fake tokens] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web 3_fake tokens] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Web 3_fake tokens] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web 3_fake tokens] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET RECOVERY FULL 
GO
ALTER DATABASE [Web 3_fake tokens] SET  MULTI_USER 
GO
ALTER DATABASE [Web 3_fake tokens] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web 3_fake tokens] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web 3_fake tokens] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web 3_fake tokens] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web 3_fake tokens] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web 3_fake tokens] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Web 3_fake tokens] SET QUERY_STORE = ON
GO
ALTER DATABASE [Web 3_fake tokens] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Web 3_fake tokens]
GO
/****** Object:  Table [dbo].[blacklist_check_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blacklist_check_Table](
	[id] [smallint] NOT NULL,
	[blacklist_check] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_blacklist_check_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Community_finding_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community_finding_Table](
	[finding_id] [bigint] NOT NULL,
	[token_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[content] [text] NOT NULL,
	[status] [smallint] NOT NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Community_finding_Table] PRIMARY KEY CLUSTERED 
(
	[finding_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fake_token_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fake_token_Table](
	[token_id] [bigint] NOT NULL,
	[token_creator_id] [bigint] NOT NULL,
	[reported_by] [bigint] NOT NULL,
	[token_name] [nvarchar](250) NOT NULL,
	[symbol] [nvarchar](20) NOT NULL,
	[token_address] [nvarchar](250) NOT NULL,
	[chain] [nvarchar](50) NOT NULL,
	[description] [text] NOT NULL,
	[status] [smallint] NOT NULL,
	[created_at] [timestamp] NOT NULL,
 CONSTRAINT [PK_Fake_token_Table] PRIMARY KEY CLUSTERED 
(
	[token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[findings_status_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[findings_status_Table](
	[id] [smallint] NOT NULL,
	[findings_status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_findings_status_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reporter_check_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reporter_check_Table](
	[id] [smallint] NOT NULL,
	[reporter_check] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_reporter_check_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scam_transaction_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scam_transaction_Table](
	[transaction_id] [bigint] NOT NULL,
	[token_id] [bigint] NOT NULL,
	[sender_id] [bigint] NOT NULL,
	[receiver_id] [bigint] NOT NULL,
	[amount] [decimal](18, 8) NOT NULL,
	[status] [smallint] NOT NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Scam_transaction_Table] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suspect_check]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suspect_check](
	[id] [smallint] NOT NULL,
	[suspect_check] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_suspect_check] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token_Creator_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token_Creator_Table](
	[creator_id] [bigint] NOT NULL,
	[reported_by] [bigint] NOT NULL,
	[wallet_address] [nvarchar](350) NOT NULL,
	[associated_cex_dex] [nvarchar](350) NOT NULL,
	[is_blacklisted] [smallint] NOT NULL,
	[description] [text] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Token_Creator_Table] PRIMARY KEY CLUSTERED 
(
	[creator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions_status_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions_status_Table](
	[id] [smallint] NOT NULL,
	[transactions_status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_transactions_status_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Table]    Script Date: 12/13/2024 10:03:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Table](
	[user_id] [bigint] NOT NULL,
	[wallet_address] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[is_reporter] [smallint] NOT NULL,
	[is_suspect] [smallint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_User_Table] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Community_finding_Table]  WITH CHECK ADD  CONSTRAINT [FK_Community_finding_Table_Community_finding_Table_fake_token] FOREIGN KEY([token_id])
REFERENCES [dbo].[Fake_token_Table] ([token_id])
GO
ALTER TABLE [dbo].[Community_finding_Table] CHECK CONSTRAINT [FK_Community_finding_Table_Community_finding_Table_fake_token]
GO
ALTER TABLE [dbo].[Community_finding_Table]  WITH CHECK ADD  CONSTRAINT [FK_Community_finding_Table_Community_finding_Table_findings_status_Table] FOREIGN KEY([status])
REFERENCES [dbo].[findings_status_Table] ([id])
GO
ALTER TABLE [dbo].[Community_finding_Table] CHECK CONSTRAINT [FK_Community_finding_Table_Community_finding_Table_findings_status_Table]
GO
ALTER TABLE [dbo].[Community_finding_Table]  WITH CHECK ADD  CONSTRAINT [FK_Community_finding_Table_Community_finding_Table_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[User_Table] ([user_id])
GO
ALTER TABLE [dbo].[Community_finding_Table] CHECK CONSTRAINT [FK_Community_finding_Table_Community_finding_Table_user]
GO
ALTER TABLE [dbo].[Fake_token_Table]  WITH CHECK ADD  CONSTRAINT [FK_Fake_token_Table_Fake_token_Table_creator] FOREIGN KEY([token_creator_id])
REFERENCES [dbo].[Token_Creator_Table] ([creator_id])
GO
ALTER TABLE [dbo].[Fake_token_Table] CHECK CONSTRAINT [FK_Fake_token_Table_Fake_token_Table_creator]
GO
ALTER TABLE [dbo].[Fake_token_Table]  WITH CHECK ADD  CONSTRAINT [FK_Fake_token_Table_Fake_token_Table_user_table] FOREIGN KEY([reported_by])
REFERENCES [dbo].[User_Table] ([user_id])
GO
ALTER TABLE [dbo].[Fake_token_Table] CHECK CONSTRAINT [FK_Fake_token_Table_Fake_token_Table_user_table]
GO
ALTER TABLE [dbo].[Scam_transaction_Table]  WITH CHECK ADD  CONSTRAINT [FK_Scam_transaction_Table_Scam_transaction_Table_fake_token] FOREIGN KEY([token_id])
REFERENCES [dbo].[Fake_token_Table] ([token_id])
GO
ALTER TABLE [dbo].[Scam_transaction_Table] CHECK CONSTRAINT [FK_Scam_transaction_Table_Scam_transaction_Table_fake_token]
GO
ALTER TABLE [dbo].[Scam_transaction_Table]  WITH CHECK ADD  CONSTRAINT [FK_Scam_transaction_Table_Scam_transaction_Table_reciever_id] FOREIGN KEY([receiver_id])
REFERENCES [dbo].[User_Table] ([user_id])
GO
ALTER TABLE [dbo].[Scam_transaction_Table] CHECK CONSTRAINT [FK_Scam_transaction_Table_Scam_transaction_Table_reciever_id]
GO
ALTER TABLE [dbo].[Scam_transaction_Table]  WITH CHECK ADD  CONSTRAINT [FK_Scam_transaction_Table_Scam_transaction_Table_sender_user] FOREIGN KEY([sender_id])
REFERENCES [dbo].[User_Table] ([user_id])
GO
ALTER TABLE [dbo].[Scam_transaction_Table] CHECK CONSTRAINT [FK_Scam_transaction_Table_Scam_transaction_Table_sender_user]
GO
ALTER TABLE [dbo].[Scam_transaction_Table]  WITH CHECK ADD  CONSTRAINT [FK_Scam_transaction_Table_Scam_transaction_Tabletransactions_status_Table] FOREIGN KEY([status])
REFERENCES [dbo].[transactions_status_Table] ([id])
GO
ALTER TABLE [dbo].[Scam_transaction_Table] CHECK CONSTRAINT [FK_Scam_transaction_Table_Scam_transaction_Tabletransactions_status_Table]
GO
ALTER TABLE [dbo].[Token_Creator_Table]  WITH CHECK ADD  CONSTRAINT [FK_Token_Creator_Table_Token_Creator_Table_user] FOREIGN KEY([reported_by])
REFERENCES [dbo].[User_Table] ([user_id])
GO
ALTER TABLE [dbo].[Token_Creator_Table] CHECK CONSTRAINT [FK_Token_Creator_Table_Token_Creator_Table_user]
GO
ALTER TABLE [dbo].[Token_Creator_Table]  WITH CHECK ADD  CONSTRAINT [FK_Token_Creator_Table_Token_Creator_Tableblacklist_check_Table] FOREIGN KEY([is_blacklisted])
REFERENCES [dbo].[blacklist_check_Table] ([id])
GO
ALTER TABLE [dbo].[Token_Creator_Table] CHECK CONSTRAINT [FK_Token_Creator_Table_Token_Creator_Tableblacklist_check_Table]
GO
ALTER TABLE [dbo].[User_Table]  WITH CHECK ADD  CONSTRAINT [FK_User_Table_User_Table_reporter_check] FOREIGN KEY([is_reporter])
REFERENCES [dbo].[reporter_check_Table] ([id])
GO
ALTER TABLE [dbo].[User_Table] CHECK CONSTRAINT [FK_User_Table_User_Table_reporter_check]
GO
ALTER TABLE [dbo].[User_Table]  WITH CHECK ADD  CONSTRAINT [FK_User_Table_User_Table_suspect_check] FOREIGN KEY([is_suspect])
REFERENCES [dbo].[suspect_check] ([id])
GO
ALTER TABLE [dbo].[User_Table] CHECK CONSTRAINT [FK_User_Table_User_Table_suspect_check]
GO
USE [master]
GO
ALTER DATABASE [Web 3_fake tokens] SET  READ_WRITE 
GO
