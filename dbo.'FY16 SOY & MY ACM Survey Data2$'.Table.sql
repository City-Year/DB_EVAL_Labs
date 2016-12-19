USE [EVAL_Labs]
GO
/****** Object:  Table [dbo].['FY16 SOY & MY ACM Survey Data2$']    Script Date: 12/19/2016 4:15:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['FY16 SOY & MY ACM Survey Data2$'](
	[empID] [float] NULL,
	[SOYQ40_1] [float] NULL,
	[SOYQ40_2] [float] NULL,
	[SOYQ40_3] [float] NULL,
	[SOYQ40_4] [float] NULL,
	[SOYQ40_5] [float] NULL,
	[SOYQ40_6] [float] NULL,
	[SOYQ40_7] [float] NULL,
	[SOYQ40_8] [float] NULL,
	[SOYQ40_9] [float] NULL,
	[SOYQ40_10] [float] NULL,
	[SOYQ40_11] [float] NULL,
	[SOYQ40_12] [float] NULL,
	[SOYQ40_13] [float] NULL,
	[SOYQ40_14] [float] NULL,
	[SOYQ40_15] [float] NULL,
	[SOYQ40_16] [float] NULL,
	[SOYQ40_17] [float] NULL,
	[SOYQ40_18] [float] NULL,
	[SOYQ40_19] [float] NULL,
	[SOYQ40_20] [float] NULL,
	[SOYQ41_1] [float] NULL,
	[SOYQ41_2] [float] NULL,
	[SOYQ41_3] [float] NULL,
	[SOYQ41_4] [float] NULL,
	[SOYQ41_5] [float] NULL,
	[SOYQ41_6] [float] NULL,
	[SOYQ41_7] [float] NULL,
	[SOYQ41_8] [float] NULL,
	[SOYQ41_9] [float] NULL,
	[SOYQ41_10] [float] NULL,
	[SOYQ41_11] [float] NULL,
	[SOYQ41_12] [float] NULL,
	[SOYQ41_12S] [nvarchar](255) NULL,
	[SOYQ42_1] [float] NULL,
	[SOYQ42_2] [float] NULL,
	[SOYQ42_3] [float] NULL,
	[SOYQ42_4] [float] NULL,
	[SOYQ42_5] [float] NULL,
	[SOYQ42_6] [float] NULL,
	[SOYQ42_7] [float] NULL,
	[SOYQ42_8] [float] NULL,
	[SOYQ43_1] [float] NULL,
	[SOYQ43_2] [float] NULL,
	[SOYQ43_3] [float] NULL,
	[SOYQ43_4] [float] NULL,
	[SOYQ43_5] [float] NULL,
	[SOYQ43_6] [float] NULL,
	[SOYQ43_7] [float] NULL,
	[SOYQ43_8] [float] NULL,
	[SOYQ43_9] [float] NULL,
	[SOYQ43_10] [float] NULL,
	[SOYQ44_1] [float] NULL,
	[SOYQ44_2] [float] NULL,
	[SOYQ44_3] [float] NULL,
	[SOYQ44_4] [float] NULL,
	[SOYQ44_5] [float] NULL,
	[SOYQ44_6] [float] NULL,
	[SOYQ44_7] [float] NULL,
	[SOYQ44_8] [float] NULL,
	[SOYQ44_9] [float] NULL,
	[SOYQ44_10] [float] NULL,
	[SOYQ44_11] [float] NULL,
	[SOYQ45_1] [float] NULL,
	[SOYQ45_2] [float] NULL,
	[SOYQ45_3] [float] NULL,
	[SOYQ45_4] [float] NULL,
	[SOYQ45_5] [float] NULL,
	[SOYQ45_6] [float] NULL,
	[SOYQ45_7] [float] NULL,
	[SOYQ45_8] [float] NULL,
	[SOYQ45_9] [float] NULL,
	[SOYQ45_10] [float] NULL,
	[SOYQ46_1] [float] NULL,
	[SOYQ46_2] [float] NULL,
	[SOYQ46_3] [float] NULL,
	[SOYQ46_4] [float] NULL,
	[SOYQ46_5] [float] NULL,
	[SOYQ46_6] [float] NULL,
	[SOYQ46_7] [float] NULL,
	[SOYQ46_8] [float] NULL,
	[SOYQ46_9] [float] NULL,
	[SOYQ46_10] [float] NULL,
	[SOYQ47] [float] NULL,
	[SOYQ48_1] [float] NULL,
	[SOYQ48_2] [float] NULL,
	[SOYQ48_3] [float] NULL,
	[SOYQ48_4] [float] NULL,
	[SOYQ48_5] [float] NULL,
	[SOYQ48_6] [float] NULL,
	[SOYQ48_7] [float] NULL,
	[SOYQ48_8] [float] NULL,
	[SOYQ48_8S] [nvarchar](255) NULL,
	[SOYQ49] [float] NULL,
	[SOYQ50_1] [float] NULL,
	[SOYQ50_2] [float] NULL,
	[SOYQ50_3] [float] NULL,
	[SOYQ50_4] [float] NULL,
	[SOYQ50_5] [float] NULL,
	[SOYQ50_6] [float] NULL,
	[SOYQ50_7] [float] NULL,
	[SOYQ51_1] [float] NULL,
	[SOYQ51_2] [float] NULL,
	[SOYQ51_3] [float] NULL,
	[SOYQ51_4] [float] NULL,
	[SOYQ51_5] [float] NULL,
	[SOYQ51_6] [float] NULL,
	[SOYQ51_7] [float] NULL,
	[SOYQ51_8] [float] NULL,
	[SOYQ52] [float] NULL,
	[SOYQ53] [float] NULL,
	[SOYQ54] [float] NULL,
	[SOYQ54S] [nvarchar](255) NULL,
	[SOYQ55_1] [nvarchar](255) NULL,
	[SOYQ55_2] [nvarchar](255) NULL,
	[SOYQ55_3] [nvarchar](255) NULL,
	[SOYQ56] [nvarchar](255) NULL,
	[SOYQ57] [nvarchar](255) NULL,
	[SOYQ58] [nvarchar](255) NULL,
	[SOYQ59_1] [nvarchar](255) NULL,
	[SOYQ59_2] [nvarchar](255) NULL,
	[SOYQ59_3] [nvarchar](255) NULL,
	[SOYQ59_4] [nvarchar](255) NULL,
	[SOYQ59_5] [nvarchar](255) NULL,
	[SOYQ59_6] [nvarchar](255) NULL,
	[SOYQ60] [nvarchar](255) NULL,
	[SOYQ60S] [nvarchar](255) NULL,
	[SOYQ61] [nvarchar](255) NULL,
	[SOYQ62_1] [nvarchar](255) NULL,
	[SOYQ62_2] [nvarchar](255) NULL,
	[SOYQ62_3] [nvarchar](255) NULL,
	[SOYQ62_4] [nvarchar](255) NULL,
	[SOYQ63] [nvarchar](255) NULL,
	[SOYQ64] [nvarchar](255) NULL,
	[SOYQ65] [nvarchar](255) NULL,
	[SOYQ66_1] [nvarchar](255) NULL,
	[SOYQ66_2] [nvarchar](255) NULL,
	[SOYQ66_3] [nvarchar](255) NULL,
	[SOYQ66_4] [nvarchar](255) NULL,
	[SOYQ66_5] [nvarchar](255) NULL,
	[SOYQ66_6] [nvarchar](255) NULL,
	[SOYQ66_6S] [nvarchar](255) NULL,
	[SOYQ67_1] [nvarchar](255) NULL,
	[SOYQ67_2] [nvarchar](255) NULL,
	[SOYQ67_3] [nvarchar](255) NULL,
	[SOYQ67_4] [nvarchar](255) NULL,
	[SOYQ67_5] [nvarchar](255) NULL,
	[SOYQ67_6] [nvarchar](255) NULL,
	[SOYQ67_7] [nvarchar](255) NULL,
	[SOYQ67_8] [nvarchar](255) NULL,
	[SOYQ67_9] [nvarchar](255) NULL,
	[SOYQ67_10] [nvarchar](255) NULL,
	[SOYQ67_10S] [nvarchar](255) NULL,
	[SOYQ68_1] [nvarchar](255) NULL,
	[SOYQ68_2] [nvarchar](255) NULL,
	[SOYQ69] [nvarchar](255) NULL,
	[SOYQ70] [nvarchar](255) NULL,
	[SOYQ71_1] [nvarchar](255) NULL,
	[SOYQ71_2] [nvarchar](255) NULL,
	[SOYQ72] [nvarchar](max) NULL,
	[SOYQ73_1] [nvarchar](255) NULL,
	[SOYQ73_2] [nvarchar](255) NULL,
	[SOYQ73_3] [nvarchar](255) NULL,
	[SOYQ74] [nvarchar](255) NULL,
	[SOYQ75_1] [nvarchar](255) NULL,
	[SOYQ75_2] [nvarchar](255) NULL,
	[SOYQ76] [nvarchar](255) NULL,
	[SOYQ77] [nvarchar](255) NULL,
	[SOYQ78] [nvarchar](255) NULL,
	[SOYQ79] [nvarchar](255) NULL,
	[SOYQ80] [nvarchar](255) NULL,
	[SOYQ81] [nvarchar](255) NULL,
	[SOYQ82_1] [nvarchar](255) NULL,
	[SOYQ82_2] [nvarchar](255) NULL,
	[SOYQ82_3] [nvarchar](255) NULL,
	[SOYQ82_4] [nvarchar](255) NULL,
	[SOYQ82_5] [nvarchar](255) NULL,
	[SOYQ83] [nvarchar](255) NULL,
	[SOYQ84_1] [nvarchar](255) NULL,
	[SOYQ84_2] [nvarchar](255) NULL,
	[SOYQ84_3] [nvarchar](255) NULL,
	[SOYQ84_4] [nvarchar](255) NULL,
	[SOYQ84_5] [nvarchar](255) NULL,
	[SOYQ85] [nvarchar](255) NULL,
	[SOYQ85S] [nvarchar](255) NULL,
	[SOYQ86] [nvarchar](255) NULL,
	[SOYQ86S] [nvarchar](255) NULL,
	[SOYQ87_1] [nvarchar](255) NULL,
	[SOYQ87_2] [nvarchar](255) NULL,
	[SOYQ87_3] [nvarchar](255) NULL,
	[SOYQ88] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
