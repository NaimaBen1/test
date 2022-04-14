USE [StoreSH]
GO
/****** Object:  Table [dbo].[tTaxGroups]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTaxGroups](
	[cdeTaxGroup] [varchar](8) NOT NULL,
	[dscTaxGroup] [varchar](50) NULL,
	[optDefault] [bit] NOT NULL,
	[optActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTaxRates]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTaxRates](
	[cdeTax] [varchar](8) NOT NULL,
	[dscShortTax] [varchar](5) NOT NULL,
	[dscLongTax] [varchar](25) NULL,
	[numRate] [float] NOT NULL,
	[numMinimum] [float] NOT NULL,
	[optDefault] [bit] NOT NULL,
	[optActive] [bit] NOT NULL,
	[cdeRounding] [varchar](1) NULL,
	[SyncStatus] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tax_view]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tax_view]
AS
SELECT tTaxGroups.cdeTaxGroup AS cdeTax, dscTaxGroup AS dscTax
FROM   tTaxGroups
UNION ALL
SELECT tTaxRates.cdeTax, dscLongTax
FROM   tTaxRates;
GO
/****** Object:  Table [dbo].[tProducts]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProducts](
	[cdeProduct] [varchar](16) NOT NULL,
	[dscDescription] [varchar](25) NULL,
	[dscNOTE] [varchar](255) NULL,
	[cdeUOM] [varchar](3) NULL,
	[dscSerialNum] [varchar](50) NULL,
	[cdeTax] [varchar](8) NULL,
	[numInventory] [float] NULL,
	[curStnd_price] [float] NULL,
	[curSUG_RETAIL] [float] NULL,
	[numStnd_Qty] [float] NULL,
	[cdeVendor1] [varchar](16) NULL,
	[cdeV1SKU] [varchar](16) NULL,
	[cdeVendor2] [varchar](16) NULL,
	[cdeV2SKU] [varchar](16) NULL,
	[cdeVendor3] [varchar](16) NULL,
	[cdeV3SKU] [varchar](16) NULL,
	[cdeVendor4] [varchar](16) NULL,
	[cdeV4SKU] [varchar](16) NULL,
	[numDUE_IN] [float] NULL,
	[numRO_QTY] [float] NULL,
	[numORDERQTY] [float] NULL,
	[numORD_MULT1] [float] NULL,
	[curMULT_1COST] [float] NULL,
	[numORD_MULT2] [float] NULL,
	[curMULT_2COST] [float] NULL,
	[numORD_MULT3] [float] NULL,
	[curMULT_3COST] [float] NULL,
	[cdeMSKU] [varchar](16) NULL,
	[dscOPEN_1] [varchar](16) NULL,
	[dscOPEN_2] [varchar](16) NULL,
	[dscOPEN_3] [varchar](16) NULL,
	[dscOPEN_4] [varchar](16) NULL,
	[optSale] [bit] NOT NULL,
	[curSale_Price] [money] NULL,
	[cdeSale] [varchar](4) NULL,
	[dteLastSold] [datetime] NULL,
	[cdeTransaction] [varchar](50) NULL,
	[cdeDept] [varchar](4) NULL,
	[cdeSubDept] [smallint] NULL,
	[curAVG_Cost] [float] NULL,
	[curREPL_Cost] [float] NULL,
	[curSTND_Cost] [float] NULL,
	[curLAST_RECD_Cost] [float] NULL,
	[numDAY_QTY] [float] NULL,
	[curDAY_SALE] [float] NULL,
	[numMON_QTY] [float] NULL,
	[curMONTH_SALE] [float] NULL,
	[numYEAR_QTY] [float] NULL,
	[curYEAR_SALE] [float] NULL,
	[numTOTAL_QTY] [float] NULL,
	[curTOTAL_SALE] [float] NULL,
	[optRental] [bit] NOT NULL,
	[dteRentTimeOut] [datetime] NULL,
	[dteRentTimeIn] [datetime] NULL,
	[numTotRentTime] [int] NULL,
	[optInvAlert] [bit] NOT NULL,
	[optSalesLessCost] [bit] NOT NULL,
	[optDiscountAllowed] [bit] NOT NULL,
	[optAddNotesToReceipt] [bit] NOT NULL,
	[numMargin] [float] NULL,
	[optKit] [bit] NOT NULL,
	[cdeAltUOMDefault] [varchar](3) NULL,
	[cdePrice] [varchar](8) NULL,
	[optSetPriceByMargin] [bit] NOT NULL,
	[optDiscontinued] [bit] NOT NULL,
	[dteAction] [datetime] NULL,
	[optRoundTo9] [bit] NOT NULL,
	[cdePAR] [varchar](16) NULL,
	[dteAdded] [datetime] NULL,
	[cdeLastUSERID] [varchar](20) NULL,
	[optNoMoreDiscounts] [bit] NOT NULL,
	[cdeManu] [varchar](16) NULL,
	[cdeClass] [varchar](8) NULL,
	[cdeSubClass] [varchar](8) NULL,
	[cdeLoc] [varchar](8) NULL,
	[dscUpdateInfo] [varchar](50) NULL,
	[dteLastRec] [datetime] NULL,
	[numLastRecQty] [float] NULL,
	[cdeClaimType] [varchar](8) NULL,
	[cdePackStatus] [varchar](4) NULL,
	[cdeCvrsID] [varchar](16) NULL,
	[cdeQtyRank] [varchar](4) NULL,
	[cdePreviousQtyRank] [varchar](4) NULL,
	[cdeDolRank] [varchar](4) NULL,
	[cdePreviousDolRank] [varchar](4) NULL,
	[dteRankCalc] [datetime] NULL,
	[optRankLock] [bit] NOT NULL,
	[numRank] [float] NULL,
	[numMinWeeks] [float] NULL,
	[numMaxWeeks] [float] NULL,
	[optWeeksLock] [bit] NOT NULL,
	[optIncludePromo] [bit] NOT NULL,
	[optORD_MULT2_LOCK] [bit] NOT NULL,
	[optORD_MULT3_LOCK] [bit] NOT NULL,
	[numOrdMin] [float] NULL,
	[numOrdMax] [float] NULL,
	[dteMinMaxCalc] [datetime] NULL,
	[optEORetailLock] [bit] NOT NULL,
	[numDesMargin] [float] NULL,
	[cdeTruBlueInd] [varchar](1) NULL,
	[cdeNonStockSkuInd] [varchar](1) NULL,
	[cdeAssortmentInd] [varchar](1) NULL,
	[numLastCount] [float] NULL,
	[dteLastCount] [datetime] NULL,
	[SyncStatus] [varchar](1) NULL,
	[numORD_MULT4] [float] NULL,
	[curMULT_4COST] [float] NULL,
	[optTiered] [bit] NOT NULL,
	[optORD_MULT4_LOCK] [bit] NOT NULL,
	[cdeCoreItem] [varchar](1) NULL,
	[cdeRetailAssortment] [varchar](1) NULL,
	[cdeGreenItem] [varchar](1) NULL,
	[cdeImageID] [varchar](14) NULL,
	[cdeToBeDiscontinued] [varchar](1) NULL,
	[dteTBD] [datetime] NULL,
	[dteDiscontinued] [datetime] NULL,
	[cdeSubsItemTypeCD] [varchar](1) NULL,
	[cdeCouponSource] [varchar](3) NULL,
	[cdeCouponType] [varchar](1) NULL,
	[numUnitWt] [float] NULL,
	[cdeDIBStatus] [varchar](1) NULL,
	[cdeSubstitute] [varchar](16) NULL,
	[optAdder] [bit] NOT NULL,
	[curFreightCost] [float] NULL,
	[numQtyCommitted] [float] NULL,
	[optAGItem] [bit] NULL,
	[optCentrallyPriced] [bit] NULL,
	[optPriceByMargin] [bit] NOT NULL,
	[optFollowDIBRetail] [bit] NOT NULL,
	[cdeDiscontinueReason] [varchar](1) NULL,
	[curMinSelling_PRICE] [float] NULL,
	[cdeUnitOfMeasureItem] [varchar](1) NULL,
	[cdeECommerceFlag] [varchar](1) NULL,
	[curRPELevel1Retail] [float] NULL,
	[curRPELevel2Retail] [float] NULL,
	[curEcommercePrice] [float] NULL,
	[cdeCentralShipInd] [varchar](1) NULL,
	[cdeVariablePricingMethodCD] [varchar](1) NULL,
	[cdeBrandName] [varchar](20) NULL,
	[numUnitQty] [float] NULL,
	[cdeUnitText] [varchar](10) NULL,
	[cdeVisibilityFlag] [varchar](1) NULL,
	[optPOSAlertNote] [bit] NULL,
	[cdeMadeInUSA] [varchar](1) NULL,
	[cdeSubCategory] [varchar](8) NULL,
	[numRoundToX] [tinyint] NULL,
	[optAceInstantSavings] [bit] NULL,
	[cdeProductType] [varchar](20) NULL,
	[dteDIBRetailInventory] [datetime] NULL,
	[numDIBCaseMultCode] [tinyint] NULL,
	[cdeDIBCountryOfOrigin] [varchar](3) NULL,
	[cdeDIBUPSSwitch] [varchar](1) NULL,
	[cdeDIBCentralStockSwitch] [varchar](1) NULL,
	[numDIBExceptionQty] [int] NULL,
	[numDIBMaxQty] [int] NULL,
	[cdeDIBPriceCode] [varchar](1) NULL,
	[cdeDIBNewItemInd] [varchar](1) NULL,
	[cdeDIBPromoStatus] [varchar](1) NULL,
	[cdeDIBSubstitute2] [varchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUOM]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUOM](
	[cdeUOM] [varchar](3) NOT NULL,
	[dscUOM] [varchar](8) NULL,
	[dscLongUOM] [varchar](25) NULL,
	[dscDIBUOM] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDept]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDept](
	[cdeDept] [varchar](4) NOT NULL,
	[dscDepartment] [varchar](50) NULL,
	[numMarginDefault] [float] NULL,
	[SyncStatus] [varchar](1) NULL,
	[optLock] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[products_qry]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[products_qry]
AS
SELECT dbo.tProducts.cdeProduct AS [Product ID], dbo.tProducts.dscDescription AS Description, dbo.tProducts.dscNOTE AS Note, dbo.tUOM.dscUOM AS [Unit of Measure], dbo.tProducts.dscSerialNum AS [Serial Number], dbo.tax_view.dscTax AS Tax, dbo.tProducts.numInventory AS Inventory, 
           dbo.tProducts.curStnd_price AS [Standard Price], dbo.tProducts.curSUG_RETAIL AS [Suggested Retail], dbo.tProducts.numStnd_Qty AS [Standard Quantity], dbo.tProducts.cdeVendor1 AS [Vendor 1], dbo.tProducts.cdeV1SKU AS [Vendor 1 SKU], dbo.tProducts.cdeVendor2 AS [Vendor 2], dbo.tProducts.cdeV2SKU AS [Vendor 2 SKU], 
           dbo.tProducts.cdeVendor3 AS [Vendor 3], dbo.tProducts.cdeV3SKU AS [Vender 3 SKU], dbo.tProducts.cdeVendor4 AS [Vendor 4], dbo.tProducts.cdeV4SKU AS [Vendor 4 SKU], dbo.tDept.dscDepartment AS Department, dbo.tDept.cdeDept AS [Department Code], dbo.tProducts.dteLastSold AS [Date Last Sold], 
           dbo.tProducts.cdeImageID
FROM   dbo.tProducts LEFT OUTER JOIN
           dbo.tDept ON dbo.tProducts.cdeDept = dbo.tDept.cdeDept LEFT OUTER JOIN
           dbo.tUOM ON dbo.tProducts.cdeUOM = dbo.tUOM.cdeUOM INNER JOIN
           dbo.tax_view ON dbo.tProducts.cdeTax = dbo.tax_view.cdeTax
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[CartId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Standard_Quantity] [int] NULL,
	[Product_ID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[subject] [varchar](50) NULL,
	[message] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Password_Confirm] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDeptSub]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDeptSub](
	[cdeDept] [varchar](4) NOT NULL,
	[cdeSubDept] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDeptSubNames]    Script Date: 14/04/2022 10:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDeptSubNames](
	[cdeSubDept] [int] NOT NULL,
	[dscSubDept] [varchar](25) NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[42] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tProducts"
            Begin Extent = 
               Top = 10
               Left = 67
               Bottom = 550
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 103
         End
         Begin Table = "tDept"
            Begin Extent = 
               Top = 10
               Left = 516
               Bottom = 240
               Right = 802
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tUOM"
            Begin Extent = 
               Top = 10
               Left = 869
               Bottom = 240
               Right = 1117
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tax_view"
            Begin Extent = 
               Top = 10
               Left = 1184
               Bottom = 176
               Right = 1432
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 857
         Width = 857
         Width = 857
         Width = 857
         Width = 857
         Width = 857
         Width = 857
         Width = 857
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'products_qry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'products_qry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'products_qry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tax_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tax_view'
GO
