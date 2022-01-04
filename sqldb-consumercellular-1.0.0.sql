/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases 12.4.2                     */
/* Target DBMS:           Azure SQL Database                              */
/* Project file:          sqldb-consumercellular.dez                      */
/* Project name:          sqldb-consumercellular                          */
/* Author:                Cam Gregson                                     */
/* Script type:           Database creation script                        */
/* Created on:            2022-01-04 13:09                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "ProductType"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ProductType] (
    [ProductTypeID] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_ProductType] PRIMARY KEY ([ProductTypeID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "ProductOwnership"                                           */
/* ---------------------------------------------------------------------- */



CREATE TABLE [ProductOwnership] (
    [ProductOwnershipID] INTEGER IDENTITY(1,1) NOT NULL,
    [ProductName] VARCHAR(100) NOT NULL,
    [OwnerName] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_ProductOwnership] PRIMARY KEY ([ProductOwnershipID])
)
GO




/* ---------------------------------------------------------------------- */
/* Add table "Color"                                                      */
/* ---------------------------------------------------------------------- */



CREATE TABLE [Color] (
    [ColorID] INTEGER IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_Color] PRIMARY KEY ([ColorID])
)
GO




/* ---------------------------------------------------------------------- */
/* Add table "Product"                                                    */
/* ---------------------------------------------------------------------- */



CREATE TABLE [Product] (
    [ProductID] INTEGER IDENTITY(1,1) NOT NULL,
    [PricePerMonth] DECIMAL(19,2) NOT NULL,
    [PriceTotal] DECIMAL(19,2) NOT NULL,
    [PriceAcquisition] DECIMAL(19,2) NOT NULL,
    [ProductOwnerID] INTEGER NOT NULL,
    [ProductTypeID] INTEGER NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY ([ProductID])
)
GO




/* ---------------------------------------------------------------------- */
/* Add table "ProductColor"                                               */
/* ---------------------------------------------------------------------- */



CREATE TABLE [ProductColor] (
    [ProductColorID] INTEGER IDENTITY(1,1) NOT NULL,
    [ProductOwnershipID] INTEGER NOT NULL,
    [ColorID] INTEGER NOT NULL,
    CONSTRAINT [PK_ProductColor] PRIMARY KEY ([ProductColorID])
)
GO




/* ---------------------------------------------------------------------- */
/* Add table "CellPhone"                                                  */
/* ---------------------------------------------------------------------- */



CREATE TABLE [CellPhone] (
    [CellPhoneID] INTEGER IDENTITY(1,1) NOT NULL,
    [StorageSize] INTEGER NOT NULL,
    [ProductID] INTEGER NOT NULL,
    CONSTRAINT [PK_CellPhone] PRIMARY KEY ([CellPhoneID])
)
GO




/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE [Product] ADD CONSTRAINT [ProductType_Product] 
    FOREIGN KEY ([ProductTypeID]) REFERENCES [ProductType] ([ProductTypeID])
GO


ALTER TABLE [Product] ADD CONSTRAINT [ProductOwnership_Product] 
    FOREIGN KEY ([ProductOwnerID]) REFERENCES [ProductOwnership] ([ProductOwnershipID])
GO


ALTER TABLE [ProductColor] ADD CONSTRAINT [ProductOwnership_ProductColor] 
    FOREIGN KEY ([ProductOwnershipID]) REFERENCES [ProductOwnership] ([ProductOwnershipID])
GO


ALTER TABLE [ProductColor] ADD CONSTRAINT [Color_ProductColor] 
    FOREIGN KEY ([ColorID]) REFERENCES [Color] ([ColorID])
GO


ALTER TABLE [CellPhone] ADD CONSTRAINT [Product_CellPhone] 
    FOREIGN KEY ([ProductID]) REFERENCES [Product] ([ProductID])
GO

/* ---------------------------------------------------------------------- */
/* Insert statements                                                      */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Insert "Color"                                                */
/* ---------------------------------------------------------------------- */

INSERT INTO [Color]
(
    Name
)
VALUES
    ('red')
    ,('white')
    ,('black')
    ,('pink')
GO

/* ---------------------------------------------------------------------- */
/* Insert "ProductType"                                                */
/* ---------------------------------------------------------------------- */

INSERT INTO [ProductType]
(
    Name
)
VALUES
    ('CellPhone')
    ,('Tablet')
    ,('HomePhoneBase')
GO

/* ---------------------------------------------------------------------- */
/* Insert "ProductOwnership"                                           */
/* ---------------------------------------------------------------------- */

