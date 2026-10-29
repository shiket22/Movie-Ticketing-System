-- Online Movie Ticketing System: database structure (SQL Server 2019 or later, LocalDB included)
-- Exported from the original database in 2026. The only change: [User].[Password] is nvarchar(128)
-- instead of nvarchar(50), because passwords are now stored as PBKDF2 hashes.
-- [User].[UserId] and [BookingSeat].[BookingSeatId] are nvarchar(1000) keys, as in the original, so
-- SQL Server warns that a key may exceed 900 bytes. The real values are short, so the warning is harmless.

CREATE TABLE [dbo].[Category] (
    [CategoryId] nvarchar(10) NOT NULL,
    [CategoryName] nvarchar(20) NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY ([CategoryId])
);
GO

CREATE TABLE [dbo].[Language] (
    [LanguageId] nvarchar(50) NOT NULL,
    [Lan] nvarchar(50) NULL,
    CONSTRAINT [PK_Language] PRIMARY KEY ([LanguageId])
);
GO

CREATE TABLE [dbo].[Movie] (
    [Id] nvarchar(50) NOT NULL,
    [Movie] nvarchar(50) NOT NULL,
    [MovieName] nvarchar(50) NULL,
    [ReleaseDate] date NULL,
    [Description] nvarchar(1000) NULL,
    [DurationTime] varchar(50) NULL,
    [Genre] nvarchar(50) NULL,
    [Language] nvarchar(50) NULL,
    [Hall] nvarchar(50) NULL,
    [Price] float NULL,
    [ShowTime] datetime NULL,
    CONSTRAINT [PK_Movie] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [dbo].[MovieHall] (
    [MovieHallId] nvarchar(10) NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Location] nvarchar(255) NOT NULL,
    CONSTRAINT [PK_MovieHall] PRIMARY KEY ([MovieHallId])
);
GO

CREATE TABLE [dbo].[User] (
    [UserId] nvarchar(1000) NOT NULL,
    [UserName] nvarchar(50) NOT NULL,
    [Password] nvarchar(128) NOT NULL,
    [Email] nvarchar(50) NOT NULL,
    [PhoneNum] nvarchar(12) NOT NULL,
    [Role] nvarchar(50) NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY ([UserId])
);
GO

CREATE TABLE [dbo].[Food] (
    [FoodId] nvarchar(10) NOT NULL,
    [CategoryId] nvarchar(10) NOT NULL,
    [FoodName] nvarchar(50) NULL,
    [Price] float NULL,
    [Description] nvarchar(100) NULL,
    [FoodImage] nvarchar(100) NULL,
    CONSTRAINT [PK_Food] PRIMARY KEY ([FoodId])
);
GO

CREATE TABLE [dbo].[ShowTime] (
    [ShowTimeId] nvarchar(10) NOT NULL,
    [Id] nvarchar(50) NOT NULL,
    [MovieHallId] nvarchar(10) NOT NULL,
    [StartTime] datetime NULL,
    [EndTime] datetime NULL,
    [AvailableSeats] int NULL,
    CONSTRAINT [PK_ShowTime] PRIMARY KEY ([ShowTimeId])
);
GO

CREATE TABLE [dbo].[Seats] (
    [SeatId] nvarchar(10) NOT NULL,
    [MovieHallId] nvarchar(10) NOT NULL,
    [SeatNumber] nvarchar(10) NULL,
    [IsAvailable] bit NULL,
    [ShowTimeId] nvarchar(10) NULL,
    CONSTRAINT [PK_Seats] PRIMARY KEY ([SeatId])
);
GO

CREATE TABLE [dbo].[Booking] (
    [BookingId] nvarchar(10) NOT NULL,
    [UserId] nvarchar(1000) NOT NULL,
    [ShowTimeId] nvarchar(10) NULL,
    [BookingDate] nvarchar(50) NULL,
    [Amount] float NULL,
    [PaymentCard] nvarchar(30) NULL,
    CONSTRAINT [PK_Booking] PRIMARY KEY ([BookingId])
);
GO

CREATE TABLE [dbo].[BookingItem] (
    [BookingItemId] nvarchar(10) NOT NULL,
    [BookingId] nvarchar(10) NOT NULL,
    [FoodId] nvarchar(10) NULL,
    [Quantity] int NULL,
    CONSTRAINT [PK_BookingItem] PRIMARY KEY ([BookingItemId])
);
GO

CREATE TABLE [dbo].[BookingSeat] (
    [BookingSeatId] nvarchar(1000) NOT NULL,
    [BookingId] nvarchar(10) NOT NULL,
    [SeatId] nvarchar(10) NULL,
    CONSTRAINT [PK_BookingSeat] PRIMARY KEY ([BookingSeatId])
);
GO

CREATE TABLE [dbo].[Payment] (
    [PaymentId] int NOT NULL,
    [Amount] float NULL,
    [PaymetTime] datetime NULL,
    [PaymentMethod] nvarchar(50) NULL,
    CONSTRAINT [PK_Payment] PRIMARY KEY ([PaymentId])
);
GO

ALTER TABLE [dbo].[Booking] ADD CONSTRAINT [FK_Booking_ShowTimeId] FOREIGN KEY ([ShowTimeId]) REFERENCES [dbo].[ShowTime] ([ShowTimeId]);
ALTER TABLE [dbo].[Booking] ADD CONSTRAINT [FK_Booking_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId]);
ALTER TABLE [dbo].[BookingItem] ADD CONSTRAINT [FK_BookingItem_BookingId] FOREIGN KEY ([BookingId]) REFERENCES [dbo].[Booking] ([BookingId]);
ALTER TABLE [dbo].[BookingItem] ADD CONSTRAINT [FK_BookingItem_FoodId] FOREIGN KEY ([FoodId]) REFERENCES [dbo].[Food] ([FoodId]);
ALTER TABLE [dbo].[BookingSeat] ADD CONSTRAINT [FK_BookingSeat_BookingId] FOREIGN KEY ([BookingId]) REFERENCES [dbo].[Booking] ([BookingId]);
ALTER TABLE [dbo].[BookingSeat] ADD CONSTRAINT [FK_BookingSeat_SeatId] FOREIGN KEY ([SeatId]) REFERENCES [dbo].[Seats] ([SeatId]);
ALTER TABLE [dbo].[Food] ADD CONSTRAINT [FK_Food_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([CategoryId]);
ALTER TABLE [dbo].[Seats] ADD CONSTRAINT [FK_Seats_MovieHallId] FOREIGN KEY ([MovieHallId]) REFERENCES [dbo].[MovieHall] ([MovieHallId]);
ALTER TABLE [dbo].[Seats] ADD CONSTRAINT [FK_Seats_ShowTimeId] FOREIGN KEY ([ShowTimeId]) REFERENCES [dbo].[ShowTime] ([ShowTimeId]);
ALTER TABLE [dbo].[ShowTime] ADD CONSTRAINT [FK_ShowTime_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[Movie] ([Id]);
ALTER TABLE [dbo].[ShowTime] ADD CONSTRAINT [FK_ShowTime_MovieHallId] FOREIGN KEY ([MovieHallId]) REFERENCES [dbo].[MovieHall] ([MovieHallId]);
GO
