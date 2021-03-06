USE [master]
GO
/****** Object:  Database [RNTWeb]    Script Date: 27/02/2017 15:40:46 ******/
CREATE DATABASE [RNTWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RNTWeb', FILENAME = N'T:\RNTWeb.mdf' , SIZE = 39936KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RNTWeb_log', FILENAME = N'L:\RNTWeb_log.ldf' , SIZE = 10624KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RNTWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RNTWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RNTWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RNTWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RNTWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RNTWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RNTWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RNTWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RNTWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RNTWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RNTWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RNTWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RNTWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RNTWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RNTWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RNTWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RNTWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RNTWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RNTWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RNTWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RNTWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RNTWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RNTWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RNTWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RNTWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RNTWeb] SET  MULTI_USER 
GO
ALTER DATABASE [RNTWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RNTWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RNTWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RNTWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RNTWeb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RNTWeb', N'ON'
GO
USE [RNTWeb]
GO
/****** Object:  User [user.rnt]    Script Date: 27/02/2017 15:40:47 ******/
CREATE USER [user.rnt] FOR LOGIN [user.rnt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user.rnt]
GO
/****** Object:  Table [dbo].[acuerdo_acceso_interconexions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acuerdo_acceso_interconexions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_acuerdo] [nvarchar](4000) NULL,
	[fecha_validez_acuerdo] [date] NULL,
	[anexos] [bit] NULL,
	[adendas] [bit] NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_acuerdo_acceso_interconexions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[arbitros]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arbitros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_acreditado] [nvarchar](4000) NULL,
	[identificacion_acreditado] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[fecha_vencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[asientos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asientos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[num_asiento] [nvarchar](4000) NULL,
	[num_asiento_original] [nvarchar](4000) NULL,
	[acto_inscribible] [nvarchar](4000) NULL,
	[tipo_asiento] [nvarchar](4000) NULL,
	[tipo_inscripcion] [nvarchar](4000) NULL,
	[numero_resolucion] [nvarchar](4000) NULL,
	[nombre_resolucion] [nvarchar](4000) NULL,
	[titulo_resolucion] [nvarchar](max) NULL,
	[fecha_resolucion] [date] NULL,
	[fecha_solicitud] [date] NULL,
	[nombre_operador] [varchar](200) NULL,
	[identificacion_operador] [varchar](200) NULL,
	[nombre_representante_legal] [varchar](200) NULL,
	[cedula_representante_legal] [varchar](200) NULL,
	[usuario] [nvarchar](4000) NULL,
	[enlace_documento] [nvarchar](4000) NULL,
	[num_expediente_sutel] [nvarchar](4000) NULL,
	[operadorregulado_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[vigencia] [int] NULL,
	[acto_id] [int] NULL,
	[acto_type] [nvarchar](4000) NULL,
	[fichero_file_name] [nvarchar](4000) NULL,
	[fichero_content_type] [nvarchar](4000) NULL,
	[fichero_file_size] [int] NULL,
	[fichero_updated_at] [datetime] NULL,
	[vigencia2] [nvarchar](4000) NULL,
 CONSTRAINT [PK__asientos__3213E83FC8D7F1BE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[autorizacions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autorizacions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_publicacion_gaceta] [nvarchar](4000) NULL,
	[fecha_publicacion_gaceta] [nvarchar](4000) NULL,
	[tipo_red] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[fecha_vencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cantons]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cantons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[canton] [nvarchar](4000) NULL,
	[prov_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[concesion_directs]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[concesion_directs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[fecha_vencimiento] [date] NULL,
	[tipo_red] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[consecion_anteriors]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consecion_anteriors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adecuacion_poder_ejecutivo] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[fecha_adecuacion_poder_ejecutivo] [date] NULL,
	[numero_adecuacion_poder_ejecutivo] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[consecion_publicas]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consecion_publicas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_red] [nvarchar](4000) NULL,
	[fecha_publicacion] [date] NULL,
	[numero_publicacion] [nvarchar](4000) NULL,
	[contrato_concesion] [nvarchar](4000) NULL,
	[fecha_emision] [date] NULL,
	[numero_notificacion_refrendo] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[fecha_notificacion_refrendo] [date] NULL,
	[fecha_vencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[consecutivos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consecutivos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[contador_as] [int] NULL,
	[contador_md] [int] NULL,
	[md] [bit] NULL DEFAULT ((0)),
	[as] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contrato_adhesions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contrato_adhesions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_contrato] [nvarchar](4000) NULL,
	[fecha_vigencia] [date] NULL,
	[estado_contrato] [bit] NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[controllers]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[controllers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Asiento] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[convenio_internacionals]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[convenio_internacionals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_convenio] [nvarchar](4000) NULL,
	[numero_ley_aprobacion] [nvarchar](4000) NULL,
	[fecha_vigencia] [date] NULL,
	[enmiendas] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[convenio_privados]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[convenio_privados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_convenio] [nvarchar](4000) NULL,
	[fecha_suscripcion] [date] NULL,
	[num_anexos] [int] NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[fecha_vencimiento] [date] NULL,
	[adendas] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[convenio_ubicacion_equipos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[convenio_ubicacion_equipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_convenio] [nvarchar](4000) NULL,
	[fecha_vencimiento] [date] NULL,
	[numero_anexos] [int] NULL,
	[adendas] [bit] NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_precios_tarifas]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_precios_tarifas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_precio_tarifa] [nvarchar](4000) NULL,
	[servicio] [nvarchar](4000) NULL,
	[modalidad] [nvarchar](4000) NULL,
	[precio_tarifa] [decimal](18, 0) NULL,
	[fecha_vigencia] [date] NULL,
	[estado] [nvarchar](4000) NULL,
	[precios_tarifas_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[sci_servicios_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_recurso_numericos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_recurso_numericos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rango_numeracion] [nvarchar](4000) NULL,
	[numero_asignado] [nvarchar](4000) NULL,
	[tipo_recurso_numerico] [nvarchar](4000) NULL,
	[nota] [nvarchar](max) NULL,
	[recurso_numericos_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[distritos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distritos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[distrito] [nvarchar](4000) NULL,
	[canton_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[espectros]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[espectros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clasificacion_uso_espectro] [nvarchar](4000) NULL,
	[titulo_id] [int] NULL,
	[titulo_type] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fonatels]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fonatels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_informe] [nvarchar](4000) NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[frec]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frec](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_frecuencia] [nvarchar](4000) NULL,
	[ancho_banda_desde] [int] NULL,
	[ancho_banda_hasta] [int] NULL,
	[unidad_desde] [nvarchar](4000) NULL,
	[unidad_hasta] [nvarchar](4000) NULL,
	[espectro_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[desde] [decimal](18, 0) NULL,
	[hasta] [decimal](18, 0) NULL,
	[tx_desde] [decimal](18, 0) NULL,
	[tx_hasta] [decimal](18, 0) NULL,
	[rx_desde] [decimal](18, 0) NULL,
	[rx_hasta] [decimal](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[frecuencia_espectros]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frecuencia_espectros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_frecuencia] [nvarchar](4000) NULL,
	[ancho_banda_desde] [int] NULL,
	[ancho_banda_hasta] [int] NULL,
	[unidad_desde] [nvarchar](4000) NULL,
	[unidad_hasta] [nvarchar](4000) NULL,
	[espectro_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[desde] [nvarchar](4000) NULL,
	[hasta] [nvarchar](4000) NULL,
	[tx_desde] [nvarchar](4000) NULL,
	[tx_hasta] [nvarchar](4000) NULL,
	[rx_desde] [nvarchar](4000) NULL,
	[rx_hasta] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[homologacions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[homologacions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_oficio_remision] [nvarchar](4000) NULL,
	[fecha_actualizacion] [date] NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[labs]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[labs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_acreditado] [nvarchar](4000) NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[normas]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[normas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_vigencia] [date] NULL,
	[reforma] [nvarchar](4000) NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oferta_interconexion_servicios]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oferta_interconexion_servicios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oferta_interconexions_id] [int] NULL,
	[sci_servicios_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[precio] [decimal](18, 2) NULL,
	[servicio] [nvarchar](4000) NULL,
 CONSTRAINT [PK__oferta_i__3213E83F1801D308] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oferta_interconexions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oferta_interconexions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_publicacion_gaceta] [nvarchar](4000) NULL,
	[fecha_publicacion_gaceta] [date] NULL,
	[contenido_oferta] [nvarchar](max) NULL,
	[fecha_vencimiento] [date] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[operador_regulados]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[operador_regulados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NULL,
	[identificacion] [varchar](200) NULL,
	[codigo_operador] [varchar](200) NULL,
	[nombre_representante_legal] [varchar](200) NULL,
	[cedula_representante_legal] [varchar](200) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[estado] [varchar](200) NULL,
 CONSTRAINT [PK__operador__3213E83F40DCD16E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[operadores_acuerdo_acceso_interconexions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operadores_acuerdo_acceso_interconexions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_operador] [nvarchar](4000) NULL,
	[identificacion_operador] [nvarchar](4000) NULL,
	[nombre_representante_legal] [nvarchar](4000) NULL,
	[cedula_representante_legal] [nvarchar](4000) NULL,
	[operador_regulados_id] [int] NULL,
	[acuerdo_acceso_interconexions_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[operadores_convenio_ubicacion_equipos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operadores_convenio_ubicacion_equipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[convenio_ubicacion_equipos_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[operador_regulados_id] [int] NULL,
	[nombre_operador] [nvarchar](4000) NULL,
	[identificacion_operador] [nvarchar](4000) NULL,
	[nombre_representante_legal] [nvarchar](4000) NULL,
	[cedula_representante_legal] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[operadores_orden_acceso_interconexions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operadores_orden_acceso_interconexions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_operador] [nvarchar](4000) NULL,
	[identificacion_operador] [nvarchar](4000) NULL,
	[nombre_representante_legal] [nvarchar](4000) NULL,
	[cedula_representante_legal] [nvarchar](4000) NULL,
	[operador_regulados_id] [int] NULL,
	[orden_acceso_interconexions_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[operadores_resolucion_ubicacion_equipos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operadores_resolucion_ubicacion_equipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_operador] [nvarchar](4000) NULL,
	[identificacion_operador] [nvarchar](4000) NULL,
	[nombre_representante_legal] [nvarchar](4000) NULL,
	[cedula_representante_legal] [nvarchar](4000) NULL,
	[operador_regulados_id] [int] NULL,
	[resolucion_ubicacion_equipos_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ops]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ops](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NULL,
	[identificacion] [varchar](200) NULL,
	[codigo_operador] [varchar](200) NULL,
	[nombre_representante_legal] [varchar](200) NULL,
	[cedula_representante_legal] [varchar](200) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[estado] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orden_acceso_interconexions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_acceso_interconexions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[fecha_vigencia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[permisos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[modalidad_permiso] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[precios_tarifas]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precios_tarifas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_publicacion_gaceta] [date] NULL,
	[numero_publicacion_gaceta] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[tipo_precio_tarifa] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[provs]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recurso_numericos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recurso_numericos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rango_numeracion] [nvarchar](4000) NULL,
	[numero_asignado] [nvarchar](4000) NULL,
	[tipo_recurso_numerico] [nvarchar](4000) NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reglamento_tecnicos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reglamento_tecnicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_reglamento] [nvarchar](4000) NULL,
	[numero_aprobacion_aresep] [nvarchar](4000) NULL,
	[fecha_aprobacion] [date] NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[fecha_vigencia] [date] NULL,
	[reformas] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[resolucion_ubicacion_equipos]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resolucion_ubicacion_equipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_vigencia] [date] NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sancions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sancions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_sancion] [nvarchar](4000) NULL,
	[fecha_vigencia] [date] NULL,
	[nota] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[schema_migrations]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schema_migrations](
	[version] [nvarchar](4000) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sci_servicios]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sci_servicios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[nota] [nvarchar](4000) NULL,
	[servicio] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicio_contrato_adhesions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio_contrato_adhesions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contrato_adhesions_id] [int] NULL,
	[sci_servicios_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[servicio] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicio_habilitados]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio_habilitados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sciservicio_id] [int] NULL,
	[titulo_habilitante_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[nota] [nvarchar](4000) NULL,
	[servicio] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicios_interconexions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios_interconexions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[precio_interconexion] [decimal](18, 2) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[acuerdo_acceso_interconexions_id] [int] NULL,
	[sci_servicios_id] [int] NULL,
	[servicio] [nvarchar](4000) NULL,
 CONSTRAINT [PK__servicio__3213E83F8D394510] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicios_operadores_acuerdo_acceso_interconexions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios_operadores_acuerdo_acceso_interconexions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[precio_interconexion] [decimal](18, 0) NULL,
	[sci_servicios_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[operadores_acuerdo_acceso_interconexions_id] [int] NULL,
	[servicio] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_sci_servicios]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_sci_servicios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[nota] [nvarchar](4000) NULL,
	[servicio] [nvarchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_servicio_habilitados]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_servicio_habilitados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sciservicio_id] [int] NULL,
	[titulo_habilitante_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[nota] [nvarchar](4000) NULL,
	[servicio] [nvarchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_sancions]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_sancions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_sancion] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[titulo_habilitantes]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titulo_habilitantes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_titulo] [nvarchar](4000) NULL,
	[fecha_titulo] [date] NULL,
	[fecha_notificacion] [date] NULL,
	[causal_finalizacion] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[espectrable_id] [int] NULL,
	[espectrable_type] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](4000) NULL,
	[email] [nvarchar](4000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[password_digest] [nvarchar](4000) NULL,
	[remember_digest] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zonas]    Script Date: 27/02/2017 15:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zonas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_zona] [nvarchar](4000) NULL,
	[descripcion_zona] [nvarchar](4000) NULL,
	[nota] [nvarchar](max) NULL,
	[frecuenciaespectro_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[provincia] [nvarchar](4000) NULL,
	[canton] [nvarchar](4000) NULL,
	[distrito] [nvarchar](4000) NULL,
	[autorizacions_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [index_acuerdo_acceso_interconexions_on_adendas]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_acuerdo_acceso_interconexions_on_adendas] ON [dbo].[acuerdo_acceso_interconexions]
(
	[adendas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_acuerdo_acceso_interconexions_on_anexos]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_acuerdo_acceso_interconexions_on_anexos] ON [dbo].[acuerdo_acceso_interconexions]
(
	[anexos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_acuerdo_acceso_interconexions_on_fecha_validez_acuerdo]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_acuerdo_acceso_interconexions_on_fecha_validez_acuerdo] ON [dbo].[acuerdo_acceso_interconexions]
(
	[fecha_validez_acuerdo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_acuerdo_acceso_interconexions_on_titulo_acuerdo]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_acuerdo_acceso_interconexions_on_titulo_acuerdo] ON [dbo].[acuerdo_acceso_interconexions]
(
	[titulo_acuerdo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_arbitros_on_identificacion_acreditado]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_arbitros_on_identificacion_acreditado] ON [dbo].[arbitros]
(
	[identificacion_acreditado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_arbitros_on_nombre_acreditado]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_arbitros_on_nombre_acreditado] ON [dbo].[arbitros]
(
	[nombre_acreditado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_asientos_on_acto_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_acto_id] ON [dbo].[asientos]
(
	[acto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_acto_inscribible]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_acto_inscribible] ON [dbo].[asientos]
(
	[acto_inscribible] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_acto_type]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_acto_type] ON [dbo].[asientos]
(
	[acto_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_cedula_representante_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_cedula_representante_legal] ON [dbo].[asientos]
(
	[cedula_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_asientos_on_fecha_resolucion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_fecha_resolucion] ON [dbo].[asientos]
(
	[fecha_resolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_asientos_on_fecha_solicitud]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_fecha_solicitud] ON [dbo].[asientos]
(
	[fecha_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_identificacion_operador]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_identificacion_operador] ON [dbo].[asientos]
(
	[identificacion_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_nombre_resolucion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_nombre_resolucion] ON [dbo].[asientos]
(
	[nombre_resolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_num_asiento]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_num_asiento] ON [dbo].[asientos]
(
	[num_asiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_num_asiento_original]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_num_asiento_original] ON [dbo].[asientos]
(
	[num_asiento_original] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_numero_resolucion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_numero_resolucion] ON [dbo].[asientos]
(
	[numero_resolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_asientos_on_operador_regulado_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_operador_regulado_id] ON [dbo].[asientos]
(
	[operadorregulado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_tipo_asiento]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_tipo_asiento] ON [dbo].[asientos]
(
	[tipo_asiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_asientos_on_tipo_inscripcion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_tipo_inscripcion] ON [dbo].[asientos]
(
	[tipo_inscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_asientos_on_vigencia]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_asientos_on_vigencia] ON [dbo].[asientos]
(
	[vigencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_autorizacions_on_fecha_publicacion_gaceta]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_autorizacions_on_fecha_publicacion_gaceta] ON [dbo].[autorizacions]
(
	[fecha_publicacion_gaceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_autorizacions_on_numero_publicacion_gaceta]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_autorizacions_on_numero_publicacion_gaceta] ON [dbo].[autorizacions]
(
	[numero_publicacion_gaceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_autorizacions_on_tipo_red]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_autorizacions_on_tipo_red] ON [dbo].[autorizacions]
(
	[tipo_red] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_cantons_on_prov_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_cantons_on_prov_id] ON [dbo].[cantons]
(
	[prov_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_consecion_publicas_on_fecha_emision]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_consecion_publicas_on_fecha_emision] ON [dbo].[consecion_publicas]
(
	[fecha_emision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_consecion_publicas_on_fecha_publicacion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_consecion_publicas_on_fecha_publicacion] ON [dbo].[consecion_publicas]
(
	[fecha_publicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_consecion_publicas_on_numero_notificacion_refrendo]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_consecion_publicas_on_numero_notificacion_refrendo] ON [dbo].[consecion_publicas]
(
	[numero_notificacion_refrendo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_consecion_publicas_on_numero_publicacion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_consecion_publicas_on_numero_publicacion] ON [dbo].[consecion_publicas]
(
	[numero_publicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_consecion_publicas_on_tipo_red]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_consecion_publicas_on_tipo_red] ON [dbo].[consecion_publicas]
(
	[tipo_red] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_consecutivos_on_contador_as]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_consecutivos_on_contador_as] ON [dbo].[consecutivos]
(
	[contador_as] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_consecutivos_on_contador_md]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_consecutivos_on_contador_md] ON [dbo].[consecutivos]
(
	[contador_md] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_contrato_adhesions_on_estado_contrato]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_contrato_adhesions_on_estado_contrato] ON [dbo].[contrato_adhesions]
(
	[estado_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_contrato_adhesions_on_fecha_vigencia]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_contrato_adhesions_on_fecha_vigencia] ON [dbo].[contrato_adhesions]
(
	[fecha_vigencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_contrato_adhesions_on_titulo_contrato]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_contrato_adhesions_on_titulo_contrato] ON [dbo].[contrato_adhesions]
(
	[titulo_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_convenio_internacionals_on_numero_ley_aprobacion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_convenio_internacionals_on_numero_ley_aprobacion] ON [dbo].[convenio_internacionals]
(
	[numero_ley_aprobacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_convenio_internacionals_on_titulo_convenio]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_convenio_internacionals_on_titulo_convenio] ON [dbo].[convenio_internacionals]
(
	[titulo_convenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_convenio_privados_on_fecha_suscripcion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_convenio_privados_on_fecha_suscripcion] ON [dbo].[convenio_privados]
(
	[fecha_suscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_convenio_privados_on_titulo_convenio]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_convenio_privados_on_titulo_convenio] ON [dbo].[convenio_privados]
(
	[titulo_convenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_convenio_ubicacion_equipos_on_adendas]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_convenio_ubicacion_equipos_on_adendas] ON [dbo].[convenio_ubicacion_equipos]
(
	[adendas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_convenio_ubicacion_equipos_on_fecha_vencimiento]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_convenio_ubicacion_equipos_on_fecha_vencimiento] ON [dbo].[convenio_ubicacion_equipos]
(
	[fecha_vencimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_convenio_ubicacion_equipos_on_titulo_convenio]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_convenio_ubicacion_equipos_on_titulo_convenio] ON [dbo].[convenio_ubicacion_equipos]
(
	[titulo_convenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_detalle_pyt_estado]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_detalle_pyt_estado] ON [dbo].[detalle_precios_tarifas]
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_detalle_pyt_modalidad]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_detalle_pyt_modalidad] ON [dbo].[detalle_precios_tarifas]
(
	[modalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_detalle_pyt_servicio]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_detalle_pyt_servicio] ON [dbo].[detalle_precios_tarifas]
(
	[servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_detalle_pyt_servicios]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_detalle_pyt_servicios] ON [dbo].[detalle_precios_tarifas]
(
	[sci_servicios_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_detalle_pyt_tipo]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_detalle_pyt_tipo] ON [dbo].[detalle_precios_tarifas]
(
	[tipo_precio_tarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_precios_tarifas_detalle]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_precios_tarifas_detalle] ON [dbo].[detalle_precios_tarifas]
(
	[precios_tarifas_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_detalle_recurso_numericos_on_recurso_numericos_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_detalle_recurso_numericos_on_recurso_numericos_id] ON [dbo].[detalle_recurso_numericos]
(
	[recurso_numericos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_distritos_on_canton_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_distritos_on_canton_id] ON [dbo].[distritos]
(
	[canton_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_espectros_on_clasificacion_uso_espectro]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_espectros_on_clasificacion_uso_espectro] ON [dbo].[espectros]
(
	[clasificacion_uso_espectro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_espectros_on_titulo_type_and_titulo_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_espectros_on_titulo_type_and_titulo_id] ON [dbo].[espectros]
(
	[titulo_type] ASC,
	[titulo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_fonatels_on_titulo_informe]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_fonatels_on_titulo_informe] ON [dbo].[fonatels]
(
	[titulo_informe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_homologacions_on_fecha_actualizacion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_homologacions_on_fecha_actualizacion] ON [dbo].[homologacions]
(
	[fecha_actualizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_homologacions_on_numero_oficio_remision]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_homologacions_on_numero_oficio_remision] ON [dbo].[homologacions]
(
	[numero_oficio_remision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_normas_on_fecha_vigencia]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_normas_on_fecha_vigencia] ON [dbo].[normas]
(
	[fecha_vigencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_oferta_interconexion_servicios_on_oferta_interconexions_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_oferta_interconexion_servicios_on_oferta_interconexions_id] ON [dbo].[oferta_interconexion_servicios]
(
	[oferta_interconexions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_oferta_interconexion_servicios_on_sci_servicios_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_oferta_interconexion_servicios_on_sci_servicios_id] ON [dbo].[oferta_interconexion_servicios]
(
	[sci_servicios_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_oferta_interconexions_on_fecha_publicacion_gaceta]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_oferta_interconexions_on_fecha_publicacion_gaceta] ON [dbo].[oferta_interconexions]
(
	[fecha_publicacion_gaceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_oferta_interconexions_on_fecha_vencimiento]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_oferta_interconexions_on_fecha_vencimiento] ON [dbo].[oferta_interconexions]
(
	[fecha_vencimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_oferta_interconexions_on_numero_publicacion_gaceta]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_oferta_interconexions_on_numero_publicacion_gaceta] ON [dbo].[oferta_interconexions]
(
	[numero_publicacion_gaceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_operadores_aai]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_aai] ON [dbo].[operadores_acuerdo_acceso_interconexions]
(
	[operador_regulados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_operadores_aai_aai]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_aai_aai] ON [dbo].[operadores_acuerdo_acceso_interconexions]
(
	[acuerdo_acceso_interconexions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [operadores_aai_cedula_rep_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [operadores_aai_cedula_rep_legal] ON [dbo].[operadores_acuerdo_acceso_interconexions]
(
	[cedula_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [operadores_aai_id_operador]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [operadores_aai_id_operador] ON [dbo].[operadores_acuerdo_acceso_interconexions]
(
	[identificacion_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [operadores_aai_nombre_operador]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [operadores_aai_nombre_operador] ON [dbo].[operadores_acuerdo_acceso_interconexions]
(
	[nombre_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [operadores_aai_rep_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [operadores_aai_rep_legal] ON [dbo].[operadores_acuerdo_acceso_interconexions]
(
	[nombre_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_convenio_ubic_equipos_operadores]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_convenio_ubic_equipos_operadores] ON [dbo].[operadores_convenio_ubicacion_equipos]
(
	[operador_regulados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_operadores_convenio_ubicacion_equipos]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_convenio_ubicacion_equipos] ON [dbo].[operadores_convenio_ubicacion_equipos]
(
	[convenio_ubicacion_equipos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_cue_cedula_rep_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_cue_cedula_rep_legal] ON [dbo].[operadores_convenio_ubicacion_equipos]
(
	[cedula_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_cue_identificacion_operador]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_cue_identificacion_operador] ON [dbo].[operadores_convenio_ubicacion_equipos]
(
	[identificacion_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_cue_nombre_operador]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_cue_nombre_operador] ON [dbo].[operadores_convenio_ubicacion_equipos]
(
	[nombre_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_cue_nombre_rep_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_cue_nombre_rep_legal] ON [dbo].[operadores_convenio_ubicacion_equipos]
(
	[nombre_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_oai]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_oai] ON [dbo].[operadores_orden_acceso_interconexions]
(
	[orden_acceso_interconexions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_operadores_oai]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_oai] ON [dbo].[operadores_orden_acceso_interconexions]
(
	[operador_regulados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_oai_cedula_rep_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_oai_cedula_rep_legal] ON [dbo].[operadores_orden_acceso_interconexions]
(
	[cedula_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_oai_id_operador]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_oai_id_operador] ON [dbo].[operadores_orden_acceso_interconexions]
(
	[identificacion_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_oai_nombre_operador]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_oai_nombre_operador] ON [dbo].[operadores_orden_acceso_interconexions]
(
	[nombre_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_oai_nombre_rep_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_oai_nombre_rep_legal] ON [dbo].[operadores_orden_acceso_interconexions]
(
	[nombre_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_rue]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_rue] ON [dbo].[operadores_resolucion_ubicacion_equipos]
(
	[nombre_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_rue_cedula_rep_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_rue_cedula_rep_legal] ON [dbo].[operadores_resolucion_ubicacion_equipos]
(
	[cedula_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_rue_id_operador]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_rue_id_operador] ON [dbo].[operadores_resolucion_ubicacion_equipos]
(
	[identificacion_operador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_operadores_rue_operador_regulado]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_rue_operador_regulado] ON [dbo].[operadores_resolucion_ubicacion_equipos]
(
	[operador_regulados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_operadores_rue_rep_legal]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_rue_rep_legal] ON [dbo].[operadores_resolucion_ubicacion_equipos]
(
	[nombre_representante_legal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_operadores_rue_rue]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_rue_rue] ON [dbo].[operadores_resolucion_ubicacion_equipos]
(
	[resolucion_ubicacion_equipos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_permisos_on_modalidad_permiso]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_permisos_on_modalidad_permiso] ON [dbo].[permisos]
(
	[modalidad_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [idx_preciostarifas_fecha_gaceta]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_preciostarifas_fecha_gaceta] ON [dbo].[precios_tarifas]
(
	[fecha_publicacion_gaceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_preciostarifas_numero_gaceta]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_preciostarifas_numero_gaceta] ON [dbo].[precios_tarifas]
(
	[numero_publicacion_gaceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_recurso_numericos_on_numero_asignado]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_recurso_numericos_on_numero_asignado] ON [dbo].[recurso_numericos]
(
	[numero_asignado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_recurso_numericos_on_rango_numeracion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_recurso_numericos_on_rango_numeracion] ON [dbo].[recurso_numericos]
(
	[rango_numeracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_recurso_numericos_on_tipo_recurso_numerico]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_recurso_numericos_on_tipo_recurso_numerico] ON [dbo].[recurso_numericos]
(
	[tipo_recurso_numerico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_reglamento_tecnicos_on_fecha_aprobacion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_reglamento_tecnicos_on_fecha_aprobacion] ON [dbo].[reglamento_tecnicos]
(
	[fecha_aprobacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_reglamento_tecnicos_on_numero_aprobacion_aresep]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_reglamento_tecnicos_on_numero_aprobacion_aresep] ON [dbo].[reglamento_tecnicos]
(
	[numero_aprobacion_aresep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_reglamento_tecnicos_on_titulo_reglamento]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_reglamento_tecnicos_on_titulo_reglamento] ON [dbo].[reglamento_tecnicos]
(
	[titulo_reglamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_resolucion_ubicacion_equipos_on_fecha_vigencia]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_resolucion_ubicacion_equipos_on_fecha_vigencia] ON [dbo].[resolucion_ubicacion_equipos]
(
	[fecha_vigencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_sancions_on_fecha_vigencia]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_sancions_on_fecha_vigencia] ON [dbo].[sancions]
(
	[fecha_vigencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_sancions_on_tipo_sancion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_sancions_on_tipo_sancion] ON [dbo].[sancions]
(
	[tipo_sancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_schema_migrations]    Script Date: 27/02/2017 15:40:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [unique_schema_migrations] ON [dbo].[schema_migrations]
(
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_sci_servicios_on_descripcion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_sci_servicios_on_descripcion] ON [dbo].[sci_servicios]
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_servicio_contrato_adhesions_on_contrato_adhesions_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_servicio_contrato_adhesions_on_contrato_adhesions_id] ON [dbo].[servicio_contrato_adhesions]
(
	[contrato_adhesions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_servicio_contrato_adhesions_on_sci_servicios_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_servicio_contrato_adhesions_on_sci_servicios_id] ON [dbo].[servicio_contrato_adhesions]
(
	[sci_servicios_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_servicio_habilitados_on_sciservicio_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_servicio_habilitados_on_sciservicio_id] ON [dbo].[servicio_habilitados]
(
	[sciservicio_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_servicio_habilitados_on_titulo_habilitante_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_servicio_habilitados_on_titulo_habilitante_id] ON [dbo].[servicio_habilitados]
(
	[titulo_habilitante_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [idx_operadores_aai_servicios]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_operadores_aai_servicios] ON [dbo].[servicios_operadores_acuerdo_acceso_interconexions]
(
	[sci_servicios_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_servicios_op_aai]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [idx_servicios_op_aai] ON [dbo].[servicios_operadores_acuerdo_acceso_interconexions]
(
	[operadores_acuerdo_acceso_interconexions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_titulo_habilitantes_on_causal_finalizacion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_titulo_habilitantes_on_causal_finalizacion] ON [dbo].[titulo_habilitantes]
(
	[causal_finalizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_titulo_habilitantes_on_espectrable_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_titulo_habilitantes_on_espectrable_id] ON [dbo].[titulo_habilitantes]
(
	[espectrable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_titulo_habilitantes_on_espectrable_type]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_titulo_habilitantes_on_espectrable_type] ON [dbo].[titulo_habilitantes]
(
	[espectrable_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_titulo_habilitantes_on_fecha_notificacion]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_titulo_habilitantes_on_fecha_notificacion] ON [dbo].[titulo_habilitantes]
(
	[fecha_notificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [index_titulo_habilitantes_on_fecha_titulo]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_titulo_habilitantes_on_fecha_titulo] ON [dbo].[titulo_habilitantes]
(
	[fecha_titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_titulo_habilitantes_on_numero_titulo]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_titulo_habilitantes_on_numero_titulo] ON [dbo].[titulo_habilitantes]
(
	[numero_titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_users_on_email]    Script Date: 27/02/2017 15:40:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_users_on_email] ON [dbo].[users]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [index_zonas_on_frecuenciaespectro_id]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_zonas_on_frecuenciaespectro_id] ON [dbo].[zonas]
(
	[frecuenciaespectro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_zonas_on_tipo_zona]    Script Date: 27/02/2017 15:40:47 ******/
CREATE NONCLUSTERED INDEX [index_zonas_on_tipo_zona] ON [dbo].[zonas]
(
	[tipo_zona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asientos]  WITH CHECK ADD  CONSTRAINT [fk_rails_113a56573a] FOREIGN KEY([operadorregulado_id])
REFERENCES [dbo].[operador_regulados] ([id])
GO
ALTER TABLE [dbo].[asientos] CHECK CONSTRAINT [fk_rails_113a56573a]
GO
ALTER TABLE [dbo].[cantons]  WITH CHECK ADD  CONSTRAINT [fk_rails_0f2d69e71a] FOREIGN KEY([prov_id])
REFERENCES [dbo].[provs] ([id])
GO
ALTER TABLE [dbo].[cantons] CHECK CONSTRAINT [fk_rails_0f2d69e71a]
GO
ALTER TABLE [dbo].[detalle_precios_tarifas]  WITH CHECK ADD  CONSTRAINT [FK_detalle_precios_tarifas_precios_tarifas] FOREIGN KEY([precios_tarifas_id])
REFERENCES [dbo].[precios_tarifas] ([id])
GO
ALTER TABLE [dbo].[detalle_precios_tarifas] CHECK CONSTRAINT [FK_detalle_precios_tarifas_precios_tarifas]
GO
ALTER TABLE [dbo].[detalle_precios_tarifas]  WITH CHECK ADD  CONSTRAINT [FK_detalle_precios_tarifas_sci_servicios] FOREIGN KEY([sci_servicios_id])
REFERENCES [dbo].[sci_servicios] ([id])
GO
ALTER TABLE [dbo].[detalle_precios_tarifas] CHECK CONSTRAINT [FK_detalle_precios_tarifas_sci_servicios]
GO
ALTER TABLE [dbo].[detalle_recurso_numericos]  WITH CHECK ADD  CONSTRAINT [FK_detalle_recurso_numericos_recurso_numericos] FOREIGN KEY([recurso_numericos_id])
REFERENCES [dbo].[recurso_numericos] ([id])
GO
ALTER TABLE [dbo].[detalle_recurso_numericos] CHECK CONSTRAINT [FK_detalle_recurso_numericos_recurso_numericos]
GO
ALTER TABLE [dbo].[distritos]  WITH CHECK ADD  CONSTRAINT [fk_rails_1396b00e59] FOREIGN KEY([canton_id])
REFERENCES [dbo].[cantons] ([id])
GO
ALTER TABLE [dbo].[distritos] CHECK CONSTRAINT [fk_rails_1396b00e59]
GO
ALTER TABLE [dbo].[frecuencia_espectros]  WITH CHECK ADD  CONSTRAINT [fk_rails_87d85bd8cf] FOREIGN KEY([espectro_id])
REFERENCES [dbo].[espectros] ([id])
GO
ALTER TABLE [dbo].[frecuencia_espectros] CHECK CONSTRAINT [fk_rails_87d85bd8cf]
GO
ALTER TABLE [dbo].[operadores_acuerdo_acceso_interconexions]  WITH CHECK ADD  CONSTRAINT [FK_operadores_acuerdo_acceso_interconexions_acuerdo_acceso_interconexions] FOREIGN KEY([acuerdo_acceso_interconexions_id])
REFERENCES [dbo].[acuerdo_acceso_interconexions] ([id])
GO
ALTER TABLE [dbo].[operadores_acuerdo_acceso_interconexions] CHECK CONSTRAINT [FK_operadores_acuerdo_acceso_interconexions_acuerdo_acceso_interconexions]
GO
ALTER TABLE [dbo].[operadores_acuerdo_acceso_interconexions]  WITH CHECK ADD  CONSTRAINT [FK_operadores_acuerdo_acceso_interconexions_operador_regulados] FOREIGN KEY([operador_regulados_id])
REFERENCES [dbo].[operador_regulados] ([id])
GO
ALTER TABLE [dbo].[operadores_acuerdo_acceso_interconexions] CHECK CONSTRAINT [FK_operadores_acuerdo_acceso_interconexions_operador_regulados]
GO
ALTER TABLE [dbo].[operadores_convenio_ubicacion_equipos]  WITH CHECK ADD  CONSTRAINT [FK_operadores_convenio_ubicacion_equipos_convenio_ubicacion_equipos] FOREIGN KEY([convenio_ubicacion_equipos_id])
REFERENCES [dbo].[convenio_ubicacion_equipos] ([id])
GO
ALTER TABLE [dbo].[operadores_convenio_ubicacion_equipos] CHECK CONSTRAINT [FK_operadores_convenio_ubicacion_equipos_convenio_ubicacion_equipos]
GO
ALTER TABLE [dbo].[operadores_convenio_ubicacion_equipos]  WITH CHECK ADD  CONSTRAINT [FK_operadores_convenio_ubicacion_equipos_operadores_convenio_ubicacion_equipos] FOREIGN KEY([id])
REFERENCES [dbo].[operadores_convenio_ubicacion_equipos] ([id])
GO
ALTER TABLE [dbo].[operadores_convenio_ubicacion_equipos] CHECK CONSTRAINT [FK_operadores_convenio_ubicacion_equipos_operadores_convenio_ubicacion_equipos]
GO
ALTER TABLE [dbo].[operadores_orden_acceso_interconexions]  WITH CHECK ADD  CONSTRAINT [FK_operadores_orden_acceso_interconexions_operador_regulados] FOREIGN KEY([operador_regulados_id])
REFERENCES [dbo].[operador_regulados] ([id])
GO
ALTER TABLE [dbo].[operadores_orden_acceso_interconexions] CHECK CONSTRAINT [FK_operadores_orden_acceso_interconexions_operador_regulados]
GO
ALTER TABLE [dbo].[operadores_orden_acceso_interconexions]  WITH CHECK ADD  CONSTRAINT [FK_operadores_orden_acceso_interconexions_orden_acceso_interconexions] FOREIGN KEY([orden_acceso_interconexions_id])
REFERENCES [dbo].[orden_acceso_interconexions] ([id])
GO
ALTER TABLE [dbo].[operadores_orden_acceso_interconexions] CHECK CONSTRAINT [FK_operadores_orden_acceso_interconexions_orden_acceso_interconexions]
GO
ALTER TABLE [dbo].[operadores_resolucion_ubicacion_equipos]  WITH CHECK ADD  CONSTRAINT [FK_operadores_resolucion_ubicacion_equipos_operador_regulados] FOREIGN KEY([operador_regulados_id])
REFERENCES [dbo].[operador_regulados] ([id])
GO
ALTER TABLE [dbo].[operadores_resolucion_ubicacion_equipos] CHECK CONSTRAINT [FK_operadores_resolucion_ubicacion_equipos_operador_regulados]
GO
ALTER TABLE [dbo].[operadores_resolucion_ubicacion_equipos]  WITH CHECK ADD  CONSTRAINT [FK_operadores_resolucion_ubicacion_equipos_resolucion_ubicacion_equipos] FOREIGN KEY([resolucion_ubicacion_equipos_id])
REFERENCES [dbo].[resolucion_ubicacion_equipos] ([id])
GO
ALTER TABLE [dbo].[operadores_resolucion_ubicacion_equipos] CHECK CONSTRAINT [FK_operadores_resolucion_ubicacion_equipos_resolucion_ubicacion_equipos]
GO
ALTER TABLE [dbo].[servicio_contrato_adhesions]  WITH CHECK ADD  CONSTRAINT [FK_servicio_contrato_adhesions_contrato_adhesions] FOREIGN KEY([contrato_adhesions_id])
REFERENCES [dbo].[contrato_adhesions] ([id])
GO
ALTER TABLE [dbo].[servicio_contrato_adhesions] CHECK CONSTRAINT [FK_servicio_contrato_adhesions_contrato_adhesions]
GO
ALTER TABLE [dbo].[servicio_contrato_adhesions]  WITH CHECK ADD  CONSTRAINT [FK_servicio_contrato_adhesions_sci_servicios] FOREIGN KEY([sci_servicios_id])
REFERENCES [dbo].[sci_servicios] ([id])
GO
ALTER TABLE [dbo].[servicio_contrato_adhesions] CHECK CONSTRAINT [FK_servicio_contrato_adhesions_sci_servicios]
GO
ALTER TABLE [dbo].[servicio_habilitados]  WITH CHECK ADD  CONSTRAINT [fk_rails_9b95078383] FOREIGN KEY([titulo_habilitante_id])
REFERENCES [dbo].[titulo_habilitantes] ([id])
GO
ALTER TABLE [dbo].[servicio_habilitados] CHECK CONSTRAINT [fk_rails_9b95078383]
GO
ALTER TABLE [dbo].[servicios_interconexions]  WITH CHECK ADD  CONSTRAINT [FK_servicios_interconexions_sci_servicios] FOREIGN KEY([sci_servicios_id])
REFERENCES [dbo].[sci_servicios] ([id])
GO
ALTER TABLE [dbo].[servicios_interconexions] CHECK CONSTRAINT [FK_servicios_interconexions_sci_servicios]
GO
ALTER TABLE [dbo].[servicios_interconexions]  WITH CHECK ADD  CONSTRAINT [FK_servicios_interconexions_servicios_interconexions] FOREIGN KEY([id])
REFERENCES [dbo].[servicios_interconexions] ([id])
GO
ALTER TABLE [dbo].[servicios_interconexions] CHECK CONSTRAINT [FK_servicios_interconexions_servicios_interconexions]
GO
ALTER TABLE [dbo].[servicios_operadores_acuerdo_acceso_interconexions]  WITH CHECK ADD  CONSTRAINT [FK_servicios_operadores_acuerdo_acceso_interconexions_sci_servicios] FOREIGN KEY([sci_servicios_id])
REFERENCES [dbo].[sci_servicios] ([id])
GO
ALTER TABLE [dbo].[servicios_operadores_acuerdo_acceso_interconexions] CHECK CONSTRAINT [FK_servicios_operadores_acuerdo_acceso_interconexions_sci_servicios]
GO
ALTER TABLE [dbo].[zonas]  WITH CHECK ADD  CONSTRAINT [FK_zonas_autorizacions] FOREIGN KEY([autorizacions_id])
REFERENCES [dbo].[autorizacions] ([id])
GO
ALTER TABLE [dbo].[zonas] CHECK CONSTRAINT [FK_zonas_autorizacions]
GO
USE [master]
GO
ALTER DATABASE [RNTWeb] SET  READ_WRITE 
GO
