USE [master]
GO
drop database MilkTeaShopManagement
go
/****** Object:  Database [MilkTeaShopManagement]    Script Date: 11/27/2021 13:04:02 ******/
CREATE DATABASE [MilkTeaShopManagement] ON  PRIMARY 
( NAME = N'MilkTeaShopManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\MilkTeaShopManagement.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MilkTeaShopManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\MilkTeaShopManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MilkTeaShopManagement] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MilkTeaShopManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MilkTeaShopManagement] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET ARITHABORT OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MilkTeaShopManagement] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MilkTeaShopManagement] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET  DISABLE_BROKER
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MilkTeaShopManagement] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MilkTeaShopManagement] SET  READ_WRITE
GO
ALTER DATABASE [MilkTeaShopManagement] SET RECOVERY SIMPLE
GO
ALTER DATABASE [MilkTeaShopManagement] SET  MULTI_USER
GO
ALTER DATABASE [MilkTeaShopManagement] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MilkTeaShopManagement] SET DB_CHAINING OFF
GO
USE [MilkTeaShopManagement]
GO
drop table tblUsers
go

/****** Object:  Table [dbo].[tblUsers]    Script Date: 11/27/2021 13:04:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE tblUsers(
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL, 
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', 1)





/*******		Product category			********/
DROP TABLE tblCategory
GO
CREATE TABLE tblCategory(
	categoryID nvarchar(50) NOT NULL,
	categoryName nvarchar(50) NOT NULL,
	CONSTRAINT PK_tblCategory PRIMARY KEY CLUSTERED 
(
	categoryID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
INSERT tblCategory(categoryID,categoryName) VALUES ('B1','Tea')
INSERT tblCategory(categoryID,categoryName) VALUES ('B2','Coffee')
INSERT tblCategory(categoryID,categoryName) VALUES ('B3','Milk tea')



/*******			Product					********/
DROP TABLE tblProduct
GO
CREATE TABLE tblProduct(
	productID nvarchar(50) NOT NULL,
	productName nvarchar(50) NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	categoryID nvarchar(50),
	CONSTRAINT PK_tblProduct PRIMARY KEY CLUSTERED
(
	productID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT FK_tblProduct FOREIGN KEY (categoryID) REFERENCES tblCategory
) ON [PRIMARY]
GO
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('T01','Lemon Tea',15,20,'B1')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('T02','Chamomile Tea',32,20,'B1')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('T03','Hibiscus Tea',15,20,'B1')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('T04','Ginger Tea',69,20,'B1')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('T05','Earl Grey Tea',15,20,'B1')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('T06','Ceylons Tea',15,20,'B1')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('C01','Espresso',15,20,'B2')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('C02','Americano',20,20,'B2')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('C03','Latte',67,20,'B2')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('C04','Machiato',15,20,'B2')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('C05','Affogato',35,20,'B2')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('M01','Brown Sugar Boba Milktea',15,20,'B3')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('M02','Matcha Milktea',15,20,'B3')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('M03','Original Milktea',50,20,'B3')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('M04','Taro Milktea',15,20,'B3')
INSERT tblProduct(productID, productName, price, quantity, categoryID) VALUES ('M05','Almond Milktea',29,20,'B3')



/********		Product image		******/
DROP TABLE tblProductImage
GO
CREATE TABLE tblProductImage(
	imageID nvarchar(50) NOT NULL,
	productID nvarchar(50) NOT NULL,
	picture image,
	CONSTRAINT PK_tblProductImage PRIMARY KEY CLUSTERED
(
	imageID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT FK_tblProductImage FOREIGN KEY (productID) REFERENCES tblProduct
) ON [PRIMARY]
GO







/*******			Order				********/
DROP TABLE tblOrder
GO
CREATE TABLE tblOrder(
	orderID nvarchar(50) NOT NULL,
	userID nvarchar(50) NOT NULL,
	orderDate datetime,
	total float,
	CONSTRAINT PK_tblOrder PRIMARY KEY CLUSTERED 
(
	orderID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT FK_tblOrder FOREIGN KEY (userID) REFERENCES tblUsers
) ON [PRIMARY]
GO



/*******			Order detail				********/
DROP TABLE tblOrderDetail
GO
CREATE TABLE tblOrderDetail(
	detailID nvarchar(50) NOT NULL,
	orderID nvarchar(50) NOT NULL,
	productID nvarchar(50),
	price float,
	quantity int,
	total float,
	CONSTRAINT PK_tblOrderDetail PRIMARY KEY CLUSTERED 
(
	detailID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT FK_tblOrderDetail_Order FOREIGN KEY (orderID) REFERENCES tblOrder,
	CONSTRAINT FK_tblOrderDetail_Product FOREIGN KEY (productID) REFERENCES tblProduct
) ON [PRIMARY]
GO