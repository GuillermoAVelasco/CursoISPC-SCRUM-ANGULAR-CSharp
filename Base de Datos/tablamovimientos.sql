USE [cryptomarca]
GO
/****** Object:  Table [dbo].[movimientos]    Script Date: 11/03/2022 22:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_billeteraMoneda_Origen] [bigint] NULL,
	[fk_billeteraMoneda_Destino] [bigint] NOT NULL,
	[cantidad_Origen] [decimal](22, 6) NULL,
	[cantidad_Destino] [decimal](22, 6) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fk_tipoMovimiento] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_movimientos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_billeterasMoneda_Destino] FOREIGN KEY([fk_billeteraMoneda_Destino])
REFERENCES [dbo].[billeterasMonedas] ([id])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_billeterasMoneda_Destino]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_billeterasMoneda_Origen] FOREIGN KEY([fk_billeteraMoneda_Origen])
REFERENCES [dbo].[billeterasMonedas] ([id])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_billeterasMoneda_Origen]
GO
