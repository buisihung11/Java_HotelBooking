
create database HotelBookingDB
go
USE [HotelBookingDB]
GO
/****** Object:  Table [dbo].[tbl_Area]    Script Date: 12/8/2019 11:47:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Area](
	[aID] [int] IDENTITY(1,1) NOT NULL,
	[aName] [nvarchar](50) NOT NULL,
	[aDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Area] PRIMARY KEY CLUSTERED 
(
	[aID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Booking]    Script Date: 12/8/2019 11:47:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Booking](
	[bID] [int] IDENTITY(1,1) NOT NULL,
	[bCheckin] [date] NOT NULL,
	[bCheckout] [date] NOT NULL,
	[bStatusID] [int] NOT NULL,
	[bBookingDate] [date] NOT NULL,
	[bUserID] [varchar](50) NOT NULL,
	[bConfirmToken] [varchar](250) NULL,
	[bTotal] [float] NOT NULL,
	[bDiscountCode] [varchar](50) NULL,
	[bCustomerPhone] [varchar](11) NULL,
	[bCustomerFullName] [varchar](20) NULL,
	[bCustomerEmail] [varchar](50) NULL,
	[bHotelId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Booking] PRIMARY KEY CLUSTERED 
(
	[bID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BookingDetail]    Script Date: 12/8/2019 11:47:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BookingDetail](
	[bdID] [int] IDENTITY(1,1) NOT NULL,
	[bdBookingID] [int] NOT NULL,
	[bdRoomID] [int] NOT NULL,
	[bdAmount] [float] NOT NULL,
	[bdBookedQuantity] [int] NOT NULL,
	[bdFeedback] [nvarchar](200) NULL,
 CONSTRAINT [PK_tbl_BookingDetail] PRIMARY KEY CLUSTERED 
(
	[bdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BookingStatus]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BookingStatus](
	[bsID] [int] IDENTITY(1,1) NOT NULL,
	[bsName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_BookingStatus] PRIMARY KEY CLUSTERED 
(
	[bsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Discount]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Discount](
	[dCode] [varchar](50) NOT NULL,
	[dValue] [float] NOT NULL,
	[dExpireDate] [date] NOT NULL,
 CONSTRAINT [PK_tbl_Discount] PRIMARY KEY CLUSTERED 
(
	[dCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Hotel]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Hotel](
	[hID] [int] IDENTITY(1,1) NOT NULL,
	[hName] [nvarchar](50) NOT NULL,
	[hAreaID] [int] NOT NULL,
	[hDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Hotel] PRIMARY KEY CLUSTERED 
(
	[hID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Room]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Room](
	[rID] [int] IDENTITY(1,1) NOT NULL,
	[rQuantity] [int] NOT NULL,
	[rHotelID] [int] NOT NULL,
	[rtID] [int] NOT NULL,
	[rDescription] [nvarchar](250) NULL,
	[rPrice] [float] NOT NULL,
 CONSTRAINT [PK_tbl_Room] PRIMARY KEY CLUSTERED 
(
	[rID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RoomType]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RoomType](
	[rtID] [int] IDENTITY(1,1) NOT NULL,
	[rtName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_RoomType] PRIMARY KEY CLUSTERED 
(
	[rtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserID] [varchar](50) NOT NULL,
	[uPassword] [varchar](30) NOT NULL,
	[uFullName] [nvarchar](50) NOT NULL,
	[uAddress] [varchar](200) NULL,
	[uPhone] [varchar](50) NULL,
	[uIsAdmin] [bit] NOT NULL,
	[uCreatedDate] [date] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Area] ON 

INSERT [dbo].[tbl_Area] ([aID], [aName], [aDescription]) VALUES (1, N'Quan 1', NULL)
INSERT [dbo].[tbl_Area] ([aID], [aName], [aDescription]) VALUES (2, N'Quan 2', NULL)
INSERT [dbo].[tbl_Area] ([aID], [aName], [aDescription]) VALUES (3, N'Quan 3 ', NULL)
INSERT [dbo].[tbl_Area] ([aID], [aName], [aDescription]) VALUES (4, N'Quan 4', NULL)
INSERT [dbo].[tbl_Area] ([aID], [aName], [aDescription]) VALUES (5, N'Quan Tan Binh', NULL)
INSERT [dbo].[tbl_Area] ([aID], [aName], [aDescription]) VALUES (6, N'Quan Phu Nhuan', NULL)
INSERT [dbo].[tbl_Area] ([aID], [aName], [aDescription]) VALUES (7, N'Quan 9', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Area] OFF
SET IDENTITY_INSERT [dbo].[tbl_Booking] ON 

INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (1, CAST(N'2019-11-27' AS Date), CAST(N'2019-11-29' AS Date), 3, CAST(N'2019-11-26' AS Date), N'cust1', NULL, 200.5, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (7, CAST(N'2019-11-27' AS Date), CAST(N'2019-11-29' AS Date), 3, CAST(N'2019-11-29' AS Date), N'cust1', NULL, 300, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (8, CAST(N'2019-12-06' AS Date), CAST(N'2019-12-10' AS Date), 3, CAST(N'2019-12-05' AS Date), N'tester@gmail.com', NULL, 300, NULL, N'0987717161', N'Hung Bui', N'cust1@gmail.com', 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (9, CAST(N'2019-12-06' AS Date), CAST(N'2019-12-10' AS Date), 2, CAST(N'2019-12-05' AS Date), N'cust1', NULL, 135, N'DC1', N'0987717161', N'Hung Bui', N'cust1@gmail.com', 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (10, CAST(N'2019-12-06' AS Date), CAST(N'2019-12-10' AS Date), 1, CAST(N'2019-12-06' AS Date), N'cust1', NULL, 2150, NULL, N'0987717161', N'Hung Bui', N'cust1@gmail.com', 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (11, CAST(N'2019-12-06' AS Date), CAST(N'2019-12-10' AS Date), 2, CAST(N'2019-12-06' AS Date), N'cust1', NULL, 1950, NULL, N'0987717161', N'Hung Bui', N'cust1@gmail.com', 3)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (12, CAST(N'2019-12-11' AS Date), CAST(N'2019-12-13' AS Date), 3, CAST(N'2019-12-07' AS Date), N'cust1', NULL, 180, NULL, N'0987717161', N'Hung Bui', N'buisihung321@gmail.com', 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (13, CAST(N'2019-12-11' AS Date), CAST(N'2019-12-13' AS Date), 3, CAST(N'2019-12-07' AS Date), N'cust1', N'28e6a6859b254426be17f3895ab899e4', 300, NULL, N'0987717161', N'Hung Bui', N'buisihung321@gmail.com', 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (14, CAST(N'2019-12-11' AS Date), CAST(N'2019-12-13' AS Date), 3, CAST(N'2019-12-07' AS Date), N'tester@gmail.com', N'ecbb78df258e4a4b940af19bf0083e08', 1026, N'DC1', N'0852815856', N'Khoi Bui', N'buisihung321@gmail.com', 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (15, CAST(N'2019-12-12' AS Date), CAST(N'2019-12-13' AS Date), 1, CAST(N'2019-12-07' AS Date), N'cust1', NULL, 144, N'DC1', N'0987717161', N'Hung Bui', N'buisihung321@gmail.com', 2)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (16, CAST(N'2019-12-12' AS Date), CAST(N'2019-12-14' AS Date), 2, CAST(N'2019-12-07' AS Date), N'cust1', NULL, 540, N'DC1', N'0987717161', N'Hung Bui', N'buisihung321@gmail.com', 3)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (17, CAST(N'2019-12-07' AS Date), CAST(N'2019-12-09' AS Date), 1, CAST(N'2019-12-07' AS Date), N'buisihung321@gmail.com', NULL, 629.63995361328125, N'DC1', N'0987717161', N'Hung Bui', N'buisihung321@gmail.com', 4)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (18, CAST(N'2019-12-07' AS Date), CAST(N'2019-12-09' AS Date), 1, CAST(N'2019-12-07' AS Date), N'buisihung321@gmail.com', N'1814caedc0464cc28a9c4940b63b8ef1', 622.79998779296875, NULL, N'0987717161', N'Hung Bui', N'buisihung321@gmail.com', 4)
INSERT [dbo].[tbl_Booking] ([bID], [bCheckin], [bCheckout], [bStatusID], [bBookingDate], [bUserID], [bConfirmToken], [bTotal], [bDiscountCode], [bCustomerPhone], [bCustomerFullName], [bCustomerEmail], [bHotelId]) VALUES (19, CAST(N'2019-12-09' AS Date), CAST(N'2019-12-10' AS Date), 3, CAST(N'2019-12-08' AS Date), N'cust1', N'72d8a784a56945c495722f6afc011194', 1094.7999267578125, NULL, N'0987717161', N'Hung Bui', N'buisihung321@gmail.com', 4)
SET IDENTITY_INSERT [dbo].[tbl_Booking] OFF
SET IDENTITY_INSERT [dbo].[tbl_BookingDetail] ON 

INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (1, 1, 1, 40.2, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (2, 1, 2, 30.8, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (7, 7, 1, 20.2, 5, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (8, 8, 1, 60, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (9, 9, 1, 30, 1, N'New feedback')
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (10, 10, 2, 50, 1, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (11, 10, 12, 380, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (12, 11, 4, 150, 2, N'Test feed back')
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (13, 11, 5, 240, 2, N'Test feed back')
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (14, 12, 1, 60, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (15, 13, 2, 100, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (16, 14, 12, 380, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (17, 15, 1, 30, 1, N'Phong sach dep')
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (18, 15, 2, 50, 1, N'Phong khong duoc don')
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (19, 16, 3, 80, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (20, 16, 5, 120, 1, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (21, 17, 8, 76.800003051757812, 3, N'Thoai mai')
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (22, 17, 9, 156.39999389648438, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (23, 18, 8, 51.200000762939453, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (24, 18, 9, 156.39999389648438, 2, NULL)
INSERT [dbo].[tbl_BookingDetail] ([bdID], [bdBookingID], [bdRoomID], [bdAmount], [bdBookedQuantity], [bdFeedback]) VALUES (25, 19, 9, 547.39996337890625, 7, NULL)
SET IDENTITY_INSERT [dbo].[tbl_BookingDetail] OFF
SET IDENTITY_INSERT [dbo].[tbl_BookingStatus] ON 

INSERT [dbo].[tbl_BookingStatus] ([bsID], [bsName]) VALUES (1, N'INACTIVE')
INSERT [dbo].[tbl_BookingStatus] ([bsID], [bsName]) VALUES (2, N'ACTIVE')
INSERT [dbo].[tbl_BookingStatus] ([bsID], [bsName]) VALUES (3, N'NOT CONFIRMED')
SET IDENTITY_INSERT [dbo].[tbl_BookingStatus] OFF
INSERT [dbo].[tbl_Discount] ([dCode], [dValue], [dExpireDate]) VALUES (N'DC1', 0.1, CAST(N'2019-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_Hotel] ON 

INSERT [dbo].[tbl_Hotel] ([hID], [hName], [hAreaID], [hDescription]) VALUES (2, N'Hotel Des Arts Saigon Mgallery', 3, N'Với nhà hàng và hồ bơi ngoài trời, Hotel Des Arts Saigon Mgallery Collection cung cấp chỗ ở thân thiện với vật nuôi ở thành phố Hồ Chí Minh nhộn nhịp')
INSERT [dbo].[tbl_Hotel] ([hID], [hName], [hAreaID], [hDescription]) VALUES (3, N'The Myst Dong Khoi', 1, N'Với thiết kế và nội thất hiện đại cổ điển, The Myst Dong Khoi cung cấp chỗ nghỉ tinh tế ở khu trung tâm Quận 1 tại thành phố Hồ Chí Minh. ')
INSERT [dbo].[tbl_Hotel] ([hID], [hName], [hAreaID], [hDescription]) VALUES (4, N'Hotel Nikko Saigon ', 1, N'Khách sạn 5 sao này có spa đủ dịch vụ, hồ bơi ngoài trời và tiện nghi tập thể dục. Chăm chút khách tận tình chu đáo')
INSERT [dbo].[tbl_Hotel] ([hID], [hName], [hAreaID], [hDescription]) VALUES (5, N'Mia Saigon – Luxury Boutique Hotel ', 2, N'Tọa lạc tại Thành phố Hồ Chí Minh, Mia Saigon – Luxury Boutique Hotel có nhà hàng, hồ bơi ngoài trời, trung tâm thể dục và quán bar.')
INSERT [dbo].[tbl_Hotel] ([hID], [hName], [hAreaID], [hDescription]) VALUES (6, N'Hotel Equatorial Ho Chi Minh City ', 5, N'Chiếm vị trí thuận tiện ở trung tâm thành phố Hồ Chí Minh, Hotel Equatorial có các phòng nghỉ rộng rãi và đầy đủ tiện nghi, hồ bơi ngoài trời đồng thời cung cấp miễn phí Wi-Fi lẫn dịch vụ đưa đón')
INSERT [dbo].[tbl_Hotel] ([hID], [hName], [hAreaID], [hDescription]) VALUES (7, N'Tan Son Nhat Saigon Hotel ', 6, N'Khai trương vào tháng 12 năm 2012, khách sạn Tan Son Nhat Saigon Hotel 5 sao cung cấp chỗ nghỉ sang trọng với Wi-Fi miễn phí. Khách cũng có thể sử dụng hồ bơi ngoài trời trên tầng 4.')
SET IDENTITY_INSERT [dbo].[tbl_Hotel] OFF
SET IDENTITY_INSERT [dbo].[tbl_Room] ON 

INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (1, 5, 2, 1, N'Room for single', 30)
INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (2, 5, 2, 2, N'Room with full features', 50)
INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (3, 4, 3, 1, N'Room for single', 40)
INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (4, 5, 3, 2, N'Room for couple', 75)
INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (5, 8, 3, 3, N'Room for family', 120)
INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (8, 10, 4, 1, N'Room for single people', 25.6)
INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (9, 7, 4, 3, N'Room for family', 78.2)
INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (11, 15, 4, 2, N'Room for double ', 60.5)
INSERT [dbo].[tbl_Room] ([rID], [rQuantity], [rHotelID], [rtID], [rDescription], [rPrice]) VALUES (12, 5, 2, 3, N'Room for family ', 190)
SET IDENTITY_INSERT [dbo].[tbl_Room] OFF
SET IDENTITY_INSERT [dbo].[tbl_RoomType] ON 

INSERT [dbo].[tbl_RoomType] ([rtID], [rtName]) VALUES (1, N'Single')
INSERT [dbo].[tbl_RoomType] ([rtID], [rtName]) VALUES (2, N'Double')
INSERT [dbo].[tbl_RoomType] ([rtID], [rtName]) VALUES (3, N'Family')
SET IDENTITY_INSERT [dbo].[tbl_RoomType] OFF
INSERT [dbo].[tbl_User] ([UserID], [uPassword], [uFullName], [uAddress], [uPhone], [uIsAdmin], [uCreatedDate], [isActive]) VALUES (N'admin', N'admin', N'admin', N'Quan 1', N'0817171717', 1, CAST(N'2019-11-22' AS Date), 1)
INSERT [dbo].[tbl_User] ([UserID], [uPassword], [uFullName], [uAddress], [uPhone], [uIsAdmin], [uCreatedDate], [isActive]) VALUES (N'buisihung@gmail.com', N'123456', N'Hung Bui', N'Quan 1', N'0987717161', 0, CAST(N'2019-12-07' AS Date), 1)
INSERT [dbo].[tbl_User] ([UserID], [uPassword], [uFullName], [uAddress], [uPhone], [uIsAdmin], [uCreatedDate], [isActive]) VALUES (N'buisihung321@gmail.com', N'123456', N'Hung Bui', N'Quan 9', N'0987717161', 0, CAST(N'2019-12-07' AS Date), 1)
INSERT [dbo].[tbl_User] ([UserID], [uPassword], [uFullName], [uAddress], [uPhone], [uIsAdmin], [uCreatedDate], [isActive]) VALUES (N'cust1', N'cust1', N'Hung Bui', N'Quan 9 ', N'0987717161', 0, CAST(N'2019-11-11' AS Date), 1)
INSERT [dbo].[tbl_User] ([UserID], [uPassword], [uFullName], [uAddress], [uPhone], [uIsAdmin], [uCreatedDate], [isActive]) VALUES (N'cust2', N'cust2', N'Jonhy  Nguyen', N'Quan 7 ', N'0716161611', 0, CAST(N'2019-11-23' AS Date), 1)
INSERT [dbo].[tbl_User] ([UserID], [uPassword], [uFullName], [uAddress], [uPhone], [uIsAdmin], [uCreatedDate], [isActive]) VALUES (N'teste2r@gmail.com', N'hung', N'Stephen Haul', N'Quan 3', N'0852815856', 0, CAST(N'2019-12-04' AS Date), 1)
INSERT [dbo].[tbl_User] ([UserID], [uPassword], [uFullName], [uAddress], [uPhone], [uIsAdmin], [uCreatedDate], [isActive]) VALUES (N'tester@gmail.com', N'hung', N'Khoi Bui', N'Quan 12
', N'0852815856', 0, CAST(N'2019-12-04' AS Date), 1)
INSERT [dbo].[tbl_User] ([UserID], [uPassword], [uFullName], [uAddress], [uPhone], [uIsAdmin], [uCreatedDate], [isActive]) VALUES (N'tester23@gmail.com', N'hung', N'Hung Bui', N'Quan 1', N'0987717161', 0, CAST(N'2019-12-07' AS Date), 1)
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Booking_tbl_BookingStatus] FOREIGN KEY([bStatusID])
REFERENCES [dbo].[tbl_BookingStatus] ([bsID])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [FK_tbl_Booking_tbl_BookingStatus]
GO
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Booking_tbl_Discount] FOREIGN KEY([bDiscountCode])
REFERENCES [dbo].[tbl_Discount] ([dCode])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [FK_tbl_Booking_tbl_Discount]
GO
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Booking_tbl_User] FOREIGN KEY([bUserID])
REFERENCES [dbo].[tbl_User] ([UserID])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [FK_tbl_Booking_tbl_User]
GO
ALTER TABLE [dbo].[tbl_BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BookingDetail_tbl_Booking] FOREIGN KEY([bdBookingID])
REFERENCES [dbo].[tbl_Booking] ([bID])
GO
ALTER TABLE [dbo].[tbl_BookingDetail] CHECK CONSTRAINT [FK_tbl_BookingDetail_tbl_Booking]
GO
ALTER TABLE [dbo].[tbl_BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BookingDetail_tbl_Room] FOREIGN KEY([bdRoomID])
REFERENCES [dbo].[tbl_Room] ([rID])
GO
ALTER TABLE [dbo].[tbl_BookingDetail] CHECK CONSTRAINT [FK_tbl_BookingDetail_tbl_Room]
GO
ALTER TABLE [dbo].[tbl_Hotel]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hotel_tbl_Area] FOREIGN KEY([hAreaID])
REFERENCES [dbo].[tbl_Area] ([aID])
GO
ALTER TABLE [dbo].[tbl_Hotel] CHECK CONSTRAINT [FK_tbl_Hotel_tbl_Area]
GO
ALTER TABLE [dbo].[tbl_Room]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Room_tbl_Hotel] FOREIGN KEY([rHotelID])
REFERENCES [dbo].[tbl_Hotel] ([hID])
GO
ALTER TABLE [dbo].[tbl_Room] CHECK CONSTRAINT [FK_tbl_Room_tbl_Hotel]
GO
ALTER TABLE [dbo].[tbl_Room]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Room_tbl_RoomType] FOREIGN KEY([rtID])
REFERENCES [dbo].[tbl_RoomType] ([rtID])
GO
ALTER TABLE [dbo].[tbl_Room] CHECK CONSTRAINT [FK_tbl_Room_tbl_RoomType]
GO
/****** Object:  StoredProcedure [dbo].[CheckRoomAvailable]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CheckRoomAvailable] @checkin date, @checkout date,@roomId int, @quantity int
AS
begin 
	--First part: roomID not in bookedRoomID
	Select r.rID,  r.rQuantity as ROOM_QUANTITY_AVAILABLE 
	from tbl_Room as r inner join tbl_Hotel as h on r.rHotelID = h.hID
	where r.rID not in (
		Select  bdRoomID 
		from tbl_Booking inner join tbl_BookingDetail on bID = bdBookingID
		where (bCheckin >= @checkin and bCheckout <= @checkout
							or bCheckin between @checkin and @checkout 
							or bCheckout between @checkin and @checkout ) and bStatusID != 1
	) and r.rID = @roomId and r.rQuantity >= @quantity and r.rQuantity > 0
	union 
	--Second part : roomID in bookedRoomID and quantity > bookedQuantity
	Select r.rID, r.rQuantity - bookedRoomTbl.BOOKED_ROOM_QUANTITY as ROOM_QUANTITY_AVAILABLE 
	from tbl_Room as r inner join tbl_Hotel as h on r.rHotelID = h.hID , 
		( Select  bdRoomID , SUM(bdBookedQuantity) as BOOKED_ROOM_QUANTITY
		from tbl_Booking inner join tbl_BookingDetail on bID = bdBookingID
		where (bCheckin >= @checkin and bCheckout <= @checkout
							or bCheckin between @checkin and @checkout 
							or bCheckout between @checkin and @checkout)  and bStatusID != 1
							group by bdRoomID
							 ) as bookedRoomTbl
	where r.rID  = bookedRoomTbl.bdRoomID and r.rQuantity - bookedRoomTbl.BOOKED_ROOM_QUANTITY >= @quantity 
	 and r.rQuantity - bookedRoomTbl.BOOKED_ROOM_QUANTITY  > 0 and r.rID = @roomId 
	--Join First part and second part => Tim duoc nhung phong con available 
end;
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableHotelInDate]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetAvailableHotelInDate] @checkin date, @checkout date, @amount int,@hotelName varchar(20),@areaID varchar(20)
AS
begin 
	--First part: roomID not in bookedRoomID
	Select Distinct h.hID , h.hName , h.hDescription ,h.hAreaID  
	from tbl_Room as r inner join tbl_Hotel as h on r.rHotelID = h.hID
	where r.rID not in (
		Select  bdRoomID 
		from tbl_Booking inner join tbl_BookingDetail on bID = bdBookingID
		where (bCheckin >= @checkin and bCheckout <= @checkout
							or bCheckin between @checkin and @checkout 
							or bCheckout between @checkin and @checkout) and bStatusID != 1
	) and r.rQuantity >= @amount and h.hName like '%' + @hotelName + '%' and h.hAreaID like @areaID
	union 
	--Second part : roomID in bookedRoomID and quantity > bookedQuantity
	Select h.hID , h.hName, h.hDescription ,h. hAreaID  
	from tbl_Room as r inner join tbl_Hotel as h on r.rHotelID = h.hID , 
		( Select  bdRoomID , SUM (bdBookedQuantity) as BOOKED_ROOM_QUANTITY
		from tbl_Booking inner join tbl_BookingDetail on bID = bdBookingID
		where (bCheckin >= @checkin and bCheckout <= @checkout
							or bCheckin between @checkin and @checkout 
							or bCheckout between @checkin and @checkout ) and bStatusID != 1
							GROUP BY bdRoomID ) as bookedRoomTbl
	where r.rID  = bookedRoomTbl.bdRoomID and r.rQuantity - bookedRoomTbl.BOOKED_ROOM_QUANTITY >= @amount and  r.rQuantity - bookedRoomTbl.BOOKED_ROOM_QUANTITY  > 0 and h.hName like '%' + @hotelName + '%' and h.hAreaID like @areaID
	--Join First part and second part => Tim duoc nhung phong con available 
end;
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableRoomOfHotel]    Script Date: 12/8/2019 11:47:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ROOM AVAILABLE OF SPECIFIC HOTEL IN DATE (For hotelDetail page )
CREATE PROCEDURE [dbo].[GetAvailableRoomOfHotel] @checkin date, @checkout date, @amount int,@hotelID int
AS
begin 
	--First part: roomID not in bookedRoomID and belong to that hotelID
	Select Distinct r.rID, r.rtID,r.rPrice , r.rQuantity as ROOM_QUANTITY_AVAILABLE 
	from tbl_Room as r inner join tbl_Hotel as h on r.rHotelID = h.hID and r.rHotelID = @hotelID
	where r.rID not in (
		Select  bdRoomID 
		from tbl_Booking inner join tbl_BookingDetail on bID = bdBookingID
		where ( bCheckin >= @checkin and bCheckout <= @checkout
							or bCheckin between @checkin and @checkout 
							or bCheckout between @checkin and @checkout ) and bStatusID != 1
	) and r.rQuantity >= @amount and r.rQuantity > 0
	union
	--Second part : roomID in bookedRoomID and quantity > bookedQuantity
	Select Distinct r.rID, r.rtID , r.rPrice , r.rQuantity - bookedRoomTbl.BOOKED_ROOM_QUANTITY as ROOM_QUANTITY_AVAILABLE 
	from tbl_Room as r inner join tbl_Hotel as h on r.rHotelID = h.hID and r.rHotelID = @hotelID , 
		( Select  bdRoomID , SUM(bdBookedQuantity) as BOOKED_ROOM_QUANTITY
		from tbl_Booking inner join tbl_BookingDetail on bID = bdBookingID
		where (bCheckin >= @checkin and bCheckout <= @checkout
							or bCheckin between @checkin and @checkout 
							or bCheckout between @checkin and @checkout ) and bStatusID != 1
							GROUP BY  bdRoomID) as bookedRoomTbl
	where r.rID  = bookedRoomTbl.bdRoomID and r.rQuantity - bookedRoomTbl.BOOKED_ROOM_QUANTITY >= @amount and r.rQuantity - bookedRoomTbl.BOOKED_ROOM_QUANTITY > 0 
	--Join First part and second part => Tim duoc nhung phong con available 
end;
GO
