create database HotelBookingDB
go
USE [HotelBookingDB]
GO
/****** Object:  Table [dbo].[tbl_Area]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  Table [dbo].[tbl_Booking]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  Table [dbo].[tbl_BookingDetail]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  Table [dbo].[tbl_BookingStatus]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  Table [dbo].[tbl_Discount]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  Table [dbo].[tbl_Hotel]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  Table [dbo].[tbl_Room]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  Table [dbo].[tbl_RoomType]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  Table [dbo].[tbl_User]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CheckRoomAvailable]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAvailableHotelInDate]    Script Date: 12/8/2019 11:48:25 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAvailableRoomOfHotel]    Script Date: 12/8/2019 11:48:25 AM ******/
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
