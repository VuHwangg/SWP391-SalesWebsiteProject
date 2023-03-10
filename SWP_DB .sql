USE [master]
GO
/****** Object:  Database [SWP]    Script Date: 3/1/2023 11:58:47 PM ******/
CREATE DATABASE [SWP]

GO
ALTER DATABASE [SWP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP] SET  MULTI_USER 
GO
ALTER DATABASE [SWP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP] SET QUERY_STORE = OFF
GO
USE [SWP]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](150) NOT NULL,
	[password] [nvarchar](150) NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
	[status] [bit] NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](150) NOT NULL,
	[description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[num] [int] NOT NULL,
 CONSTRAINT [PK_Product-Cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](150) NOT NULL,
	[address] [nvarchar](150) NOT NULL,
	[phone] [nvarchar](11) NOT NULL,
	[email] [nvarchar](150) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[feature_id] [int] IDENTITY(1,1) NOT NULL,
	[feature_name] [nvarchar](150) NOT NULL,
	[url] [varchar](max) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[thumbnail] [bit] NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import_History]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_History](
	[import_id] [int] IDENTITY(1,1) NOT NULL,
	[num] [int] NOT NULL,
	[date] [date] NOT NULL,
	[note] [nvarchar](150) NULL,
	[username] [nvarchar](150) NOT NULL,
	[cost] [float] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Import_History] PRIMARY KEY CLUSTERED 
(
	[import_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[note] [nvarchar](150) NULL,
	
	[total_price] [float] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[oder_details_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[num] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_Product-Bought] PRIMARY KEY CLUSTERED 
(
	[oder_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[type] [int] NOT NULL,
	[os] [nvarchar](150) NOT NULL,
	[feature_product] [bit] NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[current_price] [float] NULL,
	[original_price] [float] NOT NULL,
	[ram] [varchar](50) NOT NULL,
	[memory] [varchar](50) NOT NULL,
	[cpu] [nvarchar](max) NOT NULL,
	[graphics_card] [nvarchar](max) NOT NULL,
	[size] [float] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[discount] [float] NOT NULL,
	[qty] [int] NOT NULL,
	[sold] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Brand]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Brand](
	[brand_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_Brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Requirement]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Requirement](
	[requirement_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_Requirement] PRIMARY KEY CLUSTERED 
(
	[requirement_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requirement]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requirement](
	[requirement_id] [int] IDENTITY(1,1) NOT NULL,
	[requirement_name] [nvarchar](150) NOT NULL,
	[description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Requirement] PRIMARY KEY CLUSTERED 
(
	[requirement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[role_id] [int] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Role-Account] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[role_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
 CONSTRAINT [PK_Role-Feature] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vote]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[vote_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[num] [int] NOT NULL,
	[num_of_vote] [int] NOT NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[vote_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vote_Of_User]    Script Date: 3/1/2023 11:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote_Of_User](
	[vote_of_user_id] [int] NOT NULL,
	[num_of_star] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[confirm] [bit] NOT NULL,
 CONSTRAINT [PK_Vote_Of_User] PRIMARY KEY CLUSTERED 
(
	[vote_of_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer1] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer1]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Product-Cart_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Product-Cart_Product]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Import_History]  WITH CHECK ADD  CONSTRAINT [FK_Import_History_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Import_History] CHECK CONSTRAINT [FK_Import_History_Account]
GO
ALTER TABLE [dbo].[Import_History]  WITH CHECK ADD  CONSTRAINT [FK_Import_History_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Import_History] CHECK CONSTRAINT [FK_Import_History_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Bill_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([status])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Product-Bought_Bill] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Product-Bought_Bill]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Product-Bought_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Product-Bought_Product]
GO
ALTER TABLE [dbo].[Product_Brand]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product_Brand] CHECK CONSTRAINT [FK_Product_Brand_Brand]
GO
ALTER TABLE [dbo].[Product_Brand]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_Brand] CHECK CONSTRAINT [FK_Product_Brand_Product]
GO
ALTER TABLE [dbo].[Product_Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Product_Requirement_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_Requirement] CHECK CONSTRAINT [FK_Product_Requirement_Product]
GO
ALTER TABLE [dbo].[Product_Requirement]  WITH CHECK ADD  CONSTRAINT [FK_Product_Requirement_Requirement] FOREIGN KEY([requirement_id])
REFERENCES [dbo].[Requirement] ([requirement_id])
GO
ALTER TABLE [dbo].[Product_Requirement] CHECK CONSTRAINT [FK_Product_Requirement_Requirement]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role-Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role-Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role-Account_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role-Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role-Feature_Feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[Feature] ([feature_id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role-Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role-Feature_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role-Feature_Role]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_Vote_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_Vote_Product]
GO
ALTER TABLE [dbo].[Vote_Of_User]  WITH CHECK ADD  CONSTRAINT [FK_Vote_Of_User_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[Vote_Of_User] CHECK CONSTRAINT [FK_Vote_Of_User_Order]
GO
ALTER TABLE [dbo].[Vote_Of_User]  WITH CHECK ADD  CONSTRAINT [FK_Vote_Of_User_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Vote_Of_User] CHECK CONSTRAINT [FK_Vote_Of_User_Product]
GO
USE [master]
GO
ALTER DATABASE [SWP] SET  READ_WRITE 
GO
