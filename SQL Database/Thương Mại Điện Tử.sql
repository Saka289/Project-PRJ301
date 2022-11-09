USE WebProject2022
go
CREATE TABLE [Role] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255)
)
GO

CREATE TABLE [User] (
  [id] int identity(1,1) PRIMARY KEY,
  [username] nvarchar(255),
  [password] nvarchar(255),
  [nickname] nvarchar(255),
  [email] nvarchar(255),
  [phone_number] nvarchar(255),
  [address] nvarchar(255),
  [role_id] int,
  [image] nvarchar(1000)
)
GO

CREATE TABLE [Category] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
  [image] nvarchar(255)
)
GO

CREATE TABLE [Product] (
  [id] int identity(1,1) PRIMARY KEY,
  [category_id] int,
  [title] nvarchar(255),
  [price] decimal,
  [quantity] int,
  [discount] int,
  [description] nvarchar(4000),
  [status] int,
  [brand_id] int,
  [image] nvarchar(255)
)
GO

CREATE TABLE [Brands] (
  [id] int PRIMARY KEY,
  [name] nvarchar(255),
)
GO

CREATE TABLE [Feedback] (
  [id] int identity(1,1) PRIMARY KEY,
  [rating] int,
  [note] nvarchar(3000),
  [date] datetime,
  [user_id] int,
  [product_id] int
)
GO

CREATE TABLE [Orders] (
  [id] int identity(1,1) PRIMARY KEY,
  [user_id] int,
  [order_date] datetime,
  [total_money] decimal,
  [note] nvarchar(2000),
  [email] nvarchar(255),
  [fullname] nvarchar(255),
  [address] nvarchar(255),
  [country] nvarchar(255),
  [phone_number] nvarchar(255)
)
GO

CREATE TABLE [Order_Details] (
  [id] int identity(1,1) PRIMARY KEY,
  [order_id] int,
  [product_id] int,
  [price] decimal,
  [quantity] int
)
GO

ALTER TABLE [User] ADD FOREIGN KEY ([role_id]) REFERENCES [Role] ([id])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([category_id]) REFERENCES [Category] ([id])
GO

ALTER TABLE [Order_Details] ADD FOREIGN KEY ([order_id]) REFERENCES [Orders] ([id])
GO

ALTER TABLE [Orders] ADD FOREIGN KEY ([user_id]) REFERENCES [User] ([id])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([brand_id]) REFERENCES [Brands] ([id])
GO

ALTER TABLE [Feedback] ADD FOREIGN KEY ([user_id]) REFERENCES [User] ([id])
GO

ALTER TABLE [Order_Details] ADD FOREIGN KEY ([product_id]) REFERENCES [Product] ([id])
GO

ALTER TABLE [Feedback] ADD FOREIGN KEY ([product_id]) REFERENCES [Product] ([id])
GO
