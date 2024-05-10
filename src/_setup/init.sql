USE [master]
GO

/****** Object:  Database [ShoeMoneyDb]    Script Date: 5/10/2024 6:30:29 PM ******/
CREATE DATABASE [ShoeMoneyDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoeMoneyDb', FILENAME = N'C:\Users\shawn\ShoeMoneyDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoeMoneyDb_log', FILENAME = N'C:\Users\shawn\ShoeMoneyDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeMoneyDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ShoeMoneyDb] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET ARITHABORT OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [ShoeMoneyDb] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ShoeMoneyDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ShoeMoneyDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET  ENABLE_BROKER 
GO

ALTER DATABASE [ShoeMoneyDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ShoeMoneyDb] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [ShoeMoneyDb] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [ShoeMoneyDb] SET  MULTI_USER 
GO

ALTER DATABASE [ShoeMoneyDb] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ShoeMoneyDb] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ShoeMoneyDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ShoeMoneyDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [ShoeMoneyDb] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ShoeMoneyDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [ShoeMoneyDb] SET QUERY_STORE = OFF
GO

ALTER DATABASE [ShoeMoneyDb] SET  READ_WRITE 
GO


USE [ShoeMoneyDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/10/2024 6:26:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 5/10/2024 6:26:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttentionTo] [nvarchar](max) NULL,
	[Line1] [nvarchar](max) NULL,
	[Line2] [nvarchar](max) NULL,
	[CityTown] [nvarchar](max) NULL,
	[StateProvince] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[ShippingPhoneNumber] [nvarchar](max) NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/10/2024 6:26:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 5/10/2024 6:26:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](6, 2) NOT NULL,
	[Quantity] [decimal](6, 2) NOT NULL,
	[Discount] [real] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Size] [nvarchar](max) NULL,
	[Width] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/10/2024 6:26:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[OrderType] [int] NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
	[Contact] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[OrderStatus] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 5/10/2024 6:26:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Amount] [decimal](8, 2) NOT NULL,
	[CardNumber] [nvarchar](max) NULL,
	[Cvv] [nvarchar](max) NULL,
	[Expiration] [nvarchar](max) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/10/2024 6:26:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Color] [nvarchar](max) NOT NULL,
	[Usage] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ImageFile] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Price] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240412223856_Initial', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240413042837_OrderStatus', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240413070929_CascadeRules', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240413212116_Payments', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240415230540_Sizes', N'8.0.4')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Flip Flops')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Sandals')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Shoes')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (1, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Air Zoom Century Shoes', N'1636.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7c80fca789c5c1863a4080d7ed57acf0_images.jpg', CAST(43.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (2, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men White Cricket Shoes', N'1637.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0ac13b20762f7542baadcb2472855437_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (3, N'Men', 3, N'Sports Shoes', N'Brown', N'Sports', N'Reebok Men''s Ventilator Ubiq Shoe', N'1653.jpg', N'http://assets.myntassets.com/v1/images/style/properties/349e9cdd07258c3f4254065dcad69c3e_images.jpg', CAST(70.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (4, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men''s Frisker LP Shoe', N'1654.jpg', N'http://assets.myntassets.com/v1/images/style/properties/271493f761fcb4583542bad929fb3d99_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (5, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Quechua Men Arpenaz Brown Sandal', N'1806.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1e404f8311c96db483657b8ef4113d56_images.jpg', CAST(36.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (6, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men''s Air Impetus Shoe', N'1831.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2b7f6813cc0aebb2e517ddee5cf57830_images.jpg', CAST(32.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (7, N'Men', 3, N'Sports Shoes', N'Silver', N'Sports', N'Nike Air Visi Sleek Shoes', N'1836.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cae015b083e7581db36c6df436b7ef80_images.jpg', CAST(40.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (8, N'Men', 2, N'Sandals', N'Navy Blue', N'Casual', N'Puma Men Trek Navy Blue Floater', N'2211.jpg', N'http://assets.myntassets.com/v1/images/style/properties/489285fce42ff6b4a5d6be37c26a971d_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (9, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Puma Men F1 Black Sandal', N'2218.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c0d7bee21dcc124c3254cfda13193d7f_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (10, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'ADIDAS Men''s Black Shoe', N'2219.jpg', N'http://assets.myntassets.com/v1/images/style/properties/11638bf2032ce289f91e53f6696594ed_images.jpg', CAST(25.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (11, N'Men', 2, N'Sandals', N'Black', N'Sports', N'Puma Men Carbon Black Sandal', N'2220.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c7292fc1fcc934dd9a693a136640bd47_images.jpg', CAST(31.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (12, N'Men', 2, N'Sandals', N'Grey', N'Sports', N'Puma Men Gypsy Grey Sandal', N'2227.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c691cbf2c611b9e0f9af6d11ef2046af_images.jpg', CAST(66.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (13, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Red Tape Black Men''s Semi Casual Shoe', N'2399.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0eac399dea02f88af3e4775f38a8924b_images.jpg', CAST(35.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (14, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Nike Men''s LunarFly Blue Shoe', N'2477.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2aaec62ff9756dab42e78315b35505e5_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (15, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Numero Uno Men''s Casual White Canvas Shoe', N'2504.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0f7f710f647111940975e75aa0303fe8_images.jpg', CAST(58.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (16, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Carlton London Men Semi Formal Black Shoe', N'2642.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e571426e3de987910f5bdd984338bd77_images.jpg', CAST(39.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (17, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Lee Cooper Men''s Casual Leather Black Shoe', N'2817.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3236b8ebf59620600dab8e1fbe8fd01f_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (18, N'Men', 2, N'Sandals', N'Black', N'Formal', N'Lee Cooper Men Formal Leather Black Sandal', N'2820.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3d1bbf550e8fe9db493fe79dc83d25ce_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (19, N'Men', 2, N'Sandals', N'Brown', N'Formal', N'Lee Cooper Men Formal Leather Brown Sandal', N'2821.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d7c47ca9f2381f2467cd89d19e70af3a_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (20, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Lee Cooper Men Leather Semi Formal Brown Shoe', N'2826.jpg', N'http://assets.myntassets.com/v1/images/style/properties/af0944e686e90b5d9dbc5bc7e0be982f_images.jpg', CAST(69.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (21, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Lee Cooper Men''s Formal Simpleton Black Shoe', N'2827.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b83e64858ee7aa7fc15ea781eebf1a4f_images.jpg', CAST(59.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (22, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Lee Cooper Men''s LC Casual Denim Blue Shoe', N'2828.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d8fbc6ec5c348077864f687febb98cca_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (23, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men''s Basket Biz White & Blue Shoe', N'2963.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8fe5241611ac361fa7103caa71beed8f_images.jpg', CAST(40.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (24, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Puma Men''s Match Classic White & Green Shoe', N'2964.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0ec80253c849cad29f12883f49dacb97_images.jpg', CAST(26.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (25, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men''s Lunarswift Black Shoe', N'3150.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f23c4d59eb6ca3cd621c3db690e0c708_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (26, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Nike Men''s Lunarswift Blue Shoe', N'3151.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7ee77f6e00c30da7cd5a1b3d93fe5943_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (27, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Air Max Moto White Blue Shoe', N'3159.jpg', N'http://assets.myntassets.com/v1/images/style/properties/538e095d6e2d1fe70731f5a14c154f2a_images.jpg', CAST(46.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (28, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Dual Fusion White Shoe', N'3160.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2647d08362ed75f3d01e78bad9f0b98f_images.jpg', CAST(79.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (29, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Air Citius MSL White Grey Shoe', N'3161.jpg', N'http://assets.myntassets.com/v1/images/style/properties/baffde85f36e72580d7246b0952ee688_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (30, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Incinerate MSL White Blue Shoe', N'3168.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4eff2353c62ec8b7bca9fbbaf5996bd2_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (31, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Asics Men''s Gel Cushioning Black Yellow Shoe', N'3300.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c57b44b0582da012445b913bf8d80be4_images.jpg', CAST(33.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (32, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Asics Men''s Gel Phoenix 3 Running White Black Shoe', N'3306.jpg', N'http://assets.myntassets.com/v1/images/style/properties/666ac16166295985a30aea57a1f75697_images.jpg', CAST(56.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (33, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Asics Men''s Gel Phoenix 3 Black Silver Shoe', N'3307.jpg', N'http://assets.myntassets.com/v1/images/style/properties/998c282acd503d2c7185647017adbfc9_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (34, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Asics Men''s Gel Cushioning Running White Black Yellow Shoe', N'3308.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3ad2891fc7b6eb03276bae0a9b85d73d_images.jpg', CAST(26.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (35, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Asics Men''s Gel Challenger 8 Tennis White Blue Shoe', N'3309.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ce37a8630a47c6d3e9c2ec47c73cf003_images.jpg', CAST(23.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (36, N'Men', 2, N'Sports Sandals', N'Navy Blue', N'Casual', N'ADIDAS Men Navy Blue Sandals', N'3503.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Adidas-Men-Spry-Navy-Yellow-Sandal_809772c91b008543bbf5b2976a750b92_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (37, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'ADIDAS Men Spry Wine Black Sandal', N'3504.jpg', N'http://assets.myntassets.com/v1/images/style/properties/92d20316dd7f9f71e57e03068a011d35_images.jpg', CAST(62.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (38, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men''s Brown Lifestyle Shoe', N'3550.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ac06fde1d825f4d5d4587113da3bd205_images.jpg', CAST(65.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (39, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men''s Charcoal Lifestyle Shoe', N'3551.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cbfbb7dc1aee995012f8bc9cda960063_images.jpg', CAST(74.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (40, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men Dark Brown Lifestyle Shoe', N'3556.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2053807e903d6257ecb31457c0187737_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (41, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men Black Lifestyle Casual Shoes', N'3557.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b9c487b15356b9d36c0e803b43adad76_images.jpg', CAST(58.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (42, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men''s Brown Casual Lifestyle Shoe', N'3558.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3b05935a6cb549695767b9ad514af8b0_images.jpg', CAST(33.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (43, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men''s Casual Brown Lifestyle Shoe', N'3559.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6ee05bbf2e4fad44253b05372eb7753f_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (44, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Skechers Men Off White Lifestyle Casual Shoe', N'3560.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e128f17c7a01b1478604f96915dc408b_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (45, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men''s Zeta Black Lifestyle Casual Shoe', N'3561.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b1b0fa0e8afbed7dd74c1df7b42090c8_images.jpg', CAST(68.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (46, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men''s White Silver Running Shoe', N'3566.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7dae540b7b309f050e1e1b635ceabf85_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (47, N'Men', 3, N'Sports Shoes', N'Silver', N'Sports', N'ADIDAS Men''s Silver White Running Shoe', N'3567.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7210fc2b108553e1603a5ba8d5dcf0e5_images.jpg', CAST(30.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (48, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'ADIDAS Mens Lightbone Brown Sandal', N'3569.jpg', N'http://assets.myntassets.com/v1/images/style/properties/dfc72752bea77607827945515d2d238c_images.jpg', CAST(66.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (49, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Converse Men''s All Star Canvas Ox Navy Blue Shoe', N'3592.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9cec0bcd1bcd475d5adb1a0debf81a9b_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (50, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Converse Men''s Chuck Taylor Print OX White Canvas Shoe', N'3594.jpg', N'http://assets.myntassets.com/v1/images/style/properties/894464418a042a27101effb0c4e5e17b_images.jpg', CAST(32.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (51, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Converse Men''s Chuck Taylor Big Check Red Black Canvas Shoe', N'3595.jpg', N'http://assets.myntassets.com/v1/images/style/properties/bdd2eed1b066a2e060bf864cbf8bfece_images.jpg', CAST(27.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (52, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Converse Men''s AS Canvas HI Black Shoe', N'3790.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2cbba1cd60b44011accb7c099a859ec4_images.jpg', CAST(66.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (53, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Converse Men Black & Red Shoes', N'3797.jpg', N'http://assets.myntassets.com/v1/image/style/properties/3797/Converse-Men-Black--Red-Shoes_1_fe02c8391327729cd4b739c4bc555a7a.jpg', CAST(77.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (54, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Converse Men''s As Canvas Ox Navy Blue Shoe', N'3798.jpg', N'http://assets.myntassets.com/v1/images/style/properties/88d4ecab35d6c2fa4c23a2423deabf27_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (55, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Spalding Men Black Flip Flops', N'3996.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e14ffb8ceff3534250d7ae11401dfe81_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (56, N'Men', 1, N'Flip Flops', N'Grey', N'Casual', N'Spalding Men Grey & Orange Flip Flops', N'3997.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Spalding-Mens-Grey-Orange-Flip-Flop_141aff465eecd916173f9e1dcafdddc2_images.jpg', CAST(62.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (57, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Spalding Men''s Black and White Graphic Flip Flop', N'3998.jpg', N'http://assets.myntassets.com/v1/images/style/properties/91352b9549b9c0d570180dd1be12738d_images.jpg', CAST(31.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (58, N'Men', 2, N'Sandals', N'Green', N'Casual', N'Fila Men Motor Sports Olive Black Sandals', N'4112.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a35fc6de28c54581cca294e2907237ba_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (59, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Fila Men''s Bruno White Shoe', N'4113.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7f46e61a64650eab8464bdbb5f8349a9_images.jpg', CAST(68.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (60, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Fila Men Obsidian Black Sandal', N'4114.jpg', N'http://assets.myntassets.com/v1/images/style/properties/899733c446d42173fdb9ade7481ddb5e_images.jpg', CAST(69.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (61, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Fila Men''s Breath White Red Shoe', N'4141.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2b324f99796b96c6e18d6128a1784163_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (62, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men''s Easytone Inspire White Shoe', N'4171.jpg', N'http://assets.myntassets.com/v1/images/style/properties/461d2320504d9d9f1cbe2ebfd6ac7aae_images.jpg', CAST(40.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (63, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Rockport Men''s Tyson Black Shoe', N'4179.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3b94b896182e9eb5cb6cc4aa5be6801a_images.jpg', CAST(51.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (64, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Rockport Men Brown Leather Casual Shoes', N'4183.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Rockport-Men-Brown-Leather-Casual-Shoes_9c5fb81fa80950693ae635413df4f5c0_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (65, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Rockport Men D2N Desert Boot Dark Brown Shoe', N'4184.jpg', N'http://assets.myntassets.com/v1/images/style/properties/41463f5979dca81447ed51fbe146ead7_images.jpg', CAST(51.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (66, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Fila Men''s Phoenix Black White Shoe', N'4342.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e768f4ef962232b52ad4c1b2ac7331fe_images.jpg', CAST(47.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (67, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Fila Men Leonard Red Shoes', N'4343.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6c47906c4ede8ac1c9142bdba8e6fd63_images.jpg', CAST(70.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (68, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men''s Abascuss White Blue Shoe', N'4344.jpg', N'http://assets.myntassets.com/v1/images/style/properties/05258b3aab19101a69bf27340d1f6aa1_images.jpg', CAST(70.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (69, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men''s Mythos White Navy Shoe', N'4345.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2a9aba279ac9fbeea32962d5ec9f0d76_images.jpg', CAST(48.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (70, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men''s Tarun White Navy Silver Red Shoe', N'4514.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a2fdddec353fbe8c390b0bcb09105c33_images.jpg', CAST(35.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (71, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men''s Tarun White Silver Red Shoe', N'4515.jpg', N'http://assets.myntassets.com/v1/images/style/properties/25cffc1cddbfbc2ae8c8a98ee2431665_images.jpg', CAST(61.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (72, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Puma Men''s Faas Grey Shoes', N'4522.jpg', N'http://assets.myntassets.com/v1/images/style/properties/437ba16eb3cd98b8f0766a1f7be7ba2a_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (73, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Puma Men''s Faas Blue White Silver Red Shoe', N'4523.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0411da3a022ade1d11dfb7affdc6f536_images.jpg', CAST(75.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (74, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Puma Men''s YugoRun Black White Shoe', N'4524.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fae0ae76d008674551fbdbb64988ea51_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (75, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men''s YugoRun White Red Shoe', N'4525.jpg', N'http://assets.myntassets.com/v1/images/style/properties/238b3b400213329e4cd1b554140b23f8_images.jpg', CAST(49.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (76, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men''s Air Max Black Shoe', N'4546.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6d489d04b2840d450005883d5605c311_images.jpg', CAST(42.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (77, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Egoli White Black Shoe', N'4547.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1a90672c4e274285787269ba20bd524f_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (78, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Air Dictate White Shoe', N'4549.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5849b0dd76fe003fa112666be7b2850c_images.jpg', CAST(36.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (79, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men''s Incinera Grey Shoe', N'4576.jpg', N'http://assets.myntassets.com/v1/images/style/properties/33d5b86f0a0c396c4be6f05ea82e7a23_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (80, N'Men', 3, N'Sports Shoes', N'Red', N'Sports', N'Nike Men''s Mercurial Vic Pink Shoe', N'4577.jpg', N'http://assets.myntassets.com/v1/images/style/properties/02e75f751ca7d599f0187051c4fde10e_images.jpg', CAST(62.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (81, N'Men', 3, N'Sports Shoes', N'Red', N'Sports', N'Nike Men''s Mercurial Gli Red Pink Shoe', N'4578.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ff09be074c8f743051aa1694007e1555_images.jpg', CAST(75.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (82, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Fila Men''s Passion Black red Canvas Shoe', N'5050.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2f4267ce2de8d98c8ecbd46ca5d75f4a_images.jpg', CAST(43.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (83, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'Reebok Men''s Lazor Brown Flip Flop', N'5238.jpg', N'http://assets.myntassets.com/v1/images/style/properties/973dc13e58cef052ab4e9d1036c9081a_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (84, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men''s Zigfuel White Shoe', N'5239.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c8a72a981c15936a083c6382f05e72ef_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (85, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Lee Cooper Men Black Shoe', N'5290.jpg', N'http://assets.myntassets.com/v1/images/style/properties/30826a489f3fb44e19fac8f68a5fdcbf_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (86, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Lee Cooper Men Black Semi Formal Shoe', N'5291.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f9e6c0170eadb83b2f0c082b457548a2_images.jpg', CAST(47.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (87, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Puma Men Black Floater', N'5296.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f5591109328d6f69462df128965a8258_images.jpg', CAST(50.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (88, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Btwin Sport 5 Shoes', N'5345.jpg', N'http://assets.myntassets.com/v1/images/style/properties/92796112246863dfc584ecef49418a3b_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (89, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Kalenji Kiprun 1000 Whi/ Blue 2011', N'5404.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fa523afb4c2f1ee300b0b0267e0e0dd9_images.jpg', CAST(37.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (90, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Kalenji Ekiden Comfort Prime 2011', N'5405.jpg', N'http://assets.myntassets.com/v1/images/style/properties/07932c2277eda49d29639f0fe3c4e4c6_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (91, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men''s Dual Fusion Grey Shoe', N'5459.jpg', N'http://assets.myntassets.com/v1/images/style/properties/579c1cbc0dae16a3e6ec209f2e1e1ac1_images.jpg', CAST(45.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (92, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men''s Downshifter Lea Black Shoe', N'5461.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0fe9f1a6f85a5c4703716ac28cff358f_images.jpg', CAST(49.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (93, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men''s Elite Black Shoe', N'5467.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2647f07a41cd23ee046ffad2d5d4a520_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (94, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Lunareclipse White Shoe', N'5468.jpg', N'http://assets.myntassets.com/v1/images/style/properties/be5106fa146a771fdb128833b4ab9b8b_images.jpg', CAST(59.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (95, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men''s Nike Streetgato Black Shoe', N'5469.jpg', N'http://assets.myntassets.com/v1/images/style/properties/57c85d90712fff84d799ecd09d4bc898_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (96, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Reebok Men''s Trail Mud Slinger Black Blue Shoe', N'5600.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c56c66b0cc2eb62cb34bfa06e3196154_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (97, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'Nike Men''s Splash Thong Yellow Black Flip Flop', N'5601.jpg', N'http://assets.myntassets.com/v1/images/style/properties/31cec799c74c62b9785cc809953ae766_images.jpg', CAST(48.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (98, N'Men', 2, N'Sandals', N'Black', N'Casual', N'ADIDAS Men Kendall Black Floater', N'5606.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a2910180f57f2557139decd881dd66b1_images.jpg', CAST(32.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (99, N'Men', 2, N'Sandals', N'Black', N'Casual', N'ADIDAS Men Kendall Black Navy Floater', N'5608.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f12bab8f2514a0656f81aa863dd966c3_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (100, N'Men', 2, N'Sports Sandals', N'Navy Blue', N'Casual', N'ADIDAS Men Receptor Navy Sports Sandals', N'5609.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Adidas-Men-Receptor-Navy-Sports-Sandals_c52fff61c336160cdbfbe954cb1d12ed_images.jpg', CAST(44.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (101, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'ADIDAS Men''s Adi Liner Brown Flip Flop', N'5638.jpg', N'http://assets.myntassets.com/v1/images/style/properties/77faada48a82a4805451fe6d1350bedf_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (102, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men''s Winning Stride White Shoe', N'5654.jpg', N'http://assets.myntassets.com/v1/images/style/properties/85fc66a2cdec98335e142d8a30ca8347_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (103, N'Men', 1, N'Flip Flops', N'Grey', N'Casual', N'ADIDAS Men''s Slide Grey Orange Flip Flop', N'5665.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5d4748a6ae5fecb41977d8c4fe7ac09e_images.jpg', CAST(41.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (104, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men Valence Envoy Black Shoe', N'5690.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7bcc64e12b3d947664ca4bb7782cd52f_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (105, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Skechers Men''s Regions Off White Shoe', N'5691.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e508e488636ba30755268cd5b917f465_images.jpg', CAST(33.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (106, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men Genesis Brown Shoe', N'5696.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c72fec8d51ffe8aee9e80316ced621ff_images.jpg', CAST(39.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (107, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men Black Casual Shoes', N'5697.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Skechers-Mens-Midnight-Choco-Shoe_04bfd375a9dc8a3ddcf8d4a61604681d_images.jpg', CAST(54.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (108, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men''s Liquid Roggers Brown Shoe', N'5698.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5227614b9cc520f8f655397aaa39b6e4_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (109, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men''s Striking Black Shoe', N'5699.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7ab6c782cf6156d10037f737cc34e1f0_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (110, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men Cavallino Black Shoe', N'5896.jpg', N'http://assets.myntassets.com/v1/images/style/properties/57601ed1977aecafecafbfb1fe49a424_images.jpg', CAST(64.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (111, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Puma Men Tekkies Jam Blue Shoe', N'5898.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c315458173ac7727678f8e37f90bb259_images.jpg', CAST(71.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (112, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men''s Mid Spill Black Shoe', N'5899.jpg', N'http://assets.myntassets.com/v1/images/style/properties/59c96d42203b9c8683b7135026adb936_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (113, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Numero Uno Men''s Dark Blue Shoe', N'6362.jpg', N'http://assets.myntassets.com/v1/images/style/properties/09c2188ab7a57021af4056c2746a036e_images.jpg', CAST(37.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (114, N'Men', 2, N'Sandals', N'Beige', N'Casual', N'Lotto Men Revenge 02 Beige Grey Floater', N'6396.jpg', N'http://assets.myntassets.com/v1/images/style/properties/65c36a0bb5b2807cd13cd31c3fc39ce5_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (115, N'Men', 1, N'Flip Flops', N'Grey', N'Casual', N'Lotto Men''s Thong Blue White Flip Flop', N'6414.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b2f98fd8aeb72ad2dd8b76cd7468bc55_images.jpg', CAST(68.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (116, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Lotto Men''s Bavarian Black Yellow Flip Flop', N'6423.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8e32c33844c56ea0eab61b9e3631795e_images.jpg', CAST(54.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (117, N'Men', 1, N'Flip Flops', N'Navy Blue', N'Casual', N'Lotto Men''s Tennis Mule Navy Blue Flip Flop', N'6424.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d009623b103d388d2b799d03752746aa_images.jpg', CAST(78.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (118, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Lotto Men''s Calcetto Black Brown Shoe', N'6440.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5b54a388987f652667b258f4480b2a13_images.jpg', CAST(39.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (119, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Lotto Men''s Calcetto White Red Shoe', N'6441.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4a43030e45772b341104718c994b5148_images.jpg', CAST(34.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (120, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Lotto Men''s Calcetto Grey Shoe', N'6446.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e6e6d7fee7b7aa20fb5bf93e9f340890_images.jpg', CAST(37.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (121, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Lotto Men''s Calcetto Brown Shoe', N'6448.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1596f48c3390726499fc364df52a4d91_images.jpg', CAST(43.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (122, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Numero Uno Men''s Beige Brown Casual Shoe', N'6470.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2ed17831fbdb5f6c663203b0e601293b_images.jpg', CAST(47.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (123, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Tape Men''s Formal Lace Black Shoe', N'6483.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d795c0c5c2019110f3e2d94dde1d1543_images.jpg', CAST(66.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (124, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men''s Boris White Shoe', N'6619.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2aacd81da075c8d9cb891276bd9dbc9e_images.jpg', CAST(44.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (125, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men''s Ridley White Silver Shoe', N'6620.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2c9af30263273a80ebe9e75c0098edc2_images.jpg', CAST(62.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (126, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'ADIDAS Men''s Boris Black Shoe', N'6621.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2e0f915b21422d3685efaaaca1248707_images.jpg', CAST(68.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (127, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ADIDAS Men''s Canon Dialect Blue Yellow Shoe', N'6626.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b8d8c3d8ce77c3ffbeac1bd5ab06b450_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (128, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'ADIDAS Men''s Morin Black Shoe', N'6627.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d4a5a7db2b73ce5edd246dd2a7f5e70f_images.jpg', CAST(33.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (129, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men''s Lowell White Silver Shoe', N'6628.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0707b75d2d44e9cec9d27c944294ddbe_images.jpg', CAST(33.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (130, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men''s Galvin White Silver Black Shoe', N'6629.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3d67098ff0b7461cd8c4d35ed605695c_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (131, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Air Max Lte White Blue Shoe', N'6642.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3ccc31f0b88b7a4c070286cbd0c4d14e_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (132, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Air Pegasus 27 White Grey Shoe', N'6673.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f3d3b086f3e895f2662b09549e5ac12e_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (133, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men''s Free White Grey Shoe', N'6675.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d5ee8454b30de9e73365020686fc8f30_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (134, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men''s Zoom Vomero 5 Grey Blue Shoe', N'6680.jpg', N'http://assets.myntassets.com/v1/images/style/properties/237040c834f4e9bb32dcb003a9d70687_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (135, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Timberland Men Earthkeeper Burnsh Medium Brown Shoe', N'6810.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6f4d09d306689ec90049dad74570e5c7_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (136, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Timberland Men''s Ox Maroon Red Shoe', N'6811.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a3fc5944d6fbe2b7f705c72ce9a6beb9_images.jpg', CAST(46.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (137, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Timberland Men''s Desert Walnut Brown Shoe', N'6816.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b17cd3ff530b6f1250dfb0abda96c998_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (138, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Timberland Men Blue Thong Flip Flops', N'6817.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Timberland-Men-Blue-Thong-Flip-Flops_02bb5f9ccf76c9ff75ff8289dcc34aec_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (139, N'Men', 1, N'Flip Flops', N'Red', N'Casual', N'Timberland Men''s Grn Thng Red Flip Flop', N'6818.jpg', N'http://assets.myntassets.com/v1/images/style/properties/699a744978514f56207a916e8f51dcc1_images.jpg', CAST(61.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (140, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Timberland Men City Brown Floater', N'6821.jpg', N'http://assets.myntassets.com/v1/images/style/properties/402ce454f57316b103826e998e799dc2_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (141, N'Men', 2, N'Sandals', N'Grey', N'Casual', N'Timberland Men Nekkol Grey Black Floater', N'6826.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b13129b0120d04e589292b936e5a0fe7_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (142, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Rockport Men''s Allander Black Shoe', N'7244.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fb55d69868be24b540b4f40f9b0ca979_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (143, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Red Tape Men Strappy Black Floater', N'7330.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ee45b8fcfca7d478d7ff4a08132c9cc2_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (144, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Red Tape Men''s Formal Light Brown Shoe', N'7331.jpg', N'http://assets.myntassets.com/v1/images/style/properties/067ed592a5c26be0a4b6a6adbb4f9feb_images.jpg', CAST(32.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (145, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Tape Men Black Semi Formal Shoes', N'7363.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Red-Tape-Men-Black-Semi-Formal-Shoes_6d0e438208cfddf1a1c0423a04a3cc21_images.jpg', CAST(20.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (146, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Red Tape Men''s Brown casual Shoe', N'7364.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e1f82da932e688fe0f59740369c59b97_images.jpg', CAST(75.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (147, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Red Tape Men''s Black Casual Shoe', N'7365.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d648df96e206c445198d2cb32d27b8a4_images.jpg', CAST(25.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (148, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Red Tape Men Brown Shoes', N'7390.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e7ca97d7b2f468e63a1f84cc988c72ca_images.jpg', CAST(67.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (149, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Tape Men''s Black Slip-On Formal Shoe', N'7391.jpg', N'http://assets.myntassets.com/v1/images/style/properties/296ac470d429413d69d62e8105a8d6cb_images.jpg', CAST(62.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (150, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Red Tape Men Grey Casual Shoes', N'7396.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fbcff46874a80f4e8fcc2fad9642bf6e_images.jpg', CAST(26.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (151, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Tape Men''s Black Formal Shoe', N'7397.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3824fbb868e03010753ee203cac2efc5_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (152, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Red Tape Men Brown Shoes', N'7398.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3de65566d817f454427054e97487d2c5_images.jpg', CAST(34.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (153, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Tape Men''s Black Formal Shoe', N'7399.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f100c2c689ac3bf1ecbf643b1921c001_images.jpg', CAST(46.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (154, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Nike Men''s Dunk Low Blue Shoe', N'7592.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0bbe0e10638aa98ff6f42fbffd30c1a2_images.jpg', CAST(41.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (155, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Zoom Vapor 8 White Red Shoe', N'7593.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c63680ffe70accf50ca213d461f39703_images.jpg', CAST(24.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (156, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Puma Men Apex Black Olive Sandal', N'7730.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f525e99cbf1f5b6c4ab775e569d6beb6_images.jpg', CAST(48.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (157, N'Men', 1, N'Flip Flops', N'Grey', N'Casual', N'Puma Men''s Winglet II Grey Yellow White Flip Flop', N'7731.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9473ae18face7603f7bdb4b6fda3d8e2_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (158, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Fila Men''s Victory Black Shoe', N'7753.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3090de677a92eb346719f0632e939062_images.jpg', CAST(30.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (159, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Fila Men''s Agony Black Red Shoe', N'7754.jpg', N'http://assets.myntassets.com/v1/images/style/properties/07396560af065725a85a392318d02103_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (160, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men''s First Round Takeahike Black Yellow Shoe', N'7797.jpg', N'http://assets.myntassets.com/v1/images/style/properties/098fd7c7895c5c2cb80d0eba4224c102_images.jpg', CAST(36.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (161, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Puma Men''s Manilla Hi White Shoe', N'7799.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ef1f0c1dbcf7004c4495b431c986d81a_images.jpg', CAST(45.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (162, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Provogue Men''s Formal Black Shoe', N'7881.jpg', N'http://assets.myntassets.com/v1/images/style/properties/592207233cfa424f4579f5f9d25720b7_images.jpg', CAST(26.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (163, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Slimsoll White Sports Shoes', N'8346.jpg', N'http://assets.myntassets.com/v1/images/style/properties/93d7b862df153aa53d2e1c8816879f56_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (164, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Nike Men Nike air embark Black Sandals', N'8527.jpg', N'http://assets.myntassets.com/v1/images/style/properties/06a3443ee9b68ccb63036dd65b797852_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (165, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Nike air max limitless Black Sports Shoes', N'8528.jpg', N'http://assets.myntassets.com/v1/images/style/properties/47ef33226d005cc077c3bd62dff9fdf7_images.jpg', CAST(50.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (166, N'Men', 3, N'Sports Shoes', N'Navy Blue', N'Sports', N'Nike Men Nike Lunarfly+  2 Navy Blue Sports Shoes', N'8529.jpg', N'http://assets.myntassets.com/v1/images/style/properties/707710871b57d10fd1b1275c184750a6_images.jpg', CAST(67.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (167, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men Cabana Racer Sketch White Sports Shoes', N'8912.jpg', N'http://assets.myntassets.com/v1/images/style/properties/043071beb363cc49b9be54743ddf8ff6_images.jpg', CAST(44.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (168, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men Cabana Racer Sketch White Sports Shoes', N'8913.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c7a70ae4f57ca4c605f4fabb82c735fc_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (169, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men Future Cat Remix SF White Sports Shoes', N'8914.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b1d9e4498de202e29570bd08090f26a9_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (170, N'Men', 3, N'Sports Shoes', N'Red', N'Sports', N'Puma Men 65cc Ducati Red Sports Shoes', N'8970.jpg', N'http://assets.myntassets.com/v1/images/style/properties/900150bcb99d5bbb451d4037d7545ba8_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (171, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Puma Men Drift Cat III CF Black Sports Shoes', N'8971.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b0f6e40ac38b85e949721b079891659f_images.jpg', CAST(49.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (172, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men SL Tech Lo SF White Sports Shoes', N'8976.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7923a91c983c0f5b59b5269f2cd4898d_images.jpg', CAST(30.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (173, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Puma Men Driving Power Lo SF Black Sports Shoes', N'8979.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f70c7516c24b084f37404cf3bca4614f_images.jpg', CAST(43.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (174, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Puma Men Evo Ducati Lo White Casual Shoes', N'8982.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7bb4c08f6dcc4fd9192f71741e898ef8_images.jpg', CAST(51.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (175, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men Evo Ducati Lo Black Casual Shoes', N'8983.jpg', N'http://assets.myntassets.com/v1/images/style/properties/875c715ba32791dc0425a005ccda98f6_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (176, N'Men', 3, N'Casual Shoes', N'Green', N'Casual', N'Puma Men TX-3 Green Casual Shoes', N'8984.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8002a8c76c3bc5a7337fbca8c28ae2d9_images.jpg', CAST(39.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (177, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Puma Men Archive Boot WTR Brown Casual Shoes', N'9000.jpg', N'http://assets.myntassets.com/v1/images/style/properties/541e84bced1067d6ef4e59508561a303_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (178, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Puma Men El rey Riddim 50s OC Grey Casual Shoes', N'9001.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ad70631a51062e68f3c07f156904f6cd_images.jpg', CAST(59.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (179, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Buckaroo Men loma Brown Casual Shoes', N'9030.jpg', N'http://assets.myntassets.com/v1/images/style/properties/71a4e1fa5abfa2146a0ebea59b723d5d_images.jpg', CAST(50.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (180, N'Men', 3, N'Casual Shoes', N'Tan', N'Casual', N'Buckaroo Men loma Tan Casual Shoes', N'9031.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c42e34c84003a87f8fc0d5694e82d4c3_images.jpg', CAST(37.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (181, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Buckaroo Men Flores Black Formal Shoes', N'9036.jpg', N'http://assets.myntassets.com/v1/images/style/properties/06edc2da9c6d103d299e5e8dafc5b6b9_images.jpg', CAST(50.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (182, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Buckaroo Men Medina Black Formal Shoes', N'9037.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a8ac7df8dc72daebf55abfb65c363671_images.jpg', CAST(72.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (183, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Buckaroo Men Medina Brown Formal Shoes', N'9038.jpg', N'http://assets.myntassets.com/v1/images/style/properties/72da3d057e90841278201ab75c993aff_images.jpg', CAST(69.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (184, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Buckaroo Men Victor Black Formal Shoes', N'9039.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a6b18114bdf93ad684db5ceff4207821_images.jpg', CAST(48.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (185, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Duramo 3 M White Sports Shoes', N'9052.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d6a1803ef3e7d36bb596537978d541e4_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (186, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'ADIDAS Men Duramo 3 M Grey Sports Shoes', N'9053.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0ebc15dcb00d4f2315f8341ee05b19a7_images.jpg', CAST(47.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (187, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Adi Fiero M White Sports Shoes', N'9055.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4bb5e5a5167ab8b31d0c128728752a05_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (188, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Buckaroo Men Valle Black Casual Shoes', N'9090.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ca13b77121b5d3808d7ea020e0492d61_images.jpg', CAST(30.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (189, N'Men', 3, N'Casual Shoes', N'Maroon', N'Casual', N'Buckaroo Men Amigo Maroon Casual Shoes', N'9091.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f2b68e6b400d4610c64eea0c9fbacff0_images.jpg', CAST(33.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (190, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Puma Men Yacht L Red Casual Shoes', N'9202.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6e70da257e2040ff7823c9e9da1b5a87_images.jpg', CAST(79.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (191, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Puma Men Axis XT Black Shoes', N'9203.jpg', N'http://assets.myntassets.com/v1/images/style/properties/70ffebcb332030e98e65461076ac2fb0_images.jpg', CAST(72.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (192, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men Future Cat Remix SF Black Casual Shoes', N'9204.jpg', N'http://assets.myntassets.com/v1/images/style/properties/051d64772f1b38ff476fbf0a807f365a_images.jpg', CAST(25.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (193, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men SL Tech Lo NM Basic Black Casual Shoes', N'9205.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e4b0626410783b1adc96db55574959dc_images.jpg', CAST(50.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (194, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Dual Fusion Black TR II Sports Shoes', N'9400.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3ba767d12d769d771e11ce55a121f5ac_images.jpg', CAST(45.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (195, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Nike Men Lunarswi + 2 Blue Sports Shoes', N'9401.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e156531b242b0b2f63b6c9f3eaf3dfb5_images.jpg', CAST(49.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (196, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Court White Shoe', N'9407.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3b02ee079fbd884aa6ba20984e379fd6_images.jpg', CAST(65.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (197, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Lee Cooper Men Nnado Black Formal Shoes', N'9430.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ef183787311e4d8e9f33dcf3ceff9102_images.jpg', CAST(39.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (198, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Decathlon Men Quechua Grey Sports Shoes', N'9431.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fe2ec858a43a431e5422018f652d9b39_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (199, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Decathlon Men Arpenaz Black Sandals', N'9497.jpg', N'http://assets.myntassets.com/v1/images/style/properties/11371998e15f21cf032b30fdba5e972c_images.jpg', CAST(69.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (200, N'Men', 3, N'Sports Shoes', N'Silver', N'Sports', N'Reebok Men Premier ultra 8 U-form Silver Sports Shoes', N'10037.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c876491b1ad3bbece863d5bf29408446_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (201, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men Raceon White Sports Shoes', N'10039.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8c7024fc08196b33759515ff1d542899_images.jpg', CAST(25.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (202, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men Reeflex Run White Sports Shoes', N'10097.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a947ceec9e8c493229417e1a1390417e_images.jpg', CAST(22.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (203, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'United Colors Of Benetton Men Latnam Black Casual Shoes', N'10174.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fc4ea7a39f7b828bcf2fc6dfd81a1eb0_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (204, N'Men', 1, N'Flip Flops', N'Yellow', N'Casual', N'United Colors of Benetton Men Speeder Yellow Flip Flops', N'10180.jpg', N'http://assets.myntassets.com/v1/images/style/properties/abf212122486259ba302c810103970e6_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (205, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Clarks Men Goto Hi Cola Suede Brown Shoes', N'10266.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4269a355e474308b6e0f174cf6a9f6f0_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (206, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Clarks Men Rocco Fuse Black Leather Black Casual Shoes', N'10267.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5040e0c7e82dcc67e1c0a42ee04eb519_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (207, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Clarks Men Hang Work Leather Black Formal Shoes', N'10268.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2976e4095e7b3ae2de99df54d2adeaaa_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (208, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Clarks Men Unstructured Leather Brown Sandals', N'10293.jpg', N'http://assets.myntassets.com/v1/images/style/properties/566b15c0f837887c3b42c3e1dae8605a_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (209, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Clarks Men Feeling Good Leather Brown Formal Shoes', N'10294.jpg', N'http://assets.myntassets.com/v1/images/style/properties/91b438e6f6ad7cf63571fdea86dc7f68_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (210, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Clarks Men Brown Leather Casual Shoes', N'10295.jpg', N'http://assets.myntassets.com/v1/images/style/properties/83cd6db4f547e2ec582714b3592ba718_images.jpg', CAST(27.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (211, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Carlton London Men Brown Shoes', N'10632.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Carlton-London-Men-CL-semi-cas-Brown-Casual-Shoes_a9d0af87aa3dcfaeee65b44432de7fea_images.jpg', CAST(54.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (212, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Carlton London Men Formal Brown Formal Shoes', N'10633.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b195b911f558c0232e22849d1ca73193_images.jpg', CAST(20.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (213, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Carlton London Men Black Oxford Wingtip Brogues', N'10634.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f1d954cfacfc79f32325794d43b6c3a0_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (214, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Carlton London Men Semi oxfords Black Casual Shoes', N'10635.jpg', N'http://assets.myntassets.com/v1/images/style/properties/412580b9038a38e27506054eac80a836_images.jpg', CAST(47.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (215, N'Men', 1, N'Flip Flops', N'Grey', N'Casual', N'Playboy Men Grey Flip Flops', N'11851.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5040d83690dbba913807b7c8d90f3a33_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (216, N'Men', 1, N'Flip Flops', N'Red', N'Casual', N'Playboy Men Casual Red Slippers', N'11856.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cc4f2b8a0e217f2a9d73b30d822445e4_images.jpg', CAST(54.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (217, N'Men', 2, N'Sandals', N'Maroon', N'Casual', N'Franco Leone Men Casual Maroon Sandals', N'11912.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e386e646f5472587a6b6044cde31a5bf_images.jpg', CAST(69.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (218, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Franco Leone Men Casual Black Sandals', N'11913.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0f2519ae8f147ea7406e11586c49a12b_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (219, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Franco Leone Men Casual Black Sandals', N'11914.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Franco-Leone-Men-Casual-Black-Sandals_64e305d58336526ca53af1df28ff7721_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (220, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Franco Leone Men Casual Brown Sandals', N'11915.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ff5f8a17b2ae517679a28ab5640c37de_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (221, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Franco Leone Men Formal Black Formal Shoes', N'11922.jpg', N'http://assets.myntassets.com/v1/images/style/properties/262366467631b95873f546524b2444c9_images.jpg', CAST(32.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (222, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Franco Leone Men Formal Brown Formal Shoes', N'11923.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9313abbf7f92dbb61e12acab6dd2ba39_images.jpg', CAST(53.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (223, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Franco Leone Men Black Formal Shoes', N'11924.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Franco-Leone-Men-Black-Formal-Shoes_40042cda26f16556442dbb10af3e07ee_images.jpg', CAST(79.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (224, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Ganuchi Men Casual Black Sandals', N'11940.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b23f1e70aec0102c360fb9dfdc476023_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (225, N'Men', 2, N'Sandals', N'Tan', N'Casual', N'Ganuchi Men Casual Tan Sandals', N'11941.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a595f061ad81d715cccb4cf4d6a5fe9d_images.jpg', CAST(37.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (226, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Ganuchi Men Casual Brown Sandals', N'11946.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ecd25a12d12fee2264083bec8b7ed930_images.jpg', CAST(72.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (227, N'Men', 2, N'Sandals', N'Olive', N'Casual', N'Ganuchi Men Casual Olive Sandals', N'11947.jpg', N'http://assets.myntassets.com/v1/images/style/properties/464879391de4e1a7b881dad3b7bd83a8_images.jpg', CAST(60.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (228, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Ganuchi Men Casual Black Casual Shoes', N'11948.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3622942da5d2451489f5d16f4136b1c3_images.jpg', CAST(44.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (229, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Ganuchi Men Casual Brown Casual Shoes', N'11949.jpg', N'http://assets.myntassets.com/v1/images/style/properties/45da55174d251a833af58e1aa162052d_images.jpg', CAST(48.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (230, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men Glow White Sports Shoes', N'11971.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ab1fe16c66350052ecb0ade9502ebcca_images.jpg', CAST(79.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (231, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Fila Men Paramount Plus Black Shoes', N'11976.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f082906efcf97934d09f2bdd2906909b_images.jpg', CAST(43.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (232, N'Men', 2, N'Sandals', N'Olive', N'Casual', N'Fila Men Motor Sports Olive Sandals', N'11977.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8b227dec8c5f1b552970fd055c46b0ea_images.jpg', CAST(51.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (233, N'Men', 2, N'Sandals', N'Navy Blue', N'Casual', N'FILA Men Aruba Navy Blue Sandal', N'11978.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5c439c0c29672ff85b3aaafb66a43ae8_images.jpg', CAST(73.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (234, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Fila Men Glam Black Casual Shoes', N'11979.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f7f6a5fb69c690023ef5fc3c5c3c39be_images.jpg', CAST(57.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (235, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'FILA Men Dls Circuit 2 Black Sports Shoes', N'11983.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a018ed2ebe20c7f8628dada209e42057_images.jpg', CAST(23.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (236, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Fila Men Glow Black Sports Shoes', N'11985.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4bfce78151c396213aa4ce1ad204468b_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (237, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Red Tape Men Brown Shoes', N'12506.jpg', N'http://assets.myntassets.com/v1/images/style/properties/79b4ee762c04f387ec9a310537adb0ca_images.jpg', CAST(71.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (238, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Red Tape Men Casual Black Casual Shoes', N'12507.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b1ff46e8d902c8cf2eb2664e792014a6_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (239, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Red Tape Men Casual Brown Casual Shoes', N'12508.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cce72430a64274adfa887e387340ce79_images.jpg', CAST(58.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (240, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Red Tape Men Casual Brown Casual Shoes', N'12509.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7f5bf1bfc926e96373823989b1c4f420_images.jpg', CAST(66.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (241, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men Air Relentness Grey Sports Shoes', N'12704.jpg', N'http://assets.myntassets.com/v1/images/style/properties/eaf8f7339bfa5a6a5375491df92fcba4_images.jpg', CAST(36.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (242, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Air Courtballistic White Sports Shoes', N'12705.jpg', N'http://assets.myntassets.com/v1/images/style/properties/88bcb1e302eacafdfe101b3faa625659_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (243, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Provogue Men Formal Black Formal Shoes', N'12876.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b0627182f0915e431cc6112a15a20407_images.jpg', CAST(44.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (244, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men Sports White Shoes', N'12882.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ebbd9af5051149569869daa74ab478cd_images.jpg', CAST(63.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (245, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Air Max Turbulence White Sports Shoes', N'12885.jpg', N'http://assets.myntassets.com/v1/images/style/properties/49ddb7b67b306fd7212e8901412875d0_images.jpg', CAST(50.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (246, N'Men', 3, N'Casual Shoes', N'Green', N'Casual', N'Puma Men Whirlwind Classic Green Casual Shoes', N'12903.jpg', N'http://assets.myntassets.com/v1/images/style/properties/50e188bd4635f2c26717e40fb34f2e1d_images.jpg', CAST(21.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (247, N'Men', 3, N'Sports Shoes', N'Red', N'Sports', N'Puma Men Future Cat M1 Engine Red Sports Shoes', N'12904.jpg', N'http://assets.myntassets.com/v1/images/style/properties/327593510d3b633066ceacf188df73ba_images.jpg', CAST(39.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (248, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ADIDAS Men Sports Blue Sports Shoes', N'12956.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3a9f62b28cc78e42ffc030e179f8a438_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (249, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'ADIDAS Men Grey Sports Shoes', N'12957.jpg', N'http://assets.myntassets.com/v1/images/style/properties/285f77d54aa639885c93fbb6e886824b_images.jpg', CAST(30.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (250, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'ADIDAS Men Sports Black Sports Shoes', N'12958.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9c0d1badace8d2eb9680232648e94d85_images.jpg', CAST(73.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (251, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'ADIDAS Men Sports Black Sports Shoes', N'12959.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b09d86bef23eccef029df70930c162b8_images.jpg', CAST(34.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (252, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Sports White Sports Shoes', N'12960.jpg', N'http://assets.myntassets.com/v1/images/style/properties/81780f9a8eebc7fb3d57ffffa7f455ae_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (253, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'ADIDAS Men Casual Brown Sandals', N'12961.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cd86abdee8834de4aa0447b73cdcdd0c_images.jpg', CAST(32.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (254, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'ADIDAS Men Snova Glide Grey Sports Shoes', N'12966.jpg', N'http://assets.myntassets.com/v1/images/style/properties/00aa23eeb6dfa9fa2f77ab5d01e04e8f_images.jpg', CAST(46.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (255, N'Men', 2, N'Sandals', N'Black', N'Casual', N'ADIDAS Men Spry M Black Sandals', N'12967.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c5a22e9ccf9b10e0a89ffbbf3e386584_images.jpg', CAST(50.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (256, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Allegra White Sports Shoes', N'12968.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2a3a255932bd37e5bfc6799552e12527_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (257, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ADIDAS Men Snova Glide Blue Sports Shoes', N'12969.jpg', N'http://assets.myntassets.com/v1/images/style/properties/af829e3d805b3f99f3905431c425796d_images.jpg', CAST(25.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (258, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Numero Uno Men Black Casual Shoes', N'13072.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2fc766a7415035d5855a236326c01366_images.jpg', CAST(30.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (259, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Numero Uno Men White Shoes', N'13073.jpg', N'http://assets.myntassets.com/v1/images/style/properties/26e93a4246e479e84c16a0ae547d2158_images.jpg', CAST(53.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (260, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Numero Uno Men Brown Casual Shoes', N'13074.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5dfbb2e1085e06bed0b0685f4deeb0a8_images.jpg', CAST(25.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (261, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Numero Uno Men Black Shoes', N'13075.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d5e6350d1e72ff1e01b0d1bf9fe98ce8_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (262, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Numero Uno Men Black Casual Shoes', N'13080.jpg', N'http://assets.myntassets.com/v1/images/style/properties/efef30c05460e90a1e170998dde8f92c_images.jpg', CAST(50.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (263, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Numero Uno Men White Casual Shoes', N'13081.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f9e12ae63f9217cb691f9c22cf8ac05a_images.jpg', CAST(73.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (264, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ASICS Men Gel DS Sky Speed 2 Running Blue Sports Shoes', N'13198.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b8053f95ed69df40a632dccac74da643_images.jpg', CAST(63.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (265, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ASICS Men Gel 1160 Running White Sports Shoes', N'13214.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f19436ed7b41f8ee107c2ff56e1cdf13_images.jpg', CAST(23.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (266, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'ASICS Men Gel Enduro 7 Running Silver Sports Shoes', N'13215.jpg', N'http://assets.myntassets.com/v1/images/style/properties/54438127ac612583a256b3afcc527d25_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (267, N'Men', 3, N'Casual Shoes', N'Beige', N'Casual', N'Timberland Men Juniors Beige Casual Shoes', N'13359.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c2be49db2edd27cb2b90b834d6531b47_images.jpg', CAST(69.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (268, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Carlton London Men Casual Brown Casual Shoes', N'13537.jpg', N'http://assets.myntassets.com/v1/images/style/properties/685dba93fae4bdbde52dfb398e94955c_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (269, N'Men', 3, N'Casual Shoes', N'Beige', N'Casual', N'Carlton London Men Casual Beige Casual Shoes', N'13646.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ef805ca141a1d056e0363596a2faeec0_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (270, N'Men', 3, N'Sports Shoes', N'Silver', N'Sports', N'ADIDAS Silver Astar ride 3M Sports Shoe', N'13648.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4fcd6ca0e951bce32c8826788ddaebfe_images.jpg', CAST(55.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (271, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'ADIDAS Black Hydroterra Shandal Casual Shoes', N'13649.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3053dc9877f1fd1209cfc4ee1b5e9171_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (272, N'Men', 3, N'Sports Shoes', N'Silver', N'Sports', N'ADIDAS Men Titan Sports Shoes', N'13676.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b14c8811b942eeb3756ab0a66af54f47_images.jpg', CAST(28.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (273, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Running White Sports Shoes', N'13677.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f2a2bdafbb219d1dedaaed75c20853f6_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (274, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Court Switch Sports Shoes', N'13679.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d75102040c965cd59488b69007f766fe_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (275, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ADIDAS Men Adi Quest Blue Sports Shoes', N'13683.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8c673b0b5c89552c15b72b3c3ae407da_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (276, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'ADIDAS Men Dash Casual Shoes', N'13684.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ab8ada0e4956967c0ad91217175ef162_images.jpg', CAST(72.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (277, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'ADIDAS Men Dash Casual Shoes', N'13685.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1a7a0ee63554920e1445cb3e7431f7d7_images.jpg', CAST(22.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (278, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Flying Machine Men Casual Grey Casual Shoes', N'14490.jpg', N'http://assets.myntassets.com/v1/images/style/properties/965790109837039bd54cc16fe885ce9e_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (279, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Flying Machine Men Casual Black Casual Shoes', N'14491.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a0743752a7eca3ee0cf69e312a52c4d6_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (280, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Flying Machine Men Casual Grey Casual Shoes', N'14496.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e049a003fb6a4def8cce97f6ff7e0cc7_images.jpg', CAST(48.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (281, N'Men', 3, N'Casual Shoes', N'Green', N'Casual', N'Flying Machine Men Casual Green Casual Shoes', N'14497.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f50c7bc8ea0a995334e9b01d81b45c31_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (282, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Flying Machine Men Casual Black Casual Shoes', N'14498.jpg', N'http://assets.myntassets.com/v1/images/style/properties/dd4df7d68ef98ab9ebc1ce6d20cbe6b5_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (283, N'Men', 3, N'Casual Shoes', N'Green', N'Casual', N'Flying Machine Men Casual Green Casual Shoes', N'14499.jpg', N'http://assets.myntassets.com/v1/images/style/properties/405ef20c472619ca9fb6091fb0b97cef_images.jpg', CAST(64.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (284, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Franco Leone Men Brown Sandal', N'15062.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c748416626eff308712f1aafb439c38d_images.jpg', CAST(23.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (285, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'ADIDAS Originals Men SL 72 Red Casual Shoes', N'15250.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0b56b31d1dcb7f9c744080e12d3e0b56_images.jpg', CAST(44.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (286, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Aerostar White Sports Shoes', N'15313.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a5aa3ac937eacec2155ead8ad9c751b6_images.jpg', CAST(60.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (287, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Ranger White Sports Shoes', N'15314.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6c9cf98f7b982edd225753d9cd2d4cd0_images.jpg', CAST(35.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (288, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'ADIDAS Men Eqt Nitro Fashion Black Sports Shoes', N'15315.jpg', N'http://assets.myntassets.com/v1/images/style/properties/647fa9a687c2975ac72e2071b48f627f_images.jpg', CAST(32.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (289, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'FILA Men Fila Boston White Sports Shoes', N'15376.jpg', N'http://assets.myntassets.com/v1/images/style/properties/429d08e06191b69741200ba1d5c32b1d_images.jpg', CAST(77.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (290, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Fila Men Lobato Navy Blue Casual Shoes', N'15377.jpg', N'http://assets.myntassets.com/v1/images/style/properties/558836465cadc3972bd8577ac43ccc24_images.jpg', CAST(44.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (291, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Fila Men Coloda Grey Sports Shoes', N'15378.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2b6a95deedb1c844304a7f948250af68_images.jpg', CAST(28.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (292, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Fila Men Lobato Black Casual Shoes', N'15379.jpg', N'http://assets.myntassets.com/v1/images/style/properties/593368a3e9649a12de803e50fa2ed17a_images.jpg', CAST(53.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (293, N'Men', 1, N'Flip Flops', N'Navy Blue', N'Casual', N'Fila Men Terra Navy Blue Slippers', N'15382.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9d16956167f078c3a4b09328fab65b2e_images.jpg', CAST(33.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (294, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Filac Men Hawai Black Slippers', N'15384.jpg', N'http://assets.myntassets.com/v1/images/style/properties/16166d165fed7105e5d1ac7c060703c7_images.jpg', CAST(32.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (295, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Fila Men Hawai Blue Flip Flops', N'15385.jpg', N'http://assets.myntassets.com/v1/images/style/properties/FILA-Men-Flip-Flops_14793950c89a306fd27bbff93f7b7fcc_images.jpg', CAST(25.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (296, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'FILA Men FILA Boston White Sports Shoes', N'15406.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ca4070668cac17859b445c434bcb512b_images.jpg', CAST(50.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (297, N'Men', 3, N'Casual Shoes', N'Charcoal', N'Casual', N'Rockport Men CV Toe HI Charcoal Casual Shoes', N'15510.jpg', N'http://assets.myntassets.com/v1/images/style/properties/659ca18f067f9fb78cc7824eaf1d165e_images.jpg', CAST(30.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (298, N'Men', 1, N'Flip Flops', N'Navy Blue', N'Casual', N'Rockport Men Altrezlp Navy Blue Flip Flops', N'15516.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8e61745c35f663f59c82e7e68ae30c23_images.jpg', CAST(22.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (299, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Rockport Men LLandro Red Casual Shoes', N'15517.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0ea0e6130d5d4c093e0e516f9b43ced6_images.jpg', CAST(52.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (300, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Rockport Men Slatkin Grey Casual Shoes', N'15518.jpg', N'http://assets.myntassets.com/v1/images/style/properties/44f874fe55936fec7c0fe8679d435344_images.jpg', CAST(65.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (301, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'Rockport Men Jelba Brown Flip Flops', N'15519.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1d16b7a631810087d206ebcc2af4bcea_images.jpg', CAST(23.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (302, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Rockport Men CV Wing Black Casual Shoes', N'15520.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a5f34ba3e351e71badbf97de3ae80c15_images.jpg', CAST(40.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (303, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Rockport Men Jelbalp Black Flip Flops', N'15521.jpg', N'http://assets.myntassets.com/v1/images/style/properties/717a23d80631d14e60bbc954b06c5fb6_images.jpg', CAST(74.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (304, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Air Relentless Black Sports Shoes', N'15713.jpg', N'http://assets.myntassets.com/v1/images/style/properties/aea04a305c1e279cec06172c669a5751_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (305, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Free Run+ 2 Black Sports Shoes', N'15714.jpg', N'http://assets.myntassets.com/v1/images/style/properties/45e5d30d4486c3569cb89dab80ed0c66_images.jpg', CAST(27.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (306, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men Lunarswift+ 3 Shield Grey Sports Shoes', N'15722.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9854a566783e31b6172f1deab77281fa_images.jpg', CAST(24.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (307, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men Free Run+ 2 Shield Grey Sports Shoes', N'15724.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c958b7cb77f51aff23530d749ad5779a_images.jpg', CAST(62.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (308, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men Lunarglide + Shield Grey Sports Shoes', N'15741.jpg', N'http://assets.myntassets.com/v1/images/style/properties/27203442d215ad27a061c5d9c9f6f5fc_images.jpg', CAST(59.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (309, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Ballista II White Sports Shoes', N'15746.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Nike-Men-Ballista-II-White-Sports-Shoes_ea630bb8469a4100c6c62305bdc06174_images.jpg', CAST(32.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (310, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Ballista SL White Sports Shoes', N'15747.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b57c1eac50336bc23d33e86b454927e6_images.jpg', CAST(76.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (311, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Enroute Men Leather Brown Formal Shoes', N'16152.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2ba5a829cc364c32b327839a47f43e8e_images.jpg', CAST(44.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (312, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Enroute Men Leather Black Formal Shoes', N'16153.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c80c08ee91ff76e9ef5f3ec53fc6b6a7_images.jpg', CAST(73.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (313, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Enroute Men Leather Black Formal Shoes', N'16154.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1e1ddab59626e99f7163c2c8c20743b6_images.jpg', CAST(30.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (314, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Enroute Men Leather Brown Formal Shoes', N'16155.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0bfd0d3daf35ed10a922ec248548470f_images.jpg', CAST(76.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (315, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Enroute Men Leather Black Sandals', N'16162.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2aad2e1edb9ea3e6c318df98205f574b_images.jpg', CAST(77.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (316, N'Men', 3, N'Formal Shoes', N'Tan', N'Formal', N'Enroute Men Leather Tan Formal Shoes', N'16163.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f68b67a4d85b376e096423f7f68e2749_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (317, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Enroute Men Leather Brown Sandals', N'16164.jpg', N'http://assets.myntassets.com/v1/images/style/properties/58562d18360239a4ccfdef289cecffc6_images.jpg', CAST(54.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (318, N'Men', 3, N'Casual Shoes', N'Tan', N'Casual', N'Enroute Men Leather Brown Casual Shoes', N'16165.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b3ead7db8f3572f146a7d807742b9f43_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (319, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'Lotto Men Earth Brown Slipper', N'16732.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c9858c6e801580d97e523d2b1203b47c_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (320, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Lotto Men Earth Black Slipper', N'16733.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c409e1086cf84af1e6f56d7899e762f8_images.jpg', CAST(71.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (321, N'Men', 1, N'Flip Flops', N'Maroon', N'Casual', N'Lotto Men Emeriti Maroon Slipper', N'16734.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7600f1237827bb23131b59a0c8b9a7bc_images.jpg', CAST(35.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (322, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Lotto Men Emeriti Black Slipper', N'16735.jpg', N'http://assets.myntassets.com/v1/images/style/properties/20e7d75f6cef1689d6874a14a9db0933_images.jpg', CAST(38.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (323, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Reebok Men Sprintfit Lite Black Sports Shoe', N'16966.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b4a93449c1fd4666bf2572c3d8d9763d_images.jpg', CAST(71.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (324, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Puma Men Coupe Black Sandal', N'16969.jpg', N'http://assets.myntassets.com/v1/images/style/properties/efca982ea19c2521dda37ed9fb603799_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (325, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Gas Men Beach Flip Flops', N'17026.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1d6742e11f1176b43883efc4cd27ceca_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (326, N'Men', 1, N'Flip Flops', N'Navy Blue', N'Casual', N'Gas Men Navy Blue Flip Flops', N'17027.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1ce6f219f00dc784baf7715efa0ca189_images.jpg', CAST(57.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (327, N'Men', 1, N'Flip Flops', N'Grey', N'Casual', N'GAS Men Grey Pine Flip Flops', N'17028.jpg', N'http://assets.myntassets.com/v1/images/style/properties/GAS-Men-Grey-Pine-Flip-Flops_5dac07de3758240986c732d060087771_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (328, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'GAS Men Black Pine Flip Flops', N'17029.jpg', N'http://assets.myntassets.com/v1/images/style/properties/GAS-Men-Black-Pine-Flip-Flops_f6fcae18401c1c1fb8ab5b29c76d0781_images.jpg', CAST(69.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (329, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'GAS Men Grey Skate 002 Shoes', N'17042.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Gas-Men-White---Grey-Shoes_c9ac34e9a949fe81422026dfc24cebdf_images.jpg', CAST(65.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (330, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Gas Men Skate 003 Casual Shoe', N'17043.jpg', N'http://assets.myntassets.com/v1/images/style/properties/525f30ac2bcf55f1da135dcc70a1c296_images.jpg', CAST(77.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (331, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Gas Men Aventura Sandal', N'17044.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8903d2863587633e97148734df907ef4_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (332, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Gas Men Aventura Sandal', N'17045.jpg', N'http://assets.myntassets.com/v1/images/style/properties/423467d4533370ea6d8ad7317f09cb9f_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (333, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Lotto Men Atlantica White Sports Shoe', N'17410.jpg', N'http://assets.myntassets.com/v1/images/style/properties/082147936cb571867ca64b0d078f659d_images.jpg', CAST(60.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (334, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Lotto Men Basketball Mid White Sports Shoe', N'17411.jpg', N'http://assets.myntassets.com/v1/images/style/properties/95dd8b87ceff0247a70579ba850c0164_images.jpg', CAST(25.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (335, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Lotto Men Atlantica Black Sports Shoe', N'17416.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1279efc8b61fb461a804f0c1f82f276b_images.jpg', CAST(70.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (336, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Enroute Men Formal Black Formal Shoe', N'17481.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6ddbf82251463a258a89eda4a7c411d6_images.jpg', CAST(30.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (337, N'Men', 1, N'Flip Flops', N'Red', N'Casual', N'Converse Men Red Flip Flops', N'17647.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Converse-Men-Red-Flip-Flops_e522f6682fc67dad7ee54eee72f94dcc_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (338, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Lee Cooper Men  Brown Casual Shoe', N'17813.jpg', N'http://assets.myntassets.com/v1/images/style/properties/489abfd6cc785c67b99041f7217d33c9_images.jpg', CAST(69.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (339, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Lee Cooper Men  Black Casual Shoe', N'17814.jpg', N'http://assets.myntassets.com/v1/images/style/properties/66378e03115ef568fb9c485f5314738f_images.jpg', CAST(35.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (340, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Lee Cooper Men  Black Sandal', N'17815.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b0303cf0af683b9e314c2046d9b29325_images.jpg', CAST(53.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (341, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Lee Cooper Men  Black Formal Shoe', N'17822.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a1c9a53125108ea6f659900cfdfe47c5_images.jpg', CAST(63.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (342, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Nike Men  Court Majestic White Casual Shoe', N'17823.jpg', N'http://assets.myntassets.com/v1/images/style/properties/36886df8953c40042cc2e47b380dad55_images.jpg', CAST(45.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (343, N'Men', 3, N'Sports Shoes', N'Red', N'Sports', N'Nike Men Air Quick Handle Red Sports Shoe', N'17840.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c481346a8ed1ce44ec54b459af7de08a_images.jpg', CAST(50.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (344, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Supergame Black Sports Shoe', N'17846.jpg', N'http://assets.myntassets.com/v1/images/style/properties/897336e710167034f7e9066114bbb79c_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (345, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Air Impetus II White Sports Shoe', N'17847.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d30175afac8812e0b52c4fb7cc8aa0ee_images.jpg', CAST(34.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (346, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Puma Men Hopper Black Sandal', N'17960.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ef372f03e1ba9c6d634b4b1ee17c7cc7_images.jpg', CAST(62.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (347, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men USA Black Shoe', N'18402.jpg', N'http://assets.myntassets.com/v1/images/style/properties/865391bfae0dcdf364ce8c996804f2e8_images.jpg', CAST(74.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (348, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men Tone-Ups Black Shoe', N'18403.jpg', N'http://assets.myntassets.com/v1/images/style/properties/87cd7b092091609ac02f152cb50960f2_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (349, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men USA Brown Shoe', N'18404.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d954c9d70790069ca29f9346d28c1a94_images.jpg', CAST(67.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (350, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Skechers Men USA Brown Shoe', N'18405.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0864f725df98a182b763bcc00eadecac_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (351, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Puma Men Danny Blue Slipper', N'18492.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b5df5f57f0feda7a42510b6ebedf4f4d_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (352, N'Men', 2, N'Sandals', N'Multi', N'Casual', N'Puma Men Duncan Multi Slipper', N'18493.jpg', N'http://assets.myntassets.com/v1/images/style/properties/59adcc25bc20fb817f5917d74fed0aca_images.jpg', CAST(25.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (353, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men Daemon White Sports Shoes', N'18494.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cbd54b9ca8c62d49c2c2cb8152777864_images.jpg', CAST(55.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (354, N'Men', 2, N'Sandals', N'White', N'Casual', N'Puma Men Fashion Cat White Slipper', N'18495.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c78acc78b83e4f2e014215d2a302f04b_images.jpg', CAST(44.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (355, N'Men', 2, N'Sandals', N'Black', N'Sports', N'Puma Men Black Roque Sandals', N'18601.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b2fc74054083711f62b59120c0c0bddc_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (356, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Fila Men Cush Flex Black Slippers', N'18653.jpg', N'http://assets.myntassets.com/v1/images/style/properties/53690e3f396f411e184b249672d6ebae_images.jpg', CAST(34.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (357, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Fila Men Drop Needle Black Slippers', N'18655.jpg', N'http://assets.myntassets.com/v1/images/style/properties/914b05f0e6f80353629d2eb59a0b2518_images.jpg', CAST(61.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (358, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Fila Men Syncro White Shoes', N'18665.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3f475a31c39bcc9c6045a9f8c7452893_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (359, N'Men', 1, N'Flip Flops', N'White', N'Casual', N'Lotto Men XL Water Man White Slippers', N'19122.jpg', N'http://assets.myntassets.com/v1/images/style/properties/15e0953c017540f7644199f7181db74f_images.jpg', CAST(49.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (360, N'Men', 1, N'Flip Flops', N'Silver', N'Casual', N'Lotto Men XL Water Man Silver Slippers', N'19123.jpg', N'http://assets.myntassets.com/v1/images/style/properties/69482728a521cbd2ba571e36016d5f63_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (361, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Lotto Men Sting Black Sandals', N'19140.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f28efdb857ae8608cc72b4165a991603_images.jpg', CAST(62.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (362, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Lotto Men Revorb Black Sandals', N'19141.jpg', N'http://assets.myntassets.com/v1/images/style/properties/02ab0971bf0b184990ad0ebaf94a5bd7_images.jpg', CAST(66.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (363, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Lunarglide+ 3 White Sports Shoe', N'19310.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f9224900952588d6eb8c8dbd8bc6410e_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (364, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Nike Men Air Rift MTR White Casual Shoe', N'19311.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ac5a2fb9462db16f4cf5fc0f3616a9e6_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (365, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Puma Men Standpunkt Brown Casual Shoes', N'19329.jpg', N'http://assets.myntassets.com/v1/images/style/properties/bcb01252e8d12d743d85d0001586fee0_images.jpg', CAST(44.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (366, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Redtape Men Brown Formal Shoes', N'19372.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Red-Tape-Men-Formal-Shoes_69d74d2aac6cc51c38bda7600f0a2d91_images.jpg', CAST(65.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (367, N'Men', 3, N'Sports Shoes', N'Beige', N'Sports', N'ADIDAS Men Dumont Beige Sports Shoes', N'19387.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4667f5416339437dda1dc3510bb0a27d_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (368, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'ADIDAS Men Vigor Blue Casual Shoes', N'19772.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4ce7d857814ce0fec13e120fe55522c9_images.jpg', CAST(74.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (369, N'Men', 2, N'Sandals', N'Grey', N'Casual', N'ADIDAS Men Receptor Grey Sandals', N'19927.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3fa8e7f3bd3eeb217a8cb060d1db2567_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (370, N'Men', 1, N'Flip Flops', N'Yellow', N'Casual', N'ADIDAS Men Adi Wind Yellow Flip Flops', N'19928.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cb0b368d53b7883b638332bb28869881_images.jpg', CAST(71.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (371, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Buckaroo Men Bello Blue Casual Shoes', N'20695.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e6d5c6f61d04b842531936f3f73dc4e1_images.jpg', CAST(26.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (372, N'Men', 3, N'Casual Shoes', N'Black', N'Smart Casual', N'Red Tape Men Black Leather Casual Shoes', N'20715.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Red-Tape-Men-RTS---6151-BLK-Black-Casual-Shoes_75e89ac3afeed7405d895cf605be80d9_images.jpg', CAST(68.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (373, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men Racer White Sports Shoes', N'20802.jpg', N'http://assets.myntassets.com/v1/images/style/properties/89f6d664a27c88ebf7d6fc3498875fb9_images.jpg', CAST(22.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (374, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men Streak White Sports Shoes', N'20804.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b1000636b5755c276de3462524b46e46_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (375, N'Men', 1, N'Flip Flops', N'Olive', N'Casual', N'Fila Men Rambler Olive Flip Flops', N'20805.jpg', N'http://assets.myntassets.com/v1/images/style/properties/aa5794990af2ef0cc5aa7240508c7d6f_images.jpg', CAST(56.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (376, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Clarks Men Black Formal Shoes', N'20833.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7fbee63ac47052f962bd5f25aa8652b8_images.jpg', CAST(69.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (377, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'United Colors of Benetton Men Casual Black Shoes', N'20856.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fc4d12bcdc99ec17c6cbff23ce164f00_images.jpg', CAST(55.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (378, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Fila Men Stradd White Casual Shoes', N'20868.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4f9f3dde2d270ae1611ea25b98f805d9_images.jpg', CAST(72.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (379, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Fila Men Camper Brown Sandals', N'20869.jpg', N'http://assets.myntassets.com/v1/images/style/properties/29fd56a0b77043ee672235e0cfd353cc_images.jpg', CAST(65.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (380, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Basics Men Black Casual Shoes', N'20892.jpg', N'http://assets.myntassets.com/v1/images/style/properties/095fb3ab7b93692ab527692bbacc4147_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (381, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Basics Men Black Casual Shoes', N'20893.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3b86808004a5829edc1076ddeb5ebe4f_images.jpg', CAST(74.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (382, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Basics Men Red Casual Shoes', N'20894.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6cdbcb8a0c91f6f08a5eca566a30ba9e_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (383, N'Men', 3, N'Casual Shoes', N'Orange', N'Casual', N'Basics Men Orange Casual Shoes', N'20895.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e7b1be51dbdb683f6b62b41d4d2ea683_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (384, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Clarks Men Manly Alpine Brown Casual Shoe', N'21091.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cf79419333c910c05cc960d885c51ac3_images.jpg', CAST(62.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (385, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Lowell White Sports Shoe', N'21175.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fc0d77a69b91e580d38bffd75a936dcb_images.jpg', CAST(50.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (386, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'ADIDAS Men Adi Cells Black Flip Flops', N'21180.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b057c9e8d5ccc63369807a12f67a39ac_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (387, N'Men', 1, N'Flip Flops', N'Yellow', N'Casual', N'ADIDAS Men Adi Stars Tread Yellow Flip Flops', N'21181.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fc8aa316b1055183689cf6f1487f911a_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (388, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'ADIDAS Men Star Story Blue Flip Flops', N'21186.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e62c55a04b18b09939898571a2cc9258_images.jpg', CAST(26.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (389, N'Men', 1, N'Flip Flops', N'Yellow', N'Casual', N'ADIDAS Men Plugged In Yellow Flip Flops', N'21187.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fc3c2314edb31f522eab09b78ebede00_images.jpg', CAST(43.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (390, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'ADIDAS Men Adi Stars Tread Black Flip Flops', N'21188.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ae850f862dc4a53f4914528b52e8e82c_images.jpg', CAST(48.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (391, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Flying Machine Men Grey Casual Shoes', N'22101.jpg', N'http://assets.myntassets.com/v1/images/style/properties/74ad44750c9d0e10e88bba88fe5f9910_images.jpg', CAST(35.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (392, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men White Acciomax II Sports Shoes', N'22109.jpg', N'http://assets.myntassets.com/v1/images/style/properties/921f8ec9c2de2e7e7d511d47cb90c290_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (393, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Provogue Men Black Formal Shoes', N'22130.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c63bb9052b4d204abb8260905f118e94_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (394, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Provogue Men Black Formal Shoes', N'22131.jpg', N'http://assets.myntassets.com/v1/images/style/properties/158c6b88bfcd1176eb8c4497a6ac8c86_images.jpg', CAST(25.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (395, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Provouge Men Black Formal Shoes', N'22136.jpg', N'http://assets.myntassets.com/v1/images/style/properties/66382fb6d614ca7cada5bd95f7b4cd9c_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (396, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Provogue Men Brown Formal Shoes', N'22137.jpg', N'http://assets.myntassets.com/v1/images/style/properties/030566390746ba9c76afc7ce7295fbeb_images.jpg', CAST(36.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (397, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Provouge Men Black Classic Formal Shoe', N'22138.jpg', N'http://assets.myntassets.com/v1/images/style/properties/14ef53b95d09aa996909d3035e782203_images.jpg', CAST(26.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (398, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Provogue Men Black Formal Shoes', N'22139.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ed320434e393037062908c10a0368a2d_images.jpg', CAST(51.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (399, N'Men', 2, N'Sandals', N'Olive', N'Casual', N'Lee Cooper Men Casual Sandals', N'22152.jpg', N'http://assets.myntassets.com/v1/images/style/properties/94b46fd2b139a7b2397ca25628704dbd_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (400, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Lee Cooper Men Brown Casual Sandals', N'22153.jpg', N'http://assets.myntassets.com/v1/images/style/properties/99808c9bdfee6165a0cec81d0219c1a1_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (401, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Lee Cooper Men Black Formal Shoes', N'22154.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8ad35a71d39ef0432055771175ca3adc_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (402, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Timberland Men Black Casual Shoes', N'22162.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5863961b3510970c2e31d466af69b32b_images.jpg', CAST(67.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (403, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Timberland Men Navy Blue Casual Shoes', N'22163.jpg', N'http://assets.myntassets.com/v1/images/style/properties/718cc29c21bae96c4a6766bc3c0ecf1d_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (404, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Timberland Men Brown Casual Shoes', N'22164.jpg', N'http://assets.myntassets.com/v1/images/style/properties/324b832e603704a1f06c14310f701eb2_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (405, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Timberland Men Brown Casual Shoes', N'22165.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8683a67ee6b77e1d0ee1c2ca4d612161_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (406, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Timberland Men Light Brown Casual Shoes', N'22190.jpg', N'http://assets.myntassets.com/v1/images/style/properties/76dfcb181dd18083e724d8100eb962bc_images.jpg', CAST(23.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (407, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Timberland Men Light Brown Casual Shoes', N'22191.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ed28f5ea658ff49ab0253f8f8798893a_images.jpg', CAST(66.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (408, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Timberland Men Black Casual Shoes', N'22196.jpg', N'http://assets.myntassets.com/v1/images/style/properties/13b63be853066689953a150fe1986bba_images.jpg', CAST(22.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (409, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Timberland Men Brown Casual Shoes', N'22197.jpg', N'http://assets.myntassets.com/v1/images/style/properties/012a3c034f69c794277712a2904a629f_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (410, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Timberland Men Black Casual Shoes', N'22198.jpg', N'http://assets.myntassets.com/v1/images/style/properties/70e74ca34b3b534b19d6b006d5bfad0a_images.jpg', CAST(61.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (411, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Timberland Men Black Casual Shoes', N'22199.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4848cfb30ff987fee622b21322e4451b_images.jpg', CAST(21.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (412, N'Men', 2, N'Sports Sandals', N'Navy Blue', N'Casual', N'Reebok Men Navy Twist Sandals', N'22361.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Reebok-Men-Blue-Twist-Sandals_9d151773708628e8efa686c33561b54a_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (413, N'Men', 3, N'Casual Shoes', N'Green', N'Casual', N'Gas Men Skate Green Casual Shoes', N'22536.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9158e03588d188017e4ea8a8f45c2d5a_images.jpg', CAST(71.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (414, N'Men', 2, N'Sandals', N'Tan', N'Casual', N'Gas Men Eldorado Tan Casual  Sandals', N'22537.jpg', N'http://assets.myntassets.com/v1/images/style/properties/465863ba7b810b5ef6c516fe91c77308_images.jpg', CAST(47.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (415, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Nike Men Capri II Mid Grey Casual Shoes', N'22703.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f06b700ed9a5c0fb40e3d8c49d2b4efd_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (416, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Nike Men Capri II Mid White Casual Shoes', N'22704.jpg', N'http://assets.myntassets.com/v1/images/style/properties/976afdd1471339064495b533489e41bf_images.jpg', CAST(21.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (417, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Nike Men White Capri II Casual Shoe', N'22705.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9f8463e724322e0b47cc9f615acab635_images.jpg', CAST(68.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (418, N'Men', 3, N'Sports Shoes', N'Olive', N'Sports', N'Nike Men Air Max Conquer ACG Olive Sports Boot', N'22732.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b3d471d92a849559f43a9a6791a2ad83_images.jpg', CAST(26.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (419, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Nike Men Dunk High Grey Casual Shoes', N'22733.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8d5a5eb7aae39ed9958de2f8ade64b9c_images.jpg', CAST(46.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (420, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Woodland Men Brown Shoes', N'22841.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8147ab8b6d2586d1c9239cd94ff622a6_images.jpg', CAST(56.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (421, N'Men', 3, N'Casual Shoes', N'Khaki', N'Casual', N'Woodland Men Khaki Casual Shoes', N'22846.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c701bcfc8f04d62ed35016aee985d5f6_images.jpg', CAST(69.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (422, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men White Acciomax Sports Shoes', N'22958.jpg', N'http://assets.myntassets.com/v1/images/style/properties/dac3290ff5092903b72d3043e293a9f6_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (423, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men White Fusion Sports Shoes', N'22959.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d898378df6163532990b75bada43f65d_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (424, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Arrow Men Formal Black Shoe', N'23246.jpg', N'http://assets.myntassets.com/v1/images/style/properties/af8087a06f0c9ab02a37e22c4cae5dc7_images.jpg', CAST(66.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (425, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Arrow Men Formal Black Shoe', N'23247.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0201105e4604bc784525d9cf0e972c40_images.jpg', CAST(20.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (426, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Arrow Men Formal Brown Shoe', N'23248.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f7d8e92858d00fc9326445424a6f8e85_images.jpg', CAST(46.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (427, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Arrow Men Formal Black Shoes', N'23249.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ae9b19f9e5b20995dd206e0400b2dbce_images.jpg', CAST(25.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (428, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'FILA Men Forza 11 Black Sports Shoes', N'23489.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8a6a6a780165d16b0371e34f63f6b23f_images.jpg', CAST(36.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (429, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'FILA Men Hostile White Sports Shoes', N'23500.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0734fd1f8aea4117ff2f3810a8d7d30b_images.jpg', CAST(25.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (430, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Red Tape Men Cross Band Black Sandals', N'23676.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fbee867387ae6f303458cb86a7e46fa5_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (431, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Red Tape Men Cross Band Brown Sandals', N'23677.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ac888d198ff6db5fbee75f6811915cf7_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (432, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Red Tape Men Mocassins Black Casual Shoes', N'23679.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fe190c0bcadd3318af38d63b93a9b40e_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (433, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Red Tape Men Black Casual Shoes', N'23682.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b7adbd4e6933e586a69433e31c668ddf_images.jpg', CAST(72.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (434, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Puma Men Jiff Black Flip Flops', N'23812.jpg', N'http://assets.myntassets.com/v1/images/style/properties/97b2e7c6f2bbb75b6d33576adc0571fb_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (435, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Puma Men Jiff Black Flip Flops', N'23813.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fd5ec1e4e38ed0b81635af27cca0e585_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (436, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men Neo Low Black Casual Shoes', N'23814.jpg', N'http://assets.myntassets.com/v1/images/style/properties/01aa827decbe2f5e84fd7c854f8d1300_images.jpg', CAST(22.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (437, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men Evo Black Casual Shoes', N'23815.jpg', N'http://assets.myntassets.com/v1/images/style/properties/01e806e6581f0cd323418cb9344d8ec3_images.jpg', CAST(62.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (438, N'Men', 1, N'Flip Flops', N'Red', N'Casual', N'Puma Men Breeze Red Flip Flops', N'23822.jpg', N'http://assets.myntassets.com/v1/images/style/properties/982e0bf3c351aa407d629531c0a249cc_images.jpg', CAST(57.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (439, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Puma Men Breeze Blue Flip Flops', N'23823.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4619265f1f54015175802372aa42c1ec_images.jpg', CAST(72.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (440, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Puma Men Java Black Flip Flops', N'23824.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0c9608b07776a13c6d468f6723361b7b_images.jpg', CAST(64.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (441, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'Puma Men Java Brown Flip Flops', N'23825.jpg', N'http://assets.myntassets.com/v1/images/style/properties/005203199ea23de3f97959be14c2533c_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (442, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'ADIDAS Men Brown Shoes', N'23840.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b676624ef006e153f4ac61d5a70d31d8_images.jpg', CAST(72.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (443, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'ADIDAS Men White Snipe Lo Casual Shoes', N'23841.jpg', N'http://assets.myntassets.com/v1/images/style/properties/856b715d6fc1a22ae326b3e2074549ce_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (444, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men White Galaxy Elite Sports Shoes', N'23846.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2b4da2df280e3672fa30e9aafe76e66c_images.jpg', CAST(41.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (445, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men White Duramo 3 Sports Shoes', N'23847.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8b1c19f33a7ab230c7b37aa9e6996f71_images.jpg', CAST(77.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (446, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men White Razor Sports Shoes', N'23848.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f959fa984e009c3be2b201faff29e1a5_images.jpg', CAST(22.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (447, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'ADIDAS Men Black Anzo Breeze Casual Shoes', N'23849.jpg', N'http://assets.myntassets.com/v1/images/style/properties/aca469db7fbac91473fc2a810461889d_images.jpg', CAST(51.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (448, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men Cavier White Sports Shoes', N'23877.jpg', N'http://assets.myntassets.com/v1/images/style/properties/68b17ba79c69ba59f3033d921c8a59a9_images.jpg', CAST(38.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (449, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Fila Men Destiny Grey Sports Shoes', N'23882.jpg', N'http://assets.myntassets.com/v1/images/style/properties/498da65eeee9a23f2049449258384d55_images.jpg', CAST(54.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (450, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men Hitech White Sports Shoes', N'23884.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6b1d5e664a4dfdfac8ab8f5587257285_images.jpg', CAST(60.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (451, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Fila Men Grey Hex Sports Shoes', N'23885.jpg', N'http://assets.myntassets.com/v1/images/style/properties/FILA-Men-Sports-Shoes_f76566f76f49de0fdea5bedbe1c7db67_images.jpg', CAST(68.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (452, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Red Tape Men Black Sandals', N'24098.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3f605d586102ca09379cc592e697610a_images.jpg', CAST(30.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (453, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Red Tape Men Black Sandals', N'24099.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2257ebd000ba5991411d496ac1211da7_images.jpg', CAST(64.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (454, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Converse Men All Star Black Shoes', N'24187.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fa20b4db514b2caeb4e458fd8ac482db_images.jpg', CAST(30.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (455, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Numero Uno Men White Casual Shoes', N'24250.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ff82e800185f09437bdd38606dbd4ec6_images.jpg', CAST(75.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (456, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Numero Uno Men Black Casual Shoes', N'24251.jpg', N'http://assets.myntassets.com/v1/images/style/properties/73ac516d10dd631f07415d206bad0c05_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (457, N'Men', 3, N'Casual Shoes', N'Green', N'Casual', N'Numero Uno Men Green Casual Shoes', N'24256.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2ab9915265f0498a4adf481c64160b8a_images.jpg', CAST(24.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (458, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Numero Uno Men Navy Blue Casual Shoes', N'24257.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d0ee2c3d9795f7a1d0f5679e3a6cde55_images.jpg', CAST(63.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (459, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Numero Uno Men White Casual Shoes', N'24258.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8cf52572340c3592e5f0ede116a0206f_images.jpg', CAST(45.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (460, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Numero Uno Men Navy Blue Shoes', N'24259.jpg', N'http://assets.myntassets.com/v1/images/style/properties/409871b3e6186c220fab46f5d2b90c7c_images.jpg', CAST(54.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (461, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Numero Uno Men White Shoes', N'24260.jpg', N'http://assets.myntassets.com/v1/images/style/properties/201ee2059f025456791058e25fd72c4b_images.jpg', CAST(32.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (462, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'ADIDAS Men Black Vanquish Sports Shoes', N'24408.jpg', N'http://assets.myntassets.com/v1/images/style/properties/724a329e2ac5bcf1aadfc7fda484cba9_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (463, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men White Court Shuttle IV Sports Shoes', N'24452.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e857ada015878612dbcccdb71da818e1_images.jpg', CAST(56.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (464, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Nike Men Free Run Blue Sports Shoes', N'24453.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a6cfb0dfdce27e16b5ef4f5ef7e61c6c_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (465, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Nike Men Court Majestic White Casual Shoes', N'24454.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9537d2f7f68f4ab9183337966afcc9e7_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (466, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'ADIDAS Men Blue Adi Cliff Flip Flop', N'24462.jpg', N'http://assets.myntassets.com/v1/images/style/properties/833aeb80865a963448ba9d1d4a1b3119_images.jpg', CAST(59.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (467, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Numero Uno Men Brown Casual Shoes', N'24463.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3451aaaa1af1333806711b8a40c68b16_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (468, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Converse Men Lace Color Black Casual Shoes', N'24666.jpg', N'http://assets.myntassets.com/v1/images/style/properties/378d9bf9c3a96f9c45b1bf75e1f88254_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (469, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Converse Men Red Casual Shoes', N'24669.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5122efbb17cf8719d28f683d5f3b5e50_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (470, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Lotto Men Hermes Black Sandals', N'24695.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fd69840076267874eaaef3d85ed7a981_images.jpg', CAST(39.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (471, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Decathlon Men Black F300 Sports Shoes', N'24805.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Decathlon-Men-Decathlon-Shoes-F300-Fg-Sr-Black-1128765-Z-Coffee-Brown-Sports-Shoes_dd1e6a3a3c04bbd1d1ccb66378bbfff7_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (472, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Rockport Men Brown Cashaw Camel Suede Casual Shoes', N'24835.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Rockport-Men-Brown-CASHAW-CAMEL-SUEDE-Casual-Shoes_47d67001cd53547df2c7b5f9820fc63f_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (473, N'Men', 3, N'Sports Shoes', N'Silver', N'Sports', N'Fila Men Superior Silver Sports Shoes', N'25572.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a70ae8bb33c1d5a75df76c3791ed5a9f_images.jpg', CAST(60.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (474, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'FILA Men Trempet White Sports Shoes', N'25573.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9e6734638199831640f4ff2252b5e086_images.jpg', CAST(43.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (475, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'FILA Men Trempet Black & White Sports Shoes', N'25574.jpg', N'http://assets.myntassets.com/v1/images/style/properties/70e34aec928c9a25bbb87089725acb41_images.jpg', CAST(36.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (476, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Fila Men Surveillance White Shoes', N'25575.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0b529ff91b7d773ea9f1fd242412821c_images.jpg', CAST(50.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (477, N'Men', 3, N'Casual Shoes', N'Purple', N'Casual', N'Gas Men Aishley Greyish Purple Casual Shoes', N'26530.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fa0b8460a26ccca6d24d819a7fd5b168_images.jpg', CAST(26.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (478, N'Men', 3, N'Casual Shoes', N'Olive', N'Casual', N'Gas Men Arunta Olive Casual Shoes', N'26531.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8c91e3be9885709d1a77975d5e6dc2cb_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (479, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'ID Men White Shoes', N'26536.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9bbb0a99f2262993b7b659959fbcf3bc_images.jpg', CAST(64.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (480, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'ID Men Blue Shoes', N'26537.jpg', N'http://assets.myntassets.com/v1/images/style/properties/76c2efe5347ad2bd76f401afa9aef090_images.jpg', CAST(58.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (481, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'ID Men Red Shoes', N'26538.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6a6ebc47eaf2fe034bcfd94060a285ba_images.jpg', CAST(45.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (482, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'ID Men White & Black Shoes', N'26539.jpg', N'http://assets.myntassets.com/v1/images/style/properties/aebcef2573afb1f229353e0680b81959_images.jpg', CAST(26.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (483, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'ID Men Black Shoes', N'26552.jpg', N'http://assets.myntassets.com/v1/images/style/properties/260feb93da07d02483d2c9b5beb15e06_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (484, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'ID Men Blue Shoes', N'26553.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a02747a571130ca2d2aa6f491d8b5fc2_images.jpg', CAST(62.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (485, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'ID Men Blue Shoes', N'26554.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f49e87ba6c03e16135b2e79da78dc5b8_images.jpg', CAST(24.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (486, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'ID Men Black & Purple Shoes', N'26555.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6835350fa996308624b38edefa6f401e_images.jpg', CAST(51.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (487, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Lee Cooper Men Brown Shoes', N'26562.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4cd68564db2e7a0b1bbbd8def671f534_images.jpg', CAST(28.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (488, N'Men', 3, N'Casual Shoes', N'Tan', N'Casual', N'Lee Cooper Men Tan Shoes', N'26563.jpg', N'http://assets.myntassets.com/v1/images/style/properties/439813e100f361515c562eb8652a5fb4_images.jpg', CAST(49.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (489, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Puma Men Aqua Cat II Power Black Flip Flops', N'26590.jpg', N'http://assets.myntassets.com/v1/images/style/properties/14f5d521fe39590b0392f3864b499171_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (490, N'Men', 1, N'Flip Flops', N'Red', N'Casual', N'Puma Men Aqua Cat II Power Red Flip Flops', N'26591.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0e2a28441bfa616d38c5ef95266a69f8_images.jpg', CAST(23.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (491, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Puma Men Jago Ripstop Black Sports Shoes', N'26596.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c1cd58d59cc5c4ba32826e7373f254c2_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (492, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Puma Men Faas 300 Black Sports Shoes', N'26597.jpg', N'http://assets.myntassets.com/v1/images/style/properties/135fcf39e2e288c944df11c0682f7a6a_images.jpg', CAST(53.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (493, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men Faas 300 White Sports Shoes', N'26598.jpg', N'http://assets.myntassets.com/v1/images/style/properties/bd7373a9df659f9dad4eded5a7c0bb90_images.jpg', CAST(64.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (494, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Puma Men Faas 300 Blue Sports Shoes', N'26599.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4a7bc59ac70c9c71216f495d56c5fc02_images.jpg', CAST(65.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (495, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men White Court Shuttle Shoes', N'26703.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1038ce9f7220f629cf068d34e286de8c_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (496, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men White T-Lite 9 SL Shoes', N'26704.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c0a8afcb96adb60a55fcb4748bd21364_images.jpg', CAST(47.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (497, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Reebok Men Grey Premier Trinity Sports Shoes', N'27640.jpg', N'http://assets.myntassets.com/v1/images/style/properties/658ea44bbbf88b14adad0e0b59c2197b_images.jpg', CAST(52.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (498, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Red Tape Men Black Shoes', N'28316.jpg', N'http://assets.myntassets.com/v1/images/style/properties/057da5e60ea73990e70041ba83e98395_images.jpg', CAST(64.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (499, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Fila Men Torando Black Sports Shoes', N'28600.jpg', N'http://assets.myntassets.com/v1/images/style/properties/00d49e1b2d56259d0ad1ba93e8cbaf21_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (500, N'Men', 3, N'Sports Shoes', N'Black', N'Casual', N'Nike Men Air Twilight Black Shoes', N'28606.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b3e18cfe9423fe73a067520adf787d5a_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (501, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Dart VII White Sports Shoes', N'28607.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6c0b08ce2249c0eab0c8d3f90514f780_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (502, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Dart VII Leather White Sports Shoes', N'28608.jpg', N'http://assets.myntassets.com/v1/images/style/properties/06ba34f3cad51f867551ef7860e55f08_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (503, N'Men', 3, N'Sports Shoes', N'Black', N'Casual', N'Nike Men The Overplay VI Black Shoes', N'28636.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5da2b93f195e7f411a75901776a48b71_images.jpg', CAST(77.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (504, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Air Relentless Black Sports Shoes', N'28637.jpg', N'http://assets.myntassets.com/v1/images/style/properties/25dbd0bcceab68a7ab398c8a582094f6_images.jpg', CAST(33.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (505, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Dart 9 Leather White Sports Shoes', N'28638.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6a1362c08e876980c17a99de4aa7fd92_images.jpg', CAST(73.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (506, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Tiempo Natural IV Black Sports Shoes', N'28652.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d286cac0d47d4dec862b8adabbab6ceb_images.jpg', CAST(43.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (507, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Air Max Quarter Black Sports Shoes', N'28653.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c8b170a1d0ddd0a42661ea8b20244c99_images.jpg', CAST(76.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (508, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Zoom Structure White Sports Shoes', N'28655.jpg', N'http://assets.myntassets.com/v1/images/style/properties/03024db69975ad4be6f33eb928e08f96_images.jpg', CAST(35.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (509, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Nike Men Lunar Flow Black Casual Shoes', N'28662.jpg', N'http://assets.myntassets.com/v1/images/style/properties/46633b882cd1a13c3b54b6b028345533_images.jpg', CAST(68.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (510, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men Aquil White Sports Shoes', N'29123.jpg', N'http://assets.myntassets.com/v1/images/style/properties/dea49e70e6ec5a0d642febe528ffb309_images.jpg', CAST(54.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (511, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Puma Men Aquil Black Sports Shoes', N'29124.jpg', N'http://assets.myntassets.com/v1/images/style/properties/bf4766979f5625bf20c139e574011674_images.jpg', CAST(38.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (512, N'Men', 3, N'Casual Shoes', N'Purple', N'Casual', N'Vans Men Classic Slip-On Purple & Black Shoes', N'29570.jpg', N'http://assets.myntassets.com/v1/images/style/properties/49f884ddf4420d869ad143857d3bc33d_images.jpg', CAST(45.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (513, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Vans Men Classic Slip-On Navy Blue Shoes', N'29571.jpg', N'http://assets.myntassets.com/v1/images/style/properties/61ff6d0a5a90c48fe528ddeada916425_images.jpg', CAST(28.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (514, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Vans Men Fontana White Shoes', N'29576.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7af1319c8a48caac17777b1efc0cb831_images.jpg', CAST(33.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (515, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Numero Uno Men White Shoes', N'30233.jpg', N'http://assets.myntassets.com/v1/images/style/properties/115e53e76402ea9af077f2d5e44a7ea4_images.jpg', CAST(60.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (516, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Numero Uno Men Black Flip Flops', N'30234.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7b99e89eac30c7d4d78d54c8cc67e35a_images.jpg', CAST(71.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (517, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'Numero Uno Men Brown Flip Flops', N'30235.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5ba3a67486e2c88961ea1e5689c8563b_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (518, N'Men', 1, N'Flip Flops', N'Yellow', N'Casual', N'Numero Uno Men Yellow Flip Flops', N'30250.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ee0e918c229e76e0e7e61712e9d2ecb3_images.jpg', CAST(48.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (519, N'Men', 1, N'Flip Flops', N'Green', N'Casual', N'Numero Uno Men Green Flip Flops', N'30251.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c54d2b6b2829a69f78eb59fff0ed0e66_images.jpg', CAST(72.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (520, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Tape Men Black Semi Formal Shoes', N'30256.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5e6825aad55fd535636671ed72b2c3ee_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (521, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Red Tape Men Grey Shoes', N'30257.jpg', N'http://assets.myntassets.com/v1/images/style/properties/476ee0d09cd066cf3e7ce229d5491754_images.jpg', CAST(70.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (522, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Red Tape Men Brown Shoes', N'30258.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2f78b25ddf5bb5b6a5fe35d68074f420_images.jpg', CAST(35.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (523, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Red Tape Men Navy Blue Shoes', N'30259.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8a791850c1df8128183eb59f7fedabe0_images.jpg', CAST(23.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (524, N'Men', 3, N'Formal Shoes', N'Black', N'Casual', N'Red Tape Men Black Shoes', N'30260.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0fb65c93f7960b36fea651ab805b13be_images.jpg', CAST(35.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (525, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Red Tape Men Brown Formal Shoes', N'30261.jpg', N'http://assets.myntassets.com/v1/images/style/properties/002b3bb2558112872d67170f3c394361_images.jpg', CAST(35.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (526, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Ganuchi Men Brown Shoes', N'31693.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f0b49a9cc297b4fa6ab22363776cdd98_images.jpg', CAST(64.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (527, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Nike Men Avid Grey Shoes', N'31946.jpg', N'http://assets.myntassets.com/v1/images/style/properties/860c3801d65995ce20b695cf1aea1a17_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (528, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men Air Pegasus Grey Sports Shoes', N'31947.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4274e4e982c115d304677e3167cf478b_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (529, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Nike Men Air Pegasus Blue Sports Shoes', N'31948.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9afbca0c8bb6cab7154767902b9bfaf0_images.jpg', CAST(21.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (530, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Zoom Vomero White Sports Shoes', N'31949.jpg', N'http://assets.myntassets.com/v1/images/style/properties/24354f3ae110b7a6aa0fb19ffa6f0f06_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (531, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Lengo Black Sports Shoes', N'31970.jpg', N'http://assets.myntassets.com/v1/images/style/properties/721c5675ac5e1e58e2b864aa122c12df_images.jpg', CAST(75.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (532, N'Men', 3, N'Sports Shoes', N'Navy Blue', N'Sports', N'Nike Men Dual Fusion TR II Navy Blue Sports Shoes', N'31971.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fa47e17256177c9d044bd752e833e954_images.jpg', CAST(49.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (533, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men Lunarswift +3 Grey Sports Shoes', N'31978.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2b92f105b6f754c0491cd8a443e2787c_images.jpg', CAST(53.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (534, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men Lunarswift +3 Grey Sports Shoes', N'31979.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7befb37221105961c017e679245ce9f6_images.jpg', CAST(78.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (535, N'Men', 3, N'Casual Shoes', N'Khaki', N'Casual', N'Woodland Men Khaki Shoes', N'31985.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5d9e6fc038758663af5e6b53b7b90661_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (536, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ADIDAS Men Phantom Blue Sports Shoes', N'32191.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8126b972933d5f9155ef1568a6752019_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (537, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Franco Leone Men Brown Sandals', N'32506.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fdd49471c5869b89864be7a64f46538e_images.jpg', CAST(54.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (538, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Franco Leone Men Black Sandals', N'32507.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7d387a74d698f938487fc13e63e0c95e_images.jpg', CAST(43.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (539, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Franco Leone Men Brown Sandals', N'32508.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5cde18c17d3878b63ca0e4f8f336c28e_images.jpg', CAST(35.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (540, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Franco Leone Men Formal Black Formal Shoes', N'32509.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c51d7f146ef4043ec0df9eca9d42669b_images.jpg', CAST(77.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (541, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Playboy Men Black Shoes', N'32552.jpg', N'http://assets.myntassets.com/v1/images/style/properties/18ecb9a34ecd356d39bc6f15b87fe64c_images.jpg', CAST(64.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (542, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Playboy Men Brown Shoes', N'32553.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cc952bb5bd61f38e58758e8d2bc27820_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (543, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Playboy Men Black Shoes', N'32554.jpg', N'http://assets.myntassets.com/v1/images/style/properties/60ea37226c9c5ed103eeedde59116038_images.jpg', CAST(20.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (544, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Playboy Men White Shoes', N'32555.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cb5de20a8fad6fb3ea14496d5a32f525_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (545, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'FILA Men Liga II Black Shoes', N'32751.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ea051d39d65bfdcba994e6cd49061bd7_images.jpg', CAST(62.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (546, N'Men', 3, N'Casual Shoes', N'Multi', N'Casual', N'Fila Men Glam II Multi Coloured Shoes', N'32757.jpg', N'http://assets.myntassets.com/v1/images/style/properties/79bf7d8999eeeabe2470ebff7e3a6b9f_images.jpg', CAST(26.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (547, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'ADIDAS Neo Men Court Sequence Mid Brown Shoes', N'32951.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b837a4328c1e64284d4b51bd95a57858_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (548, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Lotto Men Black Koro G Slippers', N'33641.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lotto-Men-Black-Koro-G-Slippers_a34db65a450a3a80fccb61f5fe41b549_images.jpg', CAST(53.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (549, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Lotto Men Ridge Black Sandals', N'33646.jpg', N'http://assets.myntassets.com/v1/images/style/properties/affe3aa43d16e7d72433a0a2d82cfc9d_images.jpg', CAST(20.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (550, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Lotto Men Ridge Black Sandals', N'33647.jpg', N'http://assets.myntassets.com/v1/images/style/properties/48443163ef5c78260904604d1d16713c_images.jpg', CAST(28.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (551, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Lotto Men Ridge Brown Sandals', N'33648.jpg', N'http://assets.myntassets.com/v1/images/style/properties/42344fe581af7a4c62d2a39ceb57be24_images.jpg', CAST(47.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (552, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Lotto Men Stride Black Sandals', N'33649.jpg', N'http://assets.myntassets.com/v1/images/style/properties/070b37867589cbef2dbcc9da03d757ea_images.jpg', CAST(63.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (553, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Cobblerz Men Black Formal Shoes', N'33685.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b3f685b0647893db1800788d924c9f24_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (554, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'ADIDAS Neo Men Court Evo Blue Shoes', N'33766.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e20155c3e811626be6f11308521536a7_images.jpg', CAST(51.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (555, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men Axis White & Grey Sports Shoes', N'33822.jpg', N'http://assets.myntassets.com/v1/images/style/properties/52ad8ae288ba080d88a116b3c70305ec_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (556, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men Hypermoto Ducati Black Shoes', N'33840.jpg', N'http://assets.myntassets.com/v1/images/style/properties/02ee800d9466b127f47933dff2d44245_images.jpg', CAST(44.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (557, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Puma Men Drift Cat White Shoes', N'33841.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Puma-Men-Drift-Cat-White-Shoes_38bd6e262b67ee3b6d1090c4c52f881a_images.jpg', CAST(35.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (558, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Puma Men Future Cat Black Shoes', N'33846.jpg', N'http://assets.myntassets.com/v1/images/style/properties/72ccae28a97809e9693607d75ffe9702_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (559, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Puma Men Future Cat White Shoes', N'33847.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Puma-Men-Future-Cat-White-Shoes_582426f358a2de021996e86cfe3fd737_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (560, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Puma Men Drift Cat Brown Shoes', N'33848.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Puma-Men-Drift-Cat-Brown-Shoes_b37c89652031b205bcd19c36d6c686bd_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (561, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Puma Men Blue Shoes', N'33849.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0590736a280676ea2cd2b55107484776_images.jpg', CAST(69.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (562, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Numero Uno Men Navy Leather Shoes', N'34090.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Numero-Uno-Men-Casual-Shoes-SRB-8-BLU-Blue-Casual-Shoes_06848407c033f5e7c9a5177eb9b2dbb8_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (563, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Red Tape Men Brown Formal Shoes', N'34543.jpg', N'http://assets.myntassets.com/v1/images/style/properties/048de34d76449bb502d6bf75cffe33b9_images.jpg', CAST(30.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (564, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Lotto Men Dolce Vita II Grey Sports Shoes', N'34632.jpg', N'http://assets.myntassets.com/v1/images/style/properties/af21a7dc11fed0430f6c22dd916eccf4_images.jpg', CAST(62.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (565, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Lotto Men Dolce Vita II Black Sports Shoes', N'34633.jpg', N'http://assets.myntassets.com/v1/images/style/properties/23992bccfebfa3bb0e9b3716ccb45abc_images.jpg', CAST(50.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (566, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Lotto Men Brown Fella Tres Shoes', N'34634.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d11cef6a5c018893e354faaf57ea6dcb_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (567, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Lotto Men XD III Black Shoes', N'34635.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b21367a701d654464ae8c1ceb521d773_images.jpg', CAST(45.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (568, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Puma Men White Benecio Shoes', N'34749.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7eae52134ab7fe0ae400d54a01149f27_images.jpg', CAST(52.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (569, N'Men', 2, N'Sports Sandals', N'Grey', N'Casual', N'Fila Men Benton Grey Sandals', N'34785.jpg', N'http://assets.myntassets.com/v1/images/style/properties/91055f7e930ea0d17d5f3a3576a56d0d_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (570, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Sukoi White Sports Shoes', N'34832.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0eeb810eac77b956c5b62381e1f3010b_images.jpg', CAST(45.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (571, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ADIDAS Men Blue Chill Sports Shoes', N'34835.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c0abfa74fe61af6ba9e5f4936f45e6c7_images.jpg', CAST(28.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (572, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Falcon Elite White Sports Shoes', N'34850.jpg', N'http://assets.myntassets.com/v1/images/style/properties/963388d780f1becd69c93ab0d2f942a6_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (573, N'Men', 3, N'Casual Shoes', N'Charcoal', N'Casual', N'Vans Men Bedford Charcoal Shoes', N'34851.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7cad8f5a17590d439cc96e7760bc138d_images.jpg', CAST(70.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (574, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Vans Men Classic Slip-On Black Shoes', N'34856.jpg', N'http://assets.myntassets.com/v1/images/style/properties/89ee9427e4bb4bb8fcb173bc0bafdf5b_images.jpg', CAST(67.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (575, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Vans Men Classic Slip-On Black Shoes', N'34857.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0e41c416bc349faead7ebe8851e1a398_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (576, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Vans Men Classic Slip-On Grey Shoes', N'34858.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a6876fce4fe392cc65478960b1e14120_images.jpg', CAST(74.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (577, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Vans Men Era Black Shoes', N'34860.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Era-Black-Shoes_10b0bb17185116b7844cc95ef27fb0d7_images.jpg', CAST(54.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (578, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Vans Men Era Grey Shoes', N'34861.jpg', N'http://assets.myntassets.com/v1/images/style/properties/637030c279a66196db7aa13ee458bdaa_images.jpg', CAST(45.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (579, N'Men', 3, N'Formal Shoes', N'Black', N'Casual', N'Fortune Men Black Formal Shoes', N'35233.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Fortune-Men-Formal-Shoes_f09330dbdfb8c18f912f1f98e1fbea7e_images.jpg', CAST(32.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (580, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Franco Leone Men Blue Shoes', N'35465.jpg', N'http://assets.myntassets.com/v1/images/style/properties/428ea86c27e68387b1a41b4686edd32a_images.jpg', CAST(74.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (581, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Bata Men Mocassino Brown Formal Shoes', N'35491.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f4dfeba74c1492fcfdc92b6ddbbc0ef6_images.jpg', CAST(45.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (582, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Bata Men Lite Black Flip Flops', N'35511.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0affca87e3aba56fdcde8c2c1707c106_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (583, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Bata Men Sandy Blue Flip Flops', N'35521.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3f14b5325030c3476514158160768646_images.jpg', CAST(63.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (584, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Gliders Men Esquire Blue Flip Flops', N'35573.jpg', N'http://assets.myntassets.com/v1/images/style/properties/250838b0730b8630f23237809398b114_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (585, N'Men', 1, N'Flip Flops', N'Red', N'Casual', N'Gliders Men Esquire Red Flip Flops', N'35574.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9c1df994bfd66e4485b82d0e74066d98_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (586, N'Men', 1, N'Flip Flops', N'Green', N'Casual', N'Gliders Men Green Esquire Flip Flops', N'35575.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Gliders-Men-Green-Esquire-Flip-Flops_f5168c977080a420cf18c78cb7ca4336_images.jpg', CAST(49.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (587, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Gliders Men Brown Sandals', N'35586.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Gliders-Men-Sandals_4a43911cb2cbea8fe371e01243a0edbe_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (588, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Gliders Men Brown Leather Sandals', N'35587.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Gliders-Men-Brown-Leather-Sandals_95633c99c7d10aa8995f5c3d6920374d_images.jpg', CAST(54.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (589, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Gliders Men Black Sandals', N'35588.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9d0512618e8f1ab54890cb7e7dddefaf_images.jpg', CAST(59.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (590, N'Men', 2, N'Sandals', N'Olive', N'Casual', N'Gliders Men Yellow Sandals', N'35589.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b7a479fe5f56457e930541a789c5df68_images.jpg', CAST(26.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (591, N'Men', 3, N'Formal Shoes', N'Brown', N'Casual', N'U.S. Polo Assn. Men Brown Shoes', N'35657.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b7ebf4ad88e5685a2f950ba25b2ba717_images.jpg', CAST(43.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (592, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'U.S. Polo Assn. Men Brown Flip Flops', N'35668.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7a75f9bde5d5da3ba38110b6464e26de_images.jpg', CAST(54.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (593, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Nike Men Dual Fusion TR III Grey Sports Shoes', N'35712.jpg', N'http://assets.myntassets.com/v1/images/style/properties/20350a3f6fcaf11905c3609af9ec92a4_images.jpg', CAST(70.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (594, N'Men', 3, N'Sports Shoes', N'Red', N'Sports', N'Nike Men Jordan Fly Wade Red Sports Shoes', N'35713.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ce92252df97b5a245757777a5c39a572_images.jpg', CAST(38.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (595, N'Men', 3, N'Sports Shoes', N'Beige', N'Sports', N'Force 10 Men Beige Sports Shoes', N'35725.jpg', N'http://assets.myntassets.com/v1/images/style/properties/af4182d4292d371bcc10698fb31da5eb_images.jpg', CAST(60.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (596, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Force 10 Men Black & Green Sports Shoes', N'35777.jpg', N'http://assets.myntassets.com/v1/images/style/properties/82a96a5a66ccb900ef4ab90c095baf02_images.jpg', CAST(29.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (597, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Nike Men Dunk High Grey Shoes', N'36130.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ca603a625578f83eebaa222051bb442b_images.jpg', CAST(64.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (598, N'Men', 3, N'Casual Shoes', N'Maroon', N'Casual', N'Nike Men Dunk High Maroon Shoes', N'36131.jpg', N'http://assets.myntassets.com/v1/images/style/properties/619f32e4177a1dc98bdf266cefb0f4c8_images.jpg', CAST(37.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (599, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Zoom Hyperenforcer White Sports Shoes', N'36138.jpg', N'http://assets.myntassets.com/v1/images/style/properties/48a23490d5375c27ac130c606f4213b9_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (600, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men The Overplay VII Black Sports Shoes', N'36139.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0834f6ae67b7891d53e9a0d612a6fe46_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (601, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Spinn Men Dozer Black Shoes', N'36442.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cd2866856f1acb4f49239ab4ea2689ef_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (602, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Force 10 Men White Sports Shoes', N'36957.jpg', N'http://assets.myntassets.com/v1/images/style/properties/bf5fa4d1a7f8828f604656d9ea9f1cde_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (603, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'United Colors of Benetton Men Brown Shoes', N'37240.jpg', N'http://assets.myntassets.com/v1/images/style/properties/be6ae100e116fd0d18cb0277dd045901_images.jpg', CAST(23.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (604, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'United Colors of Benetton Men Black Shoes', N'37241.jpg', N'http://assets.myntassets.com/v1/images/style/properties/bb19253f1f8bce9a8ef77375cd346016_images.jpg', CAST(34.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (605, N'Men', 3, N'Casual Shoes', N'Charcoal', N'Casual', N'United Colors of Benetton Men Charcoal Shoes', N'37246.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1145142948361b0a1e1fbf5a6012c594_images.jpg', CAST(36.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (606, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'United Colors of Benetton Men Black Shoes', N'37247.jpg', N'http://assets.myntassets.com/v1/images/style/properties/aad25041bb4c453db393e317ec0fb2cf_images.jpg', CAST(38.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (607, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'United Colors of Benetton Men Brown Shoes', N'37248.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9b0d6e5c4d9caf019a8bbadc7495a92e_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (608, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'United Colors of Benetton Men Brown Shoes', N'37249.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d4636e23006874ae87dde460f7724909_images.jpg', CAST(39.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (609, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Nike Men Avid Black Casual Shoes', N'38653.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4ccdc8097238b1d029a7c23b0cc58207_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (610, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Ballista White Sports Shoes', N'38654.jpg', N'http://assets.myntassets.com/v1/images/style/properties/10365553644b24256ed7221979050d32_images.jpg', CAST(47.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (611, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Air Impetus II White Sports Shoes', N'38655.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9f6bc97599ce07ebdf3e1ee8452651fc_images.jpg', CAST(69.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (612, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'Nike Men T90 Shoot IV Hg-B Blue Sports Shoes', N'38662.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2935b4863e73f5667c427862b3cf2d2b_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (613, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Downshifter Black Sports Shoes', N'38663.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2c5347917d3e4889a799bc3cb28329b4_images.jpg', CAST(71.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (614, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Nike Men Liteforce Grey Shoes', N'38664.jpg', N'http://assets.myntassets.com/v1/images/style/properties/eb126f408e5752b645b19578f12bfeb0_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (615, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Nike Men Lunarfly Black Sports Shoes', N'38665.jpg', N'http://assets.myntassets.com/v1/images/style/properties/088a676c4548550a45922ed68f366c1d_images.jpg', CAST(30.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (616, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Chief Men Black Formal Shoes', N'39263.jpg', N'http://assets.myntassets.com/v1/images/style/properties/842f3fa981617f2625cb270cdda1a3dd_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (617, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Chief Men Black Formal Shoes', N'39264.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5b75650e8c1215edb927eb5c929a556f_images.jpg', CAST(51.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (618, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Red Chief Men Black Sandals', N'39297.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5f2f5b0ce27bb55afa0bcce8ceccbacc_images.jpg', CAST(68.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (619, N'Men', 3, N'Casual Shoes', N'Khaki', N'Casual', N'Red Chief Men Khaki Casual Shoes', N'39310.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d4970d44d1f2af84c4056852632ce317_images.jpg', CAST(54.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (620, N'Men', 1, N'Flip Flops', N'Multi', N'Casual', N'Converse Men Multi Coloured Flip Flop', N'39311.jpg', N'http://assets.myntassets.com/v1/images/style/properties/76d6c7b68001277c4f9298b1fd18be47_images.jpg', CAST(35.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (621, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Fila Men Zoom Black Shoes', N'39342.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6bba9c226b38d438115ac2d952ac9d5e_images.jpg', CAST(23.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (622, N'Men', 1, N'Flip Flops', N'Yellow', N'Casual', N'Numero Uno Men Yellow Flip Flops', N'39546.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5bdd4c9e739205e28ee134ff7849bc60_images.jpg', CAST(28.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (623, N'Men', 1, N'Flip Flops', N'Red', N'Casual', N'Numero Uno Men Red Flip Flops', N'39547.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1c648c96a3ef7fd021e5a6462601af0b_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (624, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Lotto Men White Sports Shoes', N'39638.jpg', N'http://assets.myntassets.com/v1/images/style/properties/021c6c43c0a6a9152f5f4ac18aa2b271_images.jpg', CAST(51.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (625, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Arrow Men Red Shoes', N'39742.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a5ab934bf95b73af42ac8f3ef4f3030e_images.jpg', CAST(23.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (626, N'Men', 2, N'Sports Sandals', N'Brown', N'Casual', N'ADIDAS Men Brown Sandals', N'39899.jpg', N'http://assets.myntassets.com/v1/images/style/properties/28bf82e35192d2d96f6011c669149e03_images.jpg', CAST(25.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (627, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ADIDAS Men Blue & Red F10 Sports Shoes', N'39910.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3c3bda51fa73d8d10ae31bdf79bcbbec_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (628, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Gas Men Navy Blue Shoes', N'39942.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d039d725e9893e24fd9f021de968a920_images.jpg', CAST(65.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (629, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'GAS Men Brown Count Casual Shoes', N'39943.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f2d705addd04fcf5516aef873254441e_images.jpg', CAST(20.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (630, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'GAS Men Grey Namib Shoes', N'39944.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a63da69bf6b0a00d95dde7d444f57bc5_images.jpg', CAST(23.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (631, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'GAS Men Brown Namib Shoes', N'39945.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9791ef9c6d02e740a8420299b8f02662_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (632, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'GAS Men Grey Campus Casual Shoes', N'39972.jpg', N'http://assets.myntassets.com/v1/images/style/properties/GAS-Men-Casual-Shoes_b877c388a1212f0886ad1cb52e5c03fb_images.jpg', CAST(77.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (633, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Gas Men Brown Lear Shoes', N'39973.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Gas-Men-Brown-Lear-Shoes_8d7f627491e0cc2c8de97c95ca634d5d_images.jpg', CAST(37.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (634, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Gas Men Brown Lear Shoes', N'39974.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Gas-Men-Khaki-Lear-Shoes_ee1f9af8c60c3670398b9251193f3d58_images.jpg', CAST(25.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (635, N'Men', 3, N'Casual Shoes', N'Olive', N'Casual', N'Gas Men Olive Swansea Shoes', N'39975.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Gas-Men-Olive-Swansea-Shoes_3b88d59b9e96bd64e16d0c85ec522979_images.jpg', CAST(70.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (636, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Gas Men Flint Brown Shoes', N'39980.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a7a8fe472fe8efb3f3b92a1a21ba1b6f_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (637, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Gas Men Jack Grey Shoes', N'39981.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e8dd5f308885e0e8a533a63b54eaa3ea_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (638, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Gas Men Mila Navy Blue Shoes', N'39986.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ca8904a9a90c8c44c7b08519b394e8ac_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (639, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Gas Men Europa Blue Shoes', N'39987.jpg', N'http://assets.myntassets.com/v1/images/style/properties/de3bcbc7fc0f6e4ad83fa6c9a3ce89b8_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (640, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Gas Men Europa White Shoes', N'39988.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9c3d77147758ab10f12caf6184fe13ef_images.jpg', CAST(51.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (641, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Gas Men Skate Blue Shoes', N'39989.jpg', N'http://assets.myntassets.com/v1/images/style/properties/685c0dd339e58d20bd23e8f23a122f7f_images.jpg', CAST(50.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (642, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men White Sparta Sports Shoes', N'40322.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f277dbded1640eaa4ca85c4b8d4ca101_images.jpg', CAST(58.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (643, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Black Twenty2yds Sports Shoes', N'40323.jpg', N'http://assets.myntassets.com/v1/images/style/properties/af6cf23d24781c8a729f8a7637a38bf8_images.jpg', CAST(71.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (644, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men White Sport Shoes', N'40325.jpg', N'http://assets.myntassets.com/v1/images/style/properties/01840a251f73babcc28a2c5bdef65ebc_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (645, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Quiksilver Men Black Flip Flops', N'40776.jpg', N'http://assets.myntassets.com/v1/images/style/properties/58f63757145dbcb934e7cc2f00973b4a_images.jpg', CAST(77.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (646, N'Men', 1, N'Flip Flops', N'White', N'Casual', N'Quiksilver Men White Flip Flops', N'40777.jpg', N'http://assets.myntassets.com/v1/images/style/properties/dffb0b14b097c0d2b7c4aad14181b055_images.jpg', CAST(54.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (647, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Quiksilver Men Black Flip Flops', N'40778.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cbe97f9c9486c3cd2a90881d9c77b7da_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (648, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'Quiksilver Men Brown Flip Flops', N'40779.jpg', N'http://assets.myntassets.com/v1/images/style/properties/93422bef704ee5830c23f615bc89fa32_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (649, N'Men', 1, N'Flip Flops', N'Multi', N'Casual', N'Quiksilver Men Multi Coloured Flip Flops', N'40782.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5596dae680b37c9fb4aaa6a265e7177b_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (650, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Quiksilver Men Black Flip Flops', N'40783.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d6ee15dc6f8243e59c6e05effce27873_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (651, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Quiksilver Men Blue Flip Flops', N'40784.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0a9e2c771bc3ab2945ea36a09c06418d_images.jpg', CAST(68.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (652, N'Men', 1, N'Flip Flops', N'White', N'Casual', N'Quiksilver Men White Flip Flops', N'40785.jpg', N'http://assets.myntassets.com/v1/images/style/properties/3ac1a2f48ba5767e13a5cb112da62654_images.jpg', CAST(21.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (653, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Buckaroo Men Red Casual Shoes', N'40970.jpg', N'http://assets.myntassets.com/v1/images/style/properties/81b9dfee83d2f89bfed0aab9e78e6df5_images.jpg', CAST(52.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (654, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Buckaroo Men Brown Casual Shoes', N'40971.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e5b5823706a1c890f4300f30c92f59b2_images.jpg', CAST(71.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (655, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men White Aquil Sports Shoes', N'41232.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2cb299d689b5c26c256c931837d45f7c_images.jpg', CAST(67.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (656, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men White Aquil Sports Shoes', N'41233.jpg', N'http://assets.myntassets.com/v1/images/style/properties/58b3a748a5d62f503ffd41667422df61_images.jpg', CAST(31.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (657, N'Men', 3, N'Sports Shoes', N'White', N'Casual', N'Lee Cooper Men Black & White Sports Shoes', N'41436.jpg', N'http://assets.myntassets.com/v1/images/style/properties/75dda63272645c9dedd6fcabd4eabd75_images.jpg', CAST(60.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (658, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Lee Cooper Men White Sports Shoes', N'41437.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a36c588c364a56bc88de7b50101ba1ca_images.jpg', CAST(74.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (659, N'Men', 3, N'Sports Shoes', N'White', N'Casual', N'Lee Cooper Men White Sports Shoes', N'41438.jpg', N'http://assets.myntassets.com/v1/images/style/properties/00151ff747ecd0822548bc03eae08649_images.jpg', CAST(52.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (660, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Lee Cooper Men Black Sports Shoes', N'41439.jpg', N'http://assets.myntassets.com/v1/images/style/properties/09edfdb4c1dc1478ea35507b0bdc41ce_images.jpg', CAST(68.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (661, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Lee Cooper Men White Shoes', N'41452.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b108d9994e0371f64073b44b2669a79d_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (662, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Lee Cooper Men White Shoes', N'41453.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ec572c3047ccf6cc9b4190ca455b341c_images.jpg', CAST(67.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (663, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Lee Cooper Men White Shoes', N'41454.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a10af61df2d146c2c714afde54623cbd_images.jpg', CAST(27.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (664, N'Men', 2, N'Sandals', N'Grey', N'Casual', N'Lee Cooper Men Grey Sandals', N'41455.jpg', N'http://assets.myntassets.com/v1/images/style/properties/788847bb37bf3ba404eeebcb290c8746_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (665, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men Black Sneakers', N'41832.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ca89d1b053d9453a17193bc0d056b56b_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (666, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Skechers Men Blue Shoes', N'41833.jpg', N'http://assets.myntassets.com/v1/images/style/properties/69b375b0bfbed0392edb93b05f2c8cf2_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (667, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Skechers Men Black Shoes', N'41834.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2c64a9788774d5c1ac0e149b20a61a7f_images.jpg', CAST(37.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (668, N'Men', 2, N'Sandals', N'Olive', N'Casual', N'Bata Men Hummer Grey Sandals', N'41857.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5209f6e3a73471f764528cf56902d50b_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (669, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Estd. 1977 Men Brown Sandals', N'41858.jpg', N'http://assets.myntassets.com/v1/images/style/properties/9efd7ae56fafd8f9e64f3829d9d3ca0c_images.jpg', CAST(39.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (670, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Estd. 1977 Men Black Sandals', N'41859.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2a07ce87fedfca8928f12f3ddf6b7632_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (671, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Estd. 1977 Men Black Sandals', N'41861.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b996cb05ae7c16cabfa4cadc23818247_images.jpg', CAST(41.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (672, N'Men', 2, N'Sandals', N'Beige', N'Casual', N'Estd. 1977 Men Beige & Green Sandals', N'41866.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7adfef9d7001cdcb9a58822c0c8b615f_images.jpg', CAST(46.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (673, N'Men', 2, N'Sandals', N'Red', N'Casual', N'Estd. 1977 Men Red & Brown Sandals', N'41867.jpg', N'http://assets.myntassets.com/v1/images/style/properties/43db177ea76d2f7a1c6ba451fa94200a_images.jpg', CAST(28.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (674, N'Men', 2, N'Sandals', N'Turquoise Blue', N'Casual', N'Estd. 1977 Men Turquoise Blue Sandals', N'41868.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c6ee9c292ad6c05a9f0df2cf33de7dd7_images.jpg', CAST(49.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (675, N'Men', 2, N'Sandals', N'Yellow', N'Casual', N'Estd. 1977 Men Yellow & Brown Sandals', N'41869.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d27dbd8e9666b9af2d72fbfde315f76d_images.jpg', CAST(23.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (676, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Estd. 1977 Men Brown Sandals', N'42010.jpg', N'http://assets.myntassets.com/v1/images/style/properties/feced0f1dc95b9c967f4518b90bd8316_images.jpg', CAST(41.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (677, N'Men', 2, N'Sandals', N'Grey', N'Casual', N'Estd. 1977 Men Grey Sandals', N'42011.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b6e0c18ec68cef8f678044abcb9da69f_images.jpg', CAST(36.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (678, N'Men', 3, N'Sports Shoes', N'Silver', N'Sports', N'ADIDAS Men Silver Phaedra Shoes', N'42016.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1551909acce98338ec85e55a32b04f47_images.jpg', CAST(35.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (679, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men White Phaedra Sports Shoes', N'42017.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c7e25fa074d71959905d645878cb53be_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (680, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'ADIDAS Men Black Pural Desman Shoes', N'42019.jpg', N'http://assets.myntassets.com/v1/images/style/properties/61a344cf01a57fa31aece78ee5e826d1_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (681, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'ADIDAS Men Brown Mudslide Shoes', N'42020.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b34a6f424dc8c8853fa2324f509a3303_images.jpg', CAST(57.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (682, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Nike Men Air Relentless 2 MSL White Sports Shoes', N'42042.jpg', N'http://assets.myntassets.com/v1/images/style/properties/16a858c7c58d665ba030df2f9f326086_images.jpg', CAST(63.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (683, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Nike Men Black Shoes', N'42043.jpg', N'http://assets.myntassets.com/v1/images/style/properties/673b012f8890500c1cc057fadb855541_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (684, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Nike Men Wardour Chukka White Casual Shoes', N'42044.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2819f41dd9685b02ece177ea8b74afb2_images.jpg', CAST(72.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (685, N'Men', 3, N'Casual Shoes', N'Yellow', N'Casual', N'Nike Men Wardour Chukka Yellow Casual Shoes', N'42045.jpg', N'http://assets.myntassets.com/v1/images/style/properties/bf609f778c0433c073cf4857238104eb_images.jpg', CAST(34.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (686, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men Mars White Sports Shoes', N'42086.jpg', N'http://assets.myntassets.com/v1/images/style/properties/554d13072770bf16a010c4f6212da393_images.jpg', CAST(45.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (687, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men White Aztek Shoes', N'42087.jpg', N'http://assets.myntassets.com/v1/images/style/properties/37fafc79943235067c410fe05217e8d3_images.jpg', CAST(22.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (688, N'Men', 3, N'Sports Shoes', N'Brown', N'Sports', N'ADIDAS Men Brown Zapotec Shoes', N'42088.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2b2ccb96bc63978df5e2048b9c3e1958_images.jpg', CAST(53.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (689, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'ADIDAS Men White Corona Sports Shoes', N'42089.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5059a8f382c53105f1bdce6780543934_images.jpg', CAST(43.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (690, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Vans Men Navy Blue Michoacan Shoes', N'42276.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2e83d57a194c3ca14466b5e46b9e81cc_images.jpg', CAST(61.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (691, N'Men', 3, N'Sports Shoes', N'Navy Blue', N'Sports', N'Reebok Men Navy Blue Turbo DMX Shear Sports Shoes', N'43335.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5a39c57fe14818bcf26761961d619fae_images.jpg', CAST(57.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (692, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Reebok Men Black Fuel Extreme Sports Shoes', N'43350.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8735e7bb7c0f6bba6ba42c2249a56817_images.jpg', CAST(41.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (693, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Reebok Men Black Ultimate Vibe Sports Shoes', N'43357.jpg', N'http://assets.myntassets.com/v1/images/style/properties/44010cc893bc40d8ac8e9a94c67dc1d4_images.jpg', CAST(25.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (694, N'Men', 3, N'Sports Shoes', N'Grey', N'Sports', N'Reebok Men Grey Ultimate Vibe Sports Shoes', N'43359.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8b88871337f502b165149a9adfb23495_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (695, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Reebok Men White Ultimate Vibe Sports Shoes', N'43360.jpg', N'http://assets.myntassets.com/v1/images/style/properties/204c35089ef0ca53f26baf86eb074e33_images.jpg', CAST(32.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (696, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Reebok Men Blue Possession Flip Flops', N'43368.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f07545fc41f9696be5a669176a6cdff9_images.jpg', CAST(62.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (697, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Reebok Men Black Possession Flip Flops', N'43369.jpg', N'http://assets.myntassets.com/v1/images/style/properties/647838a2e988ab55b76c9aa9ddd15ad7_images.jpg', CAST(27.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (698, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Puma Men White Driving Power Lo Shoes', N'43871.jpg', N'http://assets.myntassets.com/v1/images/style/properties/74a3feb75c7eaba01a38ed501de26ab1_images.jpg', CAST(59.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (699, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Puma Men White 3.0 Mid Shoes', N'43876.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c059090b7cadab7c4c062b2319470c33_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (700, N'Men', 2, N'Sandals', N'Olive', N'Casual', N'Puma Men Olive Techno Ind Sandal', N'43958.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Puma-Men-Olive-Techno-Ind-Sandal_3e7aa0b204f4317a017dfbefe260700b_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (701, N'Men', 2, N'Sandals', N'Grey', N'Casual', N'Puma Men Grey Sandals', N'43959.jpg', N'http://assets.myntassets.com/v1/images/style/properties/645e28828551998ae6a4f33226ef3c38_images.jpg', CAST(72.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (702, N'Men', 3, N'Sports Shoes', N'Brown', N'Sports', N'Force 10 Men Brown Shoes', N'44406.jpg', N'http://assets.myntassets.com/v1/images/style/properties/554a2be61078071561aea802dc7b6cf3_images.jpg', CAST(75.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (703, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Coolers Men Black Sandals', N'44511.jpg', N'http://assets.myntassets.com/v1/images/style/properties/cb019afbcebf61a9fae59ba48f0a6ee3_images.jpg', CAST(70.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (704, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Coolers Men Black Pokar Flip Flops', N'44516.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Coolers-Men-POKAR-Black-Flip-Flops_ee113772a64e396ec9166036cdf547c0_images.jpg', CAST(32.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (705, N'Men', 1, N'Flip Flops', N'Brown', N'Casual', N'Coolers Men Brown Pokar Flip Flops', N'44517.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Coolers-Men-POKAR-Brown-Flip-Flops_8b247db935e7cfffb8f5a0b8d578f7bf_images.jpg', CAST(64.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (706, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Coolers Men Black Sandals', N'44518.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1fe643f6730e29abcd819395dfb9ff92_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (707, N'Men', 2, N'Sandals', N'Khaki', N'Casual', N'Coolers Men Khaki Sandals', N'44520.jpg', N'http://assets.myntassets.com/v1/images/style/properties/fa43e463a1ac62d0faf52b69b2be829f_images.jpg', CAST(21.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (708, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Coolers Men Black Sandals', N'44521.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8fdaedb32b00be7b27714bc67055e0d7_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (709, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Coolers Men Black Sandals', N'44528.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5fdccf41dafc022f36adea9a7df6751c_images.jpg', CAST(39.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (710, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Coolers Men Black Sandals', N'44529.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Coolers-Men-Black-Sandals_d48cb0b603c630533c0a967fe23476c2_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (711, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Coolers Men Black Sandals', N'44544.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a534fc3afe0802b1a9d84e28a34104aa_images.jpg', CAST(78.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (712, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Coolers Men Brown Sandals', N'44545.jpg', N'http://assets.myntassets.com/v1/images/style/properties/007eb7d88e3dc7d17d7cfe15cb8c1ba0_images.jpg', CAST(30.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (713, N'Men', 2, N'Sports Sandals', N'Black', N'Casual', N'Coolers Men Black Sports Sandals', N'44572.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Coolers-Men-8141-03-Blue-Sandals_63fc34706dcb4ec3a8b5be5a4d302695_images.jpg', CAST(70.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (714, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Coolers Men Brown Sandals', N'44573.jpg', N'http://assets.myntassets.com/v1/images/style/properties/0de39b645ec8c893f54e6cb090e8245a_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (715, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Lotto Men Black Campione Flip Flop', N'44712.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b4e92269a1a54fe65b6ba1e189c49325_images.jpg', CAST(26.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (716, N'Men', 1, N'Flip Flops', N'Black', N'Casual', N'Lotto Men Black Flip Flops', N'44713.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1a690940734f3bc0df5d13791baf68a2_images.jpg', CAST(32.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (717, N'Men', 1, N'Flip Flops', N'Maroon', N'Casual', N'Lotto Men Maroon Juve Flip Flop', N'44714.jpg', N'http://assets.myntassets.com/v1/images/style/properties/02d77ac6bf8e51ea28378b0f1bfd7e00_images.jpg', CAST(33.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (718, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Lotto Men Navy Blue Flip Flops', N'44715.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ecca5b63a81ffb22a8b30c1674a7ddf0_images.jpg', CAST(60.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (719, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Globalite Men White Terra Shoes', N'44740.jpg', N'http://assets.myntassets.com/v1/images/style/properties/1382dd0726f1748a14305844d4c97f4c_images.jpg', CAST(21.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (720, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Globalite Men White Terra Shoes', N'44741.jpg', N'http://assets.myntassets.com/v1/images/style/properties/5e4da46cbf0c20e10cad459971bf9c76_images.jpg', CAST(63.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (721, N'Men', 3, N'Casual Shoes', N'Olive', N'Casual', N'Globalite Men Olive Sparta Shoes', N'44746.jpg', N'http://assets.myntassets.com/v1/images/style/properties/d5e7d1528d28993acfc99b38abc73248_images.jpg', CAST(31.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (722, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Globalite Men Black Sparta Shoes', N'44747.jpg', N'http://assets.myntassets.com/v1/images/style/properties/32b930343fffe258bcdf6ab9363bb24e_images.jpg', CAST(76.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (723, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Globalite Men White Dribble Shoes', N'44748.jpg', N'http://assets.myntassets.com/v1/images/style/properties/dc5df4ec13cadd87bff221579e6782b0_images.jpg', CAST(47.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (724, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Globalite Men Grey Tracker Shoes', N'44749.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6e61b750f76a4dccfc376634ecfacb49_images.jpg', CAST(68.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (725, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Globalite Men Black Skid Shoes', N'44770.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4afe5a31ac385e4e43ca98ed9e1ef734_images.jpg', CAST(41.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (726, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Globalite Men Navy Blue Skid Shoes', N'44771.jpg', N'http://assets.myntassets.com/v1/images/style/properties/07305f0c9d358c32b52a1d3715787121_images.jpg', CAST(40.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (727, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Lotto Men Black Dolce Vita Shoes', N'44776.jpg', N'http://assets.myntassets.com/v1/images/style/properties/bbdb227514bbad61c52c463df7e226eb_images.jpg', CAST(45.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (728, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Lotto Men Grey Dolce Vita Shoes', N'44777.jpg', N'http://assets.myntassets.com/v1/images/style/properties/68278d11b6ca39f30e2ea1ce9a4f2ad9_images.jpg', CAST(43.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (729, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Lotto Men Grey Skateboard Shoes', N'44778.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ca1b67f7619633fc7223b90322f5cf7a_images.jpg', CAST(56.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (730, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'Lotto Men White Skateboard Shoes', N'44779.jpg', N'http://assets.myntassets.com/v1/images/style/properties/44f436357d4664921418f737f798c559_images.jpg', CAST(26.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (731, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Lotto Men White Los Angeles II Sports Shoes', N'44782.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7d8732d78a1af4ef6482bbad516358dd_images.jpg', CAST(68.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (732, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Lotto Men White & Silver Sports Shoes', N'44783.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lotto-Men-White---Silver-Sports-Shoes_fb12adf8cabe4187ee42e754cc1c322c_images.jpg', CAST(59.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (733, N'Men', 3, N'Sports Shoes', N'White', N'Casual', N'Lotto Men White Torcida Shoes', N'44784.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c462e119a8ee401e9cd03f9e2e7a647f_images.jpg', CAST(60.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (734, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Lotto Men L500 FG White Sports Shoes', N'44785.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b76ddd2010ef12c342439f3491f56b73_images.jpg', CAST(78.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (735, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Franco Leone Men Brown Makhani Formal Shoes', N'44940.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f4358b5eeaa2a8e70b42db60518f59aa_images.jpg', CAST(72.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (736, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Franco Leone Men Formal Shoes', N'44941.jpg', N'http://assets.myntassets.com/v1/images/style/properties/851760e82d34ebdc4b38d0dcd399e3f2_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (737, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'Puma Men Mid Biz Ind White Shoes', N'44947.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c5bae9174c0e5fe600f0b9fc4e210d08_images.jpg', CAST(64.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (738, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'Puma Men Black Aquil II Sports Shoes', N'44948.jpg', N'http://assets.myntassets.com/v1/images/style/properties/39cef2982137215d71ed41a558159659_images.jpg', CAST(31.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (739, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Arrow Men Brown Formal Shoes', N'45602.jpg', N'http://assets.myntassets.com/v1/images/style/properties/6b7d60e42466a293bc7a976449245675_images.jpg', CAST(30.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (740, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Arrow Men Black Formal Shoes', N'45603.jpg', N'http://assets.myntassets.com/v1/images/style/properties/8f3b9f4c5f554e39681567b22985966e_images.jpg', CAST(23.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (741, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Arrow Men Brown Formal Shoes', N'45604.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2b27b053871a6e9325c0f422fe92b67a_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (742, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Arrow Men Black Formal Shoes', N'45605.jpg', N'http://assets.myntassets.com/v1/images/style/properties/a05fe01290b257157bc99ca67515ad3e_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (743, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Numero Uno Men Black Shoes', N'45866.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c15108156edb0aa796a8a5a549b5ba57_images.jpg', CAST(66.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (744, N'Men', 3, N'Sports Shoes', N'Blue', N'Sports', N'ADIDAS Men Blue Sports Shoes', N'46080.jpg', N'http://assets.myntassets.com/v1/images/style/properties/98648296abe452350f67540957a1c0cc_images.jpg', CAST(33.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (745, N'Men', 2, N'Sandals', N'Navy Blue', N'Casual', N'ADIDAS Men Navy Blue Benton Sandals', N'46081.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4c6e1b047904fe55b1b3fd4e1f26afea_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (746, N'Men', 3, N'Sports Shoes', N'Orange', N'Sports', N'ADIDAS Men Orange Sports Shoes', N'46215.jpg', N'http://assets.myntassets.com/v1/images/style/properties/626f831620dfb63d0ecc780806bc7f64_images.jpg', CAST(54.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (747, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Franco Leone Men Brown Shoes', N'47190.jpg', N'http://assets.myntassets.com/v1/images/style/properties/77d7bccf564d9807859c6841037f4112_images.jpg', CAST(36.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (748, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Franco Leone Men Black Formal Shoes', N'47191.jpg', N'http://assets.myntassets.com/v1/images/style/properties/81cf8c19e59aa21dd516d55a44f49a35_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (749, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Franco Leone Men Brown Sandals', N'47196.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ff08f4495fe8d8ca799b327cf3487e3a_images.jpg', CAST(66.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (750, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Franco Leone Men Black Sandals', N'47197.jpg', N'http://assets.myntassets.com/v1/images/style/properties/4ecc18f38825a3c9b68201fe81ad3871_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (751, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Franco Leone Men Brown Sandals', N'47198.jpg', N'http://assets.myntassets.com/v1/images/style/properties/08be9002361c65ffa2e08a8f12464f56_images.jpg', CAST(63.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (752, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Franco Leone Men Dark Brown Formal Shoes', N'47199.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Franco-Leone-Men-Dark-Brown-Formal-Shoes_a6960feb0858f028113fe4f768fd9aa7_images.jpg', CAST(61.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (753, N'Men', 3, N'Casual Shoes', N'Orange', N'Casual', N'Playboy Men Orange Casual Shoes', N'47248.jpg', N'http://assets.myntassets.com/v1/images/style/properties/c5388128a25bfecd078e864c842b49e8_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (754, N'Men', 3, N'Casual Shoes', N'Charcoal', N'Casual', N'Flying Machine Men Charcoal Shoes', N'49059.jpg', N'http://assets.myntassets.com/v1/images/style/properties/47b68b00549450cdea0d0380dd597663_images.jpg', CAST(65.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (755, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Flying Machine Men Black Shoes', N'49060.jpg', N'http://assets.myntassets.com/v1/images/style/properties/748aaedd07c35e5681e58e8cfc232675_images.jpg', CAST(50.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (756, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Flying Machine Men Brown Shoes', N'49061.jpg', N'http://assets.myntassets.com/v1/images/style/properties/815cca1f8f904471959fbe2b8055c177_images.jpg', CAST(31.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (757, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Vans Men Blue Shoes', N'49435.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Blue-Chukka-Boot-Shoes_678a3cfded1ec1bcceca587f6776a926_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (758, N'Men', 3, N'Casual Shoes', N'Blue', N'Casual', N'Vans Men Blue Era Scilla Plaid Shoes', N'49461.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Blue-Casual-Shoes_f9ad04b071e06c34a04e2c0a047d58a1_images.jpg', CAST(27.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (759, N'Men', 3, N'Casual Shoes', N'Red', N'Casual', N'Vans Men Red Old Skool Shoes', N'49468.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Maroon-Old-Skool-Shoes_d4826108fe9e4979766e62df2f7fcd06_images.jpg', CAST(31.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (760, N'Men', 3, N'Casual Shoes', N'Maroon', N'Casual', N'Vans Men Maroon Vulcanized Canvas Shoes', N'49469.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Maroon-Vulcanized-Canvas-Shoes_720f0b25cb5299caf59f50ea424432a4_images.jpg', CAST(47.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (761, N'Men', 3, N'Casual Shoes', N'Maroon', N'Casual', N'Vans Men Maroon & Grey Era Shoes', N'49492.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Maroon---Grey-Era-Shoes_f95fd18a6cf5c1deede9c2a3304cfd2c_images.jpg', CAST(73.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (762, N'Men', 3, N'Casual Shoes', N'Green', N'Casual', N'Vans Men Green & Grey Era Shoes', N'49493.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Green---Grey-Era-Shoes_8986f3f6b75ac9b2fd47fb20f22d770d_images.jpg', CAST(59.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (763, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Vans Men Navy Blue Shoes', N'49494.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Navy-Blue-Chukka-Boots_68bdb21782c59584f77fc80d9f2413b8_images.jpg', CAST(52.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (764, N'Men', 3, N'Casual Shoes', N'Khaki', N'Casual', N'Vans Men Khaki Shoes', N'49495.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Khaki-Shoes_dcaf7c703e9c0396650529df2b2a8893_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (765, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Woodland Men Black Shoes', N'50376.jpg', N'http://assets.myntassets.com/v1/images/style/properties/b461fc48013e9b45540fe64e99188c9d_images.jpg', CAST(38.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (766, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Woodland Men Brown Shoes', N'50377.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f99ee11f2167bce272f9456c67581641_images.jpg', CAST(69.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (767, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Chief Men Black Formal Shoes', N'50725.jpg', N'http://assets.myntassets.com/v1/images/style/properties/20866b1a2a15cbc1ce04296ddaeae23a_images.jpg', CAST(50.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (768, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Chief Men Black Formal Shoes', N'50740.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e37ef333be6a8e14be8410580873a611_images.jpg', CAST(21.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (769, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Red Chief Men Black Shoes', N'50741.jpg', N'http://assets.myntassets.com/v1/images/style/properties/2dba90668d61bd7dd5e25a02d7612ee3_images.jpg', CAST(21.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (770, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Red Chief Men Black Formal Shoes', N'50746.jpg', N'http://assets.myntassets.com/v1/images/style/properties/70545e7653ee98ed7a82d2b13fc2d93b_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (771, N'Men', 3, N'Casual Shoes', N'Mushroom Brown', N'Casual', N'Red Chief Men Mushroom Brown Shoes', N'50747.jpg', N'http://assets.myntassets.com/v1/images/style/properties/7a499301c721666d3243360e3e437091_images.jpg', CAST(29.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (772, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Red Chief Men Brown Shoes', N'50748.jpg', N'http://assets.myntassets.com/v1/images/style/properties/e41f0a7951b6a61de757754f91dde135_images.jpg', CAST(61.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (773, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Red Chief Men Brown Shoes', N'50749.jpg', N'http://assets.myntassets.com/v1/images/style/properties/f4cead3fba42e4fee08f3fa55e8e7d8f_images.jpg', CAST(63.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (774, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Clarks Men Brown Leather Sandals', N'50776.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Clarks-Men-Casual-Shoes_9a29e9164d1e0e4d314387e006fc406f_images.jpg', CAST(28.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (775, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Clarks Men Dino Limit Brown Formal Shoes', N'50777.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Clarks-Men-Formal-Shoes_d8593516fd4c7bfd45328e976caa96c6_images.jpg', CAST(20.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (776, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'Clarks Men Navy Leather Sneakers', N'50778.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Clarks-Men-Navy-ORSON-LACE-LEATHER-Casual-Shoes_ab896b7d68b6b57dbef40d426819d6b8_images.jpg', CAST(75.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (777, N'Men', 3, N'Casual Shoes', N'Grey', N'Casual', N'Puma Men Grey Vintage Ferrari Shoes', N'53734.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Puma-Men-Grey-Vintage-Ferrari-Casual-Shoes_3d91c7ee3487279c51edecb337de455b_images.jpg', CAST(77.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (778, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'Puma Men Brown Vintage Ferrari Shoes', N'53735.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Puma-Men-Brown-Vintage-Ferrari-Casual-Shoes_b9fd2ef51fa25279915165c5df88154b_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (779, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'F Sports Men White Velocity Sports Shoes', N'54516.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Velocity-Sports-Shoes_14345420e63e868eda0ec2e246cdb3b8_images.jpg', CAST(24.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (780, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'F Sports Men White Bratt Sports Shoes', N'54517.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Bratt-Sports-Shoes_23e61fa2aeee5c1b6f8636b3135c9371_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (781, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'F Sports Men White Velocity Sports Shoes', N'54518.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Velocity-Sports-Shoes_0cfae4d5115d7dd7372233b70eb1da1b_images.jpg', CAST(46.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (782, N'Men', 3, N'Casual Shoes', N'Navy Blue', N'Casual', N'F Sports Men Navy Blue Vito Shoes', N'54519.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-Navy-Blue-Vito-Sports-Shoes_47eee676e62fa156ca3f96052ee2b26c_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (783, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'F Sports Men White Vito Shoes', N'54520.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Vito-Sports-Shoes_f6f00e33998f44a0dacc6d4eb25f2dae_images.jpg', CAST(24.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (784, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'F Sports Men White Voyager Sports Shoes', N'54521.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Voyager-Sports-Shoes_c5ff061b1db80cb997ae9f796e838bb5_images.jpg', CAST(42.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (785, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'F Sports Men White Zero Gravity Sports Shoes', N'54526.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Zero-Gravity-Sports-Shoes_9626c504719dea085190a02f61246386_images.jpg', CAST(67.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (786, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'F Sports Men Black Charger Shoes', N'54527.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-Black-Charger-Sports-Shoes_470be134a38fc74c0f5519f82dfe9de1_images.jpg', CAST(26.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (787, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'F Sports Men White Charger Shoes', N'54528.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Charger-Sports-Shoes_eabaab9bccfc72fd0b0abddf314fcd26_images.jpg', CAST(40.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (788, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'F Sports Men Black Shoes', N'54529.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-Black-Shoes_f4920f8c2dd4277191a4468e5acf397d_images.jpg', CAST(36.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (789, N'Men', 3, N'Sports Shoes', N'White', N'Sports', N'F Sports Men White Hurricane Sports Shoes', N'54542.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Hurricane-Sports-Shoes_42056340c92493a9c33526f3b1602fc4_images.jpg', CAST(58.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (790, N'Men', 3, N'Sports Shoes', N'White', N'Casual', N'F Sports Men White Outlander Sports Shoes', N'54543.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-White-Outlander-Sports-Shoes_b600b7c68b5e9dd8b56dcd8732ce0fda_images.jpg', CAST(53.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (791, N'Men', 3, N'Sports Shoes', N'Black', N'Sports', N'F Sports Men Black Pace Sports Shoes', N'54544.jpg', N'http://assets.myntassets.com/v1/images/style/properties/F-Sports-Men-Black-Pace-Sports-Shoes_564a9fd92f55538cafab82567a7fbce3_images.jpg', CAST(22.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (792, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Vans Men Black Era Shoes', N'54740.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Black-Era-Shoes_e1fd73af72d76d932ba25c9738a8586d_images.jpg', CAST(44.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (793, N'Men', 3, N'Casual Shoes', N'Brown', N'Casual', N'GAS Men Brown Casual Shoes', N'56410.jpg', N'http://assets.myntassets.com/v1/images/style/properties/GAS-Men-Brown-Casual-Shoes_87737d6282779d5a8bf6553ba8ac024c_images.jpg', CAST(36.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (794, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'GAS Men Brown Savana Sandals', N'56411.jpg', N'http://assets.myntassets.com/v1/images/style/properties/GAS-Men-Brown-Savana-Sandals_9f858aea5701fd4ea8b5aa550e9c4cf7_images.jpg', CAST(68.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (795, N'Men', 2, N'Sandals', N'Black', N'Casual', N'ID Men Black Sandals', N'57475.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ID-Men-Black-Sandals_249453ea3392792c05e511f9f5644ade_images.jpg', CAST(47.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (796, N'Men', 3, N'Casual Shoes', N'White', N'Casual', N'ID Men White & Blue Casual Shoes', N'57481.jpg', N'http://assets.myntassets.com/v1/images/style/properties/ID-Men-White---Blue-Casual-Shoes_70c82cd514f95f07ed16d84a9ce750eb_images.jpg', CAST(79.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (797, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Lee Cooper Men Brown Sandals', N'57500.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lee-Cooper-Men-Brown-Sandals_c12090ddca1c01400484d7c8f9fe8a1f_images.jpg', CAST(34.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (798, N'Men', 2, N'Sandals', N'Beige', N'Casual', N'Lee Cooper Men Light cocoa Sandals', N'57501.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lee-Cooper-Men-Khaki-Sandals_ae939350de06c0bd99f50d9de1f48635_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (799, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Lee Cooper Men Brown Sandals', N'57506.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lee-Cooper-Men-Brown-Sandals_41be8fa41082876a31ecb2b34fb7a12a_images.jpg', CAST(43.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (800, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Lee Cooper Men Black  Sandals', N'57507.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lee-Cooper-Men-Black-Sandals_1b0f7922cd4ca61ee33d35927163a007_images.jpg', CAST(72.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (801, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Lee Cooper Men Brown Sandals', N'57508.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lee-Cooper-Men-Brown-Sandals_3e54af924a452a138ad5aa43aae892f0_images.jpg', CAST(55.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (802, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Provogue Men Black Casual Shoes', N'57509.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Provogue-Men-Black-Casual-Shoes_7cfdbdde37f93b7d1d330cb4222a8345_images.jpg', CAST(65.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (803, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Provogue Men Black Casual Shoes', N'57530.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Provogue-Men-Black-Casual-Shoes_b15379def0848cfdc89755f9c535f303_images.jpg', CAST(47.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (804, N'Men', 3, N'Casual Shoes', N'Mushroom Brown', N'Casual', N'Provogue Men Mushroom Brown Casual Shoes', N'57531.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Provogue-Men-Mushroom-Brown-Casual-Shoes_63c5624508f1ae3d4ce5256c1e82492a_images.jpg', CAST(72.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (805, N'Men', 2, N'Sandals', N'Brown', N'Casual', N'Clarks Men Brown Sandals', N'57934.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Clarks-Men-Brown-Sandals_de132ea3035bd5070b3d638f6068ec61_images.jpg', CAST(44.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (806, N'Men', 2, N'Sandals', N'Black', N'Casual', N'Clarks Men Black Leather Closed Sandals', N'57935.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Clarks-Men-Black-Sandals_32cdfdb1c318dd5bb7c332071bfbd3f7_images.jpg', CAST(34.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (807, N'Men', 3, N'Formal Shoes', N'Brown', N'Formal', N'Clarks Men Brown Formal Shoes', N'57950.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Clarks-Men-Brown-Formal-Shoes_cae81cf723ab38cd1a0921981bba2a05_images.jpg', CAST(33.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (808, N'Men', 1, N'Flip Flops', N'Blue', N'Casual', N'Lotto Men Blue Flip Flops', N'58328.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lotto-Men-Blue-Flip-Flops_fcb9db63056967ad17bc5937555db441_images.jpg', CAST(39.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (809, N'Men', 1, N'Flip Flops', N'Red', N'Casual', N'Lotto Men Red Flip Flops', N'58329.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Lotto-Men-Red-Flip-Flops_504feb7f72ee222980ee2e6e3526e80a_images.jpg', CAST(58.00 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (810, N'Men', 3, N'Formal Shoes', N'Black', N'Formal', N'Arrow Men Black Formal Shoes', N'59435.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Arrow-Men-Black-Formal-Shoes_70a3c7c185338a5636c8c0e668829bb6_images.jpg', CAST(75.50 AS Decimal(6, 2)))
GO
INSERT [dbo].[Products] ([Id], [Gender], [CategoryId], [Type], [Color], [Usage], [Title], [ImageFile], [ImageUrl], [Price]) VALUES (811, N'Men', 3, N'Casual Shoes', N'Black', N'Casual', N'Vans Men Black & Red Casual Shoes', N'59943.jpg', N'http://assets.myntassets.com/v1/images/style/properties/Vans-Men-Black---Red-Casual-Shoes_d58b0db818089598dada89b3cca155aa_images.jpg', CAST(26.00 AS Decimal(6, 2)))
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT ((0)) FOR [OrderId]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT ((0)) FOR [OrderId]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Products_ProductId]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders_OrderId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category_CategoryId]
GO
