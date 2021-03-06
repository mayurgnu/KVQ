USE [master]
GO
/****** Object:  Database [MP]    Script Date: 11/29/2018 10:33:05 AM ******/
CREATE DATABASE [MP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MP', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MP.mdf' , SIZE = 137216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MP_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MP_log.ldf' , SIZE = 63424KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MP] SET ARITHABORT OFF 
GO
ALTER DATABASE [MP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MP] SET  MULTI_USER 
GO
ALTER DATABASE [MP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MP]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[contactno] [nvarchar](25) NULL,
	[gender] [int] NULL,
	[username] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NULL,
	[stateid] [int] NULL,
	[cityid] [int] NULL,
	[countryid] [int] NULL,
	[profilepicture] [nvarchar](500) NULL,
	[birthdate] [date] NULL,
	[isloginallowed] [bit] NULL,
	[isemailverified] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Library]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library](
	[Library_id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nvarchar](50) NULL,
 CONSTRAINT [PK_Library] PRIMARY KEY CLUSTERED 
(
	[Library_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MST_Cart]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Qty] [int] NULL,
	[Price] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_MST_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_Order_Detail]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Order_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Product_Id] [int] NULL,
	[Qty] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_TBL_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_Order_MST]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Order_MST](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_No] [nvarchar](50) NULL,
	[TotalAmount] [float] NULL,
	[GstAmount] [float] NULL,
	[Discount] [float] NULL,
	[PayableAmount] [nchar](10) NULL,
 CONSTRAINT [PK_TBL_Order_MST] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCities]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[createddate] [datetime] NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 11/29/2018 10:33:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[contactno] [nvarchar](25) NULL,
	[gender] [int] NULL,
	[username] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NULL,
	[stateid] [int] NULL,
	[cityid] [int] NULL,
	[countryid] [int] NULL,
	[profilepicture] [nvarchar](500) NULL,
	[birthdate] [date] NULL,
	[isloginallowed] [bit] NULL,
	[isemailverified] [bit] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Library] ON 

INSERT [dbo].[Library] ([Library_id], [Department]) VALUES (1, N'Computer')
INSERT [dbo].[Library] ([Library_id], [Department]) VALUES (2, N'Mechanical')
INSERT [dbo].[Library] ([Library_id], [Department]) VALUES (3, N'EC')
INSERT [dbo].[Library] ([Library_id], [Department]) VALUES (4, N'Electrical')
INSERT [dbo].[Library] ([Library_id], [Department]) VALUES (5, N'Civil')
SET IDENTITY_INSERT [dbo].[Library] OFF
SET IDENTITY_INSERT [dbo].[MST_Cart] ON 

INSERT [dbo].[MST_Cart] ([id], [User_Id], [Product_Id], [Qty], [Price], [Total]) VALUES (1, 2, 2, 2, 50000, 100000)
INSERT [dbo].[MST_Cart] ([id], [User_Id], [Product_Id], [Qty], [Price], [Total]) VALUES (2, 1, 1, 2, 145000, 290000)
INSERT [dbo].[MST_Cart] ([id], [User_Id], [Product_Id], [Qty], [Price], [Total]) VALUES (3, 1, 1, 2, 50000, 100000)
INSERT [dbo].[MST_Cart] ([id], [User_Id], [Product_Id], [Qty], [Price], [Total]) VALUES (4, 3, 3, 2, 55000, 110000)
SET IDENTITY_INSERT [dbo].[MST_Cart] OFF
SET IDENTITY_INSERT [dbo].[TBL_Order_Detail] ON 

INSERT [dbo].[TBL_Order_Detail] ([ID], [Order_ID], [Product_Id], [Qty], [Price]) VALUES (1, 1, 1, 2, 25000)
INSERT [dbo].[TBL_Order_Detail] ([ID], [Order_ID], [Product_Id], [Qty], [Price]) VALUES (2, 2, 1, 2, 25000)
SET IDENTITY_INSERT [dbo].[TBL_Order_Detail] OFF
SET IDENTITY_INSERT [dbo].[TBL_Order_MST] ON 

