USE [master]
GO
/****** Object:  Database [Web 3]    Script Date: 12/13/2024 10:02:00 PM ******/
CREATE DATABASE [Web 3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web 3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Web 3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web 3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Web 3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Web 3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web 3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web 3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web 3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web 3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web 3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web 3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web 3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Web 3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web 3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web 3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web 3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web 3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web 3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web 3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web 3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web 3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Web 3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web 3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web 3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web 3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web 3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web 3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web 3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web 3] SET RECOVERY FULL 
GO
ALTER DATABASE [Web 3] SET  MULTI_USER 
GO
ALTER DATABASE [Web 3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web 3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web 3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web 3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web 3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web 3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Web 3] SET QUERY_STORE = ON
GO
ALTER DATABASE [Web 3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Web 3]
GO
/****** Object:  Table [dbo].[Banking_transactions_&_Accounts Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banking_transactions_&_Accounts Table](
	[bank_account_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[bank_name] [varchar](225) NOT NULL,
	[account_number] [varchar](70) NOT NULL,
	[ifsc_code] [varchar](15) NOT NULL,
	[created_at] [timestamp] NOT NULL,
 CONSTRAINT [PK_Banking_transactions_&_Accounts Table] PRIMARY KEY CLUSTERED 
(
	[bank_account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Community_engagements_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community_engagements_Table](
	[engagement_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[engagement_type] [smallint] NOT NULL,
	[content] [text] NOT NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Community_engagements_Table] PRIMARY KEY CLUSTERED 
(
	[engagement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[engagement_type_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[engagement_type_Table](
	[id] [smallint] NOT NULL,
	[engagement_types] [varchar](50) NOT NULL,
 CONSTRAINT [PK_engagement_type_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KYC_Information_table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KYC_Information_table](
	[kyc_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[national_id] [varchar](20) NOT NULL,
	[address] [text] NOT NULL,
	[kyc_status] [smallint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_KYC_Information_table] PRIMARY KEY CLUSTERED 
(
	[kyc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KYC_Status_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KYC_Status_Table](
	[id] [smallint] NOT NULL,
	[KYC_S] [varchar](50) NOT NULL,
 CONSTRAINT [PK_KYC_Status_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staking_information_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staking_information_Table](
	[staking_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[amount_staked] [decimal](18, 2) NOT NULL,
	[reward_earned] [decimal](18, 2) NOT NULL,
	[staking_start] [datetime] NOT NULL,
	[staking_end] [datetime] NOT NULL,
	[status] [smallint] NOT NULL,
 CONSTRAINT [PK_Staking_information_Table] PRIMARY KEY CLUSTERED 
(
	[staking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staking_statuses_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staking_statuses_Table](
	[id] [smallint] NOT NULL,
	[staking_statuses] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_staking_statuses_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token_information_table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token_information_table](
	[token_id] [bigint] NOT NULL,
	[token_name] [varchar](225) NOT NULL,
	[token_address] [varchar](225) NOT NULL,
	[clone_name] [varchar](225) NOT NULL,
	[clone_address] [varchar](225) NOT NULL,
	[is_valid] [smallint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Token_information_table] PRIMARY KEY CLUSTERED 
(
	[token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_history_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_history_Table](
	[transaction_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[transaction_type] [smallint] NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[currency] [varchar](10) NOT NULL,
	[status] [smallint] NOT NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Transaction_history_Table] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Status_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Status_Table](
	[id] [smallint] NOT NULL,
	[Transaction_Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Transaction_Status_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Types_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Types_Table](
	[id] [smallint] NOT NULL,
	[transaction_types] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Transaction_Types_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles_Table](
	[id] [smallint] NOT NULL,
	[user_roles] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user_roles_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Validation_history_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Validation_history_Table](
	[validation_id] [bigint] NOT NULL,
	[validator_id] [bigint] NOT NULL,
	[transaction_id] [bigint] NOT NULL,
	[validation_status] [smallint] NOT NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Validation_history_Table] PRIMARY KEY CLUSTERED 
(
	[validation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Validation_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Validation_Table](
	[id] [smallint] NOT NULL,
	[validation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Validation_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[validations_status_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[validations_status_Table](
	[id] [smallint] NOT NULL,
	[validations_status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_validations_status_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Validator_or_user_Table]    Script Date: 12/13/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Validator_or_user_Table](
	[user_id] [bigint] NOT NULL,
	[role] [smallint] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password_hash] [text] NOT NULL,
	[created_at] [timestamp] NOT NULL,
 CONSTRAINT [PK_Validator_or_user_Table] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banking_transactions_&_Accounts Table]  WITH CHECK ADD  CONSTRAINT [[FK_Banking_transactions_&_Accounts Table_Banking_transactions_&_Accounts Table]]_user_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[Validator_or_user_Table] ([user_id])
GO
ALTER TABLE [dbo].[Banking_transactions_&_Accounts Table] CHECK CONSTRAINT [[FK_Banking_transactions_&_Accounts Table_Banking_transactions_&_Accounts Table]]_user_table]
GO
ALTER TABLE [dbo].[Community_engagements_Table]  WITH CHECK ADD  CONSTRAINT [FK_Community_engagements_Table_Community_engagements_Table_engagement_type] FOREIGN KEY([engagement_type])
REFERENCES [dbo].[engagement_type_Table] ([id])
GO
ALTER TABLE [dbo].[Community_engagements_Table] CHECK CONSTRAINT [FK_Community_engagements_Table_Community_engagements_Table_engagement_type]
GO
ALTER TABLE [dbo].[Community_engagements_Table]  WITH CHECK ADD  CONSTRAINT [FK_Community_engagements_Table_Community_engagements_Table_user_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[Validator_or_user_Table] ([user_id])
GO
ALTER TABLE [dbo].[Community_engagements_Table] CHECK CONSTRAINT [FK_Community_engagements_Table_Community_engagements_Table_user_table]
GO
ALTER TABLE [dbo].[KYC_Information_table]  WITH CHECK ADD  CONSTRAINT [FK_KYC_Information_table_KYC_Information_table_KYC_S] FOREIGN KEY([kyc_status])
REFERENCES [dbo].[KYC_Status_Table] ([id])
GO
ALTER TABLE [dbo].[KYC_Information_table] CHECK CONSTRAINT [FK_KYC_Information_table_KYC_Information_table_KYC_S]
GO
ALTER TABLE [dbo].[KYC_Information_table]  WITH CHECK ADD  CONSTRAINT [FK_KYC_Information_table_KYC_Information_table_user_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[Validator_or_user_Table] ([user_id])
GO
ALTER TABLE [dbo].[KYC_Information_table] CHECK CONSTRAINT [FK_KYC_Information_table_KYC_Information_table_user_table]
GO
ALTER TABLE [dbo].[Staking_information_Table]  WITH CHECK ADD  CONSTRAINT [FK_Staking_information_Table_Staking_information_Table_staking_statuses] FOREIGN KEY([status])
REFERENCES [dbo].[staking_statuses_Table] ([id])
GO
ALTER TABLE [dbo].[Staking_information_Table] CHECK CONSTRAINT [FK_Staking_information_Table_Staking_information_Table_staking_statuses]
GO
ALTER TABLE [dbo].[Staking_information_Table]  WITH CHECK ADD  CONSTRAINT [FK_Staking_information_Table_Staking_information_Table_user_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[Validator_or_user_Table] ([user_id])
GO
ALTER TABLE [dbo].[Staking_information_Table] CHECK CONSTRAINT [FK_Staking_information_Table_Staking_information_Table_user_table]
GO
ALTER TABLE [dbo].[Token_information_table]  WITH CHECK ADD  CONSTRAINT [FK_Token_information_table_Token_information_table_Validation] FOREIGN KEY([is_valid])
REFERENCES [dbo].[Validation_Table] ([id])
GO
ALTER TABLE [dbo].[Token_information_table] CHECK CONSTRAINT [FK_Token_information_table_Token_information_table_Validation]
GO
ALTER TABLE [dbo].[Transaction_history_Table]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_history_Table_Transaction_history_Table_Transaction_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Transaction_Status_Table] ([id])
GO
ALTER TABLE [dbo].[Transaction_history_Table] CHECK CONSTRAINT [FK_Transaction_history_Table_Transaction_history_Table_Transaction_Status]
GO
ALTER TABLE [dbo].[Transaction_history_Table]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_history_Table_Transaction_history_Table_transaction_types] FOREIGN KEY([transaction_type])
REFERENCES [dbo].[Transaction_Types_Table] ([id])
GO
ALTER TABLE [dbo].[Transaction_history_Table] CHECK CONSTRAINT [FK_Transaction_history_Table_Transaction_history_Table_transaction_types]
GO
ALTER TABLE [dbo].[Transaction_history_Table]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_history_Table_Transaction_history_Table_user_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[Validator_or_user_Table] ([user_id])
GO
ALTER TABLE [dbo].[Transaction_history_Table] CHECK CONSTRAINT [FK_Transaction_history_Table_Transaction_history_Table_user_table]
GO
ALTER TABLE [dbo].[Validation_history_Table]  WITH CHECK ADD  CONSTRAINT [FK_Validation_history_Table_Validation_history_Table_transaction_table] FOREIGN KEY([transaction_id])
REFERENCES [dbo].[Transaction_history_Table] ([transaction_id])
GO
ALTER TABLE [dbo].[Validation_history_Table] CHECK CONSTRAINT [FK_Validation_history_Table_Validation_history_Table_transaction_table]
GO
ALTER TABLE [dbo].[Validation_history_Table]  WITH CHECK ADD  CONSTRAINT [FK_Validation_history_Table_Validation_history_Table_validator_table] FOREIGN KEY([validator_id])
REFERENCES [dbo].[Validator_or_user_Table] ([user_id])
GO
ALTER TABLE [dbo].[Validation_history_Table] CHECK CONSTRAINT [FK_Validation_history_Table_Validation_history_Table_validator_table]
GO
ALTER TABLE [dbo].[Validation_history_Table]  WITH CHECK ADD  CONSTRAINT [FK_Validation_history_Table_Validation_history_Tablevalidations_status] FOREIGN KEY([validation_status])
REFERENCES [dbo].[validations_status_Table] ([id])
GO
ALTER TABLE [dbo].[Validation_history_Table] CHECK CONSTRAINT [FK_Validation_history_Table_Validation_history_Tablevalidations_status]
GO
ALTER TABLE [dbo].[Validator_or_user_Table]  WITH CHECK ADD  CONSTRAINT [FK_Validator_or_user_Table_Validator_or_user_Table_user_roles] FOREIGN KEY([role])
REFERENCES [dbo].[user_roles_Table] ([id])
GO
ALTER TABLE [dbo].[Validator_or_user_Table] CHECK CONSTRAINT [FK_Validator_or_user_Table_Validator_or_user_Table_user_roles]
GO
USE [master]
GO
ALTER DATABASE [Web 3] SET  READ_WRITE 
GO
