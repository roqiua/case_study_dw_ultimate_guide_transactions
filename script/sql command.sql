--CREATE DATABASE [Sales_DW];
--GO
USE [Sales_DW];


GO
/****** Object:  Schema [core]    Script Date: 10/9/2026 9:23:56 AM ******/
--CREATE SCHEMA [core];
--GO
--/****** Object:  Schema [Staging]    Script Date: 10/9/2026 9:23:56 AM ******/
--CREATE SCHEMA [Staging];
--GO
/****** Object:  Table [Staging].[sales]    Script Date: 10/9/2026 9:23:56 AM ******/
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID(N'[Staging].[sales]')
                  AND type IN (N'U'))
    DROP TABLE [Staging].[sales];


GO
/****** Object:  Table [Staging].[dim_products]    Script Date: 10/9/2026 9:23:56 AM ******/
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID(N'[Staging].[dim_products]')
                  AND type IN (N'U'))
    DROP TABLE [Staging].[dim_products];


GO
/****** Object:  Table [core].[sales]    Script Date: 10/9/2026 9:23:56 AM ******/
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID(N'[core].[sales]')
                  AND type IN (N'U'))
    DROP TABLE [core].[sales];


GO
/****** Object:  Table [core].[dim_product]    Script Date: 10/9/2026 9:23:56 AM ******/
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID(N'[core].[dim_product]')
                  AND type IN (N'U'))
    DROP TABLE [core].[dim_product];


GO
/****** Object:  Table [core].[dim_payments]    Script Date: 10/9/2026 9:23:56 AM ******/
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID(N'[core].[dim_payments]')
                  AND type IN (N'U'))
    DROP TABLE [core].[dim_payments];


GO
/****** Object:  Table [core].[date_dim]    Script Date: 10/9/2026 9:23:56 AM ******/
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  object_id = OBJECT_ID(N'[core].[date_dim]')
                  AND type IN (N'U'))
    DROP TABLE [core].[date_dim];


GO
/****** Object:  Table [core].[date_dim]    Script Date: 10/9/2026 9:23:56 AM ******/
SET ANSI_NULLS ON;


GO
SET QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [core].[date_dim]
(
    [date_id] INT NOT NULL,
    [full_date] DATE NOT NULL,
    [day_number] INT NOT NULL,
    [day_name] VARCHAR (20) NOT NULL,
    [week_number] INT NOT NULL,
    [month_number] INT NOT NULL,
    [month_name] VARCHAR (20) NOT NULL,
    [quarter_number] INT NOT NULL,
    [year_number] INT NOT NULL,
    [is_weekend] BIT NOT NULL,
    CONSTRAINT [PK_date_dim] PRIMARY KEY CLUSTERED ([date_id] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
    CONSTRAINT [UQ_date_dim_full_date] UNIQUE NONCLUSTERED ([full_date] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];


GO
/****** Object:  Table [core].[dim_payments]    Script Date: 10/9/2026 9:23:57 AM ******/
SET ANSI_NULLS ON;


GO
SET QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [core].[dim_payments]
(
    [payment_fk] INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
    [payment] VARCHAR (50) NULL,
    [loyalty_card] VARCHAR (50) NULL
) ON [PRIMARY];


GO
/****** Object:  Table [core].[dim_product]    Script Date: 10/9/2026 9:23:57 AM ******/
SET ANSI_NULLS ON;


GO
SET QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [core].[dim_product]
(
    [Product_PK] INT PRIMARY KEY,
    [product_id] NVARCHAR (50) NULL,
    [product_name] NVARCHAR (100) NULL,
    [category] NVARCHAR (100) NULL,
    [subcategory] NVARCHAR (100) NULL,
    [brand] NVARCHAR (100) NULL
) ON [PRIMARY];


GO
/****** Object:  Table [core].[sales]    Script Date: 10/9/2026 9:23:57 AM ******/
SET ANSI_NULLS ON;


GO
SET QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [core].[sales]
(
    [transaction_id] INT NOT NULL,
    [transactional_date_fk] INT NULL,
    [transactional_time] TIME (7) NULL,
    [product_id] VARCHAR (100) NULL,
    [product_fk] INT NULL,
    [customer_id] INT NULL,
    [payment_fk] INT NULL,
    [credit_card] VARCHAR (30) NULL,
    [cost] DECIMAL (18, 2) NULL,
    [quantity] INT NULL,
    [price] DECIMAL (18, 2) NULL,
    [total_cost] DECIMAL (18, 2) NULL,
    [total_price] DECIMAL (18, 2) NULL,
    [profit] DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_core_sales] PRIMARY KEY CLUSTERED ([transaction_id] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];


GO
/****** Object:  Table [Staging].[dim_products]    Script Date: 10/9/2026 9:23:57 AM ******/
SET ANSI_NULLS ON;


GO
SET QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [Staging].[dim_products]
(
    [product_id_PK] INT IDENTITY (1, 1) NOT NULL,
    [product_id] NVARCHAR (50) NOT NULL,
    [product (brand)] NVARCHAR (100) NULL,
    [category] NVARCHAR (100) NULL,
    [sub_category] NVARCHAR (100) NULL,
    CONSTRAINT [PK_dim_products] PRIMARY KEY CLUSTERED ([product_id_PK] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];


GO
/****** Object:  Table [Staging].[sales]    Script Date: 10/9/2026 9:23:57 AM ******/
SET ANSI_NULLS ON;


GO
SET QUOTED_IDENTIFIER ON;


GO
CREATE TABLE [Staging].[sales]
(
    [transaction_id] INT NOT NULL,
    [transactional_date] DATETIME NULL,
    [product_id] VARCHAR (50) NULL,
    [customer_id] INT NULL,
    [payment] VARCHAR (50) NULL,
    [credit_card] VARCHAR (30) NULL,
    [loyalty_card] VARCHAR (50) NULL,
    [cost] DECIMAL (18, 2) NULL,
    [quantity] INT NULL,
    [price] DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_Staging_sales] PRIMARY KEY CLUSTERED ([transaction_id] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];
