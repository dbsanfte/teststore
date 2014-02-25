
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/20/2014 13:57:24
-- Generated from EDMX file: C:\Users\david.sanftenberg\Documents\Visual Studio 2013\Projects\Store\Store\Models\StoreModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [StoreDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_OrderLineItemOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderLineItems] DROP CONSTRAINT [FK_OrderLineItemOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderLineItemProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderLineItems] DROP CONSTRAINT [FK_OrderLineItemProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderShippingInformation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ShippingInformations] DROP CONSTRAINT [FK_OrderShippingInformation];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[OrderLineItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderLineItems];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[ShippingInformations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShippingInformations];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'OrderLineItems'
CREATE TABLE [dbo].[OrderLineItems] (
    [Id] uniqueidentifier  NOT NULL,
    [Quantity] int  NOT NULL,
    [OrderId] uniqueidentifier  NOT NULL,
    [ProductId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] uniqueidentifier  NOT NULL,
    [CustomerId] uniqueidentifier  NOT NULL,
    [Date] datetime  NOT NULL,
    [PaypalInvoiceId] uniqueidentifier  NULL,
    [ShippingTotal] decimal(16,2)  NULL,
    [HSTTotal] decimal(16,2)  NULL,
    [OrderTotal] decimal(16,2)  NULL,
    [OrderSubtotal] decimal(16,2)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] varchar(100)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Stock] int  NOT NULL,
    [PhotoUrl] varchar(max)  NOT NULL,
    [Price] decimal(16,2)  NOT NULL
);
GO

-- Creating table 'ShippingInformations'
CREATE TABLE [dbo].[ShippingInformations] (
    [Id] uniqueidentifier  NOT NULL,
    [ShippingMethod] int  NULL,
    [ShippingAddressFirstLine] nvarchar(max)  NOT NULL,
    [ShippingAddressSecondLine] nvarchar(max)  NOT NULL,
    [ShippingAddressThirdLine] nvarchar(max)  NOT NULL,
    [ShippingCity] nvarchar(max)  NOT NULL,
    [ShippingProvince] nvarchar(max)  NOT NULL,
    [ShippingCountry] nvarchar(max)  NOT NULL,
    [ShippingPostcode] nvarchar(max)  NOT NULL,
    [ShippingName] nvarchar(max)  NOT NULL,
    [CustomerId] uniqueidentifier  NOT NULL,
    [Orders_Id] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'OrderLineItems'
ALTER TABLE [dbo].[OrderLineItems]
ADD CONSTRAINT [PK_OrderLineItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ShippingInformations'
ALTER TABLE [dbo].[ShippingInformations]
ADD CONSTRAINT [PK_ShippingInformations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OrderId] in table 'OrderLineItems'
ALTER TABLE [dbo].[OrderLineItems]
ADD CONSTRAINT [FK_OrderLineItemOrder]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderLineItemOrder'
CREATE INDEX [IX_FK_OrderLineItemOrder]
ON [dbo].[OrderLineItems]
    ([OrderId]);
GO

-- Creating foreign key on [ProductId] in table 'OrderLineItems'
ALTER TABLE [dbo].[OrderLineItems]
ADD CONSTRAINT [FK_OrderLineItemProduct]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderLineItemProduct'
CREATE INDEX [IX_FK_OrderLineItemProduct]
ON [dbo].[OrderLineItems]
    ([ProductId]);
GO

-- Creating foreign key on [Orders_Id] in table 'ShippingInformations'
ALTER TABLE [dbo].[ShippingInformations]
ADD CONSTRAINT [FK_OrderShippingInformation]
    FOREIGN KEY ([Orders_Id])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderShippingInformation'
CREATE INDEX [IX_FK_OrderShippingInformation]
ON [dbo].[ShippingInformations]
    ([Orders_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------