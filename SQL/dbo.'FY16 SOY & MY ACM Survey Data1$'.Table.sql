USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].['FY16 SOY & MY ACM Survey Data1$']    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['FY16 SOY & MY ACM Survey Data1$'](
	[empID] [float] NULL,
	[SOYVrid] [float] NULL,
	[SOYVdatesub] [datetime] NULL,
	[SOYVstatus] [nvarchar](255) NULL,
	[SOYVcid] [nvarchar](255) NULL,
	[SOYVcomment] [nvarchar](255) NULL,
	[SOYVlanguage] [nvarchar](255) NULL,
	[SOYVreferer] [nvarchar](255) NULL,
	[SOYVsessionid] [nvarchar](255) NULL,
	[SOYVuseragent] [nvarchar](255) NULL,
	[SOYVip] [nvarchar](255) NULL,
	[SOYVlong] [nvarchar](255) NULL,
	[SOYVlat] [nvarchar](255) NULL,
	[SOYVGeoCountry] [nvarchar](255) NULL,
	[SOYVGeoCity] [nvarchar](255) NULL,
	[SOYVGeoRegion] [nvarchar](255) NULL,
	[SOYVpostal] [nvarchar](255) NULL,
	[SOYQ1] [nvarchar](255) NULL,
	[SOYQ2] [float] NULL,
	[SOYQ3] [nvarchar](255) NULL,
	[SOYQ4] [float] NULL,
	[SOYQ5] [float] NULL,
	[SOYQ6] [nvarchar](255) NULL,
	[SOYQ7] [nvarchar](255) NULL,
	[SOYQ7S] [nvarchar](255) NULL,
	[SOYQ8_1] [float] NULL,
	[SOYQ8_2] [float] NULL,
	[SOYQ8_3] [float] NULL,
	[SOYQ8_4] [float] NULL,
	[SOYQ8_5] [float] NULL,
	[SOYQ8_6] [float] NULL,
	[SOYQ8_7] [float] NULL,
	[SOYQ8_8] [float] NULL,
	[SOYQ8S] [nvarchar](255) NULL,
	[SOYQ9] [float] NULL,
	[SOYQ10] [float] NULL,
	[SOYQ11] [float] NULL,
	[SOYQ12] [float] NULL,
	[SOYQ13] [float] NULL,
	[SOYQ14] [float] NULL,
	[SOYQ15] [float] NULL,
	[SOYQ16] [nvarchar](255) NULL,
	[SOYQ17] [nvarchar](255) NULL,
	[SOYQ18] [float] NULL,
	[SOYQ18S] [nvarchar](255) NULL,
	[SOYQ19] [nvarchar](255) NULL,
	[SOYQ19S] [nvarchar](255) NULL,
	[SOYQ20] [float] NULL,
	[SOYQ21_1] [float] NULL,
	[SOYQ21_2] [float] NULL,
	[SOYQ21_3] [float] NULL,
	[SOYQ21_4] [float] NULL,
	[SOYQ21_5] [float] NULL,
	[SOYQ21_6] [float] NULL,
	[SOYQ21_7] [float] NULL,
	[SOYQ21_8] [float] NULL,
	[SOYQ21_9] [float] NULL,
	[SOYQ21_10] [float] NULL,
	[SOYQ21_11] [float] NULL,
	[SOYQ21_12] [float] NULL,
	[SOYQ21_13] [float] NULL,
	[SOYQ21_14] [float] NULL,
	[SOYQ21_15] [float] NULL,
	[SOYQ22_1] [nvarchar](255) NULL,
	[SOYQ22_2] [nvarchar](255) NULL,
	[SOYQ22_3] [nvarchar](255) NULL,
	[SOYQ22_4] [nvarchar](255) NULL,
	[SOYQ22_5] [nvarchar](255) NULL,
	[SOYQ22_6] [nvarchar](255) NULL,
	[SOYQ23_1] [nvarchar](255) NULL,
	[SOYQ23_2] [nvarchar](255) NULL,
	[SOYQ23_3] [nvarchar](255) NULL,
	[SOYQ23_4] [nvarchar](255) NULL,
	[SOYQ23_5] [nvarchar](255) NULL,
	[SOYQ23_6] [nvarchar](255) NULL,
	[SOYQ23_7] [nvarchar](255) NULL,
	[SOYQ23_8] [nvarchar](255) NULL,
	[SOYQ24_1] [nvarchar](255) NULL,
	[SOYQ24_2] [nvarchar](255) NULL,
	[SOYQ24_3] [nvarchar](255) NULL,
	[SOYQ24_4] [nvarchar](255) NULL,
	[SOYQ24_5] [nvarchar](255) NULL,
	[SOYQ24_6] [nvarchar](255) NULL,
	[SOYQ25_1] [nvarchar](255) NULL,
	[SOYQ25_2] [nvarchar](255) NULL,
	[SOYQ25_3] [nvarchar](255) NULL,
	[SOYQ25_4] [nvarchar](255) NULL,
	[SOYQ26_1] [float] NULL,
	[SOYQ26_2] [float] NULL,
	[SOYQ26_3] [float] NULL,
	[SOYQ27_1] [float] NULL,
	[SOYQ27_2] [float] NULL,
	[SOYQ27_3] [float] NULL,
	[SOYQ28_1] [float] NULL,
	[SOYQ28_2] [float] NULL,
	[SOYQ28_3] [float] NULL,
	[SOYQ28_4] [float] NULL,
	[SOYQ28_5] [float] NULL,
	[SOYQ28_6] [float] NULL,
	[SOYQ29_1] [nvarchar](255) NULL,
	[SOYQ29_2] [nvarchar](255) NULL,
	[SOYQ29_3] [nvarchar](255) NULL,
	[SOYQ29_4] [nvarchar](255) NULL,
	[SOYQ29_5] [nvarchar](255) NULL,
	[SOYQ29_6] [nvarchar](255) NULL,
	[SOYQ29_7] [nvarchar](255) NULL,
	[SOYQ29_8] [nvarchar](255) NULL,
	[SOYQ29_9] [nvarchar](255) NULL,
	[SOYQ29_10] [nvarchar](255) NULL,
	[SOYQ29_11] [nvarchar](255) NULL,
	[SOYQ29_12] [nvarchar](255) NULL,
	[SOYQ29_13] [nvarchar](255) NULL,
	[SOYQ30] [float] NULL,
	[SOYQ31_1] [float] NULL,
	[SOYQ31_2] [float] NULL,
	[SOYQ31_3] [float] NULL,
	[SOYQ31_4] [float] NULL,
	[SOYQ31_5] [float] NULL,
	[SOYQ31_6] [float] NULL,
	[SOYQ31_7] [float] NULL,
	[SOYQ31_8] [float] NULL,
	[SOYQ32_1] [float] NULL,
	[SOYQ32_2] [float] NULL,
	[SOYQ32_3] [float] NULL,
	[SOYQ32_4] [float] NULL,
	[SOYQ32_5] [float] NULL,
	[SOYQ32_6] [float] NULL,
	[SOYQ32_7] [float] NULL,
	[SOYQ32_8] [float] NULL,
	[SOYQ32_9] [float] NULL,
	[SOYQ33] [nvarchar](255) NULL,
	[SOYQ34_1] [float] NULL,
	[SOYQ34_2] [float] NULL,
	[SOYQ34_3] [float] NULL,
	[SOYQ34_4] [float] NULL,
	[SOYQ34_5] [float] NULL,
	[SOYQ34_6] [float] NULL,
	[SOYQ34_7] [float] NULL,
	[SOYQ34_8] [float] NULL,
	[SOYQ34_9] [float] NULL,
	[SOYQ34_10] [float] NULL,
	[SOYQ34_11] [float] NULL,
	[SOYQ34_12] [float] NULL,
	[SOYQ34_13] [float] NULL,
	[SOYQ34_14] [float] NULL,
	[SOYQ34_15] [float] NULL,
	[SOYQ34_16] [float] NULL,
	[SOYQ34_17] [float] NULL,
	[SOYQ34_18] [float] NULL,
	[SOYQ34_19] [float] NULL,
	[SOYQ34_20] [float] NULL,
	[SOYQ34_21] [float] NULL,
	[SOYQ34_22] [float] NULL,
	[SOYQ34_23] [float] NULL,
	[SOYQ34_24] [float] NULL,
	[SOYQ34_25] [float] NULL,
	[SOYQ34_26] [float] NULL,
	[SOYQ35] [float] NULL,
	[SOYQ36_1] [float] NULL,
	[SOYQ36_2] [float] NULL,
	[SOYQ36_3] [float] NULL,
	[SOYQ36_4] [float] NULL,
	[SOYQ36_5] [float] NULL,
	[SOYQ36_6] [float] NULL,
	[SOYQ36_7] [float] NULL,
	[SOYQ36_8] [float] NULL,
	[SOYQ36_9] [float] NULL,
	[SOYQ36_10] [float] NULL,
	[SOYQ36_11] [float] NULL,
	[SOYQ36_12] [float] NULL,
	[SOYQ36_13] [float] NULL,
	[SOYQ36_14] [float] NULL,
	[SOYQ36_15] [float] NULL,
	[SOYQ36_16] [float] NULL,
	[SOYQ36_17] [float] NULL,
	[SOYQ37_1] [float] NULL,
	[SOYQ37_2] [float] NULL,
	[SOYQ37_3] [float] NULL,
	[SOYQ37_4] [float] NULL,
	[SOYQ37_5] [float] NULL,
	[SOYQ37_6] [float] NULL,
	[SOYQ37_7] [float] NULL,
	[SOYQ37_8] [float] NULL,
	[SOYQ37_9] [float] NULL,
	[SOYQ37_10] [float] NULL,
	[SOYQ37_11] [float] NULL,
	[SOYQ37_12] [float] NULL,
	[SOYQ38] [nvarchar](255) NULL,
	[SOYQ39] [float] NULL
) ON [PRIMARY]

GO
