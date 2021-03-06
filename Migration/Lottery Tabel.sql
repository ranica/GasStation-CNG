USE [GasStation]
GO
/****** Object:  Table [dbo].[Lottery]    Script Date: 6/25/2017 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lottery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[viewId] [uniqueidentifier] NULL CONSTRAINT [DF_Lottery_viewId]  DEFAULT (newid()),
	[ownerId] [int] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[lotteryDate] [datetime] NULL,
	[total] [int] NULL,
	[month] [nvarchar](50) NULL,
	[insertedById] [int] NULL,
	[insertDate] [datetime] NULL,
	[updateById] [int] NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_Lottery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Lottery]  WITH CHECK ADD  CONSTRAINT [FK_Lottery_Owner] FOREIGN KEY([ownerId])
REFERENCES [dbo].[Owner] ([id])
GO
ALTER TABLE [dbo].[Lottery] CHECK CONSTRAINT [FK_Lottery_Owner]
GO
ALTER TABLE [dbo].[Lottery]  WITH CHECK ADD  CONSTRAINT [FK_Lottery_User_Insert] FOREIGN KEY([insertedById])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Lottery] CHECK CONSTRAINT [FK_Lottery_User_Insert]
GO
ALTER TABLE [dbo].[Lottery]  WITH CHECK ADD  CONSTRAINT [FK_Lottery_User_Modify] FOREIGN KEY([updateById])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Lottery] CHECK CONSTRAINT [FK_Lottery_User_Modify]
GO