INSERT INTO [ProductOwnership]
(
    ProductName
    ,OwnerName
)
VALUES
    ('iPhone 13', 'Apple')
    ,('iPhone 12', 'Apple')
    ,('Galaxy Z Fold3 5G', 'Samsung')
    ,('Galaxy S21+ 5G', 'Samsung')
    ,('One 5G Ace', 'Motorola')
    ,('Avid 579', 'ZTE')
    ,('CC Home Phone Base', 'Consumer Cellular')
    ,('GrandPad', 'GrandPad')
GO

/* ---------------------------------------------------------------------- */
/* Insert "Product"                                           */
/* ---------------------------------------------------------------------- */

INSERT INTO [Product]
(
    PricePerMonth
    ,PriceTotal
    ,PriceAcquisition
    ,ProductOwnerID
    ,ProductTypeID
)
VALUES
(
    34.00
    ,829.00
    ,13.00
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='iPhone 13' AND [ProductOwnership].[OwnerName] = 'Apple')
    ,(SELECT [ProductType].[ProductTypeID] FROM [ProductType] WHERE [ProductType].[Name]='CellPhone')
)
,(
    29.00
    ,729.00
    ,33.00
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='iPhone 12' AND [ProductOwnership].[OwnerName] = 'Apple')
    ,(SELECT [ProductType].[ProductTypeID] FROM [ProductType] WHERE [ProductType].[Name]='CellPhone')
)
,(
    74.00
    ,1799.00
    ,23.00
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='Galaxy Z Fold3 5G' AND [ProductOwnership].[OwnerName] = 'Samsung')
    ,(SELECT [ProductType].[ProductTypeID] FROM [ProductType] WHERE [ProductType].[Name]='CellPhone')
)
,(
    41.00
    ,999.00
    ,15.00
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='Galaxy S21+ 5G' AND [ProductOwnership].[OwnerName] = 'Samsung')
    ,(SELECT [ProductType].[ProductTypeID] FROM [ProductType] WHERE [ProductType].[Name]='CellPhone')
)
,(
    14.00
    ,349.00
    ,13.00
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='One 5G Ace' AND [ProductOwnership].[OwnerName] = 'Motorola')
    ,(SELECT [ProductType].[ProductTypeID] FROM [ProductType] WHERE [ProductType].[Name]='CellPhone')
)
,(
    2.00
    ,79.00
    ,31.00
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='Avid 579' AND [ProductOwnership].[OwnerName] = 'ZTE')
    ,(SELECT [ProductType].[ProductTypeID] FROM [ProductType] WHERE [ProductType].[Name]='CellPhone')
)
,(
    2.00
    ,79.00
    ,31.00
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='CC Home Phone Base' AND [ProductOwnership].[OwnerName] = 'Consumer Cellular')
    ,(SELECT [ProductType].[ProductTypeID] FROM [ProductType] WHERE [ProductType].[Name]='HomePhoneBase')
)
,(
    122.00
    ,299.00
    ,11.00
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='GrandPad' AND [ProductOwnership].[OwnerName] = 'GrandPad')
    ,(SELECT [ProductType].[ProductTypeID] FROM [ProductType] WHERE [ProductType].[Name]='Tablet')
)
GO

/* ---------------------------------------------------------------------- */
/* Insert "ProductColor"                                               */
/* ---------------------------------------------------------------------- */

INSERT INTO [ProductColor]
(
    ColorID
    ,ProductOwnershipID
)
VALUES
(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'white')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName] = 'iPhone 13' AND [ProductOwnership].[OwnerName]= 'Apple')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'red')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName] = 'iPhone 13' AND [ProductOwnership].[OwnerName]= 'Apple')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'black')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName] = 'iPhone 13' AND [ProductOwnership].[OwnerName]= 'Apple')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'black')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName] = 'iPhone 12' AND [ProductOwnership].[OwnerName]= 'Apple')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'white')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName] = 'iPhone 12' AND [ProductOwnership].[OwnerName]= 'Apple')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'pink')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName] = 'iPhone 12' AND [ProductOwnership].[OwnerName]= 'Apple')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'white')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName] = 'Galaxy Z Fold3 5G' AND [ProductOwnership].[OwnerName]= 'Samsung')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'white')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='Galaxy S21+ 5G' AND [ProductOwnership].[OwnerName] = 'Samsung')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'white')
        ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='One 5G Ace' AND [ProductOwnership].[OwnerName] = 'Motorola')

)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'black')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='Avid 579' AND [ProductOwnership].[OwnerName] = 'ZTE')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'black')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName]='CC Home Phone Base' AND [ProductOwnership].[OwnerName] = 'Consumer Cellular')
)
,(
    (SELECT [Color].[ColorID] FROM [Color] WHERE [Color].[Name] = 'black')
    ,(SELECT [ProductOwnership].[ProductOwnershipID] FROM [ProductOwnership] WHERE [ProductOwnership].[ProductName] = 'GrandPad' AND [ProductOwnership].[OwnerName]= 'GrandPad')
)
GO