INSERT [dbo].[TBL_Order_MST] ([Order_ID], [Order_No], [TotalAmount], [GstAmount], [Discount], [PayableAmount]) VALUES (1, N'ORD_001', 50000, 10, 5, N'52250     ')
INSERT [dbo].[TBL_Order_MST] ([Order_ID], [Order_No], [TotalAmount], [GstAmount], [Discount], [PayableAmount]) VALUES (2, N'ORD_001', 50000, 10, 5, N'52250     ')
SET IDENTITY_INSERT [dbo].[TBL_Order_MST] OFF
SET IDENTITY_INSERT [dbo].[tblCities] ON 

INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (1, N'New Delhi')
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (2, N'Mumbai')
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (3, N'Hyderabad')
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (4, N'Chennai')
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (5, N'Bengaluru')
SET IDENTITY_INSERT [dbo].[tblCities] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([productid], [name], [quantity], [price]) VALUES (1, N'note8', 1, 47000)
INSERT [dbo].[tblProduct] ([productid], [name], [quantity], [price]) VALUES (2, N'note9', 1, 68000)
INSERT [dbo].[tblProduct] ([productid], [name], [quantity], [price]) VALUES (3, N'iphone-x', 1, 95000)
INSERT [dbo].[tblProduct] ([productid], [name], [quantity], [price]) VALUES (4, N'iphone-xs', 1, 120000)
INSERT [dbo].[tblProduct] ([productid], [name], [quantity], [price]) VALUES (5, N's9-plus', 10, 600000)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([id], [firstname], [lastname], [email], [password], [contactno], [gender], [username], [address], [stateid], [cityid], [countryid], [profilepicture], [birthdate], [isloginallowed], [isemailverified]) VALUES (1, N'mayur', N'patel', N'm@gmail.com', N'123', N'9876543210', 1, N'mayurp', N'saiyedpura', 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUser] ([id], [firstname], [lastname], [email], [password], [contactno], [gender], [username], [address], [stateid], [cityid], [countryid], [profilepicture], [birthdate], [isloginallowed], [isemailverified]) VALUES (2, N'gnu', N'pandya', N'g@gmail.com', N'123', N'9632587410', 2, N'gnup', N'gopipura', 2, 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUser] ([id], [firstname], [lastname], [email], [password], [contactno], [gender], [username], [address], [stateid], [cityid], [countryid], [profilepicture], [birthdate], [isloginallowed], [isemailverified]) VALUES (3, N'saanjh', N'patel', N's@gmail.com', N'456', N'9513578962', 1, N'sanjup', N'jahangirpura', 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUser] ([id], [firstname], [lastname], [email], [password], [contactno], [gender], [username], [address], [stateid], [cityid], [countryid], [profilepicture], [birthdate], [isloginallowed], [isemailverified]) VALUES (12, N'a', N'a', N'mayur.jeannie@gmail.com', N'a', N'a', 1, N'Mayur', N'sa', 1, 1, 1, NULL, NULL, 1, 1)
INSERT [dbo].[tblUser] ([id], [firstname], [lastname], [email], [password], [contactno], [gender], [username], [address], [stateid], [cityid], [countryid], [profilepicture], [birthdate], [isloginallowed], [isemailverified]) VALUES (13, NULL, NULL, N'rahul@gmail.com', N'R@!234', NULL, NULL, N'Rahul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[TBL_Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Order_Detail_TBL_Order_MST] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[TBL_Order_MST] ([Order_ID])
GO
ALTER TABLE [dbo].[TBL_Order_Detail] CHECK CONSTRAINT [FK_TBL_Order_Detail_TBL_Order_MST]
GO
ALTER TABLE [dbo].[TBL_Order_MST]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Order_MST_TBL_Order_MST] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[TBL_Order_MST] ([Order_ID])
GO
ALTER TABLE [dbo].[TBL_Order_MST] CHECK CONSTRAINT [FK_TBL_Order_MST_TBL_Order_MST]
GO
/****** Object:  StoredProcedure [dbo].[MST_Cart_Insert_Update]    Script Date: 11/29/2018 10:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MST_Cart_Insert_Update]
  @XMLSTR xml = '-<DocumentElement>
-<AddToCartViewModel>

<id>1</id>

<User_Id>2</User_Id>

<Product_Id>2</Product_Id>

<Qty>2</Qty>

<Price>50000</Price>

<Total>100000</Total>

</AddToCartViewModel>


-<AddToCartViewModel>

<id>2</id>

<User_Id>1</User_Id>

<Product_Id>1</Product_Id>

<Qty>2</Qty>

<Price>145000</Price>

<Total>290000</Total>

</AddToCartViewModel>


-<AddToCartViewModel>

<id>3</id>

<User_Id>1</User_Id>

<Product_Id>1</Product_Id>

<Qty>2</Qty>

<Price>50000</Price>

<Total>100000</Total>

</AddToCartViewModel>


-<AddToCartViewModel>

<id>4</id>

<User_Id>3</User_Id>

<Product_Id>3</Product_Id>

<Qty>2</Qty>

<Price>55000</Price>

<Total>110000</Total>

</AddToCartViewModel>

</DocumentElement>',
@OUTPARAM int = 0 out
AS
BEGIN
 SET @OUTPARAM = 0;
 SELECT 
 x.value('id[1]','int') as id,
 x.value('User_Id[1]','int') as User_Id,
 x.value('Product_Id[1]','int') as Product_Id,
 x.value('Qty[1]','int') as Qty,
 x.value('Price[1]','int') as Price,
 x.value('Total[1]','int') as Total
 INTO #MST_Cart
 from @XMLSTR.nodes('/DocumentElement/AddToCartViewModel') as xtbl(x)

        --SELECT * FROM #MST_Cart
        --SELECT * FROM MST_Cart


        MERGE MST_Cart   As TARGET
        USING #MST_Cart  AS SOURCE ON TARGET.id = SOURCE.id
        WHEN MATCHED THEN
      UPDATE SET 
      TARGET.User_Id =  SOURCE.User_Id,
      TARGET.Product_Id =  SOURCE.Product_Id,
      TARGET.Qty =  SOURCE.Qty,
      TARGET.Price =  SOURCE.Price,
      TARGET.Total =  SOURCE.Total

      WHEN NOT MATCHED THEN
      INSERT (User_Id,Product_Id,Qty,Price,Total) VALUES( User_Id,Product_Id,Qty,Price,Total );

            if @@ERROR = 0
            BEGIN
            SET @OUTPARAM = 1;
            END
            ELSE
            BEGIN
            SET @OUTPARAM = 0;
            END
END
GO
/****** Object:  StoredProcedure [dbo].[MST_User_Save_User]    Script Date: 11/29/2018 10:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MST_User_Save_User]
@xmlStr xml = '<DocumentElement>
<UserViewModel>
<Id>101</Id>
<FirstName>aaaa</FirstName>
<LastName>cccc</LastName>
<Photo>7710270585272340118.jpg</Photo>
</UserViewModel></DocumentElement>'
as
begin
SELECT 
 x.value('Id[1]','int') as ID,
 x.value('FirstName[1]','varchar(20)') as FirstName,
 x.value('Photo[1]','varchar(20)') as MiddleName,
 x.value('LastName[1]','varchar(20)') as LastName
        INTO #MST_Employee
        from @xmlStr.nodes('/DocumentElement/UserViewModel') as xtbl(x)
        SELECT * FROM #MST_Employee

end
GO
USE [master]
GO
ALTER DATABASE [MP] SET  READ_WRITE 
GO
