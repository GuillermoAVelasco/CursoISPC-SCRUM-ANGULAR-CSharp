USE [cryptomarca]
GO
/****** Object:  Table [dbo].[bancos]    Script Date: 3/3/2022 20:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bancos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_bancos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[billeterasMonedas]    Script Date: 3/3/2022 20:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billeterasMonedas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_usuario] [bigint] NOT NULL,
	[fk_moneda] [bigint] NOT NULL,
	[cantidad] [decimal](22, 6) NOT NULL,
 CONSTRAINT [PK_billeterasMonedas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[monedas]    Script Date: 3/3/2022 20:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[monedas](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[cotizacion] [decimal](22, 6) NOT NULL,
	[fecha_cotizacion] [datetime] NOT NULL,
	[direccion_contrato] [varchar](25) NULL,
 CONSTRAINT [PK_monedas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[movimientos]    Script Date: 3/3/2022 20:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fk_billeteraMoneda] [bigint] NOT NULL,
	[cantidad] [decimal](22, 6) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fk_tipoMovimiento] [numeric](2, 0) NOT NULL,
	[fk_monedaOrigen] [bigint] NULL,
	[fk_monedaDestino] [bigint] NULL,
 CONSTRAINT [PK_movimientos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paises]    Script Date: 3/3/2022 20:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paises](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 3/3/2022 20:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[provincias](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[fk_pais] [bigint] NULL,
 CONSTRAINT [PK_provincias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipoMovimientos]    Script Date: 3/3/2022 20:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipoMovimientos](
	[id] [numeric](2, 0) IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 3/3/2022 20:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](25) NOT NULL,
	[dni] [varchar](12) NOT NULL,
	[fk_provincia] [bigint] NOT NULL,
	[fk_banco] [bigint] NOT NULL,
	[cbu] [varchar](20) NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[activo] [bit] NOT NULL CONSTRAINT [DF_usuarios_activo]  DEFAULT ((1)),
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[billeterasMonedas]  WITH CHECK ADD  CONSTRAINT [FK_billeterasMonedas_monedas] FOREIGN KEY([fk_moneda])
REFERENCES [dbo].[monedas] ([id])
GO
ALTER TABLE [dbo].[billeterasMonedas] CHECK CONSTRAINT [FK_billeterasMonedas_monedas]
GO
ALTER TABLE [dbo].[billeterasMonedas]  WITH CHECK ADD  CONSTRAINT [FK_billeterasMonedas_usuarios] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[billeterasMonedas] CHECK CONSTRAINT [FK_billeterasMonedas_usuarios]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_billeterasMonedas] FOREIGN KEY([fk_billeteraMoneda])
REFERENCES [dbo].[billeterasMonedas] ([id])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_billeterasMonedas]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_monedas] FOREIGN KEY([fk_monedaOrigen])
REFERENCES [dbo].[monedas] ([id])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_monedas]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_monedas1] FOREIGN KEY([fk_monedaDestino])
REFERENCES [dbo].[monedas] ([id])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_monedas1]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_tipoMovimientos] FOREIGN KEY([fk_tipoMovimiento])
REFERENCES [dbo].[tipoMovimientos] ([id])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_tipoMovimientos]
GO
ALTER TABLE [dbo].[provincias]  WITH CHECK ADD  CONSTRAINT [FK_provincias_paises] FOREIGN KEY([fk_pais])
REFERENCES [dbo].[paises] ([id])
GO
ALTER TABLE [dbo].[provincias] CHECK CONSTRAINT [FK_provincias_paises]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_bancos] FOREIGN KEY([fk_banco])
REFERENCES [dbo].[bancos] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_bancos]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_provincias] FOREIGN KEY([fk_provincia])
REFERENCES [dbo].[provincias] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_provincias]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'billeterasMonedas', @level2type=N'COLUMN',@level2name=N'cantidad'
GO
