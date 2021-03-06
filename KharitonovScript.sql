USE [Pawnshop]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 05.07.2022 11:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[IDClient] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Patron] [nvarchar](50) NULL,
	[Tel] [nvarchar](11) NULL,
	[PassportSer] [int] NULL,
	[PassportNum] [int] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[IDClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthlyPayments]    Script Date: 05.07.2022 11:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyPayments](
	[IDMonthlyPayment] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Sum] [int] NULL,
	[Deadline] [date] NULL,
	[FactPayment] [date] NULL,
	[EmployeeID] [int] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_MonthlyPayments] PRIMARY KEY CLUSTERED 
(
	[IDMonthlyPayment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05.07.2022 11:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductTypeID] [int] NULL,
	[DeliveryDate] [date] NULL,
	[EstimatedCost] [int] NULL,
	[EmployeeID] [int] NULL,
	[DepositSum] [int] NULL,
	[RedemptionSum] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 05.07.2022 11:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[IDSale] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[SaleDate] [date] NULL,
	[EmployeeID] [int] NULL,
	[Sum] [int] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[IDSale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 05.07.2022 11:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[IDEmployee] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[IDEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusesOfPayments]    Script Date: 05.07.2022 11:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusesOfPayments](
	[IDStatus] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_StatusesOfPayments] PRIMARY KEY CLUSTERED 
(
	[IDStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesOfProducts]    Script Date: 05.07.2022 11:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOfProducts](
	[IDType] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypesOfProducts] PRIMARY KEY CLUSTERED 
(
	[IDType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MonthlyPayments]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyPayments_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([IDProduct])
GO
ALTER TABLE [dbo].[MonthlyPayments] CHECK CONSTRAINT [FK_MonthlyPayments_Products]
GO
ALTER TABLE [dbo].[MonthlyPayments]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyPayments_Staff] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Staff] ([IDEmployee])
GO
ALTER TABLE [dbo].[MonthlyPayments] CHECK CONSTRAINT [FK_MonthlyPayments_Staff]
GO
ALTER TABLE [dbo].[MonthlyPayments]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyPayments_StatusesOfPayments] FOREIGN KEY([StatusID])
REFERENCES [dbo].[StatusesOfPayments] ([IDStatus])
GO
ALTER TABLE [dbo].[MonthlyPayments] CHECK CONSTRAINT [FK_MonthlyPayments_StatusesOfPayments]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([IDClient])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Clients]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Staff] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Staff] ([IDEmployee])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Staff]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_TypesOfProducts] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[TypesOfProducts] ([IDType])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_TypesOfProducts]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([IDProduct])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Products]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Staff] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Staff] ([IDEmployee])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Staff]
GO
