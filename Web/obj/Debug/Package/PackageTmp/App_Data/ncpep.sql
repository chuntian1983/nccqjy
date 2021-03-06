USE [master]
GO
/****** Object:  Database [NCPEP]    Script Date: 09/07/2017 15:36:14 ******/
CREATE DATABASE [NCPEP] ON  PRIMARY 
( NAME = N'NCPEP', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS2008\MSSQL\DATA\NCPEP.mdf' , SIZE = 6080KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NCPEP_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS2008\MSSQL\DATA\NCPEP.ldf' , SIZE = 26864KB , MAXSIZE = 2048GB , FILEGROWTH = 0)
GO
ALTER DATABASE [NCPEP] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NCPEP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NCPEP] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [NCPEP] SET ANSI_NULLS OFF
GO
ALTER DATABASE [NCPEP] SET ANSI_PADDING OFF
GO
ALTER DATABASE [NCPEP] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [NCPEP] SET ARITHABORT OFF
GO
ALTER DATABASE [NCPEP] SET AUTO_CLOSE ON
GO
ALTER DATABASE [NCPEP] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [NCPEP] SET AUTO_SHRINK ON
GO
ALTER DATABASE [NCPEP] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [NCPEP] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [NCPEP] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [NCPEP] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [NCPEP] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [NCPEP] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [NCPEP] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [NCPEP] SET  DISABLE_BROKER
GO
ALTER DATABASE [NCPEP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [NCPEP] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [NCPEP] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [NCPEP] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [NCPEP] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [NCPEP] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [NCPEP] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [NCPEP] SET  READ_WRITE
GO
ALTER DATABASE [NCPEP] SET RECOVERY FULL
GO
ALTER DATABASE [NCPEP] SET  MULTI_USER
GO
ALTER DATABASE [NCPEP] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [NCPEP] SET DB_CHAINING OFF
GO
USE [NCPEP]
GO
/****** Object:  Table [dbo].[T_YQ]    Script Date: 09/07/2017 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_YQ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[yqname] [nvarchar](500) NULL,
	[yqleixing] [nvarchar](500) NULL,
	[yqlianjie] [nvarchar](500) NULL,
	[beiyong] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_YQ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_YQ] ON
INSERT [dbo].[T_YQ] ([id], [yqname], [yqleixing], [yqlianjie], [beiyong]) VALUES (1, N'山东', N'各省政府网站', N'http://baidu.com', NULL)
SET IDENTITY_INSERT [dbo].[T_YQ] OFF
/****** Object:  Table [dbo].[T_XMGG]    Script Date: 09/07/2017 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_XMGG](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bid] [int] NOT NULL,
	[xmtitle] [varchar](50) NULL,
	[xmneirong] [nvarchar](max) NULL,
	[xmsj] [nvarchar](50) NULL,
	[xmbz] [nvarchar](50) NULL,
	[xmby] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_XMGG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_XMGG] ON
INSERT [dbo].[T_XMGG] ([id], [bid], [xmtitle], [xmneirong], [xmsj], [xmbz], [xmby]) VALUES (4, 1, N'大家分开链接打开撒放假快乐大家撒拉萨的风景', N'撒范德萨发简单快乐撒荆防颗粒电视剧啊风口浪尖的萨克雷锋大家分开来决定洒垃圾房贷款拉丝机', N'2017-03-16', N'', N'1')
SET IDENTITY_INSERT [dbo].[T_XMGG] OFF
/****** Object:  Table [dbo].[T_XmBeian]    Script Date: 09/07/2017 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_XmBeian](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cqname] [varchar](150) NULL,
	[orgcode] [varchar](50) NULL,
	[cqleixing] [varchar](50) NULL,
	[guimo] [varchar](50) NULL,
	[danwei] [varchar](50) NULL,
	[cqquanshu] [varchar](50) NULL,
	[churangfang] [varchar](50) NULL,
	[churangfangxingzhi] [varchar](50) NULL,
	[shourangfang] [varchar](50) NULL,
	[shourangfangxingzhi] [varchar](50) NULL,
	[jiaoyifangshi] [varchar](50) NULL,
	[hetongksrq] [datetime] NOT NULL,
	[hetongjsrq] [datetime] NOT NULL,
	[chengjiaodanjia] [varchar](50) NULL,
	[changjiaozongjia] [nvarchar](50) NULL,
	[zhifufangshi] [varchar](50) NULL,
	[beizhu] [varchar](50) NULL,
	[beiyong] [varchar](50) NULL,
	[beiyongb] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_XmBeian] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_XmBeian] ON
INSERT [dbo].[T_XmBeian] ([id], [cqname], [orgcode], [cqleixing], [guimo], [danwei], [cqquanshu], [churangfang], [churangfangxingzhi], [shourangfang], [shourangfangxingzhi], [jiaoyifangshi], [hetongksrq], [hetongjsrq], [chengjiaodanjia], [changjiaozongjia], [zhifufangshi], [beizhu], [beiyong], [beiyongb]) VALUES (4, N'333', N'360102', N'1', N'33', N'亩', N'个人所有', N'3', N'3', N'3', N'3', N'1', CAST(0x0000A6F000000000 AS DateTime), CAST(0x0000A6FB00000000 AS DateTime), N'33', N'3', N'3', N'3', N'3', N'')
INSERT [dbo].[T_XmBeian] ([id], [cqname], [orgcode], [cqleixing], [guimo], [danwei], [cqquanshu], [churangfang], [churangfangxingzhi], [shourangfang], [shourangfangxingzhi], [jiaoyifangshi], [hetongksrq], [hetongjsrq], [chengjiaodanjia], [changjiaozongjia], [zhifufangshi], [beizhu], [beiyong], [beiyongb]) VALUES (5, N'dsafdsafds', N'3601', N'1', N'2', N'亩', N'个人所有', N'3', N'33', N'3', N'3', N'1', CAST(0x0000A6F000000000 AS DateTime), CAST(0x0000A6F100000000 AS DateTime), N'3', N'3', N'3', N'33', N'3', N'')
SET IDENTITY_INSERT [dbo].[T_XmBeian] OFF
/****** Object:  Table [dbo].[T_Wztou]    Script Date: 09/07/2017 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Wztou](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wztou] [nvarchar](50) NULL,
	[zzcode] [nvarchar](50) NULL,
	[beizhu] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_Wztou] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Wztou] ON
INSERT [dbo].[T_Wztou] ([id], [wztou], [zzcode], [beizhu]) VALUES (4, N'42b02731f9be4f329a21a59cecf67ea9.png', N'360201', N'信州区')
SET IDENTITY_INSERT [dbo].[T_Wztou] OFF
/****** Object:  Table [dbo].[T_WebUserVeri]    Script Date: 09/07/2017 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_WebUserVeri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[LoginPass] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserTel] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserStatus] [int] NULL,
	[LoginDate] [datetime] NULL,
	[LoginnNum] [int] NULL,
	[OutDate] [datetime] NULL,
	[Veri] [int] NULL,
	[MemberTypeId] [int] NULL,
	[VeriName] [nvarchar](50) NULL,
	[VeriSex] [nvarchar](50) NULL,
	[VeriIDCard] [nvarchar](50) NULL,
	[VeriIDCardScan] [nvarchar](50) NULL,
	[OrgCode] [nvarchar](50) NULL,
	[VeriAddress] [nvarchar](150) NULL,
	[VeriTel] [nvarchar](50) NULL,
	[VeriCorporate] [nvarchar](50) NULL,
	[VeriCorporateIDCard] [nvarchar](50) NULL,
	[VeriCorporateIDCardScan] [nvarchar](50) NULL,
	[VeriCreditCode] [nvarchar](50) NULL,
	[VeriCreditCodeScan] [nvarchar](50) NULL,
	[VeriStatus] [int] NULL,
	[AuditType] [int] NULL,
	[VeriCheckName] [nvarchar](50) NULL,
	[VeriApplyDate] [datetime] NULL,
	[VeriCheckDate] [datetime] NULL,
 CONSTRAINT [PK_T_WebUserVeri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_WebUserVeri] ON
INSERT [dbo].[T_WebUserVeri] ([Id], [LoginName], [LoginPass], [UserName], [UserTel], [UserEmail], [UserStatus], [LoginDate], [LoginnNum], [OutDate], [Veri], [MemberTypeId], [VeriName], [VeriSex], [VeriIDCard], [VeriIDCardScan], [OrgCode], [VeriAddress], [VeriTel], [VeriCorporate], [VeriCorporateIDCard], [VeriCorporateIDCardScan], [VeriCreditCode], [VeriCreditCodeScan], [VeriStatus], [AuditType], [VeriCheckName], [VeriApplyDate], [VeriCheckDate]) VALUES (1, N'webuser', N'123456', N'张三丰', N'15192085121', N'32768600@qq.com', 1, CAST(0x0000A64300B87388 AS DateTime), 15, CAST(0x0000A71400F46A8A AS DateTime), 1, 1, N'张三丰', N'男', N'371082198810110111', N'20160714111729.pdf', N'3601', N'洪湖大道123号A座51号', N'13562138090', N'', N'', N'', N'', N'', 1, 0, N'', CAST(0x0000A64300B87388 AS DateTime), CAST(0x0000A64300B87388 AS DateTime))
INSERT [dbo].[T_WebUserVeri] ([Id], [LoginName], [LoginPass], [UserName], [UserTel], [UserEmail], [UserStatus], [LoginDate], [LoginnNum], [OutDate], [Veri], [MemberTypeId], [VeriName], [VeriSex], [VeriIDCard], [VeriIDCardScan], [OrgCode], [VeriAddress], [VeriTel], [VeriCorporate], [VeriCorporateIDCard], [VeriCorporateIDCardScan], [VeriCreditCode], [VeriCreditCodeScan], [VeriStatus], [AuditType], [VeriCheckName], [VeriApplyDate], [VeriCheckDate]) VALUES (2, N'zhangsan', N'123456', N'张三', N'18660376721', N'12121@qq.com', 1, CAST(0x0000A67600A7D474 AS DateTime), 1, CAST(0x0000A67600AD7708 AS DateTime), 1, 1, N'zhangsan', N'男', N'232323213', N'20160903103407.pdf', N'360102', N'2323', N'2323', N'', N'', N'', N'', N'', 0, 0, N'', CAST(0x0000A67600A7D474 AS DateTime), CAST(0x0000A67600A7D474 AS DateTime))
INSERT [dbo].[T_WebUserVeri] ([Id], [LoginName], [LoginPass], [UserName], [UserTel], [UserEmail], [UserStatus], [LoginDate], [LoginnNum], [OutDate], [Veri], [MemberTypeId], [VeriName], [VeriSex], [VeriIDCard], [VeriIDCardScan], [OrgCode], [VeriAddress], [VeriTel], [VeriCorporate], [VeriCorporateIDCard], [VeriCorporateIDCardScan], [VeriCreditCode], [VeriCreditCodeScan], [VeriStatus], [AuditType], [VeriCheckName], [VeriApplyDate], [VeriCheckDate]) VALUES (3, N'huiyuan', N'123456', N'444', N'444', N'', 1, CAST(0x0000A69C00A4E3C0 AS DateTime), 1, CAST(0x0000A69C00A516D4 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, CAST(0x0000A69C00A4E3CF AS DateTime), CAST(0x0000A69C00A4E3CF AS DateTime))
INSERT [dbo].[T_WebUserVeri] ([Id], [LoginName], [LoginPass], [UserName], [UserTel], [UserEmail], [UserStatus], [LoginDate], [LoginnNum], [OutDate], [Veri], [MemberTypeId], [VeriName], [VeriSex], [VeriIDCard], [VeriIDCardScan], [OrgCode], [VeriAddress], [VeriTel], [VeriCorporate], [VeriCorporateIDCard], [VeriCorporateIDCardScan], [VeriCreditCode], [VeriCreditCodeScan], [VeriStatus], [AuditType], [VeriCheckName], [VeriApplyDate], [VeriCheckDate]) VALUES (4, N'chuntian', N'123456', N'1', N'15562102895', N'1', 1, CAST(0x0000A71400F120C3 AS DateTime), 1, CAST(0x0000A71400FBFB79 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, CAST(0x0000A71400F120DB AS DateTime), CAST(0x0000A71400F120DB AS DateTime))
INSERT [dbo].[T_WebUserVeri] ([Id], [LoginName], [LoginPass], [UserName], [UserTel], [UserEmail], [UserStatus], [LoginDate], [LoginnNum], [OutDate], [Veri], [MemberTypeId], [VeriName], [VeriSex], [VeriIDCard], [VeriIDCardScan], [OrgCode], [VeriAddress], [VeriTel], [VeriCorporate], [VeriCorporateIDCard], [VeriCorporateIDCardScan], [VeriCreditCode], [VeriCreditCodeScan], [VeriStatus], [AuditType], [VeriCheckName], [VeriApplyDate], [VeriCheckDate]) VALUES (5, N'chuntian2', N'888888', N'2', N'15562102895', N'2', 1, CAST(0x0000A71400F7F878 AS DateTime), 2, CAST(0x0000A7C800A8D248 AS DateTime), 1, 1, N'ceshi', N'男', N'371089198605031586', N'20170208030909.pdf', N'360102', N'3333', N'18663116598', N'', N'', N'', N'', N'', 1, 1, N'SystemAdmin', CAST(0x0000A71400F7F878 AS DateTime), CAST(0x0000A71400F7F878 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_WebUserVeri] OFF
/****** Object:  Table [dbo].[T_WebIntention]    Script Date: 09/07/2017 15:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_WebIntention](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_WebUserVeriId] [int] NOT NULL,
	[IntentionType] [int] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[RegDate] [datetime] NOT NULL,
	[EndDte] [datetime] NOT NULL,
	[CheckStatus] [int] NOT NULL,
	[ClickNum] [int] NOT NULL,
	[CheckName] [nvarchar](50) NOT NULL,
	[CheckDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_WebIntention] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_WebIntention] ON
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (1, 69, 2, N'东山村转让土地50亩', N'以每亩价格为200元每年，转让期限20年', CAST(0x0000A63600000000 AS DateTime), CAST(0x0000A64100000000 AS DateTime), 1, 2, N'', CAST(0x0000A63600C12A25 AS DateTime))
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (2, 69, 1, N'需求土地30亩', N'需求在铅山县受让土地30亩，拟每亩价格为200元每亩每年', CAST(0x0000A63600000000 AS DateTime), CAST(0x0000A64100000000 AS DateTime), 1, 9, N'', CAST(0x0000A63600C18835 AS DateTime))
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (3, 69, 1, N'在铅山县需求流转土地100亩', N'用于种植水稻，每年每亩150元，期限20年', CAST(0x0000A63600000000 AS DateTime), CAST(0x0000A64400000000 AS DateTime), 1, 3, N'', CAST(0x0000A63600C26837 AS DateTime))
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (4, 69, 1, N'上饶县需求200亩水田', N'用于水稻种植', CAST(0x0000A63700000000 AS DateTime), CAST(0x0000A64300000000 AS DateTime), 1, 4, N'', CAST(0x0000A63600C2C8F3 AS DateTime))
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (5, 70, 2, N'转让土地50亩', N'<span style="font-family:宋体, Arial, 微软雅黑;line-height:22px;white-space:normal;">福建赣闽稀有金属有限公司，成立于2006年3月16日，注册地址：上杭县南阳镇工业区，注册资本：人民币1000万元，统一社会信用代码：913508237845439855，法定代表人：吴林浒，类型：有限责任公司，经营范围：钨铁合金冶炼、销售；经营本企业自产产品及技术的出口业务、本企业生产所需的原辅材料、机械设备、零配件及技术的进口业务、进料加工和“三来一补”业务（以上经营项目涉及国家限定、禁止、有专项专营规定的除外）。（以上经营范围涉及许可经营项目的，应在取得有关部门的许可后方可经营）</span><br style="margin:0px;padding:0px;font-family:宋体, Arial, 微软雅黑;line-height:22px;white-space:normal;" />', CAST(0x0000A63B00000000 AS DateTime), CAST(0x0000AD7400000000 AS DateTime), 1, 2, N'', CAST(0x0000A63B00A5172E AS DateTime))
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (6, 1, 1, N'测试内容有代码的问题', N'<strong><u><span style="background-color:#9933e5;font-family:Arial Black;color:#e56600;font-size:32px;">策划四从而色反抗集散地就算了快捷方式登记方式</span></u></strong>', CAST(0x0000A65100000000 AS DateTime), CAST(0x0000A64100000000 AS DateTime), 0, 5, N'', CAST(0x0000A63D00A9C5E2 AS DateTime))
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (7, 1, 1, N'3432342432', N'34234243242', CAST(0x0000A64400000000 AS DateTime), CAST(0x0000A65100000000 AS DateTime), 0, 0, N'', CAST(0x0000A64400A74C33 AS DateTime))
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (8, 3, 1, N'我来测试', N'11111', CAST(0x0000A69500000000 AS DateTime), CAST(0x0000A69D00000000 AS DateTime), 0, 0, N'', CAST(0x0000A69C00A5406D AS DateTime))
INSERT [dbo].[T_WebIntention] ([Id], [FK_WebUserVeriId], [IntentionType], [Title], [Content], [RegDate], [EndDte], [CheckStatus], [ClickNum], [CheckName], [CheckDate]) VALUES (9, 5, 1, N'99999999999', N'999', CAST(0x0000A70D00000000 AS DateTime), CAST(0x0000A71500000000 AS DateTime), 1, 1, N'', CAST(0x0000A71400F8D1AC AS DateTime))
SET IDENTITY_INSERT [dbo].[T_WebIntention] OFF
/****** Object:  Table [dbo].[T_UploadTypeIndicator]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_UploadTypeIndicator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeIndicatorName] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_UploadTypeIndicator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_UploadTypeIndicator', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指标类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_UploadTypeIndicator'
GO
SET IDENTITY_INSERT [dbo].[T_UploadTypeIndicator] ON
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (1, N'《农村综合产权流转交易申请书（出让方）》', N'admin', CAST(0x0000A5FB0121CB23 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (2, N'《农村综合产权流转交易申请书（意向受让让方）》', N'admin', CAST(0x0000A5FB0121D50B AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (3, N'1.个人身份证复印件', N'admin', CAST(0x0000A5FB0123DA28 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (4, N'2.常住人口登记卡（户口薄）复印件', N'admin', CAST(0x0000A5FB0123F6A7 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (5, N'1.村委会主任的身份证复印件', N'admin', CAST(0x0000A5FB01241835 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (6, N'2.村委会主任当选证书复印件（有效任期内）', N'admin', CAST(0x0000A5FB012467B8 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (7, N'3.村民大会或村民代表大会决议', N'admin', CAST(0x0000A5FC008D1EBA AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (8, N'4.村民大会决议中签名农户身份证复印件', N'admin', CAST(0x0000A5FC008D4685 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (9, N'1.近期年检的营业执照（副本）复印件', N'admin', CAST(0x0000A5FC008D89D9 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (10, N'2.组织机构代码证（副本）复印件', N'admin', CAST(0x0000A5FC008DB1F9 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (11, N'3.法定代表人身份证复印件', N'admin', CAST(0x0000A5FC008DCB2B AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (12, N'4.公司章程（提供最新版本）', N'admin', CAST(0x0000A5FC008DF1ED AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (13, N'5.股东会或董事会决议', N'admin', CAST(0x0000A5FC008E1027 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (14, N'1.项目实施方案', N'admin', CAST(0x0000A5FC008E26BC AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (15, N'2.经办人授权委托书及身份证复印件', N'admin', CAST(0x0000A5FC008E5C21 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (16, N'6.其他', N'admin', CAST(0x0000A5FC008E67F5 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (17, N'1.权利证明文件，如土地承包经营权证复印件', N'admin', CAST(0x0000A5FC008EA0CC AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (18, N'2.流转农户身份证复印件', N'admin', CAST(0x0000A5FC008EBC9D AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (19, N'3.《南昌市农村土地流转申请鉴证前置审批申请表》', N'admin', CAST(0x0000A5FC008EE9C6 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (20, N'4.农村土地承包经营权流转委托书', N'admin', CAST(0x0000A5FC008F3647 AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (21, N'5.土地流转清单', N'SystemAdmin', CAST(0x0000A6F300F0828A AS DateTime))
INSERT [dbo].[T_UploadTypeIndicator] ([Id], [TypeIndicatorName], [Editor], [CreateDate]) VALUES (22, N'6.其他', N'SystemAdmin', CAST(0x0000A6F300F089DA AS DateTime))
SET IDENTITY_INSERT [dbo].[T_UploadTypeIndicator] OFF
/****** Object:  Table [dbo].[T_TurnOutType]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TurnOutType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TurnOutTypeName] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_TurnOutType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_TurnOutType] ON
INSERT [dbo].[T_TurnOutType] ([Id], [TurnOutTypeName], [Editor], [CreateDate]) VALUES (1, N'转出', N'admin', CAST(0x0000A5FB0102A410 AS DateTime))
INSERT [dbo].[T_TurnOutType] ([Id], [TurnOutTypeName], [Editor], [CreateDate]) VALUES (2, N'互换', N'张伟伟', CAST(0x0000A619009CD6FB AS DateTime))
INSERT [dbo].[T_TurnOutType] ([Id], [TurnOutTypeName], [Editor], [CreateDate]) VALUES (3, N'转包', N'admin', CAST(0x0000A5FB0102B7D3 AS DateTime))
INSERT [dbo].[T_TurnOutType] ([Id], [TurnOutTypeName], [Editor], [CreateDate]) VALUES (4, N'出租', N'admin', CAST(0x0000A5FB0102BF60 AS DateTime))
INSERT [dbo].[T_TurnOutType] ([Id], [TurnOutTypeName], [Editor], [CreateDate]) VALUES (5, N'入股', N'admin', CAST(0x0000A5FB0102C729 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_TurnOutType] OFF
/****** Object:  Table [dbo].[T_TranProcess]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TranProcess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[AcceptDate] [datetime] NULL,
	[AcceptName] [nvarchar](50) NULL,
	[AcceptSay] [nvarchar](150) NULL,
	[AcceptSayDate] [datetime] NULL,
	[AuditDate] [datetime] NULL,
	[AuditName] [nvarchar](50) NULL,
	[AuditSay] [nvarchar](150) NULL,
	[AuditSayDate] [datetime] NULL,
	[TradingDate] [datetime] NULL,
	[TradingName] [nvarchar](50) NULL,
	[TradingSay] [nvarchar](150) NULL,
	[TradingSayDate] [datetime] NULL,
	[AttestationDate] [datetime] NULL,
	[AttestationName] [nvarchar](50) NULL,
	[AttestationSay] [nvarchar](150) NULL,
	[AttestationSayDate] [datetime] NULL,
	[HeadDate] [datetime] NULL,
	[HeadName] [nvarchar](50) NULL,
	[HeadSay] [nvarchar](150) NULL,
	[HeadSayDate] [datetime] NULL,
	[SuperDate] [datetime] NULL,
	[SuperName] [nvarchar](50) NULL,
	[SuperSay] [nvarchar](150) NULL,
	[SuperSayDate] [datetime] NULL,
 CONSTRAINT [PK_T_TranProcess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_TranProcess] ON
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (1, 6, CAST(0x0000A13900000000 AS DateTime), N'张伟伟', N'同意', CAST(0x0000A60B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'张伟伟', N'', CAST(0x0000A61600A238E8 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (2, 21, CAST(0x0000A60900B255E8 AS DateTime), NULL, NULL, CAST(0x0000A60B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (3, 7, CAST(0x0000A60B00B1B8E0 AS DateTime), N'张伟伟', N'附件上传检查完毕', CAST(0x0000A60C00BBE5F4 AS DateTime), CAST(0x0000A60C00BBE5F4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (4, 3, CAST(0x0000A61700AC5C9C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'张伟伟', N'', CAST(0x0000A61700AC5C9C AS DateTime), CAST(0x0000A61700AC5C9C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (5, 11, CAST(0x0000A62E00F90AB0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'张伟伟', N'', CAST(0x0000A62E00F90984 AS DateTime), CAST(0x0000A62E00F90984 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (6, 16, CAST(0x0000A633011C92C8 AS DateTime), N'张伟伟', N'同意', CAST(0x0000A633011CE020 AS DateTime), CAST(0x0000A633011CE020 AS DateTime), N'张伟伟', N'', CAST(0x0000A633011E1B5C AS DateTime), CAST(0x0000A633011E1B5C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (7, 1, CAST(0x0000A63B00A8E6AC AS DateTime), N'SystemAdmin', N'111', CAST(0x0000A63B00A8E6AC AS DateTime), CAST(0x0000A63B00A8E6AC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (8, 2, CAST(0x0000A63B00A9A358 AS DateTime), NULL, NULL, NULL, NULL, N'SystemAdmin', N'', CAST(0x0000A63B00A9A358 AS DateTime), CAST(0x0000A63B00A9A358 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (9, 15, CAST(0x0000A63B00AA2314 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SystemAdmin', N'', CAST(0x0000A63B00AA2314 AS DateTime), CAST(0x0000A63B00AA2314 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A63B00AA8C8C AS DateTime), CAST(0x0000A63B00AA8C8C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (10, 5, CAST(0x0000A63B00AAA9D8 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SystemAdmin', N'', CAST(0x0000A63B00AAA9D8 AS DateTime), CAST(0x0000A63B00AAA9D8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A63B00AAB590 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (11, 34, CAST(0x0000A65C00B17BF0 AS DateTime), N'张飞', N'审核通过', CAST(0x0000A65C00B27B68 AS DateTime), CAST(0x0000A65C00B27B68 AS DateTime), N'0801', N'', CAST(0x0000A65C00B4BE50 AS DateTime), CAST(0x0000A65C00B4BE50 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A67600B55900 AS DateTime), CAST(0x0000A67600B55900 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (12, 35, CAST(0x0000A65C00FABFCC AS DateTime), N'08', N'审核通过，可以上报', CAST(0x0000A65C00FAD610 AS DateTime), CAST(0x0000A65C00FAD610 AS DateTime), N'0801', N'', CAST(0x0000A65C00FB39AC AS DateTime), CAST(0x0000A65C00FB39AC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (13, 36, CAST(0x0000A69C00A6B558 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A69C00A6D2A4 AS DateTime), CAST(0x0000A69C00A6D2A4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (14, 37, CAST(0x0000A69D009C0AE0 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A69D009C25D4 AS DateTime), CAST(0x0000A69D009C25D4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D009CD344 AS DateTime), CAST(0x0000A69D009CD344 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D009CFEA0 AS DateTime), CAST(0x0000A69D009CFEA0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (15, 38, CAST(0x0000A69D009E91C0 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A69D009EE878 AS DateTime), CAST(0x0000A69D009EE878 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D009F58F8 AS DateTime), CAST(0x0000A69D009F58F8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69E01099128 AS DateTime), CAST(0x0000A69E01099128 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F7008A7104 AS DateTime), CAST(0x0000A6F7008A7104 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F7008AFC78 AS DateTime), CAST(0x0000A6F7008AFC78 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F7008B2324 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (16, 39, CAST(0x0000A69D00A09434 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A69D00A0EF9C AS DateTime), CAST(0x0000A69D00A0EF9C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D00A0F7D0 AS DateTime), CAST(0x0000A69D00A0F7D0 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D00A755E4 AS DateTime), CAST(0x0000A69D00A755E4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D00ABD4AC AS DateTime), CAST(0x0000A69D00ABD4AC AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D00AC18A4 AS DateTime), CAST(0x0000A69D00AC18A4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D00AC2330 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (17, 40, CAST(0x0000A69D00A2795C AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A69D00A2A4B8 AS DateTime), CAST(0x0000A69D00A2A4B8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69D00A2B3F4 AS DateTime), CAST(0x0000A69D00A2B3F4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69E0108C1BC AS DateTime), CAST(0x0000A69E0108C1BC AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69E0108FEAC AS DateTime), CAST(0x0000A69E0108FEAC AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69E010906E0 AS DateTime), CAST(0x0000A69E010906E0 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A69E0109161C AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (18, 41, CAST(0x0000A6E2008BAC40 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6E200A18DD0 AS DateTime), CAST(0x0000A6E200A18DD0 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD00E25888 AS DateTime), CAST(0x0000A6FD00E25888 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FE00853DC4 AS DateTime), CAST(0x0000A6FE00853DC4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FE00E3DD98 AS DateTime), CAST(0x0000A6FE00E3DD98 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FE00E3FC10 AS DateTime), CAST(0x0000A6FE00E3FC10 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FE00E40318 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (19, 42, CAST(0x0000A6E200904D04 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6E200B34AD4 AS DateTime), CAST(0x0000A6E200B34AD4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (20, 43, CAST(0x0000A6E200B33DF0 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6E200B34F84 AS DateTime), CAST(0x0000A6E200B34F84 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (21, 44, CAST(0x0000A6E200B373D8 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6E200B3982C AS DateTime), CAST(0x0000A6E200B3982C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F2009ADB5C AS DateTime), CAST(0x0000A6F2009ADB5C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (22, 45, CAST(0x0000A6E200B394A8 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6E200B3F844 AS DateTime), CAST(0x0000A6E200B3F844 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F7008D822C AS DateTime), CAST(0x0000A6F7008D822C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (23, 46, CAST(0x0000A6E200B3C838 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6E200B3FCF4 AS DateTime), CAST(0x0000A6E200B3FCF4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6EB0099FA5C AS DateTime), CAST(0x0000A6EB0099FA5C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (24, 47, CAST(0x0000A6E200B3F4C0 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6F2010B9144 AS DateTime), CAST(0x0000A6F2010B9144 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (25, 48, CAST(0x0000A6E6008ADBA8 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6F20095FA24 AS DateTime), CAST(0x0000A6F20095FA24 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F2009AB258 AS DateTime), CAST(0x0000A6F2009AB258 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (26, 49, CAST(0x0000A6F20095D828 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6F20099069C AS DateTime), CAST(0x0000A6F20099069C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F2009AE5E8 AS DateTime), CAST(0x0000A6F2009AE5E8 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (27, 50, CAST(0x0000A6F200A2DCF8 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (28, 51, CAST(0x0000A6F200A47270 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6F2010B64BC AS DateTime), CAST(0x0000A6F2010B64BC AS DateTime), N'SystemAdmin', N'', CAST(0x0000A73600F5049C AS DateTime), CAST(0x0000A73600F5049C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (29, 52, CAST(0x0000A6F600F2D924 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6F7008A5994 AS DateTime), CAST(0x0000A6F7008A5994 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A73600F4FFEC AS DateTime), CAST(0x0000A73600F4FFEC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (30, 53, CAST(0x0000A6F7008AC438 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6F7008B9980 AS DateTime), CAST(0x0000A6F7008B9980 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A73600F4FB3C AS DateTime), CAST(0x0000A73600F4FB3C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (31, 54, CAST(0x0000A6F7008CB068 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6F7008CC6AC AS DateTime), CAST(0x0000A6F7008CC6AC AS DateTime), N'SystemAdmin', N'', CAST(0x0000A73600F4F68C AS DateTime), CAST(0x0000A73600F4F68C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (32, 55, CAST(0x0000A6F7008EF5A8 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6F7008F1C54 AS DateTime), CAST(0x0000A6F7008F1C54 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F7008F2B90 AS DateTime), CAST(0x0000A6F7008F2B90 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6F7008F5368 AS DateTime), CAST(0x0000A6F7008F5368 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD00E23D94 AS DateTime), CAST(0x0000A6FD00E23D94 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD00E2494C AS DateTime), CAST(0x0000A6FD00E2494C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD00E2575C AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (33, 56, CAST(0x0000A6FA00E21940 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6FD009620D0 AS DateTime), CAST(0x0000A6FD009620D0 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD009671AC AS DateTime), CAST(0x0000A6FD009671AC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (34, 57, CAST(0x0000A6FD008F8824 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A72000F144D8 AS DateTime), CAST(0x0000A72000F144D8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7220101C1F0 AS DateTime), CAST(0x0000A7220101C1F0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (35, 58, CAST(0x0000A6FD00FEF970 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (36, 59, CAST(0x0000A6FD00FF5BE0 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A6FD00FF6414 AS DateTime), CAST(0x0000A6FD00FF6414 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD00FFDCC8 AS DateTime), CAST(0x0000A6FD00FFDCC8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD00FFFB40 AS DateTime), CAST(0x0000A6FD00FFFB40 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD01004064 AS DateTime), CAST(0x0000A6FD01004064 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD010049C4 AS DateTime), CAST(0x0000A6FD010049C4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A6FD01005324 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (37, 60, CAST(0x0000A71A008A5D18 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A71A008BA088 AS DateTime), CAST(0x0000A71A008BA088 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A71A008BAC40 AS DateTime), CAST(0x0000A71A008BAC40 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A71A008C0D84 AS DateTime), CAST(0x0000A71A008C0D84 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A71A009192CC AS DateTime), CAST(0x0000A71A009192CC AS DateTime), N'SystemAdmin', N'', CAST(0x0000A71A0092322C AS DateTime), CAST(0x0000A71A0092322C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A71A00927D2C AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (38, 61, CAST(0x0000A76700E8AC10 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (40, 63, CAST(0x0000A7670109A2BC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (41, 64, CAST(0x0000A767010BFF6C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (42, 65, CAST(0x0000A7700098EE00 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A770009C46A4 AS DateTime), CAST(0x0000A770009C46A4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A770009C5130 AS DateTime), CAST(0x0000A770009C5130 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A770009F6CE4 AS DateTime), CAST(0x0000A770009F6CE4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (43, 66, CAST(0x0000A77000EDED60 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A77000EE686C AS DateTime), CAST(0x0000A77000EE686C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A77000EF53F8 AS DateTime), CAST(0x0000A77000EF53F8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A77000EFAE34 AS DateTime), CAST(0x0000A77000EFAE34 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A77000EFD288 AS DateTime), CAST(0x0000A77000EFD288 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A77000EFE9F8 AS DateTime), CAST(0x0000A77000EFE9F8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A77000EFF484 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (44, 67, CAST(0x0000A77400FB7FFC AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A77400FB9C1C AS DateTime), CAST(0x0000A77400FB9C1C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A77400FC9B94 AS DateTime), CAST(0x0000A77400FC9B94 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (45, 68, CAST(0x0000A7D000A8A764 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A7D000AA1F90 AS DateTime), CAST(0x0000A7D000AA1F90 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D000AA2FF8 AS DateTime), CAST(0x0000A7D000AA2FF8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D10108F420 AS DateTime), CAST(0x0000A7D10108F420 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D101090CBC AS DateTime), CAST(0x0000A7D101090CBC AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D10109161C AS DateTime), CAST(0x0000A7D10109161C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D101091E50 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (46, 69, CAST(0x0000A7D0010404D8 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A7D001050B58 AS DateTime), CAST(0x0000A7D001050B58 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D001052520 AS DateTime), CAST(0x0000A7D001052520 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (47, 70, CAST(0x0000A7D001043610 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A7D0010507D4 AS DateTime), CAST(0x0000A7D0010507D4 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D001052070 AS DateTime), CAST(0x0000A7D001052070 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (48, 71, CAST(0x0000A7D001046748 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A7D0010501F8 AS DateTime), CAST(0x0000A7D0010501F8 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D001051BC0 AS DateTime), CAST(0x0000A7D001051BC0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (49, 72, CAST(0x0000A7D100B65AD0 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A7D100B689B0 AS DateTime), CAST(0x0000A7D100B689B0 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D100B6943C AS DateTime), CAST(0x0000A7D100B6943C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D600A2E8B0 AS DateTime), CAST(0x0000A7D600A2E8B0 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D600A30F5C AS DateTime), CAST(0x0000A7D600A30F5C AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D600A31C40 AS DateTime), CAST(0x0000A7D600A31C40 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D600A32474 AS DateTime))
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (50, 73, CAST(0x0000A7D100B77D70 AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A7D100B79D14 AS DateTime), CAST(0x0000A7D100B79D14 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7D100B7A674 AS DateTime), CAST(0x0000A7D100B7A674 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_TranProcess] ([Id], [FK_BidId], [AcceptDate], [AcceptName], [AcceptSay], [AcceptSayDate], [AuditDate], [AuditName], [AuditSay], [AuditSayDate], [TradingDate], [TradingName], [TradingSay], [TradingSayDate], [AttestationDate], [AttestationName], [AttestationSay], [AttestationSayDate], [HeadDate], [HeadName], [HeadSay], [HeadSayDate], [SuperDate], [SuperName], [SuperSay], [SuperSayDate]) VALUES (51, 74, CAST(0x0000A7E4009B391C AS DateTime), N'SystemAdmin', N'审核通过', CAST(0x0000A7E4009B8548 AS DateTime), CAST(0x0000A7E4009B8548 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7E4009B9A60 AS DateTime), CAST(0x0000A7E4009B9A60 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7E700912954 AS DateTime), CAST(0x0000A7E700912954 AS DateTime), N'SystemAdmin', N'', CAST(0x0000A7E700916194 AS DateTime), CAST(0x0000A7E700916194 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[T_TranProcess] OFF
/****** Object:  Table [dbo].[T_TempUser]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TempUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_LiceTranId] [int] NOT NULL,
	[TempLogName] [nvarchar](50) NOT NULL,
	[TempLogPass] [nvarchar](50) NOT NULL,
	[TempStatus] [int] NOT NULL,
	[CloseDateTime] [datetime] NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_TempUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_SysLog]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_SysLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogValue] [nvarchar](150) NOT NULL,
	[Operates] [nvarchar](50) NOT NULL,
	[IpAdd] [varchar](50) NOT NULL,
	[MacAdd] [varchar](50) NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_SysLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_SysFun]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SysFun](
	[NodeId] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[NodeURL] [nvarchar](50) NULL,
	[DisplayOrder] [int] NOT NULL,
	[ParentNodeId] [int] NOT NULL,
	[FunImgNum] [nvarchar](10) NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_SysFun] PRIMARY KEY CLUSTERED 
(
	[NodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_SysFun] ON
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (1, N'系统管理', N'', 1, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (2, N'权限管理', N'', 2, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (3, N'数据字典', N'', 3, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (4, N'用户管理', N'', 4, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (5, N'前台受理', N'', 5, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (6, N'市场受理', N'', 6, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (7, N'产权交易', N'', 7, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (8, N'产权鉴证', N'', 8, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (9, N'分管领导', N'', 9, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (10, N'主管领导', N'', 10, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (11, N'证书管理', N'', 11, 1111, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (12, N'产权档案', N'', 12, 1212, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (13, N'数据汇总', N'', 13, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (14, N'纠纷仲裁', N'', 14, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (15, N'抵押贷款', N'', 15, 100, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (16, N'网站管理', N'', 16, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (17, N'新闻管理', N'WebMana/News.aspx', 3, 16, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (18, N'意向管理', N'WebMana/WebInten.aspx', 4, 16, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (19, N'系统菜单', N'Sys/SysFun.aspx', 1, 1, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (20, N'组织单位', N'Sys/Org.aspx', 2, 1, N'nav', N'System', CAST(0x0000A619009A1AA1 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (21, N'操作日志', N'Sys/Logs.aspx', 3, 1, N'nav', N'System', CAST(0x0000A619009A6AAA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (22, N'通信录', N'Sys/Contacts.aspx', 4, 1, N'nav', N'System', CAST(0x0000A61900A17203 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (23, N'通知公告', N'Sys/Placard.aspx', 5, 1, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (24, N'用户权限', N'Power/Roleper.aspx', 1, 2, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (25, N'类型权限', N'Power/Permis.aspx', 2, 2, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (26, N'系统管理员', N'Us/Admin.aspx', 1, 4, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (27, N'管理员类型', N'Dic/AdminType.aspx', 1, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (28, N'转出方式', N'Dic/TurnOutType.aspx', 1, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (29, N'挂牌类型', N'Dic/StandardType.aspx', 2, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (30, N'岗位类型', N'Dic/JobType.aspx', 3, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (31, N'会员类型', N'Dic/MemberType.aspx', 4, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (32, N'挂牌方式', N'Dic/StandardMode.aspx', 5, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (33, N'产权类型', N'Dic/PropertyType.aspx', 6, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (34, N'上传指标类型', N'Dic/UploadTypeIndicator.aspx', 7, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (35, N'指标对应关系', N'Dic/IndRel.aspx', 8, 3, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (36, N'认证会员', N'Us/WebUser.aspx', 2, 4, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (37, N'短信设置', N'Sys/PhoneCode.aspx', 5, 111, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (38, N'出让方管理', N'Lt/LiceOrTran.aspx', 1, 5, N'', N'SystemAdmin', CAST(0x0000A7C300F06E40 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (39, N'会员管理', N'WebMana/User.aspx', 1, 16, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (40, N'新闻类型', N'WebMana/NewsType.aspx', 2, 16, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (41, N'标出让申请', N'Bi/BidPage.aspx', 3, 5, N'', N'SystemAdmin', CAST(0x0000A7C300F061B8 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (42, N'标意向受让申请', N'Bi/BidTr.aspx', 3, 5, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (43, N'流转交易申请', N'Bi/TranAcc.aspx', 1, 6, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (44, N'组织交易', N'Bi/Agreement.aspx', 1, 7, N'', N'SystemAdmin', CAST(0x0000A6FD00E4E929 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (45, N'一次竞价', N'Bi/OneAgree.aspx', 2, 7, N'nav', N'System', CAST(0x0000A60F00B2428C AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (46, N'二次竞价', N'Bi/TwoAgree.aspx', 3, 7, N'nav', N'System', CAST(0x0000A60F00B25259 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (47, N'产权交易鉴证', N'Bi/Attestation.aspx', 1, 8, N'nav', N'System', CAST(0x0000A61100F37723 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (48, N'鉴证书打印', N'Bi/AttestationPrint.aspx', 4, 8, N'nav', N'System', CAST(0x0000A61100F38FDB AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (49, N'分管领导审核', N'Bi/Head.aspx', 1, 9, N'nav', N'System', CAST(0x0000A6120091AD10 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (50, N'主管领导审核', N'Bi/Super.aspx', 1, 10, N'nav', N'System', CAST(0x0000A6120091B91D AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (51, N'合理低价法', N'', 4, 777, N'nav', N'System', CAST(0x0000A612009912CE AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (52, N'纠纷仲裁处理', N'Zc/Arbi.aspx', 1, 14, N'nav', N'System', CAST(0x0000A61200000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (53, N'交易审核上报', N'Bi/AuditReport.aspx', 5, 7, N'nav', N'System', CAST(0x0000A62700A034AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (54, N' 鉴证审核上报', N'Bi/AttAuditReport.aspx', 3, 8, N'nav', N'System', CAST(0x0000A59F00000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (55, N'生成合同/传附件', N'Bi/AttContractNo.aspx', 4, 7, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (56, N'产权交易汇总', N'Data/Summary.aspx', 1, 13, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (57, N'友情连接', N'Sys/Links.aspx', 6, 1, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (58, N'修改密码', N'Us/UpPass.aspx', 3, 4, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (59, N'变更登记', N'VerMana/Change.aspx', 1, 1111, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (60, N'遗失补办', N'VerMana/Loss.aspx', 2, 1111, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (61, N'注销登记', N'VerMana/Logouts.aspx', 3, 1111, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (62, N'产权交易登记', N'Files/Demands.aspx', 1, 12, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (63, N'外站嵌套', N'https://www.baidu.com/', 1, 1, N'nav', N'SystemAdmin', CAST(0x0000A647011C5F31 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (64, N'测试', N'WebMana/addNews.aspx', 15, 16, N'', N'SystemAdmin', CAST(0x0000A6A9011296AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (65, N'新闻信息', N'WebMana/Newslist.aspx', 6, 16, N'', N'SystemAdmin', CAST(0x0000A6BA00860403 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (66, N'网站头设置', N'WebMana/wztoulist.aspx', 8, 16, N'', N'SystemAdmin', CAST(0x0000A6CD0086A5A7 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (67, N'分管打印申请审核', N'Bi/Headsqs.aspx', 1, 9, N'', N'SystemAdmin', CAST(0x0000A6F80104EB8B AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (68, N'主管打印申请审核', N'Bi/Supersqs.aspx', 1, 10, N'', N'SystemAdmin', CAST(0x0000A6F80104DCF9 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (69, N'项目备案', N'Bi/Xmbeian.aspx', 4, 5, N'', N'SystemAdmin', CAST(0x0000A6F9009AF42B AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (70, N'项目备案审核', N'Bi/Xmbeiansh.aspx', 1, 6, N'', N'SystemAdmin', CAST(0x0000A6F901049D83 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (71, N'友情链接管理', N'WebMana/yqlist.aspx', 9, 16, N'', N'SystemAdmin', CAST(0x0000A71400DFE2D8 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (72, N'档案管理', N'', 12, 0, N'', N'SystemAdmin', CAST(0x0000A72000E34018 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (73, N'鉴证档案', N'Bi/biddangan.aspx', 1, 72, N'', N'SystemAdmin', CAST(0x0000A72000F5B402 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (74, N'项目公告管理', N'WebMana/xmgglist.aspx', 8, 16, N'', N'SystemAdmin', CAST(0x0000A73F0100E02A AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (75, N'线下交易', N'Bi/AgreementXX.aspx', 1, 7, N'', N'SystemAdmin', CAST(0x0000A740009358CA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (76, N'受让方管理', N'Lt/LiceOrTran2.aspx', 2, 5, N'', N'SystemAdmin', CAST(0x0000A7C300F04EE0 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (77, N'一次竞价新', N'dzjj/jbone.aspx', 1, 7, N'', N'SystemAdmin', CAST(0x0000A7D100ED37B2 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (78, N'二次竞价新', N'dzjj/jbtwo.aspx', 1, 7, N'', N'SystemAdmin', CAST(0x0000A7D100ED7D9B AS DateTime))
SET IDENTITY_INSERT [dbo].[T_SysFun] OFF
/****** Object:  Table [dbo].[T_StandardType]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_StandardType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StandardTypeName] [nvarchar](50) NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_StandardType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_StandardType] ON
INSERT [dbo].[T_StandardType] ([Id], [StandardTypeName], [Editor], [CreateDate]) VALUES (1, N'不变更挂牌条件，按照10日为一个周期延长挂牌，直至征集到意向受让方。', N'admin', CAST(0x0000A5FB0108FBDF AS DateTime))
INSERT [dbo].[T_StandardType] ([Id], [StandardTypeName], [Editor], [CreateDate]) VALUES (2, N'变更挂牌条件，重新挂牌。', N'admin', CAST(0x0000A5FB01091494 AS DateTime))
INSERT [dbo].[T_StandardType] ([Id], [StandardTypeName], [Editor], [CreateDate]) VALUES (3, N'自然撤牌。', N'admin', CAST(0x0000A5FB01093918 AS DateTime))
INSERT [dbo].[T_StandardType] ([Id], [StandardTypeName], [Editor], [CreateDate]) VALUES (4, N'其他：未知的原因。', N'admin', CAST(0x0000A5FB01094997 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_StandardType] OFF
/****** Object:  Table [dbo].[T_StandardMode]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_StandardMode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StandardModeName] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_StandardMode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_StandardMode] ON
INSERT [dbo].[T_StandardMode] ([Id], [StandardModeName], [Editor], [CreateDate]) VALUES (1, N'协议', N'Systerm', CAST(0x0000A5FB0110305E AS DateTime))
INSERT [dbo].[T_StandardMode] ([Id], [StandardModeName], [Editor], [CreateDate]) VALUES (2, N'一次竞价', N'Systerm', CAST(0x0000A619009D60F1 AS DateTime))
INSERT [dbo].[T_StandardMode] ([Id], [StandardModeName], [Editor], [CreateDate]) VALUES (3, N'二次竞价', N'Systerm', CAST(0x0000A5FB01104A67 AS DateTime))
INSERT [dbo].[T_StandardMode] ([Id], [StandardModeName], [Editor], [CreateDate]) VALUES (4, N'招投标', N'SystemAdmin', CAST(0x0000A7C800AAA029 AS DateTime))
INSERT [dbo].[T_StandardMode] ([Id], [StandardModeName], [Editor], [CreateDate]) VALUES (5, N'拍卖', N'SystemAdmin', CAST(0x0000A7C800AAAB8F AS DateTime))
INSERT [dbo].[T_StandardMode] ([Id], [StandardModeName], [Editor], [CreateDate]) VALUES (6, N'竞价', N'SystemAdmin', CAST(0x0000A77400FB070C AS DateTime))
SET IDENTITY_INSERT [dbo].[T_StandardMode] OFF
/****** Object:  Table [dbo].[T_SoftReg]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SoftReg](
	[SequenceNumber] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[T_SoftReg] ([SequenceNumber]) VALUES (N'B4A68088CE65028E65041468B2EF2B59D0F3478BD82590E6111015BF1ECDAD4DB9EEA86E13363C4698F57B17458801F1F6895B1783C93BD8231DD3C776AA929428042593EA89D99C                                                        ')
/****** Object:  Table [dbo].[T_ShortMessageSending]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ShortMessageSending](
	[Uid] [nvarchar](150) NOT NULL,
	[Key] [varchar](300) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[T_ShortMessageSending] ([Uid], [Key]) VALUES (N'nanchangchanquanzhongxin', N'b1f2751cb844d83703a0')
/****** Object:  Table [dbo].[T_ShieldingUsers]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ShieldingUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserMac] [varchar](100) NULL,
 CONSTRAINT [PK_ShieldingUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_ShieldingUsers] ON
INSERT [dbo].[T_ShieldingUsers] ([Id], [UserMac]) VALUES (3, N'')
SET IDENTITY_INSERT [dbo].[T_ShieldingUsers] OFF
/****** Object:  Table [dbo].[T_RolePermissions]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_RolePermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminUserId] [int] NOT NULL,
	[SysFunId] [int] NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_RoleRight] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_RolePermissions] ON
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (60, 4, 1, N'System', CAST(0x0000A61900A1963D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (61, 4, 19, N'System', CAST(0x0000A61900A1963F AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (62, 4, 20, N'System', CAST(0x0000A61900A1963F AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (131, 10, 1, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (132, 10, 19, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (133, 10, 20, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (134, 10, 21, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (135, 10, 22, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (136, 10, 5, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (137, 10, 38, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (138, 10, 41, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (139, 10, 42, N'张伟伟', CAST(0x0000A6340117D9A3 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (140, 9, 1, N'张伟伟', CAST(0x0000A63401182674 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (141, 9, 19, N'张伟伟', CAST(0x0000A63401182674 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (142, 9, 20, N'张伟伟', CAST(0x0000A63401182674 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (143, 9, 21, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (144, 9, 2, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (145, 9, 24, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (146, 9, 25, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (147, 9, 3, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (148, 9, 27, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (149, 9, 4, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (150, 9, 26, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (151, 9, 36, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (152, 9, 5, N'张伟伟', CAST(0x0000A63401182675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (153, 9, 38, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (154, 9, 41, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (155, 9, 42, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (156, 9, 6, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (157, 9, 43, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (158, 9, 7, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (159, 9, 44, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (160, 9, 45, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (161, 9, 46, N'张伟伟', CAST(0x0000A63401182676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (162, 9, 53, N'张伟伟', CAST(0x0000A63401182677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (465, 11, 5, N'admin', CAST(0x0000A65C00B30277 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (466, 11, 38, N'admin', CAST(0x0000A65C00B3027C AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (467, 11, 41, N'admin', CAST(0x0000A65C00B3027D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (468, 11, 42, N'admin', CAST(0x0000A65C00B3027D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (469, 12, 6, N'SystemAdmin', CAST(0x0000A65C00B492F1 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (470, 12, 43, N'SystemAdmin', CAST(0x0000A65C00B492F4 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (471, 13, 7, N'SystemAdmin', CAST(0x0000A65C00B4A1CE AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (472, 13, 44, N'SystemAdmin', CAST(0x0000A65C00B4A1CE AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (473, 13, 45, N'SystemAdmin', CAST(0x0000A65C00B4A1CE AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (474, 13, 46, N'SystemAdmin', CAST(0x0000A65C00B4A1CE AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (475, 13, 55, N'SystemAdmin', CAST(0x0000A65C00B4A1CE AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (476, 13, 53, N'SystemAdmin', CAST(0x0000A65C00B4A1CE AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (477, 14, 8, N'SystemAdmin', CAST(0x0000A65C00B6DEE6 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (478, 14, 47, N'SystemAdmin', CAST(0x0000A65C00B6DEE6 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (479, 14, 54, N'SystemAdmin', CAST(0x0000A65C00B6DEE6 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (480, 14, 48, N'SystemAdmin', CAST(0x0000A65C00B6DEE6 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (481, 15, 16, N'admin', CAST(0x0000A65C00BABC16 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (482, 15, 39, N'admin', CAST(0x0000A65C00BABC16 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (483, 15, 40, N'admin', CAST(0x0000A65C00BABC16 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (484, 15, 17, N'admin', CAST(0x0000A65C00BABC16 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (485, 15, 18, N'admin', CAST(0x0000A65C00BABC16 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (486, 16, 1, N'admin', CAST(0x0000A67600AC2668 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (487, 16, 63, N'admin', CAST(0x0000A67600AC2674 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (488, 16, 20, N'admin', CAST(0x0000A67600AC2674 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (489, 16, 21, N'admin', CAST(0x0000A67600AC2674 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (490, 16, 22, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (491, 16, 23, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (492, 16, 57, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (493, 16, 2, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (494, 16, 24, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (495, 16, 25, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (496, 16, 3, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (497, 16, 27, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (498, 16, 28, N'admin', CAST(0x0000A67600AC2675 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (499, 16, 29, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (500, 16, 30, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (501, 16, 31, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (502, 16, 32, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (503, 16, 33, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (504, 16, 34, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (505, 16, 35, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (506, 16, 4, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (507, 16, 26, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (508, 16, 36, N'admin', CAST(0x0000A67600AC2676 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (509, 16, 58, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (510, 16, 5, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (511, 16, 38, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (512, 16, 41, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (513, 16, 42, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (514, 16, 6, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (515, 16, 43, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (516, 16, 7, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (517, 16, 44, N'admin', CAST(0x0000A67600AC2677 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (518, 16, 45, N'admin', CAST(0x0000A67600AC2678 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (519, 16, 46, N'admin', CAST(0x0000A67600AC2678 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (520, 16, 55, N'admin', CAST(0x0000A67600AC2678 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (521, 16, 53, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (522, 16, 8, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (523, 16, 47, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (524, 16, 54, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (525, 16, 48, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (526, 16, 9, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (527, 16, 49, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (528, 16, 10, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (529, 16, 50, N'admin', CAST(0x0000A67600AC2679 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (584, 17, 16, N'admin', CAST(0x0000A6890098DEF4 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (585, 17, 39, N'admin', CAST(0x0000A6890098DEFB AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (586, 17, 40, N'admin', CAST(0x0000A6890098DEFC AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (587, 17, 17, N'admin', CAST(0x0000A6890098DEFD AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (588, 17, 18, N'admin', CAST(0x0000A6890098DEFD AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (757, 18, 64, N'admin', CAST(0x0000A6CE00E99724 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (761, 19, 64, N'admin', CAST(0x0000A6F0008EC355 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (762, 1, 1, N'admin', CAST(0x0000A770009CFB6B AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (763, 1, 19, N'admin', CAST(0x0000A770009CFB75 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (764, 1, 63, N'admin', CAST(0x0000A770009CFB75 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (765, 1, 20, N'admin', CAST(0x0000A770009CFB75 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (766, 1, 21, N'admin', CAST(0x0000A770009CFB75 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (767, 1, 22, N'admin', CAST(0x0000A770009CFB76 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (768, 1, 23, N'admin', CAST(0x0000A770009CFB76 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (769, 1, 57, N'admin', CAST(0x0000A770009CFB76 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (770, 1, 2, N'admin', CAST(0x0000A770009CFB76 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (771, 1, 24, N'admin', CAST(0x0000A770009CFB76 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (772, 1, 25, N'admin', CAST(0x0000A770009CFB77 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (773, 1, 3, N'admin', CAST(0x0000A770009CFB77 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (774, 1, 27, N'admin', CAST(0x0000A770009CFB77 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (775, 1, 28, N'admin', CAST(0x0000A770009CFB77 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (776, 1, 29, N'admin', CAST(0x0000A770009CFB77 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (777, 1, 30, N'admin', CAST(0x0000A770009CFB78 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (778, 1, 31, N'admin', CAST(0x0000A770009CFB78 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (779, 1, 32, N'admin', CAST(0x0000A770009CFB78 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (780, 1, 33, N'admin', CAST(0x0000A770009CFB78 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (781, 1, 34, N'admin', CAST(0x0000A770009CFB78 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (782, 1, 35, N'admin', CAST(0x0000A770009CFB78 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (783, 1, 4, N'admin', CAST(0x0000A770009CFB78 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (784, 1, 26, N'admin', CAST(0x0000A770009CFB79 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (785, 1, 36, N'admin', CAST(0x0000A770009CFB79 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (786, 1, 58, N'admin', CAST(0x0000A770009CFB79 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (787, 1, 5, N'admin', CAST(0x0000A770009CFB79 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (788, 1, 38, N'admin', CAST(0x0000A770009CFB79 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (789, 1, 41, N'admin', CAST(0x0000A770009CFB7A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (790, 1, 42, N'admin', CAST(0x0000A770009CFB7A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (791, 1, 69, N'admin', CAST(0x0000A770009CFB7A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (792, 1, 6, N'admin', CAST(0x0000A770009CFB7A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (793, 1, 43, N'admin', CAST(0x0000A770009CFB7A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (794, 1, 70, N'admin', CAST(0x0000A770009CFB7B AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (795, 1, 7, N'admin', CAST(0x0000A770009CFB7B AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (796, 1, 44, N'admin', CAST(0x0000A770009CFB7B AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (797, 1, 75, N'admin', CAST(0x0000A770009CFB7B AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (798, 1, 45, N'admin', CAST(0x0000A770009CFB7B AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (799, 1, 46, N'admin', CAST(0x0000A770009CFB7B AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (800, 1, 55, N'admin', CAST(0x0000A770009CFB7B AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (801, 1, 53, N'admin', CAST(0x0000A770009CFB7C AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (802, 1, 8, N'admin', CAST(0x0000A770009CFB7C AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (803, 1, 47, N'admin', CAST(0x0000A770009CFB7C AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (804, 1, 54, N'admin', CAST(0x0000A770009CFB7D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (805, 1, 48, N'admin', CAST(0x0000A770009CFB7D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (806, 1, 9, N'admin', CAST(0x0000A770009CFB7D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (807, 1, 49, N'admin', CAST(0x0000A770009CFB7D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (808, 1, 67, N'admin', CAST(0x0000A770009CFB7D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (809, 1, 10, N'admin', CAST(0x0000A770009CFB7D AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (810, 1, 50, N'admin', CAST(0x0000A770009CFB7E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (811, 1, 68, N'admin', CAST(0x0000A770009CFB7E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (812, 1, 72, N'admin', CAST(0x0000A770009CFB7E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (813, 1, 73, N'admin', CAST(0x0000A770009CFB7E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (814, 1, 13, N'admin', CAST(0x0000A770009CFB7E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (815, 1, 56, N'admin', CAST(0x0000A770009CFB7F AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (816, 1, 14, N'admin', CAST(0x0000A770009CFB7F AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (817, 1, 52, N'admin', CAST(0x0000A770009CFB7F AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (818, 1, 16, N'admin', CAST(0x0000A770009CFB7F AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (819, 1, 39, N'admin', CAST(0x0000A770009CFB7F AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (820, 1, 40, N'admin', CAST(0x0000A770009CFB7F AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (821, 1, 17, N'admin', CAST(0x0000A770009CFB80 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (822, 1, 18, N'admin', CAST(0x0000A770009CFB80 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (823, 1, 65, N'admin', CAST(0x0000A770009CFB80 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (824, 1, 66, N'admin', CAST(0x0000A770009CFB80 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (825, 1, 74, N'admin', CAST(0x0000A770009CFB80 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (826, 1, 71, N'admin', CAST(0x0000A770009CFB81 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (827, 1, 64, N'admin', CAST(0x0000A770009CFB81 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_RolePermissions] OFF
/****** Object:  Table [dbo].[T_PropertyType]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_PropertyType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeName] [nvarchar](50) NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_PropertyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_PropertyType] ON
INSERT [dbo].[T_PropertyType] ([Id], [PropertyTypeName], [Editor], [CreateDate]) VALUES (1, N'土地承包', N'SystemAdmin', CAST(0x0000A6EB009FEE22 AS DateTime))
INSERT [dbo].[T_PropertyType] ([Id], [PropertyTypeName], [Editor], [CreateDate]) VALUES (2, N'农村集体经营性资产', N'SystemAdmin', CAST(0x0000A6EB00A002CA AS DateTime))
INSERT [dbo].[T_PropertyType] ([Id], [PropertyTypeName], [Editor], [CreateDate]) VALUES (3, N'四荒地', N'admin', CAST(0x0000A5FB011BA3FF AS DateTime))
INSERT [dbo].[T_PropertyType] ([Id], [PropertyTypeName], [Editor], [CreateDate]) VALUES (4, N'知识产权', N'SystemAdmin', CAST(0x0000A6EB00A0152A AS DateTime))
INSERT [dbo].[T_PropertyType] ([Id], [PropertyTypeName], [Editor], [CreateDate]) VALUES (5, N'其他', N'admin', CAST(0x0000A5FB011BBC8C AS DateTime))
SET IDENTITY_INSERT [dbo].[T_PropertyType] OFF
/****** Object:  Table [dbo].[T_Placard]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Placard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlacardTitle] [nvarchar](200) NOT NULL,
	[PlacardContent] [text] NOT NULL,
	[Publisher] [nvarchar](500) NOT NULL,
	[ReleaseTime] [datetime] NOT NULL,
	[NumClicks] [int] NOT NULL,
	[DepName] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_T_Placard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Placard] ON
INSERT [dbo].[T_Placard] ([Id], [PlacardTitle], [PlacardContent], [Publisher], [ReleaseTime], [NumClicks], [DepName]) VALUES (1, N'通告', N'规范产权交易相关对顶', N'张伟伟', CAST(0x0000A6330114F720 AS DateTime), 19, N'南昌市农村综合产权交易中心')
SET IDENTITY_INSERT [dbo].[T_Placard] OFF
/****** Object:  Table [dbo].[T_Permissions]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminTypeId] [int] NOT NULL,
	[SysFunId] [int] NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Permissions] ON
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (145, 4, 6, N'admin', CAST(0x0000A65C00B9ABE9 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (146, 4, 43, N'admin', CAST(0x0000A65C00B9ABF7 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (147, 5, 7, N'admin', CAST(0x0000A65C00B9B88F AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (148, 5, 44, N'admin', CAST(0x0000A65C00B9B88F AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (149, 5, 45, N'admin', CAST(0x0000A65C00B9B88F AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (150, 5, 46, N'admin', CAST(0x0000A65C00B9B88F AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (151, 5, 55, N'admin', CAST(0x0000A65C00B9B88F AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (152, 5, 53, N'admin', CAST(0x0000A65C00B9B88F AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (153, 6, 8, N'admin', CAST(0x0000A65C00B9C213 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (154, 6, 47, N'admin', CAST(0x0000A65C00B9C213 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (155, 6, 54, N'admin', CAST(0x0000A65C00B9C213 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (156, 6, 48, N'admin', CAST(0x0000A65C00B9C213 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (157, 7, 9, N'admin', CAST(0x0000A65C00B9CA80 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (158, 7, 49, N'admin', CAST(0x0000A65C00B9CA80 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (159, 8, 10, N'admin', CAST(0x0000A65C00B9D5ED AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (160, 8, 50, N'admin', CAST(0x0000A65C00B9D5ED AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (298, 2, 16, N'admin', CAST(0x0000A6890098998F AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (299, 2, 39, N'admin', CAST(0x0000A68900989991 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (300, 2, 40, N'admin', CAST(0x0000A68900989991 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (301, 2, 17, N'admin', CAST(0x0000A68900989991 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (302, 2, 18, N'admin', CAST(0x0000A68900989992 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (304, 9, 1, N'admin', CAST(0x0000A6CD010B4338 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (305, 9, 19, N'admin', CAST(0x0000A6CD010B433B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (306, 9, 63, N'admin', CAST(0x0000A6CD010B433B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (426, 3, 5, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (427, 3, 38, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (428, 3, 41, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (429, 3, 42, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (430, 3, 69, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (684, 1, 1, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (685, 1, 19, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (686, 1, 63, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (687, 1, 20, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (688, 1, 21, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (689, 1, 22, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (690, 1, 23, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (691, 1, 57, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (692, 1, 2, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (693, 1, 24, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (694, 1, 25, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (695, 1, 3, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (696, 1, 27, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (697, 1, 28, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (698, 1, 29, N'admin', CAST(0x0000A7D100ED96CF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (699, 1, 30, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (700, 1, 31, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (701, 1, 32, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (702, 1, 33, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (703, 1, 34, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (704, 1, 35, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (705, 1, 4, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (706, 1, 26, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (707, 1, 36, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (708, 1, 58, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (709, 1, 5, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (710, 1, 38, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (711, 1, 41, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (712, 1, 42, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (713, 1, 69, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (714, 1, 6, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (715, 1, 43, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (716, 1, 70, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (717, 1, 7, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (718, 1, 44, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (719, 1, 77, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (720, 1, 78, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (721, 1, 45, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (722, 1, 46, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (723, 1, 55, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (724, 1, 53, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (725, 1, 8, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (726, 1, 47, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (727, 1, 54, N'admin', CAST(0x0000A7D100ED96D4 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (728, 1, 48, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (729, 1, 9, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (730, 1, 49, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (731, 1, 67, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (732, 1, 10, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (733, 1, 50, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (734, 1, 68, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (735, 1, 72, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (736, 1, 73, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (737, 1, 13, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (738, 1, 56, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (739, 1, 14, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (740, 1, 52, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (741, 1, 16, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (742, 1, 39, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (743, 1, 40, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (744, 1, 17, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (745, 1, 18, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (746, 1, 65, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (747, 1, 66, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (748, 1, 74, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (749, 1, 71, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (750, 1, 64, N'admin', CAST(0x0000A7D100ED96D8 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Permissions] OFF
/****** Object:  Table [dbo].[T_Organization]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Organization](
	[OrgCode] [varchar](300) NOT NULL,
	[OrgName] [nvarchar](500) NOT NULL,
	[OrgShortName] [nvarchar](50) NOT NULL,
	[UpOrgCode] [varchar](300) NOT NULL,
	[Seq] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[ShengCode] [char](10) NULL,
	[ShiCode] [char](10) NULL,
	[XianCode] [char](10) NULL,
	[XiangCode] [char](10) NULL,
	[CunCode] [char](10) NULL,
	[ZuCode] [char](10) NULL,
 CONSTRAINT [PK_T_Organization] PRIMARY KEY CLUSTERED 
(
	[OrgCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'00', N'中华人民共和国农业部', N'农业部', N'0', 1, 6, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'36', N'江西省', N'江西省', N'00', 2, 5, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3601', N'南昌市', N'南昌市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360102', N'江西省南昌市南昌县', N'南昌县', N'3601', 4, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360103', N'江西省南昌市东湖区', N'东湖区', N'3601', 5, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360104', N'江西省南昌市西湖区', N'西湖区', N'3601', 6, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360105', N'江西省南昌市新建区', N'新建区', N'3601', 7, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360111', N'江西省南昌市进贤县', N'进贤县', N'3601', 8, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360121', N'江西省南昌市安义县', N'安义县', N'3601', 9, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360122', N'江西省南昌市青云谱区', N'青云谱区', N'3601', 10, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360123', N'江西省南昌市青山湖区', N'青山湖区', N'3601', 11, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360124', N'江西省南昌市高新区', N'高新区', N'3601', 12, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360125', N'江西省南昌市经开区', N'经开区', N'3601', 5, 3, N'36        ', N'01        ', N'25        ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360126', N'江西省南昌市红谷滩区', N'红谷滩区', N'3601', 6, 3, N'36        ', N'01        ', N'26        ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360127', N'江西省南昌市湾里区', N'湾里区', N'3601', 7, 3, N'36        ', N'01        ', N'27        ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3602', N'景德镇市', N'景德镇市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3603', N'萍乡市', N'萍乡市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3604', N'九江市', N'九江市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3605', N'新余市', N'新余市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3606', N'鹰潭市', N'鹰潭市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360601', N'市辖区', N'市辖区', N'3606', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360602', N'月湖区', N'月湖区', N'3606', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622', N'余江县', N'余江县', N'3606', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622100', N'邓埠镇', N'邓埠镇', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622101', N'锦江镇', N'锦江镇', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622102', N'潢溪镇', N'潢溪镇', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622103', N'中童镇', N'中童镇', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622104', N'马荃镇', N'马荃镇', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622105', N'画桥镇', N'画桥镇', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622106', N'春涛镇', N'春涛镇', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622200', N'平定乡', N'平定乡', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622202', N'杨溪乡', N'杨溪乡', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622203', N'洪湖乡', N'洪湖乡', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622204', N'黄庄乡', N'黄庄乡', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360622205', N'刘家站乡', N'刘家站乡', N'360622', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'360681', N'贵溪市', N'贵溪市', N'3606', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3607', N'赣州市', N'赣州市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3608', N'吉安市', N'吉安市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3609', N'宜春市', N'宜春市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3610', N'抚州市', N'抚州市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3611', N'上饶市', N'上饶市', N'36', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'37', N'山东省', N'山东省', N'00', 1, 5, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'45', N'广西省', N'广西省', N'00', 1, 5, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4501', N'南宁市', N'南宁市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4502', N'柳州市', N'柳州市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4503', N'桂林市', N'桂林市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4504', N'梧州市', N'梧州市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450401', N'市辖区', N'市辖区', N'4504', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450403', N'万秀区', N'万秀区', N'4504', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450405', N'长洲区', N'长洲区', N'4504', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450405001', N'大塘街道办事处', N'大塘街道办事处', N'450405', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450405002', N'兴龙街道办事处', N'兴龙街道办事处', N'450405', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450405101', N'长洲镇', N'长洲镇', N'450405', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450405102', N'倒水镇', N'倒水镇', N'450405', 1, 2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450406', N'龙圩区', N'龙圩区', N'4504', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450421', N'苍梧县', N'苍梧县', N'4504', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450422', N'藤县', N'藤县', N'4504', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450423', N'蒙山县', N'蒙山县', N'4504', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'450481', N'岑溪市', N'岑溪市', N'4504', 1, 3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4505', N'北海市', N'北海市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4506', N'防城港市', N'防城港市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4507', N'钦州市', N'钦州市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4508', N'贵港市', N'贵港市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4509', N'玉林市', N'玉林市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4510', N'百色市', N'百色市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4511', N'贺州市', N'贺州市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4512', N'河池市', N'河池市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4513', N'来宾市', N'来宾市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'4514', N'崇左市', N'崇左市', N'45', 1, 4, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ')
/****** Object:  Table [dbo].[T_OnlineNumber]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_OnlineNumber](
	[OnlineNumber] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[T_OnlineNumber] ([OnlineNumber]) VALUES (51)
/****** Object:  Table [dbo].[T_Notice]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Notice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[newsid] [varchar](50) NULL,
	[beizhu] [varchar](50) NULL,
 CONSTRAINT [PK_T_Notice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_Notice] ON
INSERT [dbo].[T_Notice] ([id], [newsid], [beizhu]) VALUES (2, N'78', NULL)
INSERT [dbo].[T_Notice] ([id], [newsid], [beizhu]) VALUES (3, N'97', NULL)
INSERT [dbo].[T_Notice] ([id], [newsid], [beizhu]) VALUES (4, N'96', NULL)
INSERT [dbo].[T_Notice] ([id], [newsid], [beizhu]) VALUES (5, N'95', NULL)
INSERT [dbo].[T_Notice] ([id], [newsid], [beizhu]) VALUES (6, N'94', NULL)
SET IDENTITY_INSERT [dbo].[T_Notice] OFF
/****** Object:  Table [dbo].[T_NewsType]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_NewsType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsTypeName] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_NewsType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_NewsType] ON
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (1, N'新闻中心', N'System', CAST(0x0000A60C00EFD664 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (2, N'政策法规', N'System', CAST(0x0000A60C00EE1265 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (3, N'交易规则', N'System', CAST(0x0000A60C00EE1D69 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (4, N'办事指南', N'System', CAST(0x0000A60C00EE2AB9 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (5, N'专题活动', N'System', CAST(0x0000A60C00EE3651 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (6, N'帮助中心', N'System', CAST(0x0000A60C00EE6707 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (7, N'关于我们', N'System', CAST(0x0000A60C00EE7005 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (8, N'资料下载', N'System', CAST(0x0000A61300B79C72 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (9, N'通知公告', N'System', CAST(0x0000A660011444EF AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (10, N'股份权能改革', N'system', CAST(0x0000A66C0100E577 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (11, N'业务办理', N'SystemAdmin', CAST(0x0000A6F200E75374 AS DateTime))
INSERT [dbo].[T_NewsType] ([Id], [NewsTypeName], [Editor], [CreateDate]) VALUES (12, N'日常工作', N'SystemAdmin', CAST(0x0000A6F200E762AB AS DateTime))
SET IDENTITY_INSERT [dbo].[T_NewsType] OFF
/****** Object:  Table [dbo].[T_News]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsTypeId] [int] NOT NULL,
	[Keyword] [nvarchar](50) NULL,
	[Content] [nvarchar](50) NULL,
	[OrgCode] [varchar](150) NOT NULL,
	[NewsTitle] [nvarchar](100) NOT NULL,
	[NewsSubheading] [nvarchar](50) NOT NULL,
	[NewsSource] [nvarchar](50) NOT NULL,
	[NewsContent] [text] NOT NULL,
	[NewsImg] [varchar](50) NULL,
	[NewsFile] [varchar](50) NULL,
	[NumClicks] [int] NOT NULL,
	[IsCheck] [int] NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ztbz] [varchar](50) NULL,
	[TZZT] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专题通栏标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_News', @level2type=N'COLUMN',@level2name=N'ztbz'
GO
SET IDENTITY_INSERT [dbo].[T_News] ON
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (79, 1, N'', N'', N'3601', N'市农村综合产权交易中心以“党建+服务”“党建+服务”“党建+服务”推动农村产权入市流转 ', N'', N'', N'<div class="top_nav">
	<div class="main1">
		<div class="fl">
			<p align="center">
				<img src="W020161217348421205181.jpg" oldsrc="W020161217348421205181.jpg" />
			</p>
			<p align="justify">
				本网讯　12月17日上午，农业部党组书记、部长韩长赋主持召开部党组（扩大）会议，传达学习中央经济工作会议精神，研究贯彻落实意见。会议强调，各级农业部门要迅速把思想和行动统一到中央关于经济工作的决策部署和要求上来，增强工作责任感紧迫感，坚定信心，扎实工作，科学谋划和做好明年农业农村经济工作，坚持稳中求进的总基调，坚持把推进农业供给侧结构性改革作为工作主线，加快推进农业现代化，巩固发展农业农村经济好形势，以优异成绩迎接党的十九大召开。
			</p>
			<p align="justify">
				<img hspace="5" src="W020161217348421209194.jpg" width="300" align="left" height="211" oldsrc="W020161217348421209194.jpg" />
			</p>
			<p align="justify">
				会议指出，这次中央经济工作会议，是在全面建成小康社会决胜阶段和推进供给侧结构性改革攻坚时期召开的一次十分重要的会议，会议立足大局、主题鲜明、重点突出、要求明确，各项决策部署全局性、思想性、指导性和针对性都非常强，各级农业部门要认真学习，深刻领会，抓好落实。要认真学习领会习近平总书记在中央经济工作会议上的重要讲话精神，深刻把握党的十八大以来，以习近平同志为核心的党中央领导和推动经济工作的战略性全局性考虑，增强做好农业农村经济工作的坚定性自觉性，提高推进农业改革发展的能力和水平。要认真学习李克强总理重要讲话精神，准确理解精神实质和任务要求。要全面把握中央关于明年经济工作的总体部署和重点任务，结合农业农村经济工作实际，切实抓好落实。
			</p>
			<p>
				会议强调，科学谋划和做好明年农业农村经济发展工作，要坚持稳中求进的总基调，把握推进农业供给侧结构性改革的工作主线，在确保粮食安全和重要农产品有效供给的基础上，扎实推进农业结构调整，推进质量兴农，增加绿色优质农产品供给，提高农业质量效益竞争力；大力推进绿色发展，推进创新驱动，推进农村改革，把农业农村经济转型升级提升到新水平。
			</p>
			<p>
				会议要求，要切实把中央经济工作会议精神体现到具体工作中，筹备开好全国农业工作会议，统筹抓好各项工作。当前要重点抓好秋粮收购，搞好冬春农业生产特别是“菜篮子”产品供应，确保“两节”期间农产品供给充足、价格稳定，加强农业安全生产。要认真抓好全面从严治党各项工作，坚持不懈落实八项规定精神，切实加强作风建设。
			</p>
<br />
		</div>
	</div>
	<div class="main">
		<div class="list top">
			<div class="list_content">
			</div>
		</div>
	</div>
</div>', N'', N'', 47, 1, N'SystemAdmin', CAST(0x0000A6E300000000 AS DateTime), N'否', N'否')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (80, 1, N'', N'', N'3601', N'市农村综合产权交易中心以“党建+服务”推动农村产权入市流转 ', N'', N'', N'<span style="white-space:nowrap;">.menu_nav a{color: #035ea3;}</span><br />
<span style="white-space:nowrap;">.menu_nav li span a:hover{color:#fff;}</span><br />
<span style="white-space:nowrap;">.menu_nav_white{color:#fff!important;}</span><br />
<span style="white-space:nowrap;">.menu_nav_ligb{background: url(../Images/menu.jpg) no-repeat;}</span><br />
<span style="white-space:nowrap;">/* .menu</span><br />
<span style="white-space:nowrap;">.menus1,.menus2,.menus3,.menus4,.menus5,.menul1,.menul2,.menul3{background: url(../Images/tb1.png) no-repeat ;display: block; padding-left:30px; margin-left:5px;}</span><br />
<span style="white-space:nowrap;">.menus1_1,.menus2_1,.menus3_1,.menus4_1,.menus5_1,.menul1_1,.menul2_1,.menul3_1{background: url(../Images/tb.png) no-repeat;display: block; padding-left:30px; margin-left:5px;}</span><br />
<span style="white-space:nowrap;">.menus1,.menus1_1{ background-position: left 8px; margin-left:25px;}</span><br />
<span style="white-space:nowrap;">.menus2,.menus2_1{background-position: left -112px;}</span><br />
<span style="white-space:nowrap;">.menus3,.menus3_1{background-position: left -155px;}</span><br />
<span style="white-space:nowrap;">.menus4,.menus4_1{background-position: left -30px;}</span><br />
<span style="white-space:nowrap;">.menus5,.menus5_1{background-position: left -71px;}*/</span><br />
<span style="white-space:nowrap;">.menu_nav li:hover{no-repeat; color:#fff;}</span><br />
<span style="white-space:nowrap;">.menu_nav li a{display: block; padding-left:35px; margin-left:5px;}</span><br />
<span style="white-space:nowrap;">/*</span><br />
<span style="white-space:nowrap;">.menu_nav li a{background: url(../images/tb.png) no-repeat ;display: block; padding-left:35px; margin-left:5px;}</span><br />
<span style="white-space:nowrap;">.menu_nav li a:hover{background: url(../images/tb1.png) no-repeat;padding-left:35px; margin-left:5px;color:#fff;}*/</span><br />
<span style="white-space:nowrap;"><br />
</span><br />
<span style="white-space:nowrap;">.menus1,.menus2,.menus3,.menus4,.menus5,.menul1,.menus6,.menus7,.menul2,.menul3{background: url(../images/tb1.png) no-repeat ;display: block; padding-left:30px; margin-left:5px;}</span><br />
<span style="white-space:nowrap;"><br />
</span><br />
<span style="white-space:nowrap;">.menus1_1,.menus2_1,.menus3_1,.menus4_1,.menus5_1,.menul1_1,.menul2_1,.menul3_1,.menus6_1,.menus7_1{background: url(../images/tb.png) no-repeat;display: block; padding-left:30px; margin-left:5px;}</span><br />
<span style="white-space:nowrap;">.menus1{background: url(../images/tb1.png) no-repeat;background-position: left 8px; margin-left:25px;}</span><br />
<span style="white-space:nowrap;">.menus1,.menus1_1{ background-position: left 8px; margin-left:25px;}</span><br />
<span style="white-space:nowrap;">.menus2,.menus2_1{background-position: left -112px;}</span><br />
<span style="white-space:nowrap;">.menus3,.menus3_1{background-position: left -155px;}</span><br />
<span style="white-space:nowrap;">.menus4,.menus4_1{background-position: left -30px!important;}</span><br />
<span style="white-space:nowrap;">.menus5,.menus5_1{background-position: left -71px;}</span><br />
<span style="white-space:nowrap;">.menus6,.menus6_1{background-position: left -426px;}</span><br />
<span style="white-space:nowrap;">.menus7,.menus7_1{background-position: left -522px;}</span><br />
<span style="white-space:nowrap;"><br />
</span><br />
<span style="white-space:nowrap;">.menu_nav1 li{float: left; width:15px; height: 42px;}</span><br />
<span style="white-space:nowrap;">.menul1,.menul1_1{background-position:left -192px; }</span><br />
<span style="white-space:nowrap;">.menul2,.menul2_1{background-position:left -235px; }</span><br />
<span style="white-space:nowrap;">.menul3,.menul3_1{background-position:left -276px; }</span><br />
<span style="white-space:nowrap;">.list_wz,.tzhi{width: 953px;border:1px solid #c7c7c7; border-top: 2px solid #b40000; background:#f3f3f3 url(../Images/ot.png) no-repeat 15px 8px; padding-left:45px;color:#fc7344; line-height: 35px; height: 35px;}</span><br />
<span style="white-space:nowrap;">.tzhi a{color:#fc7344;}</span><br />
<span style="white-space:nowrap;">.list_wz{background-image: url(../Images/wz.png);}</span><br />
<span style="white-space:nowrap;">.h_new_b,.h_new_t{background: url(../Images/jdtu.jpg) no-repeat; height: 8px;}</span><br />
<span style="white-space:nowrap;">.h_new_b{background-position: left -8px;}</span><br />
<span style="white-space:nowrap;">.h_new_c{width: 695px; padding:0 3px; border-left:1px solid #c7c7c7;border-right:1px solid #c7c7c7;}</span><br />
<span style="white-space:nowrap;">.new_tab{float: left; margin-left:8px; height: 308px; overflow: hidden;}</span><br />
<span style="white-space:nowrap;">.or_search_tab,.new_s{width: 288px; border-bottom:1px solid #ff4504;line-height: 30px; height: 30px;}</span><br />
<span style="white-space:nowrap;">.or_search_tab a,.new_s a{display: block; width:80px; &nbsp;float: left; text-align: center; font-weight: bold;}</span><br />
<span style="white-space:nowrap;">.new_s1{ background-color: #ff4504; color:#fff; font-weight: bold;}</span><br />
<span style="white-space:nowrap;">.or_search_tab{width:240px;}</span><br />
<span style="white-space:nowrap;">.new_c{height: 280px;margin-top:10px;}</span><br />
<span style="white-space:nowrap;">.new_c li{ height: 29px; line-height: 29px;}</span><br />
<span style="white-space:nowrap;">.new_c span{font-size: 10px; color: #ff4504;}</span><br />
<span style="white-space:nowrap;">.sys li{background: url(../Images/an_bg.jpg) no-repeat; width: 94px;margin-right: 6px; float: left; height: 80px; color:#fff; margin-right:7px;}</span><br />
<span style="white-space:nowrap;">.sys_s1,.sys_s2,.sys_s3,.sys_s4,.sys_s5,.sys_s6,.sys_s7,.sys_s8{background:url(../Images/an.png) no-repeat; display:block; width:94px; text-align: center; padding-top: 50px;}</span><br />
<span style="white-space:nowrap;">.sys_s1{background-position: 27px 18px;}</span><br />
<span style="white-space:nowrap;">.sys_s2{background-position: 27px -62px;}</span><br />
<span style="white-space:nowrap;">.sys_s3{background-position: 27px -142px;}</span><br />', N'', N'', 13, 1, N'SystemAdmin', CAST(0x0000A6E300000000 AS DateTime), N'否', N'否')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (81, 1, N'', N'', N'3601', N'全国第七届蔬菜规模化高效育苗技术经验交流会暨 中国蔬菜协会种苗分会成立大会正式通知', N'', N'', N'<p>
	各有关单位：
</p>
<p>
	种为苗之本，苗好三成收。良种、壮苗是蔬菜丰产优质高效的基础，是现代蔬菜产业体系的重要组成。
</p>
<p>
	各级政府一直非常重视蔬菜种苗产业的发展，蔬菜种苗已列入<b>国务院《全国现代农业发展规划（</b><b>2011-2015</b><b>年），</b><b>国发〔</b><b>2012</b><b>〕</b><b>4</b><b>号</b><b>》、</b>《<b>关于统筹推进</b><b>新一轮</b><b>“</b><b>菜篮子</b><b>”</b><b>工程建设的意见，</b>国办发〔2010〕18<b>号</b><b>》、农业部</b>《全国种植业发展第十二个五年规划》、《全国蔬菜产业发展规划（2011-2020年）》、《蔬菜标准园建设规范》等，还通过现代农业建设、蔬菜良种工程、农业综合开发等予以专项支持，辽宁、浙江、宁夏、甘肃、山西、贵州等多省（区）将蔬菜种苗技术作为设施农业主推技术。
</p>
<p>
	上世纪80年代以来，通过国家和省级审定、认定和鉴定的蔬菜新品种超过1000个，主要蔬菜实现了3-4次品种更新，良种覆盖率超过90%。2012年仅河北、甘肃等11个省年育苗量500-1000万株以上蔬菜集约化育苗场数量已达1454家，年育苗总量约127亿株，年移栽面积约44万公顷。蔬菜种苗产业发展呈现非常良好的势头，强有力地支撑和引领了现代蔬菜产业发展，而且已成为社会资本投资现代农业的热点。
</p>
<p>
	为了加强管理部门与种苗企业的联系，增进种苗产业内部沟通协作，推广普及先进实用种苗技术，构建优质品牌产品供需诚信优惠交易平台，促进蔬菜种苗产业规范、有序、健康发展，中国蔬菜协会、中国农业科学院蔬菜花卉研究所决定联合主办全国第七届蔬菜规模化高效育苗技术经验交流会暨中国蔬菜协会种苗分会成立大会。
</p>
<p>
	<b>一、时间与地点</b>
</p>
<p>
	2015年1月18-20日，山东省寿光市晨鸣大酒店（详见附件5）<b>二、主要议题</b>（详见附件2）
</p>
<p>
	1.蔬菜种苗产业发展政策与法规
</p>
<p>
	2.蔬菜种子质量控制
</p>
<p>
	3.蔬菜集约化育苗技术及应用实例
</p>
<p>
	4.蔬菜种苗企业成本控制与经营策略
</p>
<p>
	5.中国蔬菜协会种苗分会成立
</p>
<p>
	<b>三、相关事宜</b>
</p>
<p>
	1.拟采取大会学术报告与蔬菜集约化育苗现场观摩相结合的形式。
</p>
<p>
	2.体现节约、高效、务实办会精神，每位参会代表收取会务费和资料费合计900元。食宿费用自理。
</p>
<p>
	3.会议不安排接送和订购往返车票，请自行妥善安排行程。
</p>
<p>
	4.请参会代表务于2015年1月15日前将参会回执发送至联系人电子邮箱（详见附件1）。
</p>
<p>
	<b>四、会议联系人</b>
</p>
<p>
	汝琳
</p>
<p>
	联系电话：010-82105018，15210597251；传真：010-82105017
</p>
<p>
	电子邮箱：cva_bj@163.com
</p>
<p>
	联系地址：中国蔬菜协会，北京100081，北京市海淀区中关村南大街12号中国农业科学院8号楼530室
</p>
<p>
	尚庆茂
</p>
<p>
	联系电话：010-82105481，13910306276；传真：010-82105481
</p>
<p>
	电子邮箱：shangqingmao@caas.cn
</p>
<p>
	联系地址：中国农业科学院蔬菜花卉研究所，北京100081，北京市海淀区中关村南大街12号
</p>
<p>
	<b>附件：</b>
</p>
<p>
	附件1.参会回执
</p>
<p>
	附件2.会议拟定议程
</p>
<p>
	附件3.中国蔬菜协会种苗分会章程（讨论稿）
</p>
<p>
	附件4.中国蔬菜协会种苗分会会员登记表
</p>
<p>
	附件5.会议地点交通路线示意图
</p>
<p>
	中国蔬菜协会　&nbsp;中国农业科学院蔬菜花卉研究所
</p>
<p>
	&nbsp; 2014年12月25日
</p>', N'', N'', 12, 1, N'SystemAdmin', CAST(0x0000A6E300000000 AS DateTime), N'否', N'否')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (82, 1, N'', N'', N'3601', N'市农村综”推动农村产权入市流转2016 ', N'', N'', N'<p>
	各有关单位：
</p>
<p>
	种为苗之本，苗好三成收。良种、壮苗是蔬菜丰产优质高效的基础，是现代蔬菜产业体系的重要组成。
</p>
<p>
	各级政府一直非常重视蔬菜种苗产业的发展，蔬菜种苗已列入<b>国务院《全国现代农业发展规划（</b><b>2011-2015</b><b>年），</b><b>国发〔</b><b>2012</b><b>〕</b><b>4</b><b>号</b><b>》、</b>《<b>关于统筹推进</b><b>新一轮</b><b>“</b><b>菜篮子</b><b>”</b><b>工程建设的意见，</b>国办发〔2010〕18<b>号</b><b>》、农业部</b>《全国种植业发展第十二个五年规划》、《全国蔬菜产业发展规划（2011-2020年）》、《蔬菜标准园建设规范》等，还通过现代农业建设、蔬菜良种工程、农业综合开发等予以专项支持，辽宁、浙江、宁夏、甘肃、山西、贵州等多省（区）将蔬菜种苗技术作为设施农业主推技术。
</p>
<p>
	上世纪80年代以来，通过国家和省级审定、认定和鉴定的蔬菜新品种超过1000个，主要蔬菜实现了3-4次品种更新，良种覆盖率超过90%。2012年仅河北、甘肃等11个省年育苗量500-1000万株以上蔬菜集约化育苗场数量已达1454家，年育苗总量约127亿株，年移栽面积约44万公顷。蔬菜种苗产业发展呈现非常良好的势头，强有力地支撑和引领了现代蔬菜产业发展，而且已成为社会资本投资现代农业的热点。
</p>
<p>
	为了加强管理部门与种苗企业的联系，增进种苗产业内部沟通协作，推广普及先进实用种苗技术，构建优质品牌产品供需诚信优惠交易平台，促进蔬菜种苗产业规范、有序、健康发展，中国蔬菜协会、中国农业科学院蔬菜花卉研究所决定联合主办全国第七届蔬菜规模化高效育苗技术经验交流会暨中国蔬菜协会种苗分会成立大会。
</p>
<p>
	<b>一、时间与地点</b>
</p>
<p>
	2015年1月18-20日，山东省寿光市晨鸣大酒店（详见附件5）<b>二、主要议题</b>（详见附件2）
</p>
<p>
	1.蔬菜种苗产业发展政策与法规
</p>
<p>
	2.蔬菜种子质量控制
</p>
<p>
	3.蔬菜集约化育苗技术及应用实例
</p>
<p>
	4.蔬菜种苗企业成本控制与经营策略
</p>
<p>
	5.中国蔬菜协会种苗分会成立
</p>
<p>
	<b>三、相关事宜</b>
</p>
<p>
	1.拟采取大会学术报告与蔬菜集约化育苗现场观摩相结合的形式。
</p>
<p>
	2.体现节约、高效、务实办会精神，每位参会代表收取会务费和资料费合计900元。食宿费用自理。
</p>
<p>
	3.会议不安排接送和订购往返车票，请自行妥善安排行程。
</p>
<p>
	4.请参会代表务于2015年1月15日前将参会回执发送至联系人电子邮箱（详见附件1）。
</p>
<p>
	<b>四、会议联系人</b>
</p>
<p>
	汝琳
</p>
<p>
	联系电话：010-82105018，15210597251；传真：010-82105017
</p>
<p>
	电子邮箱：cva_bj@163.com
</p>
<p>
	联系地址：中国蔬菜协会，北京100081，北京市海淀区中关村南大街12号中国农业科学院8号楼530室
</p>
<p>
	尚庆茂
</p>
<p>
	联系电话：010-82105481，13910306276；传真：010-82105481
</p>
<p>
	电子邮箱：shangqingmao@caas.cn
</p>
<p>
	联系地址：中国农业科学院蔬菜花卉研究所，北京100081，北京市海淀区中关村南大街12号
</p>
<p>
	<b>附件：</b>
</p>
<p>
	附件1.参会回执
</p>
<p>
	附件2.会议拟定议程
</p>
<p>
	附件3.中国蔬菜协会种苗分会章程（讨论稿）
</p>
<p>
	附件4.中国蔬菜协会种苗分会会员登记表
</p>
<p>
	附件5.会议地点交通路线示意图
</p>
<p>
	中国蔬菜协会　&nbsp;中国农业科学院蔬菜花卉研究所
</p>
<p>
	&nbsp; 2014年12月25日
</p>
<img src="/upload/image/20161221/20161221091314_4306.jpg" alt="" />', N'20161221091317.jpg', N'', 13, 1, N'SystemAdmin', CAST(0x0000A6E300000000 AS DateTime), N'否', N'否')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (83, 1, N'', N'', N'3601', N'中央农村工作会议在京召开 习近平对做好“三农”工作作出重要指示李克强提出要求', N'', N'', N'<p align="center" style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;color:#333333;white-space:normal;background-color:#FFFFFF;">
	<img oldsrc="W020161221328577773134.jpg" alt="" src="http://www.agri.cn/V20/ZX/tpxw/201612/W020161221328577773134.jpg" />
</p>
<p align="justify" style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;color:#333333;white-space:normal;background-color:#FFFFFF;">
	12月19日至20日，中央农村工作会议在北京召开。中共中央政治局委员、国务院副总理汪洋出席会议并讲话。中共中央书记处书记、国务委员杨晶主持第一次全体会议。新华社记者姚大伟摄
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	新华社北京12月20日电&nbsp; 中央农村工作会议19日至20日在北京召开。会议全面贯彻落实党的十八大和十八届三中、四中、五中、六中全会以及中央经济工作会议精神，总结“十三五”开局之年“三农”工作，分析当前农业农村形势，部署2017年农业农村工作。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	会前，中共中央总书记、国家主席、中央军委主席习近平主持召开中央政治局常委会会议，专门研究“三农”工作并发表重要讲话。习近平指出，今年农业农村形势总体较好，明年“三农”工作要继续为全局作贡献。要坚持新发展理念，把推进农业供给侧结构性改革作为农业农村工作的主线，培育农业农村发展新动能，提高农业综合效益和竞争力。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	习近平强调，要始终重视“三农”工作，持续强化重农强农信号；要准确把握新形势下“三农”工作方向，深入推进农业供给侧结构性改革；要在确保国家粮食安全基础上，着力优化产业产品结构；要把发展农业适度规模经营同脱贫攻坚结合起来，与推进新型城镇化相适应，使强农惠农政策照顾到大多数普通农户；要协同发挥政府和市场“两只手”的作用，更好引导农业生产、优化供给结构；要尊重基层创造，营造改革良好氛围。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	中共中央政治局常委、国务院总理李克强在国务院常务会议上要求，要持续抓好“三农”工作，大力推进农业供给侧结构性改革，加快现代农业建设，积极调整农业结构，发展多种形式适度规模经营，深入开展农村“双创”，推动新型城镇化与农业现代化互促共进。深入推进脱贫攻坚，提高贫困地区和贫困群众自我发展能力。促进农业提质增效和农民持续增收，拓展农村发展空间。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	会上传达学习了习近平重要讲话和李克强指示要求，讨论了《中共中央、国务院关于深入推进农业供给侧结构性改革加快培育农业农村发展新动能的若干意见（讨论稿）》。中共中央政治局委员、国务院副总理汪洋出席会议并讲话。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	会议指出，今年以来，农业农村发展继续保持稳中有进的良好态势，为经济社会发展大局提供了有力支撑，农业结构调整迈出重要步伐，农村新产业新业态蓬勃发展，农村重要领域和关键环节改革深入推进，农村民生持续改善，农村社会保持和谐稳定。全年1000万人的脱贫任务有望超额完成，脱贫攻坚实现良好开局。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	会议强调，推进农业供给侧结构性改革，要在确保国家粮食安全的基础上，紧紧围绕市场需求变化，以增加农民收入、保障有效供给为主要目标，以提高农业供给质量为主攻方向，以体制改革和机制创新为根本途径，优化农业产业体系、生产体系、经营体系，提高土地产出率、资源利用率、劳动生产率，促进农业农村发展由过度依赖资源消耗、主要满足“量”的需求，向追求绿色生态可持续、更加注重满足“质”的需求转变。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	会议指出，推进农业供给侧结构性改革，首先要把农业结构调好调顺调优。要适应市场需求，优化产品结构，把提高农产品质量放在更加突出位置；发展适度规模经营，优化经营结构，把促进规模经营与脱贫攻坚和带动一般农户增收结合起来；立足比较优势，优化区域结构，重点建设好粮食生产功能区、重要农产品生产保护区、特色农产品优势区；加快科技创新，增强农业发展动能，调整农业科技创新方向和重点，调动科技人员的积极性；促进融合发展，优化产业结构，着眼提高农业全产业链收益，努力做强一产、做优二产、做活三产；推行绿色生产方式，促进农业可持续发展，把该退的坚决退下来，把超载的果断减下来，把该治理的切实治理到位，把农业节水作为方向性、战略性大事来抓。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	会议强调，推进农业供给侧结构性改革，关键在完善体制、创新机制，加快深化农村改革，理顺政府和市场的关系，全面激活市场、激活要素、激活主体。推进粮食等重要农产品价格形成机制和收储制度改革，深化农村产权制度改革，改革财政支农投入使用机制，加快农村金融创新，健全农村创业创新机制。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	会议强调，推进农业供给侧结构性改革，是“三农”领域的一场深刻变革，关系农业的长远发展，在方向性问题上不能出偏差，不能犯颠覆性的错误，必须守住确保粮食生产能力不降低、农民增收势头不逆转、农村稳定不出问题的三条底线。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	会议要求，进一步推进精准扶贫各项政策措施落地生根，确保2017年再脱贫1000万人以上。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	中共中央书记处书记、国务委员杨晶主持第一次全体会议。
</p>
<p style="line-height:24px;margin-top:6px;font-family:宋体;margin-bottom:12px;font-size:14px;white-space:normal;color:#393939;background-color:#FFFFFF;">
	中央农村工作领导小组成员，各省、自治区、直辖市和计划单列市、新疆生产建设兵团负责同志，中央和国家机关及军队有关单位负责同志等出席会议。
</p>', N'20161221091531.jpg', N'', 4, 1, N'SystemAdmin', CAST(0x0000A6E300000000 AS DateTime), N'否', N'否')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (84, 1, N'', N'', N'3601', N'测试图片是否还存在', N'', N'', N'<span style="white-space:nowrap;">测试图片是否还存在</span>', N'20161221091728.jpg', N'', 19, 1, N'SystemAdmin', CAST(0x0000A6E300000000 AS DateTime), N'否', N'否')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (90, 2, N'', N'', N'3601', N'就打死了科技风老大世纪东方就打死了科技风老大世纪东方就打死了科技风老大世纪东方就打死了科技风老大世纪东方就打死了科技风老大世纪东方就打死了科技风老大世纪东方就打死了科技风老大世纪东方', N'', N'', N'就打死了科技风老大世纪东方就打死了科技风老大世纪东方就打死了科技风老大世纪东方就打死了科技风老大世纪东方', N'', N'', 3, 1, N'SystemAdmin', CAST(0x0000A6F000A25C85 AS DateTime), NULL, NULL)
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (91, 11, N'', N'', N'3601', N'下载下载下载下载', N'', N'', N'的撒范德萨发', N'', N'', 3, 1, N'SystemAdmin', CAST(0x0000A6F200E87D30 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (92, 12, N'', N'的撒范德萨', N'3601', N'到底是发的萨芬', N'撒范德萨', N'', N'', N'', N'', 3, 1, N'SystemAdmin', CAST(0x0000A6F200000000 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (94, 9, N'11', N'', N'3601', N'我是来测试的', N'11', N'1', N'1111111', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A73100000000 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (95, 9, N'', N'', N'3601', N'我是来测试的大姐姐看到三', N'111', N'', N'1111111', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A73100000000 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (96, 9, N'', N'', N'3601', N'在测试时', N'22', N'', N'22', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A73F009A11CC AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (97, 9, N'', N'', N'3601', N'的撒范德萨范德萨范德萨', N'士大夫', N'', N'撒发生大', N'', N'', 1, 1, N'SystemAdmin', CAST(0x0000A73F009A2108 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (98, 1, N'', N'', N'3601', N'问问群二无群二', N'', N'', N'吾问无为新闻信息', N'', N'', 1, 1, N'SystemAdmin', CAST(0x0000A74D00000000 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (99, 1, N'', N'', N'3601', N'2222222222', N'2', N'22', N'222', N'20170505111600.jpg', N'', 0, 1, N'SystemAdmin', CAST(0x0000A76A00B9AB40 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (100, 1, N'', N'', N'3601', N'我是来测试机的的骄傲看风景的拉伸机发大水了发', N'我是来测试机的的骄傲看风景的拉伸机发大水了发', N'', N'我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A76F009E0AFC AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (101, 1, N'', N'', N'3601', N'我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发', N'我是来测试机的的骄傲看风景的拉伸机发大水了发', N'', N'我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发', N'', N'', 1, 1, N'SystemAdmin', CAST(0x0000A76F009E1EE8 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (102, 1, N'', N'', N'3601', N'我是来测试机的的骄傲看风景的拉伸机发大水了发', N'我是来测试机的的骄傲看风景的拉伸机发大水了发', N'', N'我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发我是来测试机的的骄傲看风景的拉伸机发大水了发', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A76F009E3658 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (103, 1, N'', N'', N'3601', N'的萨芬的萨芬', N'', N'', N'撒范德萨士大夫', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A76F009E4594 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (104, 1, N'', N'', N'3601', N'的萨芬的萨芬士大夫', N'', N'', N'上撒范德萨范德萨范德萨', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A76F009E6D6C AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (105, 1, N'', N'', N'3601', N'的萨芬的萨芬的萨芬的撒发的萨芬', N'', N'', N'撒范德萨范德萨发的萨芬大', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A76F009E7CA8 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (106, 1, N'', N'', N'3601', N'的撒范德萨发大水是大方的萨芬的萨芬', N'', N'', N'撒范德萨发', N'', N'', 0, 1, N'SystemAdmin', CAST(0x0000A76F009F4D40 AS DateTime), N'否', N'')
INSERT [dbo].[T_News] ([Id], [NewsTypeId], [Keyword], [Content], [OrgCode], [NewsTitle], [NewsSubheading], [NewsSource], [NewsContent], [NewsImg], [NewsFile], [NumClicks], [IsCheck], [Editor], [CreateDate], [ztbz], [TZZT]) VALUES (107, 1, N'', N'', N'3601', N'见识到了会计法的雷克萨', N'', N'', N'的萨芬大师', N'20170510103508.JPG', N'', 2, 1, N'SystemAdmin', CAST(0x0000A76F00AE71D0 AS DateTime), N'否', N'')
SET IDENTITY_INSERT [dbo].[T_News] OFF
/****** Object:  Table [dbo].[T_MemberTypeCertification]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_MemberTypeCertification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeCertificationName] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_MemberTypeCertification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员类型表即指标对应类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_MemberTypeCertification'
GO
SET IDENTITY_INSERT [dbo].[T_MemberTypeCertification] ON
INSERT [dbo].[T_MemberTypeCertification] ([Id], [TypeCertificationName], [Editor], [CreateDate]) VALUES (1, N'个人', N'admin', CAST(0x0000A5FB00AB584A AS DateTime))
INSERT [dbo].[T_MemberTypeCertification] ([Id], [TypeCertificationName], [Editor], [CreateDate]) VALUES (2, N'村委会或集体组织', N'张伟伟', CAST(0x0000A619009D5633 AS DateTime))
INSERT [dbo].[T_MemberTypeCertification] ([Id], [TypeCertificationName], [Editor], [CreateDate]) VALUES (3, N'公司', N'admin', CAST(0x0000A5FB00AB7651 AS DateTime))
INSERT [dbo].[T_MemberTypeCertification] ([Id], [TypeCertificationName], [Editor], [CreateDate]) VALUES (4, N'新型农业经营主体', N'张伟伟', CAST(0x0000A61F010F4626 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_MemberTypeCertification] OFF
/****** Object:  Table [dbo].[T_Links]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LinkName] [nvarchar](50) NOT NULL,
	[LinkUrl] [varchar](50) NOT NULL,
	[LinkImgUrl] [varchar](50) NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_Links] ON
INSERT [dbo].[T_Links] ([Id], [LinkName], [LinkUrl], [LinkImgUrl], [Editor], [CreateDate]) VALUES (1, N'江西农业', N'http://www.jxagri.gov.cn/Index.shtml', N'20160701113059.png', N'SystemAdmin', CAST(0x0000A63600BDC930 AS DateTime))
INSERT [dbo].[T_Links] ([Id], [LinkName], [LinkUrl], [LinkImgUrl], [Editor], [CreateDate]) VALUES (3, N'江西人民政府', N'http://www.jiangxi.gov.cn/', N'20160701113517.png', N'SystemAdmin', CAST(0x0000A63600BEF75A AS DateTime))
INSERT [dbo].[T_Links] ([Id], [LinkName], [LinkUrl], [LinkImgUrl], [Editor], [CreateDate]) VALUES (4, N'农业部', N'http://www.moa.gov.cn/', N'20160701113642.png', N'SystemAdmin', CAST(0x0000A63600BF5B62 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Links] OFF
/****** Object:  Table [dbo].[T_LiceTranScan]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_LiceTranScan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_LiceTranId] [int] NOT NULL,
	[FK_UploadTypeIndicatorId] [int] NOT NULL,
	[ScanUrl] [nvarchar](100) NOT NULL,
	[UploadName] [nvarchar](100) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_LiceTranScan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_LiceTranScan] ON
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (1, 3, 1, N'3', N'5', CAST(0x0000A41300000000 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (2, 3, 3, N'20160513113516.pdf', N'张伟伟', CAST(0x0000A60500BEF91D AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (3, 3, 22, N'20160513031343.pdf', N'张伟伟', CAST(0x0000A60500FAF881 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (4, 3, 4, N'20160513031838.pdf', N'张伟伟', CAST(0x0000A60500FC5002 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (5, 3, 17, N'20160513033725.pdf', N'张伟伟', CAST(0x0000A605010178C0 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (6, 3, 21, N'20160513033742.pdf', N'张伟伟', CAST(0x0000A60501018C14 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (7, 16, 3, N'20160628051118.pdf', N'张伟伟', CAST(0x0000A633011B4411 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (8, 7, 1, N'20160706105624.pdf', N'SystemAdmin', CAST(0x0000A63B00B44B14 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (9, 7, 3, N'20160706105642.pdf', N'SystemAdmin', CAST(0x0000A63B00B45ECB AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (10, 7, 4, N'20160706105649.pdf', N'SystemAdmin', CAST(0x0000A63B00B4672D AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (11, 2, 1, N'20160706110115.pdf', N'SystemAdmin', CAST(0x0000A63B00B59FB6 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (12, 7, 1, N'20160706110204.pdf', N'SystemAdmin', CAST(0x0000A63B00B5D8E2 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (16, 7, 1, N'20160816033420.pdf', N'SystemAdmin', CAST(0x0000A6640100A045 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (17, 7, 3, N'20161123092905.pdf', N'SystemAdmin', CAST(0x0000A6C7009C4F34 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (18, 7, 3, N'20161123093952.pdf', N'SystemAdmin', CAST(0x0000A6C7009F44BE AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (19, 7, 3, N'.pdf', N'SystemAdmin', CAST(0x0000A6C800B6AC99 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (20, 7, 1, N'.pdf', N'SystemAdmin', CAST(0x0000A6C800E1CA0A AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (21, 7, 1, N'4688521c500342339c425973f5af2d46.jpg', N'SystemAdmin', CAST(0x0000A6C800E63711 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (22, 7, 1, N'347e636de51e474b93d7fafbf06864de.pdf', N'SystemAdmin', CAST(0x0000A6C800E674B5 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (23, 21, 1, N'03e4942abaef4da2b9081d988afe3f70.pdf', N'SystemAdmin', CAST(0x0000A6C800E77D4D AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (24, 21, 1, N'503f1820cd984617847c9fa64f6bb53a.jpg', N'SystemAdmin', CAST(0x0000A6C800E7CFBE AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (25, 21, 1, N'45155f7ee61147f4b408ed2d4eff359a.jpg', N'SystemAdmin', CAST(0x0000A6C800E7F20A AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (26, 7, 1, N'345794e17f7f4829adee4d426b0a860d.pdf', N'SystemAdmin', CAST(0x0000A6E9008796F2 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (27, 23, 1, N'331de458c54d4cdc82a5461c60234be3.jpg', N'SystemAdmin', CAST(0x0000A6E900EBECC7 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (28, 23, 1, N'ed0f300692384a18af6316fe2a26db3b.jpg', N'SystemAdmin', CAST(0x0000A6F0010A01F8 AS DateTime))
INSERT [dbo].[T_LiceTranScan] ([Id], [FK_LiceTranId], [FK_UploadTypeIndicatorId], [ScanUrl], [UploadName], [UploadDate]) VALUES (29, 23, 1, N'747a1350cddc4003802e2a6aca6529c5.jpg', N'SystemAdmin', CAST(0x0000A6F100F1CE52 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_LiceTranScan] OFF
/****** Object:  Table [dbo].[T_LiceTranCheck]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_LiceTranCheck](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_LiceTranId] [int] NOT NULL,
	[Reviewer] [nvarchar](100) NOT NULL,
	[AuditSay] [nvarchar](100) NOT NULL,
	[AuditDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_LiceTranCheck] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_LiceTranCheck] ON
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (1, 3, N'2', N'同意', CAST(0x0000A41300000000 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (2, 16, N'张伟伟', N'同意', CAST(0x0000A633011BACA6 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (3, 17, N'SystemAdmin', N'同意', CAST(0x0000A63B00F5A3E1 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (4, 7, N'SystemAdmin', N'审核通过', CAST(0x0000A65C00B02E6C AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (5, 19, N'08', N'审核通过', CAST(0x0000A65C00F5628E AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (6, 18, N'08', N'审核通过', CAST(0x0000A65C00F56AA4 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (7, 20, N'08', N'审核通过', CAST(0x0000A65D00EA5F34 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (8, 21, N'SystemAdmin', N'审核通过', CAST(0x0000A69D009B7074 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (9, 22, N'SystemAdmin', N'审核通过', CAST(0x0000A69D009BB201 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (10, 5, N'SystemAdmin', N'审核通过', CAST(0x0000A6F101126B8A AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (11, 5, N'SystemAdmin', N'审核通过', CAST(0x0000A6F300FB101A AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (12, 25, N'SystemAdmin', N'审核通过', CAST(0x0000A6F600F2B283 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (13, 7, N'SystemAdmin', N'审核通过', CAST(0x0000A6F7008C1CD3 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (14, 3, N'SystemAdmin', N'审核通过', CAST(0x0000A6F7008C363D AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (15, 26, N'SystemAdmin', N'审核通过', CAST(0x0000A6F7008C8595 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (16, 27, N'SystemAdmin', N'审核通过', CAST(0x0000A6FD00FEAB33 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (17, 28, N'SystemAdmin', N'审核通过', CAST(0x0000A77000982461 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (18, 29, N'SystemAdmin', N'审核通过', CAST(0x0000A770009881AE AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (19, 38, N'SystemAdmin', N'审核通过', CAST(0x0000A7D000A977D5 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (20, 37, N'SystemAdmin', N'审核通过', CAST(0x0000A7D000A97BA1 AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (21, 36, N'SystemAdmin', N'审核通过', CAST(0x0000A7D000A97FFF AS DateTime))
INSERT [dbo].[T_LiceTranCheck] ([Id], [FK_LiceTranId], [Reviewer], [AuditSay], [AuditDate]) VALUES (22, 35, N'SystemAdmin', N'审核通过', CAST(0x0000A7D000A9843E AS DateTime))
SET IDENTITY_INSERT [dbo].[T_LiceTranCheck] OFF
/****** Object:  Table [dbo].[T_LiceTran]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LiceTran](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_WebUserVeriId] [int] NOT NULL,
	[LiceTranType] [int] NOT NULL,
	[OrgCode] [nvarchar](100) NOT NULL,
	[MemberTypeId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Addr] [nvarchar](100) NULL,
	[Contact] [nvarchar](100) NULL,
	[Corporate] [nvarchar](100) NULL,
	[IDCard] [nvarchar](100) NULL,
	[OrganizationCode] [nvarchar](100) NULL,
	[Tel] [nvarchar](100) NULL,
	[Owner] [nvarchar](100) NULL,
	[Capital] [nvarchar](100) NULL,
	[ApplyDate] [datetime] NOT NULL,
	[AuditType] [int] NOT NULL,
	[JBYhm] [varchar](50) NULL,
	[JBmm] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_LiceTran] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_LiceTran] ON
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (2, 1, 1, N'3601', 1, N'亦霞', N'滨湖西路110号城南世家', N'李亦霞', N'张亦霞', N'371082198012121234', N'36012016010100001', N'13562138090', N'龙亦霞', N'100万', CAST(0x0000A60B00A5FA9D AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (3, 1, 1, N'3601', 1, N'仁辉', N'滨湖西路110号城南世家', N'李仁辉', N'张仁辉', N'371082198012121234', N'36012016010100001', N'13562138090', N'龙仁辉', N'100万', CAST(0x0000A60B00A5F9D8 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (5, 1, 1, N'3601', 1, N'薇坤', N'滨湖西路110号城南世家', N'李薇坤', N'张薇坤', N'371082198012121234', N'36012016010100001', N'13562138090', N'龙薇坤', N'100万', CAST(0x0000A60B00A5FA9D AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (6, 1, 1, N'3601', 1, N'子睿', N'滨湖西路110号城南世家', N'李子睿', N'张子睿', N'371082198012121234', N'36012016010100001', N'13562138090', N'龙子睿', N'100万', CAST(0x0000A60B00A5FA9D AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (7, 1, 1, N'3601', 1, N'传昊', N'滨湖西路110号城南世家', N'李传昊', N'张传昊', N'371082198012121234', N'36012016010100001', N'13562138090', N'龙传昊', N'100万', CAST(0x0000A60B00A5FA9D AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (18, 0, 2, N'3601', 1, N'0808', N'0808', N'0808', N'0808', N'0808', N'0808', N'080808', N'0808', N'0808', CAST(0x0000A65C00B2222A AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (19, 0, 2, N'3601', 1, N'受让方陶', N'威海测试', N'陶', N'陶', N'370682', N'370682', N'370682', N'陶', N'10', CAST(0x0000A65C00B3F3EF AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (20, 1, 2, N'3601', 1, N'089', N'089', N'089', N'089', N'089', N'089', N'089089', N'089', N'089', CAST(0x0000A65D00EA1B0A AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (21, 0, 1, N'3601', 1, N'张飞', N'南昌', N'张飞', N'', N'554576452555', N'', N'12456454', N'张飞', N'', CAST(0x0000A69D009B68E0 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (22, 0, 2, N'3601', 3, N'关羽', N'南昌', N'关羽', N'关羽', N'2323213213', N'', N'23213213', N'关羽', N'50w', CAST(0x0000A69D009BA64F AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (23, 0, 1, N'3601', 1, N'33', N'3', N'3', N'3', N'3', N'3', N'123456', N'3', N'3', CAST(0x0000A6E900E925FC AS DateTime), 0, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (24, 0, 1, N'3601', 1, N'22', N'2', N'2', N'2', N'2', N'2', N'15562102895', N'3333', N'2', CAST(0x0000A6F100F1B42C AS DateTime), 0, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (25, 0, 1, N'3601', 1, N'333', N'3', N'333', N'33', N'33', N'33', N'3333333', N'33', N'33', CAST(0x0000A6F600F2A368 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (26, 0, 1, N'3601', 1, N'王菲得', N'3213213', N'2323', N'', N'23231', N'', N'323123', N'2323', N'', CAST(0x0000A6F7008C7ECA AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (27, 0, 1, N'360102', 1, N'王军', N'王军', N'王军', N'', N'1522121122111', N'', N'12342323', N'王军', N'', CAST(0x0000A6FD00FEA28F AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (28, 0, 1, N'360102', 2, N'王明', N'打算', N'的萨芬', N'', N'1111111111111', N'', N'11111111111', N'村委会', N'', CAST(0x0000A77000981066 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (29, 0, 2, N'360102', 1, N'王明的受让方', N'测试地址', N'测试联系人', N'', N'1111111111111', N'', N'11111111111', N'王明所有权人', N'', CAST(0x0000A770009860AE AS DateTime), 1, NULL, NULL)
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (30, 0, 1, N'360102', 1, N'2', N'2', N'2', N'2', N'2', N'2', N'15562102895', N'2', N'2', CAST(0x0000A7C300E510A0 AS DateTime), 0, N'2', N'2')
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (31, 0, 1, N'3601', 1, N'2', N'2', N'22', N'2', N'2', N'2', N'15562102895', N'2', N'2', CAST(0x0000A7C300E541D8 AS DateTime), 0, N'2', N'2')
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (33, 0, 1, N'3601', 1, N'2', N'22', N'2', N'2', N'2', N'2', N'15562102895', N'2', N'', CAST(0x0000A7C4008F6274 AS DateTime), 0, N'55', N'2')
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (34, 0, 2, N'3601', 1, N'1', N'11', N'11', N'11', N'1', N'1', N'15562102895', N'1', N'2', CAST(0x0000A7C400949A94 AS DateTime), 0, N'33', N'2')
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (35, 0, 2, N'3601', 1, N'一次竞标1', N'2', N'2', N'', N'3', N'2', N'11125468954', N'2', N'2', CAST(0x0000A7D000A91D42 AS DateTime), 1, N'yici1', N'8')
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (36, 0, 2, N'3601', 1, N'yici2', N'33', N'3', N'', N'3', N'', N'11111111111', N'3', N'', CAST(0x0000A7D000A95408 AS DateTime), 1, N'yici2', N'8')
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (37, 0, 2, N'3601', 1, N'yici3', N'33', N'3', N'', N'3', N'', N'11111111111', N'3', N'', CAST(0x0000A7D000A95F5A AS DateTime), 1, N'yici3', N'8')
INSERT [dbo].[T_LiceTran] ([Id], [FK_WebUserVeriId], [LiceTranType], [OrgCode], [MemberTypeId], [Name], [Addr], [Contact], [Corporate], [IDCard], [OrganizationCode], [Tel], [Owner], [Capital], [ApplyDate], [AuditType], [JBYhm], [JBmm]) VALUES (38, 0, 2, N'3601', 1, N'yici4', N'33', N'3', N'', N'3', N'', N'11111111111', N'3', N'', CAST(0x0000A7D000A96C1A AS DateTime), 1, N'yici4', N'8')
SET IDENTITY_INSERT [dbo].[T_LiceTran] OFF
/****** Object:  Table [dbo].[T_Jzs]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Jzs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[zcdate] [varchar](50) NULL,
	[zcdatez] [varchar](50) NULL,
	[cjje] [varchar](50) NULL,
	[htbh] [varchar](50) NULL,
	[binid] [varchar](50) NULL,
	[beizhu] [text] NULL,
	[beiyong] [varchar](500) NULL,
	[beiyong2] [varchar](500) NULL,
 CONSTRAINT [PK_T_Jzs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_Jzs] ON
INSERT [dbo].[T_Jzs] ([id], [zcdate], [zcdatez], [cjje], [htbh], [binid], [beizhu], [beiyong], [beiyong2]) VALUES (1, N'2017-01-04', N'2017-01-20', N'3', N'333', NULL, N'33', NULL, NULL)
INSERT [dbo].[T_Jzs] ([id], [zcdate], [zcdatez], [cjje], [htbh], [binid], [beizhu], [beiyong], [beiyong2]) VALUES (2, N'2017-01-04', N'2017-01-13', N'55', N'55', N'55', N'5', NULL, NULL)
INSERT [dbo].[T_Jzs] ([id], [zcdate], [zcdatez], [cjje], [htbh], [binid], [beizhu], [beiyong], [beiyong2]) VALUES (3, N'2017-01-04', N'2017-01-13', N'200元每亩每年', N'55', N'55', N'5', NULL, NULL)
INSERT [dbo].[T_Jzs] ([id], [zcdate], [zcdatez], [cjje], [htbh], [binid], [beizhu], [beiyong], [beiyong2]) VALUES (7, N'2017-01-03', N'2017-01-18', N'金额', N'4563123', N'41', N'的撒范德萨', N'一次性支付', NULL)
INSERT [dbo].[T_Jzs] ([id], [zcdate], [zcdatez], [cjje], [htbh], [binid], [beizhu], [beiyong], [beiyong2]) VALUES (8, N'2017-02-09', N'2017-02-16', N'11', N'111', NULL, N'', N'', NULL)
INSERT [dbo].[T_Jzs] ([id], [zcdate], [zcdatez], [cjje], [htbh], [binid], [beizhu], [beiyong], [beiyong2]) VALUES (9, N'2017-08-08', N'2017-08-31', N'成交金额', N'合同编号', N'68', N'', N'支付方式', N'交易单价')
SET IDENTITY_INSERT [dbo].[T_Jzs] OFF
/****** Object:  Table [dbo].[T_Job]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobTypeName] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Job] ON
INSERT [dbo].[T_Job] ([Id], [JobTypeName], [Editor], [CreateDate]) VALUES (1, N'前台受理科', N'admin', CAST(0x0000A5FB009FA15F AS DateTime))
INSERT [dbo].[T_Job] ([Id], [JobTypeName], [Editor], [CreateDate]) VALUES (2, N'市场信息科', N'admin', CAST(0x0000A5FB009FAE78 AS DateTime))
INSERT [dbo].[T_Job] ([Id], [JobTypeName], [Editor], [CreateDate]) VALUES (3, N'产权交易科', N'admin', CAST(0x0000A5FB009FBA99 AS DateTime))
INSERT [dbo].[T_Job] ([Id], [JobTypeName], [Editor], [CreateDate]) VALUES (4, N'产权鉴定科', N'admin', CAST(0x0000A5FB009FC669 AS DateTime))
INSERT [dbo].[T_Job] ([Id], [JobTypeName], [Editor], [CreateDate]) VALUES (5, N'中心分管领导', N'admin', CAST(0x0000A5FB009FD689 AS DateTime))
INSERT [dbo].[T_Job] ([Id], [JobTypeName], [Editor], [CreateDate]) VALUES (6, N'中心主管领导', N'admin', CAST(0x0000A5FB009FE55D AS DateTime))
INSERT [dbo].[T_Job] ([Id], [JobTypeName], [Editor], [CreateDate]) VALUES (7, N'网站管理员', N'SystemAdmin', CAST(0x0000A65C00BA57CA AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Job] OFF
/****** Object:  Table [dbo].[T_JBTWO]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JBTWO](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[bid] [varchar](50) NULL,
	[tid] [varchar](50) NULL,
	[jbyhm] [nvarchar](50) NULL,
	[jbjg] [nvarchar](50) NULL,
	[jbdj] [nvarchar](50) NULL,
	[zbzt] [nvarchar](50) NULL,
	[beizhu] [nvarchar](50) NULL,
	[jbbs] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_JBTWO] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中标状态1是中标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_JBTWO', @level2type=N'COLUMN',@level2name=N'zbzt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'竞标标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_JBTWO', @level2type=N'COLUMN',@level2name=N'jbbs'
GO
SET IDENTITY_INSERT [dbo].[T_JBTWO] ON
INSERT [dbo].[T_JBTWO] ([sid], [bid], [tid], [jbyhm], [jbjg], [jbdj], [zbzt], [beizhu], [jbbs]) VALUES (2, N'74', N'35', N'yici1', N'66666', N'5555', N'0', NULL, N'1')
INSERT [dbo].[T_JBTWO] ([sid], [bid], [tid], [jbyhm], [jbjg], [jbdj], [zbzt], [beizhu], [jbbs]) VALUES (3, N'74', N'36', N'yici2', N'77777', N'5555', N'1', N'', N'1')
INSERT [dbo].[T_JBTWO] ([sid], [bid], [tid], [jbyhm], [jbjg], [jbdj], [zbzt], [beizhu], [jbbs]) VALUES (4, N'74', N'35', N'yici1', N'99999', N'77777', N'4', N'', N'2')
SET IDENTITY_INSERT [dbo].[T_JBTWO] OFF
/****** Object:  Table [dbo].[T_JBONE]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_JBONE](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[bid] [varchar](50) NULL,
	[tid] [varchar](50) NULL,
	[jbyhm] [nvarchar](50) NULL,
	[jbjg] [nvarchar](50) NULL,
	[jbdj] [nvarchar](50) NULL,
	[zbzt] [nvarchar](50) NULL,
	[beizhu] [nvarchar](50) NULL,
	[jbbs] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_JBONE] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中标状态1是中标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_JBONE', @level2type=N'COLUMN',@level2name=N'zbzt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'竞标标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_JBONE', @level2type=N'COLUMN',@level2name=N'jbbs'
GO
SET IDENTITY_INSERT [dbo].[T_JBONE] ON
INSERT [dbo].[T_JBONE] ([sid], [bid], [tid], [jbyhm], [jbjg], [jbdj], [zbzt], [beizhu], [jbbs]) VALUES (7, N'71', N'36', N'yici2', N'888', N'333', N'0', NULL, N'0')
INSERT [dbo].[T_JBONE] ([sid], [bid], [tid], [jbyhm], [jbjg], [jbdj], [zbzt], [beizhu], [jbbs]) VALUES (8, N'70', N'35', N'yici1', N'666', N'333', N'0', NULL, N'0')
INSERT [dbo].[T_JBONE] ([sid], [bid], [tid], [jbyhm], [jbjg], [jbdj], [zbzt], [beizhu], [jbbs]) VALUES (9, N'68', N'37', N'yici3', N'666', N'555', N'1', N'', N'0')
INSERT [dbo].[T_JBONE] ([sid], [bid], [tid], [jbyhm], [jbjg], [jbdj], [zbzt], [beizhu], [jbbs]) VALUES (10, N'68', N'35', N'yici1', N'666', N'555', N'0', NULL, N'0')
SET IDENTITY_INSERT [dbo].[T_JBONE] OFF
/****** Object:  Table [dbo].[T_IndicatorsRelations]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_IndicatorsRelations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationType] [int] NOT NULL,
	[FK_MemberTypeCertificationId] [int] NOT NULL,
	[FK_TypeIndicatorNameId] [int] NOT NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_IndicatorsRelations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指标对应关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_IndicatorsRelations'
GO
SET IDENTITY_INSERT [dbo].[T_IndicatorsRelations] ON
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (10, 2, 1, 2, N'admin', CAST(0x0000A5FC00BA685D AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (11, 2, 1, 3, N'admin', CAST(0x0000A5FC00BA685D AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (12, 2, 1, 4, N'admin', CAST(0x0000A5FC00BA685D AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (13, 2, 1, 14, N'admin', CAST(0x0000A5FC00BA685D AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (14, 2, 1, 15, N'admin', CAST(0x0000A5FC00BA685D AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (15, 2, 1, 16, N'admin', CAST(0x0000A5FC00BA685D AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (26, 2, 2, 2, N'admin', CAST(0x0000A5FC00BAEEF8 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (27, 2, 2, 5, N'admin', CAST(0x0000A5FC00BAEEF8 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (28, 2, 2, 6, N'admin', CAST(0x0000A5FC00BAEEF8 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (29, 2, 2, 7, N'admin', CAST(0x0000A5FC00BAEEF8 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (30, 2, 2, 8, N'admin', CAST(0x0000A5FC00BAEEF8 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (31, 2, 2, 14, N'admin', CAST(0x0000A5FC00BAEEF8 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (32, 2, 2, 15, N'admin', CAST(0x0000A5FC00BAEEF8 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (33, 2, 2, 16, N'admin', CAST(0x0000A5FC00BAEEF8 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (34, 1, 2, 1, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (35, 1, 2, 5, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (36, 1, 2, 6, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (37, 1, 2, 7, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (38, 1, 2, 8, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (39, 1, 2, 17, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (40, 1, 2, 18, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (41, 1, 2, 19, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (42, 1, 2, 20, N'admin', CAST(0x0000A5FC00BB14A9 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (43, 1, 2, 21, N'admin', CAST(0x0000A5FC00BB14AC AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (44, 1, 2, 22, N'admin', CAST(0x0000A5FC00BB14AC AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (45, 1, 3, 1, N'admin', CAST(0x0000A5FC00BB3276 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (46, 1, 3, 9, N'admin', CAST(0x0000A5FC00BB3276 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (47, 1, 3, 10, N'admin', CAST(0x0000A5FC00BB3276 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (48, 1, 3, 11, N'admin', CAST(0x0000A5FC00BB3276 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (49, 1, 3, 12, N'admin', CAST(0x0000A5FC00BB3276 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (50, 1, 3, 13, N'admin', CAST(0x0000A5FC00BB3276 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (51, 1, 3, 17, N'admin', CAST(0x0000A5FC00BB3276 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (52, 1, 3, 18, N'admin', CAST(0x0000A5FC00BB3276 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (53, 1, 3, 19, N'admin', CAST(0x0000A5FC00BB3279 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (54, 1, 3, 20, N'admin', CAST(0x0000A5FC00BB3279 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (55, 1, 3, 21, N'admin', CAST(0x0000A5FC00BB3279 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (56, 1, 3, 22, N'admin', CAST(0x0000A5FC00BB3279 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (57, 2, 3, 2, N'admin', CAST(0x0000A5FC00BB61FE AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (58, 2, 3, 9, N'admin', CAST(0x0000A5FC00BB61FE AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (59, 2, 3, 10, N'admin', CAST(0x0000A5FC00BB6204 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (60, 2, 3, 11, N'admin', CAST(0x0000A5FC00BB6207 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (61, 2, 3, 12, N'admin', CAST(0x0000A5FC00BB620A AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (62, 2, 3, 13, N'admin', CAST(0x0000A5FC00BB620A AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (63, 2, 3, 14, N'admin', CAST(0x0000A5FC00BB620A AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (64, 2, 3, 15, N'admin', CAST(0x0000A5FC00BB620A AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (65, 2, 3, 16, N'admin', CAST(0x0000A5FC00BB620A AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (75, 1, 1, 1, N'admin', CAST(0x0000A6F100FB8A30 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (76, 1, 1, 3, N'admin', CAST(0x0000A6F100FB8A3B AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (77, 1, 1, 4, N'admin', CAST(0x0000A6F100FB8A3B AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (78, 1, 1, 17, N'admin', CAST(0x0000A6F100FB8A3C AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (79, 1, 1, 18, N'admin', CAST(0x0000A6F100FB8A3C AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (80, 1, 1, 19, N'admin', CAST(0x0000A6F100FB8A3C AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (81, 1, 1, 20, N'admin', CAST(0x0000A6F100FB8A3C AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (82, 1, 1, 21, N'admin', CAST(0x0000A6F100FB8A3D AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (83, 1, 1, 22, N'admin', CAST(0x0000A6F100FB8A3D AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (93, 4, 3, 8, N'admin', CAST(0x0000A6F600E93232 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (94, 4, 3, 9, N'admin', CAST(0x0000A6F600E93239 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (95, 4, 3, 10, N'admin', CAST(0x0000A6F600E93239 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (96, 4, 3, 11, N'admin', CAST(0x0000A6F600E93239 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (97, 4, 1, 11, N'admin', CAST(0x0000A6F600E94DC3 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (98, 4, 1, 12, N'admin', CAST(0x0000A6F600E94DC3 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (99, 4, 1, 13, N'admin', CAST(0x0000A6F600E94DC3 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (100, 4, 1, 14, N'admin', CAST(0x0000A6F600E94DC3 AS DateTime))
INSERT [dbo].[T_IndicatorsRelations] ([Id], [ApplicationType], [FK_MemberTypeCertificationId], [FK_TypeIndicatorNameId], [Editor], [CreateDate]) VALUES (101, 3, 1, 22, N'admin', CAST(0x0000A6FD0092B36E AS DateTime))
SET IDENTITY_INSERT [dbo].[T_IndicatorsRelations] OFF
/****** Object:  Table [dbo].[T_FujianBiao]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FujianBiao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fjname] [varchar](50) NULL,
	[fjpath] [nvarchar](150) NULL,
	[fid] [varchar](50) NULL,
	[fjlx] [varchar](50) NULL,
	[fjdynameid] [varchar](150) NULL,
 CONSTRAINT [PK_T_FujianBiao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_FujianBiao] ON
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (1, N'SystemAdmin', N'c5a6f0553dfc41baa9c9d4278ddcd648.jpg', N'49', N'3', N'14')
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (5, N'SystemAdmin', N'5eed1397fea44d4bb7ec34417807eb5a.jpg', N'48', N'3', N'14')
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (7, N'SystemAdmin', N'fc4822f087bf46b2ade8539403ffcece.jpg', N'52', N'3', N'14')
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (8, N'SystemAdmin', N'355ecbdf377445178e977e919550d53c.jpg', N'9', N'4', N'11')
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (9, N'SystemAdmin', N'4619437f42404b3d9bf60cc35250b6d3.jpg', N'53', N'3', N'14')
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (10, N'SystemAdmin', N'88832a5c84d3466b99ddf275c23598cb.jpg', N'9', N'4', N'11')
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (11, N'SystemAdmin', N'73a0268907204d94a8e5466cc1420cd4.jpg', N'54', N'3', N'14')
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (12, N'SystemAdmin', N'9fd5f5bb7fd648e3833e5761a6a8285b.jpg', N'57', N'3', N'22')
INSERT [dbo].[T_FujianBiao] ([id], [fjname], [fjpath], [fid], [fjlx], [fjdynameid]) VALUES (13, N'SystemAdmin', N'67502a6d6f70424199102cd0bc747eec.png', N'64', N'3', N'22')
SET IDENTITY_INSERT [dbo].[T_FujianBiao] OFF
/****** Object:  Table [dbo].[T_Fujian]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Fujian](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fjname] [varchar](50) NULL,
	[fjpath] [nvarchar](150) NULL,
	[fid] [varchar](50) NULL,
	[fjlx] [varchar](50) NULL,
 CONSTRAINT [PK_T_Fujian] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_Fujian] ON
INSERT [dbo].[T_Fujian] ([id], [fjname], [fjpath], [fid], [fjlx]) VALUES (1, N'login22', N'131232367790411597.jpg', N'70', N'')
INSERT [dbo].[T_Fujian] ([id], [fjname], [fjpath], [fid], [fjlx]) VALUES (2, N'chengjiaogg', N'131232367790341593.jpg', N'70', N'')
INSERT [dbo].[T_Fujian] ([id], [fjname], [fjpath], [fid], [fjlx]) VALUES (3, N'xiangmu', N'131233066779987205.jpg', N'71', N'')
INSERT [dbo].[T_Fujian] ([id], [fjname], [fjpath], [fid], [fjlx]) VALUES (6, N'王浩莱阳出差决算表', N'131280700685811920.xls', N'92', N'')
INSERT [dbo].[T_Fujian] ([id], [fjname], [fjpath], [fid], [fjlx]) VALUES (7, N'泾口乡东风村300亩水面', N'131359133668916434.pdf', N'98', N'')
SET IDENTITY_INSERT [dbo].[T_Fujian] OFF
/****** Object:  Table [dbo].[T_Dyzt]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Dyzt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[binid] [varchar](50) NULL,
	[dyzt] [varchar](50) NULL,
 CONSTRAINT [PK_T_Dyzt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_Dyzt] ON
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (1, N'7', N'2')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (2, N'6', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (3, N'5', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (4, N'40', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (5, N'4', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (6, N'59', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (7, N'38', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (8, N'41', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (9, N'2', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (10, N'16', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (11, N'15', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (12, N'10', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (13, N'39', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (14, N'60', N'1')
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (15, N'66', N'1')
SET IDENTITY_INSERT [dbo].[T_Dyzt] OFF
/****** Object:  Table [dbo].[T_Dysq]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Dysq](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fid] [varchar](50) NULL,
	[dycs] [varchar](50) NULL,
	[dysqnr] [varchar](500) NULL,
	[dysqsj] [varchar](50) NULL,
	[dyzt] [varchar](50) NULL,
	[beiyong] [varchar](50) NULL,
 CONSTRAINT [PK_T_Dysq] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_Dysq] ON
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (1, N'7', N'1', N'第一次打印', N'2017-01-11', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (2, N'6', N'1', N'第一次打印', N'2017-01-11', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (3, N'5', N'1', N'第一次打印', N'2017-01-11', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (4, N'40', N'1', N'第一次打印', N'2017-01-11', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (5, N'7', N'2', N'456465464', N'2017/1/11 11:30:49', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (6, N'4', N'1', N'第一次打印', N'2017-01-11', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (7, N'7', N'3', N'dadfdsafdsafdsfadsafds', N'2017/1/11 15:43:23', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (8, N'7', N'4', N'456464', N'2017/1/16 11:17:04', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (9, N'59', N'1', N'第一次打印', N'2017-01-16', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (10, N'38', N'1', N'第一次打印', N'2017-01-17', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (11, N'41', N'1', N'第一次打印', N'2017-01-17', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (12, N'2', N'1', N'第一次打印', N'2017-02-03', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (13, N'16', N'1', N'第一次打印', N'2017-02-03', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (14, N'15', N'1', N'第一次打印', N'2017-02-03', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (15, N'10', N'1', N'第一次打印', N'2017-02-13', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (16, N'39', N'1', N'第一次打印', N'2017-02-13', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (17, N'60', N'1', N'第一次打印', N'2017-02-14', N'1', NULL)
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (18, N'66', N'1', N'第一次打印', N'2017-05-11', N'1', NULL)
SET IDENTITY_INSERT [dbo].[T_Dysq] OFF
/****** Object:  Table [dbo].[T_Dyjl]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Dyjl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fid] [varchar](50) NULL,
	[dysj] [varchar](50) NULL,
	[dyr] [varchar](50) NULL,
	[dysqid] [varchar](50) NULL,
 CONSTRAINT [PK_T_Dyjl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_Dyjl] ON
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (1, N'7', N'2017/1/11 10:17:46', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (2, N'7', N'2017/1/11 10:18:19', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (3, N'7', N'2017/1/11 10:18:43', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (5, N'6', N'2017/1/11 11:13:10', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (6, N'6', N'2017/1/11 11:13:15', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (7, N'6', N'2017/1/11 11:13:20', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (8, N'5', N'2017/1/11 11:13:53', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (9, N'4', N'2017/1/11 11:36:59', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (10, N'40', N'2017/1/11 11:39:44', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (11, N'4', N'2017/1/11 13:10:38', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (12, N'7', N'2017/1/11 15:41:35', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (13, N'7', N'2017/1/11 15:41:41', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (14, N'7', N'2017/1/11 15:41:45', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (15, N'7', N'2017/1/12 10:00:17', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (16, N'7', N'2017/1/16 11:16:36', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (17, N'7', N'2017/1/16 11:16:43', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (18, N'4', N'2017/1/17 13:18:55', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (19, N'41', N'2017/1/18 13:19:24', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (20, N'40', N'2017/2/13 10:13:15', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (21, N'38', N'2017/2/13 10:33:43', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (22, N'16', N'2017/2/14 8:19:59', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (23, N'39', N'2017/2/14 16:00:14', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (24, N'38', N'2017/2/22 14:28:14', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (25, N'10', N'2017/2/22 14:28:57', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (26, N'60', N'2017/2/22 14:30:20', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (27, N'40', N'2017/2/22 14:45:55', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (28, N'16', N'2017/2/22 14:48:43', N'SystemAdmin', N'1')
INSERT [dbo].[T_Dyjl] ([id], [fid], [dysj], [dyr], [dysqid]) VALUES (29, N'41', N'2017/5/3 14:52:49', N'SystemAdmin', N'1')
SET IDENTITY_INSERT [dbo].[T_Dyjl] OFF
/****** Object:  Table [dbo].[T_Contacts]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_OrganizationId] [nvarchar](150) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserTel] [nvarchar](50) NOT NULL,
	[ConsContent] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Contacts] ON
INSERT [dbo].[T_Contacts] ([Id], [FK_OrganizationId], [UserName], [UserTel], [ConsContent], [Editor], [CreateDate]) VALUES (1, N'3601', N'张科长', N'15192085121', N'科长', N'张伟伟', CAST(0x0000A63301154372 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Contacts] OFF
/****** Object:  Table [dbo].[T_BidTrans]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidTrans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[FK_LiceTranId] [int] NOT NULL,
	[TradingStatus] [int] NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidTrans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_BidTrans] ON
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (1, 1, 2, 1, N'system', CAST(0x0000A60A00F03B75 AS DateTime), CAST(0x0000A60A00F03B9F AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (3, 2, 3, 1, N'system', CAST(0x0000A60F0128BB38 AS DateTime), CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (4, 3, 4, 1, N'system', CAST(0x0000A62300F596B8 AS DateTime), CAST(0x0000A62300F596C3 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (6, 4, 5, 1, N'system', CAST(0x0000A58000000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (7, 5, 6, 1, N'system', CAST(0x0000A633011D0564 AS DateTime), CAST(0x0000A633011D0564 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (8, 6, 7, 1, N'system', CAST(0x0000A633011D2B1D AS DateTime), CAST(0x0000A633011D2B1D AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (9, 34, 19, 2, N'08', CAST(0x0000A65C00F5B66F AS DateTime), CAST(0x0000A65C00F5B673 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (10, 35, 19, 0, N'08', CAST(0x0000A65C00FAF6DA AS DateTime), CAST(0x0000A65C00FAF6DA AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (11, 34, 20, 1, N'张三丰', CAST(0x0000A65D00EAA72A AS DateTime), CAST(0x0000A65D00EAA734 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (12, 38, 22, 1, N'SystemAdmin', CAST(0x0000A69D009FB12B AS DateTime), CAST(0x0000A69D009FB12B AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (13, 39, 22, 1, N'SystemAdmin', CAST(0x0000A69D00A0C018 AS DateTime), CAST(0x0000A69D00A0C018 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (14, 40, 22, 1, N'SystemAdmin', CAST(0x0000A69D00A29180 AS DateTime), CAST(0x0000A69D00A29180 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (15, 41, 22, 1, N'SystemAdmin', CAST(0x0000A6E2008FFE5D AS DateTime), CAST(0x0000A6E2008FFE66 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (16, 53, 18, 0, N'SystemAdmin', CAST(0x0000A6F7008B5E2D AS DateTime), CAST(0x0000A6F7008B5E2D AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (17, 54, 19, 1, N'SystemAdmin', CAST(0x0000A6F7008D6C70 AS DateTime), CAST(0x0000A6F7008D6C70 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (18, 55, 22, 1, N'SystemAdmin', CAST(0x0000A6F7008F12EA AS DateTime), CAST(0x0000A6F7008F12EA AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (19, 41, 18, 2, N'SystemAdmin', CAST(0x0000A6FD00964642 AS DateTime), CAST(0x0000A6FD00964649 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (20, 41, 19, 2, N'SystemAdmin', CAST(0x0000A6FD009A9ECF AS DateTime), CAST(0x0000A6FD009A9ECF AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (21, 59, 19, 1, N'SystemAdmin', CAST(0x0000A6FD00FFC87C AS DateTime), CAST(0x0000A6FD00FFC87C AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (22, 60, 20, 1, N'SystemAdmin', CAST(0x0000A71A008BE9DC AS DateTime), CAST(0x0000A71A008BE9DD AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (23, 65, 29, 1, N'SystemAdmin', CAST(0x0000A770009B11F5 AS DateTime), CAST(0x0000A770009B11F6 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (24, 66, 29, 1, N'SystemAdmin', CAST(0x0000A77000EE1A59 AS DateTime), CAST(0x0000A77000EE1A59 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (25, 67, 29, 1, N'SystemAdmin', CAST(0x0000A77400FB9547 AS DateTime), CAST(0x0000A77400FB9552 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (26, 68, 35, 0, N'SystemAdmin', CAST(0x0000A7D000A9B836 AS DateTime), CAST(0x0000A7D000A9B840 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (27, 68, 36, 0, N'SystemAdmin', CAST(0x0000A7D000A9CC40 AS DateTime), CAST(0x0000A7D000A9CC40 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (28, 68, 37, 1, N'SystemAdmin', CAST(0x0000A7D000A9DCC4 AS DateTime), CAST(0x0000A7D000A9DCC4 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (29, 68, 38, 0, N'SystemAdmin', CAST(0x0000A7D000A9ED3B AS DateTime), CAST(0x0000A7D000A9ED3B AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (30, 69, 35, 0, N'SystemAdmin', CAST(0x0000A7D001048AB6 AS DateTime), CAST(0x0000A7D001048AB7 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (31, 69, 36, 0, N'SystemAdmin', CAST(0x0000A7D001049A6C AS DateTime), CAST(0x0000A7D001049A6C AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (32, 71, 36, 0, N'SystemAdmin', CAST(0x0000A7D00104B8F5 AS DateTime), CAST(0x0000A7D00104B8F5 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (33, 70, 35, 0, N'SystemAdmin', CAST(0x0000A7D00104D20E AS DateTime), CAST(0x0000A7D00104D20E AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (34, 72, 35, 1, N'SystemAdmin', CAST(0x0000A7D100B672D6 AS DateTime), CAST(0x0000A7D100B672DB AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (35, 73, 35, 0, N'SystemAdmin', CAST(0x0000A7D100B79416 AS DateTime), CAST(0x0000A7D100B79416 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (36, 74, 35, 1, N'SystemAdmin', CAST(0x0000A7E4009B5668 AS DateTime), CAST(0x0000A7E4009B5668 AS DateTime))
INSERT [dbo].[T_BidTrans] ([Id], [FK_BidId], [FK_LiceTranId], [TradingStatus], [Editor], [CreateDate], [ApplyDate]) VALUES (37, 74, 36, 1, N'SystemAdmin', CAST(0x0000A7E4009B67FC AS DateTime), CAST(0x0000A7E4009B67FC AS DateTime))
SET IDENTITY_INSERT [dbo].[T_BidTrans] OFF
/****** Object:  Table [dbo].[T_BidReturnInfo]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidReturnInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[FK_JobId] [int] NOT NULL,
	[ReturnDepaName] [nvarchar](150) NOT NULL,
	[ReturnDepaSay] [nvarchar](120) NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidReturnInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_BidReturnInfo] ON
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (1, 6, 1, N'1', N'1', CAST(0x0000A608014B8832 AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (2, 6, 6, N'6', N'6', CAST(0x0000A609009C8C6B AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (3, 7, 6, N'张伟伟', N'附件上传不完全', CAST(0x0000A60C00BB28C7 AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (4, 48, 6, N'SystemAdmin', N'11', CAST(0x0000A6F2009580A0 AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (5, 47, 6, N'SystemAdmin', N'我问问', CAST(0x0000A6F2009AA74A AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (6, 51, 6, N'SystemAdmin', N'222', CAST(0x0000A6F200E64B76 AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (7, 50, 6, N'SystemAdmin', N'22', CAST(0x0000A6F2010B13F9 AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (8, 51, 6, N'SystemAdmin', N'555', CAST(0x0000A6F2010B5B4D AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (9, 47, 6, N'SystemAdmin', N'555', CAST(0x0000A6F2010B8732 AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (10, 53, 6, N'SystemAdmin', N'1212', CAST(0x0000A6F7008BF093 AS DateTime))
INSERT [dbo].[T_BidReturnInfo] ([Id], [FK_BidId], [FK_JobId], [ReturnDepaName], [ReturnDepaSay], [ReturnDate]) VALUES (11, 66, 6, N'SystemAdmin', N'测试退会的', CAST(0x0000A77000EE57F4 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_BidReturnInfo] OFF
/****** Object:  Table [dbo].[T_BidPrintGrounds]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidPrintGrounds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[PrintNum] [int] NOT NULL,
	[PrintName] [nvarchar](150) NOT NULL,
	[Reason] [nvarchar](150) NOT NULL,
	[PrintDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidPrintGrounds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_BidPrintGrounds] ON
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (1, 15, 1, N'张伟伟', N'正常打印', CAST(0x0000A61101194824 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (2, 15, 2, N'张伟伟', N'地刺问问', CAST(0x0000A611011A51D8 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (3, 15, 3, N'张伟伟', N'11111', CAST(0x0000A611011FA97C AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (4, 15, 4, N'张伟伟', N'12121', CAST(0x0000A612008F4DB7 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (5, 7, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A65600A29F94 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (6, 7, 2, N'SystemAdmin', N'QueryString', CAST(0x0000A65600A3FA41 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (7, 7, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A65700EF65B1 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (8, 7, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A65700EF65A8 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (9, 7, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A65700EF65A8 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (10, 7, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A65700EF65A8 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (11, 7, 7, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A65700F380C4 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (12, 7, 8, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A66400FCB4D7 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (13, 7, 9, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6640101AB84 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (14, 7, 10, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6640101AF59 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (15, 7, 11, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6640101C4C1 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (16, 7, 12, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A66B00FE2970 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (17, 7, 13, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68500883261 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (18, 7, 14, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A685008835EB AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (19, 7, 15, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68500883D36 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (20, 7, 16, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68500883F70 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (21, 6, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6850088453B AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (22, 5, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68500884C69 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (23, 16, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68500885468 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (24, 15, 5, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68500885ADF AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (25, 14, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68500886102 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (26, 13, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6850088685B AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (27, 12, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68500886D6C AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (28, 7, 17, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A68E009C061B AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (29, 6, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69C00A3E4DA AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (30, 6, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69C00A8E7CD AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (31, 7, 18, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69C00AEDA11 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (32, 7, 19, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69C00AEE239 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (33, 7, 20, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69C00AEF443 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (34, 39, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69D00AC4EF8 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (35, 6, 4, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69D00AFFE50 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (36, 6, 5, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E0098C07C AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (37, 14, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00997FCC AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (38, 14, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E0099B473 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (39, 16, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E009A79A1 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (40, 16, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E009A8336 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (41, 15, 6, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E009C6A04 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (42, 39, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E009C766E AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (43, 39, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00AEBB11 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (44, 39, 4, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00AFFC67 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (45, 3, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B002B1 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (46, 5, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B053EF AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (47, 3, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B1A137 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (48, 15, 7, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B217C2 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (49, 16, 4, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B398C1 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (50, 2, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B3A6EE AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (51, 2, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B3D889 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (52, 16, 5, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B48F55 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (53, 15, 8, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B49CC9 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (54, 3, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B53DD4 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (55, 4, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B78E11 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (56, 5, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B84B6C AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (57, 6, 6, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B8F2D5 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (58, 12, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B8FDD2 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (59, 14, 4, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B93280 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (60, 16, 6, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00B97A8E AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (61, 16, 7, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BA0CF5 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (62, 2, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BA67B1 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (63, 14, 5, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BADC46 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (64, 16, 8, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BB1ABF AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (65, 39, 5, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BB2469 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (66, 39, 6, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BBC34F AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (67, 39, 7, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BC2F25 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (68, 39, 8, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BCB959 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (69, 39, 9, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BCF973 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (70, 39, 10, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BD4B8A AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (71, 39, 11, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00BE56F3 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (72, 39, 12, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00E89CCE AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (73, 39, 13, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00E91DB2 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (74, 39, 14, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00EAD92F AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (75, 39, 15, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00EBB773 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (76, 15, 9, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00EC3ED0 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (77, 11, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00EC46FF AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (78, 10, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00EC4FF7 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (79, 1, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00EC5DC8 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (80, 39, 16, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00ECA3AF AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (81, 39, 17, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00F1F65F AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (82, 39, 18, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00F29AA9 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (83, 39, 19, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00F36F25 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (84, 13, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A69E00F86501 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (85, 6, 7, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6E6008F412B AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (86, 4, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6E6008F4F5E AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (87, 7, 21, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F7008B3F60 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (88, 7, 22, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F700DC0A29 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (89, 7, 23, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F700E9AAC1 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (90, 7, 24, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F701000F19 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (91, 40, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F701002018 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (92, 7, 25, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800955F29 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (93, 6, 8, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F80096BE66 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (94, 6, 9, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A1941C AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (95, 7, 26, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A89F26 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (96, 7, 27, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A8A85C AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (97, 7, 28, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A8AF03 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (98, 7, 29, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A8B60B AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (99, 7, 30, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A91F37 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (100, 7, 31, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A9905A AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (101, 7, 32, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A9CD37 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (102, 7, 33, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A9F04A AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (103, 7, 34, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800A9FE8F AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (104, 7, 35, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800AA8FAC AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (105, 6, 10, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800AA9A1E AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (106, 7, 36, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800AAA17D AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (107, 7, 37, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800AB4085 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (108, 5, 4, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800AB4985 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (109, 6, 11, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800B8E4CF AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (110, 6, 12, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800B8EA92 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (111, 6, 13, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800B8F09B AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (112, 6, 14, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800B8F668 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (113, 5, 5, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800B91773 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (114, 7, 38, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800BD78A5 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (115, 40, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800BD7D61 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (116, 7, 39, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800BDC775 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (117, 7, 40, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800BE0655 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (118, 7, 41, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800BF3639 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (119, 4, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800BF4B4F AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (120, 4, 4, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800BF6F49 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (121, 40, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800C0301F AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (122, 4, 5, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F800D927E7 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (123, 7, 42, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F801015A87 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (124, 7, 43, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F80101C2FF AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (125, 7, 44, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F801021026 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (126, 7, 45, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F801029D44 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (127, 7, 46, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F80102A44B AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (128, 7, 47, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F80102A9A6 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (129, 7, 48, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F80102AEFE AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (130, 7, 49, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F801032551 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (131, 7, 50, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6F900A4DF7B AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (132, 7, 51, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FD00B9D618 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (133, 7, 52, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FD00B9DE40 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (134, 7, 53, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FD00B9E418 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (135, 7, 54, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FD00F0AE6E AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (136, 7, 55, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FD00F0C826 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (137, 59, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FD010094F7 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (138, 7, 56, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FE00DB64F0 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (139, 4, 6, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FE00DB6DE3 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (140, 4, 7, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FE00DF0E54 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (141, 38, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FE00DF14EC AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (142, 41, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FE00E41617 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (143, 41, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A6FF00DB90C0 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (144, 6, 15, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A70F011A6AEC AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (145, 4, 8, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A70F011A7090 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (146, 2, 4, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A70F011A7601 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (147, 16, 9, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A70F011AEF4A AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (148, 4, 9, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A70F011B12DD AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (149, 15, 10, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A70F011B18C7 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (150, 10, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71900A36F31 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (151, 40, 4, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71900A86F1E AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (152, 7, 57, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71900AE0974 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (153, 38, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71900AE0ED2 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (154, 7, 58, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71901086980 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (155, 39, 20, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71901086DEF AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (156, 16, 10, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71A0089534A AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (157, 60, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71A010641C7 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (158, 7, 59, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71A0107B383 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (159, 4, 10, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71A0107B837 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (160, 39, 21, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A71A0107BCDA AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (161, 7, 60, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A72200EE726E AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (162, 38, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A72200EE77D5 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (163, 10, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A72200EEAA39 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (164, 60, 2, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A72200EF0C2A AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (165, 40, 5, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A72200F353A4 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (166, 16, 11, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A72200F418C9 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (167, 41, 3, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A76800F53883 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (168, 66, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A77000F01BCA AS DateTime))
SET IDENTITY_INSERT [dbo].[T_BidPrintGrounds] OFF
/****** Object:  Table [dbo].[T_BidPlacard]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BidPlacard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[BidPlacardTitle] [nvarchar](50) NOT NULL,
	[BidPlacardContent] [nvarchar](500) NOT NULL,
	[Publisher] [nvarchar](50) NOT NULL,
	[ReleaseTime] [datetime] NOT NULL,
	[fujian] [varchar](500) NULL,
	[fujianname] [varchar](50) NULL,
 CONSTRAINT [PK_T_BidPlacard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_BidPlacard] ON
INSERT [dbo].[T_BidPlacard] ([Id], [FK_BidId], [BidPlacardTitle], [BidPlacardContent], [Publisher], [ReleaseTime], [fujian], [fujianname]) VALUES (1, 3, N'池塘转包-招标公告事宜', N'招标公告：主要是证件齐全', N'张伟伟', CAST(0x0000A60F011022F1 AS DateTime), NULL, NULL)
INSERT [dbo].[T_BidPlacard] ([Id], [FK_BidId], [BidPlacardTitle], [BidPlacardContent], [Publisher], [ReleaseTime], [fujian], [fujianname]) VALUES (2, 11, N'城南60亩土地招租-招标公告事宜', N'测试招标公关稿打灯阿萨德啊大大新农村年开始对你发誓快捷方式克里夫就是犯贱史蒂夫纳什雷锋精神的 ', N'张伟伟', CAST(0x0000A62700AFEF53 AS DateTime), NULL, NULL)
INSERT [dbo].[T_BidPlacard] ([Id], [FK_BidId], [BidPlacardTitle], [BidPlacardContent], [Publisher], [ReleaseTime], [fujian], [fujianname]) VALUES (3, 2, N'北山转包-招标公告事宜', N'招标公告', N'SystemAdmin', CAST(0x0000A63B00A9C349 AS DateTime), NULL, NULL)
INSERT [dbo].[T_BidPlacard] ([Id], [FK_BidId], [BidPlacardTitle], [BidPlacardContent], [Publisher], [ReleaseTime], [fujian], [fujianname]) VALUES (4, 34, N'土地测试-招标公告事宜', N'测试招标公告0808', N'080101', CAST(0x0000A65C00B4FE8E AS DateTime), NULL, NULL)
INSERT [dbo].[T_BidPlacard] ([Id], [FK_BidId], [BidPlacardTitle], [BidPlacardContent], [Publisher], [ReleaseTime], [fujian], [fujianname]) VALUES (5, 38, N'大街上看了就发了肯德基撒开了房间打扫-招标公告事宜', N'去去去去', N'SystemAdmin', CAST(0x0000A69D00A04E2B AS DateTime), NULL, NULL)
INSERT [dbo].[T_BidPlacard] ([Id], [FK_BidId], [BidPlacardTitle], [BidPlacardContent], [Publisher], [ReleaseTime], [fujian], [fujianname]) VALUES (6, 41, N'测试数据-招标公告事宜', N'反倒是噶范德萨范德萨dsafdsa', N'SystemAdmin', CAST(0x0000A6FD00E5BE10 AS DateTime), N'', N'2.jpg')
INSERT [dbo].[T_BidPlacard] ([Id], [FK_BidId], [BidPlacardTitle], [BidPlacardContent], [Publisher], [ReleaseTime], [fujian], [fujianname]) VALUES (7, 46, N'dasf', N'dsafds', N'SystemAdmin', CAST(0x0000A6FD01023D85 AS DateTime), NULL, NULL)
INSERT [dbo].[T_BidPlacard] ([Id], [FK_BidId], [BidPlacardTitle], [BidPlacardContent], [Publisher], [ReleaseTime], [fujian], [fujianname]) VALUES (8, 45, N'', N'', N'SystemAdmin', CAST(0x0000A6FD010293EE AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[T_BidPlacard] OFF
/****** Object:  Table [dbo].[T_BidOneBaojia]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BidOneBaojia](
	[bjid] [int] IDENTITY(1,1) NOT NULL,
	[bidid] [varchar](50) NULL,
	[binoneid] [varchar](50) NULL,
	[bjyhm] [nvarchar](50) NULL,
	[srfid] [nvarchar](50) NULL,
	[beizhu] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_BidOneBaojia] PRIMARY KEY CLUSTERED 
(
	[bjid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BidOne]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BidOne](
	[oneid] [int] IDENTITY(1,1) NOT NULL,
	[binid] [varchar](50) NULL,
	[jssj] [nvarchar](50) NULL,
	[beizhu] [varchar](50) NULL,
 CONSTRAINT [PK_T_BidOne] PRIMARY KEY CLUSTERED 
(
	[oneid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BidLostScan]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidLostScan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[fk_BidLostId] [int] NOT NULL,
	[ScanName] [nvarchar](50) NOT NULL,
	[ScanUrl] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidLostScan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BidLost]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidLost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[LostName] [nvarchar](50) NOT NULL,
	[LostDate] [datetime] NOT NULL,
	[LostParts] [nvarchar](150) NOT NULL,
	[LostCause] [nvarchar](150) NOT NULL,
	[Remark] [nvarchar](150) NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidLost] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BidFile]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[FileUrlName] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BidContractScan]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidContractScan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[ScanName] [nvarchar](100) NOT NULL,
	[ScanUrl] [nvarchar](100) NOT NULL,
	[UploadName] [nvarchar](100) NOT NULL,
	[UploadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidContractScan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_BidContractScan] ON
INSERT [dbo].[T_BidContractScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [UploadName], [UploadDate]) VALUES (1, 11, N'合同扫描件', N'20160624112815.pdf', N'张伟伟', CAST(0x0000A62F00BD0A5F AS DateTime))
INSERT [dbo].[T_BidContractScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [UploadName], [UploadDate]) VALUES (4, 65, N'图片', N'', N'SystemAdmin', CAST(0x0000A77000A8B40C AS DateTime))
INSERT [dbo].[T_BidContractScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [UploadName], [UploadDate]) VALUES (5, 65, N'dsafs', N'', N'SystemAdmin', CAST(0x0000A77000A9964A AS DateTime))
INSERT [dbo].[T_BidContractScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [UploadName], [UploadDate]) VALUES (6, 65, N'344', N'20170511101913.JPG', N'SystemAdmin', CAST(0x0000A77000AA1AFB AS DateTime))
INSERT [dbo].[T_BidContractScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [UploadName], [UploadDate]) VALUES (7, 65, N'pdfdsa', N'20170511102842.pdf', N'SystemAdmin', CAST(0x0000A77000ACADA8 AS DateTime))
INSERT [dbo].[T_BidContractScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [UploadName], [UploadDate]) VALUES (8, 66, N'555', N'20170511023223.pdf', N'SystemAdmin', CAST(0x0000A77000EF9C4F AS DateTime))
INSERT [dbo].[T_BidContractScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [UploadName], [UploadDate]) VALUES (9, 72, N'333', N'20170821084915.png', N'SystemAdmin', CAST(0x0000A7D600915DD9 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_BidContractScan] OFF
/****** Object:  Table [dbo].[T_BidClinchScan]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidClinchScan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[ScanName] [nvarchar](50) NOT NULL,
	[ScanUrl] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidClinchScan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_BidClinchScan] ON
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (1, 3, N'12', N'3', N'3', CAST(0x0000A61000A956D3 AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (4, 3, N'11', N'3', N'3', CAST(0x0000A61000A96378 AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (5, 3, N'14', N'3', N'3', CAST(0x0000A61000A965DD AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (6, 3, N'15', N'3', N'3', CAST(0x0000A61000A968E2 AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (8, 3, N'sara三大', N'20160524112621.pdf', N'张伟伟', CAST(0x0000A61000BC8503 AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (9, 3, N'王企鹅屋企恶趣味', N'20160524113118.pdf', N'张伟伟', CAST(0x0000A61000BE0187 AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (10, 3, N'喂喂喂', N'20160524113401.pdf', N'张伟伟', CAST(0x0000A61000BE9F8C AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (11, 72, N'33', N'20170821085242.pdf', N'SystemAdmin', CAST(0x0000A7D6009252DC AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (12, 72, N'333', N'20170821090536.pdf', N'SystemAdmin', CAST(0x0000A7D60095DB70 AS DateTime))
INSERT [dbo].[T_BidClinchScan] ([Id], [FK_BidId], [ScanName], [ScanUrl], [Editor], [CreateDate]) VALUES (13, 72, N'333', N'20170821093145.pdf', N'SystemAdmin', CAST(0x0000A7D6009D0A93 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_BidClinchScan] OFF
/****** Object:  Table [dbo].[T_BidChangeScan]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidChangeScan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[ScanFileName] [nvarchar](50) NOT NULL,
	[ScanFileUrl] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidChangeScan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BidChange]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidChange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[BidName] [nvarchar](100) NOT NULL,
	[ListingPrice] [decimal](18, 3) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[BidBasic] [nvarchar](500) NOT NULL,
	[Ownership] [nvarchar](100) NULL,
	[Properties] [nvarchar](100) NULL,
	[TurnOut] [int] NULL,
	[RightsBodies] [nvarchar](100) NULL,
	[FeedingMechanism] [nvarchar](100) NULL,
	[WarrantNumber] [nvarchar](100) NULL,
	[MeansTransaction] [int] NULL,
	[LowTransaction] [decimal](18, 3) NULL,
	[Turnover] [decimal](18, 3) NULL,
	[RelatesNum] [int] NULL,
 CONSTRAINT [PK_T_BidChange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BidCancellationScan]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidCancellationScan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[ScanName] [nvarchar](150) NOT NULL,
	[ScanUrl] [nvarchar](150) NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidCancellationScan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BidCancellation]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidCancellation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[CanceDate] [datetime] NOT NULL,
	[CanceReason] [nvarchar](150) NOT NULL,
	[Remark] [nvarchar](150) NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_BidCancellation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BidAuction]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BidAuction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[LiceTranId] [int] NOT NULL,
	[SeveralBid] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[AuctionDate] [datetime] NOT NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_BidAuction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_BidAuction] ON
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (7, 11, 9, 1, CAST(200.00 AS Decimal(18, 2)), CAST(0x0000A62D0112C950 AS DateTime), N'张三', NULL)
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (8, 34, 20, 1, CAST(111.00 AS Decimal(18, 2)), CAST(0x0000A67600B3DFA0 AS DateTime), N'张三丰', CAST(0x0000A67600B3DFA0 AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (9, 37, 22, 1, CAST(400.00 AS Decimal(18, 2)), CAST(0x0000A69D009CF46C AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A69D009CF46D AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (10, 39, 22, 1, CAST(22.00 AS Decimal(18, 2)), CAST(0x0000A69D00A11B15 AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A69D00A11B15 AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (11, 40, 22, 1, CAST(2.00 AS Decimal(18, 2)), CAST(0x0000A69D00A2C4F4 AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A69D00A2C4F4 AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (12, 55, 22, 1, CAST(888.00 AS Decimal(18, 2)), CAST(0x0000A6F7008F41CD AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A6F7008F41CD AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (13, 59, 19, 1, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A6FD00FFF0E0 AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A6FD00FFF0E0 AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (14, 41, 22, 1, CAST(333.00 AS Decimal(18, 2)), CAST(0x0000A6FE0084C8C2 AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A6FE0084C8C2 AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (15, 60, 20, 1, CAST(5555.00 AS Decimal(18, 2)), CAST(0x0000A71A008BFEE2 AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A71A008BFEE3 AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (16, 54, 19, 5, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A74D008E6EE4 AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A74D008E6EE4 AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (17, 65, 29, 1, CAST(20000.00 AS Decimal(18, 2)), CAST(0x0000A770009F445B AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A770009F445B AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (18, 66, 29, 1, CAST(5555.00 AS Decimal(18, 2)), CAST(0x0000A77000EF6850 AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A77000EF6851 AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (19, 67, 29, 5, CAST(2.00 AS Decimal(18, 2)), CAST(0x0000A77400FBC07B AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A77400FBC07B AS DateTime))
INSERT [dbo].[T_BidAuction] ([Id], [FK_BidId], [LiceTranId], [SeveralBid], [Price], [AuctionDate], [Editor], [CreateDate]) VALUES (20, 72, 35, 1, CAST(33.00 AS Decimal(18, 2)), CAST(0x0000A7D100B6AF46 AS DateTime), N'SystemAdmin                                       ', CAST(0x0000A7D100B6AF46 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_BidAuction] OFF
/****** Object:  Table [dbo].[T_Bid]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Bid](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrgCode] [nvarchar](50) NOT NULL,
	[FK_LiceTranId] [int] NOT NULL,
	[BidName] [nvarchar](100) NOT NULL,
	[ListingPrice] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[BidBasic] [nvarchar](500) NULL,
	[Ownership] [nvarchar](50) NULL,
	[Properties] [nvarchar](50) NULL,
	[TurnOut] [int] NULL,
	[RightsBodies] [nvarchar](50) NULL,
	[FeedingMechanism] [nvarchar](50) NULL,
	[WarrantNumber] [nvarchar](50) NULL,
	[LowTransaction] [nvarchar](50) NULL,
	[Turnover] [decimal](18, 2) NULL,
	[ContractDate] [nvarchar](50) NULL,
	[ContractNo] [nvarchar](50) NULL,
	[Admissibility] [nvarchar](50) NULL,
	[NoAssurance] [nvarchar](50) NULL,
	[TradingCenterName] [nvarchar](50) NULL,
	[AreContract] [nvarchar](5) NULL,
	[RelatesNum] [nvarchar](5) NULL,
	[DepaStatus] [int] NULL,
	[ReturnStatus] [int] NULL,
	[UpManager] [int] NULL,
	[Publicity] [nvarchar](5) NULL,
	[Change] [int] NULL,
	[Cancel] [int] NULL,
	[Lost] [int] NULL,
	[StandardMode] [int] NOT NULL,
	[StandardType] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[guimo] [varchar](50) NULL,
	[danwei] [nvarchar](50) NULL,
	[sfzclz] [nvarchar](50) NULL,
	[srfjbtj] [nvarchar](500) NULL,
	[Jbzt] [varchar](50) NULL,
	[Jbjzsj] [varchar](50) NULL,
	[Jbqbj] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_Bid] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规模' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Bid', @level2type=N'COLUMN',@level2name=N'guimo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Bid', @level2type=N'COLUMN',@level2name=N'danwei'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否再次流转' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Bid', @level2type=N'COLUMN',@level2name=N'sfzclz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受让方具备条件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Bid', @level2type=N'COLUMN',@level2name=N'srfjbtj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子竞价的状态1完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Bid', @level2type=N'COLUMN',@level2name=N'Jbzt'
GO
SET IDENTITY_INSERT [dbo].[T_Bid] ON
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (1, N'3601', 2, N'城南荒地转包', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', NULL, N'2016000001', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (2, N'3601', 3, N'北山转包', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000002', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (3, N'3601', 4, N'池塘转包', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000003', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (4, N'3601', 5, N'房屋出租', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000004', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (5, N'3601', 6, N'写字楼出租', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000005', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (6, N'3601', 7, N'房屋出租', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000006', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (7, N'3601', 2, N'土地出租', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000007', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (10, N'3601', 3, N'大片土地转包', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000008', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (11, N'3601', 4, N'城南60亩土地招租', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'2016/6/28 17:44:22', N'3601002016000001', N'2016000009', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (12, N'3601', 5, N'城北荒山100亩招租', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000010', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (13, N'3601', 6, N'城市人家楼房招租', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000011', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (14, N'3601', 7, N'乡镇土地招租', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000012', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (15, N'3601', 2, N'好家村100亩招租土地', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'2016/7/6 10:20:26', N'3601002016000002', N'2016000013', N'2016000001', N'南昌市农村产权交易中心', N'4', N'1', 7, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (16, N'3601', 3, N'高区厂房出租', N'100万/年', CAST(0x0000A63300000000 AS DateTime), CAST(0x0000B5D700000000 AS DateTime), N'详细情况面谈', N'个人所有', N'1', 4, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000014', N'2016000001', N'南昌市农村综合产权交易中心', N'', N'0', 7, 0, 0, N'10', 0, 0, 0, 1, 3, CAST(0x0000A633011C938F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (17, N'3601', 4, N'大片土地转包', N'100元/1亩/1月', CAST(0x0000A41300000000 AS DateTime), CAST(0x0000A58000000000 AS DateTime), N'详细信息见面详谈', N'个人所有', N'1', 1, N'1', N'1', N'1', N'1', CAST(1.00 AS Decimal(18, 2)), N'1', N'', N'2016000008', N'2016000001', N'南昌市农村产权交易中心', N'4', N'2', 2, 0, 1, N'1', 1, 1, 1, 1, 1, CAST(0x0000A630009EF3A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (34, N'3601', 2, N'土地测试', N'20', CAST(0x0000A65C00000000 AS DateTime), CAST(0x0000A66300000000 AS DateTime), N'20160808', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000015', N'', N'南昌市农村综合产权交易中心', N'', N'2', 2, 0, 1, N'1', 0, 0, 0, 2, 1, CAST(0x0000A65C00B17C88 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (35, N'3601', 2, N'果园测试2', N'30', CAST(0x0000A65C00000000 AS DateTime), CAST(0x0000A66300000000 AS DateTime), N'果园', N'个人所有', N'2', 1, N'12', N'', N'', N'30', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000015', N'', N'南昌市农村综合产权交易中心', N'', N'2', 2, 0, 0, N'5', 0, 0, 0, 3, 4, CAST(0x0000A65C00FAC09B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (36, N'3601', 2, N'323e23', N'222', CAST(0x0000A69C00000000 AS DateTime), CAST(0x0000A69D00000000 AS DateTime), N'2222', N'个人所有', N'2', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000016', N'', N'南昌市农村综合产权交易中心', N'', N'22', 2, 0, 1, N'22', 0, 0, 0, 1, 3, CAST(0x0000A69C00A6B577 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (37, N'3601', 21, N'出租水田500亩', N'400元每亩每年', CAST(0x0000A69B00000000 AS DateTime), CAST(0x0000ADEC00000000 AS DateTime), N'水田', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000017', N'', N'南昌市农村综合产权交易中心', N'', N'10', 4, 0, 1, N'10', 0, 0, 0, 1, 1, CAST(0x0000A69D009C0BE2 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (38, N'3601', 21, N'大街上看了就发了肯德基撒开了房间打扫', N'房贷', CAST(0x0000A69D00000000 AS DateTime), CAST(0x0000A69E00000000 AS DateTime), N'大师傅', N'个人所有', N'2', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000018', N'2017000006', N'南昌市农村综合产权交易中心', N'', N'1', 7, 0, 0, N'11', 0, 0, 0, 1, 1, CAST(0x0000A69D009E920F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (39, N'3601', 21, N'66666666666', N'6', CAST(0x0000A69700000000 AS DateTime), CAST(0x0000A69D00000000 AS DateTime), N'66', N'个人所有', N'2', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000019', N'2016000002', N'南昌市农村综合产权交易中心', N'', N'66', 7, 0, 1, N'66', 0, 0, 0, 1, 1, CAST(0x0000A69D00A0955A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (40, N'3601', 21, N'555555', N'2', CAST(0x0000A69D00000000 AS DateTime), CAST(0x0000A6A500000000 AS DateTime), N'22', N'个人所有', N'2', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000020', N'2016000003', N'南昌市农村综合产权交易中心', N'', N'2', 7, 0, 0, N'2', 0, 0, 0, 1, 1, CAST(0x0000A69D00A27A7B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (41, N'3601', 3, N'测试数据', N'333', CAST(0x0000A6DB00000000 AS DateTime), CAST(0x0000A6E300000000 AS DateTime), N'的撒范德萨范德萨发散', N'个人所有', N'2', 4, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000021', N'2017000015', N'信州区农村综合产权交易中心', N'', N'1', 7, 0, 0, N'22', 0, 0, 0, 1, 1, CAST(0x0000A6E2008BACC1 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (42, N'3601', 3, N'的撒范德萨范德萨范德萨', N'点多', CAST(0x0000A6D400000000 AS DateTime), CAST(0x0000A6DD00000000 AS DateTime), N'第三方啊', N'个人所有', N'2', 2, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000022', N'', N'信州区农村综合产权交易中心', N'', N'1', 2, 0, 1, N'11', 0, 0, 0, 1, 1, CAST(0x0000A6E200904D22 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (43, N'3601', 3, N'dsdsdafdasfdsa', N'1', CAST(0x0000A6D400000000 AS DateTime), CAST(0x0000A6EC00000000 AS DateTime), N'dasfdas', N'个人所有', N'2', 2, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000023', N'', N'南昌市农村综合产权交易中心', N'', N'1', 2, 0, 1, N'1', 0, 0, 0, 1, 1, CAST(0x0000A6E200B33ED7 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (44, N'3601', 4, N'dsafdsadsaf', N'dsaf', CAST(0x0000A6D500000000 AS DateTime), CAST(0x0000A6E400000000 AS DateTime), N'as', N'个人所有', N'2', 2, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000024', N'', N'南昌市农村综合产权交易中心', N'', N'1', 3, 0, 1, N'1', 0, 0, 0, 1, 1, CAST(0x0000A6E200B374E2 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (45, N'3601', 6, N'道具卡连接发来打卡机是分开了巨大失联飞机ADSL', N'11', CAST(0x0000A6CF00000000 AS DateTime), CAST(0x0000A6E500000000 AS DateTime), N'大发大厦', N'个人所有', N'2', 2, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000025', N'', N'南昌市农村综合产权交易中心', N'', N'1', 3, 0, 1, N'2', 0, 0, 0, 1, 1, CAST(0x0000A6E200B39585 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (46, N'3601', 5, N'的撒范德萨范德萨发', N'22', CAST(0x0000A6DC00000000 AS DateTime), CAST(0x0000A6EC00000000 AS DateTime), N'22', N'个人所有', N'2', 2, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000026', N'', N'南昌市农村综合产权交易中心', N'', N'2', 3, 0, 1, N'2', 0, 0, 0, 1, 1, CAST(0x0000A6E200B3C848 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (47, N'3601', 21, N'的飞洒发大厦', N'2', CAST(0x0000A6D400000000 AS DateTime), CAST(0x0000A6ED00000000 AS DateTime), N'2222', N'个人所有', N'2', 2, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000027', N'', N'南昌市农村综合产权交易中心', N'', N'2', 2, 0, 1, N'2', 0, 0, 0, 1, 1, CAST(0x0000A6E200B3F597 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (48, N'3601', 5, N'dsaf', N'ds', CAST(0x0000A6E200000000 AS DateTime), CAST(0x0000A6EC00000000 AS DateTime), N'sdafa', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2016000028', N'', N'南昌市农村综合产权交易中心', N'', N'11', 3, 0, 1, N'11', 0, 0, 0, 1, 1, CAST(0x0000A6E6008ADCB2 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (49, N'3601', 5, N'111', N'222', CAST(0x0000A6FD00000000 AS DateTime), CAST(0x0000A6F500000000 AS DateTime), N'111', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000029', N'', N'南昌市农村综合产权交易中心', N'', N'11', 3, 0, 0, N'11', 0, 0, 0, 2, 1, CAST(0x0000A6F20095D828 AS DateTime), N'', N'', N'', N'', N'1', N'2017-08-15 9:34:49', N'333')
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (51, N'3601', 3, N'333', N'44', CAST(0x0000A6F100000000 AS DateTime), CAST(0x0000A6FE00000000 AS DateTime), N'sdfdsa', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000031', N'', N'南昌市农村综合产权交易中心', N'', N'33', 3, 0, 1, N'33', 0, 0, 0, 1, 1, CAST(0x0000A6F200A4730D AS DateTime), N'44', N'台', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (52, N'3601', 25, N'7777', N'77', CAST(0x0000A6F000000000 AS DateTime), CAST(0x0000A6FA00000000 AS DateTime), N'77', N'个人所有', N'1', 1, N'7', N'', N'7', N'7', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000032', N'', N'南昌市农村综合产权交易中心', N'', N'7', 3, 0, 1, N'7', 0, 0, 0, 1, 1, CAST(0x0000A6F600F2D9DB AS DateTime), N'77', N'亩', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (53, N'3601', 2, N'chuzutudi 200mu', N'100元每亩每年', CAST(0x0000A6F700000000 AS DateTime), CAST(0x0000A70800000000 AS DateTime), N'威威', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000033', N'', N'南昌市农村综合产权交易中心', N'', N'2', 3, 0, 1, N'12', 0, 0, 0, 1, 1, CAST(0x0000A6F7008AC53A AS DateTime), N'200', N'亩', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (54, N'3601', 26, N'2323', N'2222', CAST(0x0000A6F700000000 AS DateTime), CAST(0x0000A70C00000000 AS DateTime), N'2321', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'2017-08-16 11:01:01', N'3601002017000006', N'2017000033', N'', N'南昌市农村综合产权交易中心', N'', N'23', 3, 0, 1, N'22', 0, 0, 0, 1, 1, CAST(0x0000A6F7008CB105 AS DateTime), N'222', N'亩', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (55, N'3601', 2, N'9999', N'9', CAST(0x0000A6F000000000 AS DateTime), CAST(0x0000A6F800000000 AS DateTime), N'99', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000034', N'2017000011', N'南昌市农村综合产权交易中心', N'', N'9', 7, 0, 1, N'9', 0, 0, 0, 1, 1, CAST(0x0000A6F7008EF656 AS DateTime), N'9', N'亩', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (56, N'3601', 2, N'测试数据', N'挂牌价格', CAST(0x0000A6F100000000 AS DateTime), CAST(0x0000A70800000000 AS DateTime), N'表基本情况', N'个人所有', N'1', 1, N'确权机构', N'转出批准机构', N'权证编号', N'交易底价', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000035', N'', N'南昌市农村综合产权交易中心', N'', N'3', 3, 0, 1, N'3', 0, 0, 0, 1, 1, CAST(0x0000A6FA00E2196B AS DateTime), N'2', N'亩', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (57, N'3601', 5, N'的卢卡斯减肥了第三方', N'3', CAST(0x0000A6F100000000 AS DateTime), CAST(0x0000A6F200000000 AS DateTime), N'33', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000036', N'', N'南昌市农村综合产权交易中心', N'', N'3', 3, 0, 1, N'3', 0, 0, 0, 1, 1, CAST(0x0000A6FD008F890C AS DateTime), N'3', N'亩', N'否', N'333', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (58, N'360102', 27, N'出租水田600亩', N'100元每亩每年', CAST(0x0000A6FD00000000 AS DateTime), CAST(0x0000A70C00000000 AS DateTime), N'222', N'个人所有', N'1', 4, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000037', N'', N'南昌市农村综合产权交易中心', N'', N'12', 1, 0, 1, N'12', 0, 0, 0, 1, 1, CAST(0x0000A6FD00FEF9D8 AS DateTime), N'600', N'亩', N'否', N'', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (59, N'3601', 26, N'21212212', N'22', CAST(0x0000A6FD00000000 AS DateTime), CAST(0x0000A70C00000000 AS DateTime), N'222', N'个人所有', N'1', 4, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000037', N'2017000012', N'南昌市农村综合产权交易中心', N'', N'11', 7, 0, 1, N'11', 0, 0, 0, 1, 1, CAST(0x0000A6FD00FF5C84 AS DateTime), N'40', N'亩', N'否', N'', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (60, N'3601', 25, N'测试鉴证书', N'22', CAST(0x0000A71300000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), N'222', N'个人所有', N'1', 1, N'2', N'22', N'22', N'', CAST(2.00 AS Decimal(18, 2)), N'', N'', N'2017000038', N'2017000016', N'南昌市农村综合产权交易中心', N'', N'2', 7, 0, 1, N'2', 0, 0, 0, 1, 1, CAST(0x0000A71A008A5D03 AS DateTime), N'2', N'亩', N'否', N'222', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (61, N'360102', 27, N'22', N'2', CAST(0x0000A76700000000 AS DateTime), CAST(0x0000A76600000000 AS DateTime), N'22', N'个人所有', N'1', 1, N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000039', N'', N'南昌市农村综合产权交易中心', N'', N'22', 1, 0, 0, N'22', 0, 0, 0, 1, 1, CAST(0x0000A76700E8ACC5 AS DateTime), N'2', N'亩', N'否', N'2', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (62, N'360102', 27, N'1', N'1', CAST(0x0000A76800000000 AS DateTime), CAST(0x0000A76900000000 AS DateTime), N'1', N'个人所有', N'1', 1, N'', N'', N'', NULL, CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000040', N'', N'南昌市农村综合产权交易中心', N'', N'11', 1, 0, 0, N'1', 0, 0, 0, 1, 1, CAST(0x0000A76700FBF2A4 AS DateTime), N'1', N'亩', N'否', N'1', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (63, N'360102', 27, N'333', N'33', CAST(0x0000A76700000000 AS DateTime), CAST(0x0000A76E00000000 AS DateTime), N'33', N'个人所有', N'1', 1, N'', N'', N'', NULL, CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000041', N'', N'南昌市农村综合产权交易中心', N'', N'33', 1, 0, 0, N'33', 0, 0, 0, 1, 1, CAST(0x0000A7670109A313 AS DateTime), N'3', N'亩', N'否', N'33', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (64, N'360102', 27, N'2', N'2', CAST(0x0000A76800000000 AS DateTime), CAST(0x0000A76F00000000 AS DateTime), N'22', N'个人所有', N'1', 1, N'', N'', N'', NULL, CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000042', N'', N'南昌市农村综合产权交易中心', N'', N'2', 1, 0, 0, N'2', 0, 0, 0, 1, 1, CAST(0x0000A767010C0069 AS DateTime), N'3', N'亩', N'否', N'332', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (65, N'360102', 28, N'王明的土地要出租', N'2000/一年', CAST(0x0000A77000000000 AS DateTime), CAST(0x0000A77E00000000 AS DateTime), N'王明的土地要出租王明的土地要出租王明的土地要出租王明的土地要出租', N'个人所有', N'1', 4, N'', N'', N'', NULL, CAST(0.00 AS Decimal(18, 2)), N'2017/5/11 9:53:02', N'3601002017000003', N'2017000043', N'', N'南昌县农村交易中心', N'', N'1', 3, 0, 1, N'15', 0, 0, 0, 1, 1, CAST(0x0000A7700098EEF0 AS DateTime), N'22', N'亩', N'否', N'', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (66, N'360102', 28, N'测试退会的', N'2', CAST(0x0000A76600000000 AS DateTime), CAST(0x0000A77700000000 AS DateTime), N'222', N'个人所有', N'1', 1, N'', N'', N'', NULL, CAST(0.00 AS Decimal(18, 2)), N'', N'', N'2017000044', N'2017000018', N'南昌市农村综合产权交易中心', N'', N'2', 7, 0, 1, N'2', 0, 0, 0, 1, 1, CAST(0x0000A77000EDEE4D AS DateTime), N'2', N'亩', N'否', N'2', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (67, N'360102', 27, N'2222222', N'22', CAST(0x0000A77400000000 AS DateTime), CAST(0x0000A77C00000000 AS DateTime), N'222', N'个人所有', N'1', 1, N'', N'', N'', NULL, CAST(0.00 AS Decimal(18, 2)), N'2017-08-16 11:00:52', N'3601002017000005', N'2017000045', N'', N'南昌市农村综合产权交易中心', N'', N'2', 3, 0, 1, N'2', 0, 0, 0, 6, 1, CAST(0x0000A77400FB800D AS DateTime), N'22', N'亩', N'否', N'222', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (68, N'3601', 2, N'测试一次竞价', N'1000', CAST(0x0000A7C900000000 AS DateTime), CAST(0x0000A7D100000000 AS DateTime), N'杀了会计分录肯德基萨芬', N'个人所有', N'1', 1, N'', N'', N'', N'', NULL, N'2017-08-16 16:01:24', N'3601002017000007', N'2017000046', N'2017000017', N'南昌市农村综合产权交易中心', N'', N'3', 7, 0, 1, N'11', NULL, NULL, NULL, 2, 1, CAST(0x0000A7D000A8A764 AS DateTime), N'100', N'亩', N'否', N'的萨芬的撒', N'2', N'2017-08-15 14:10:07', N'555')
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (69, N'3601', 2, N'yiciceshi', N'11', CAST(0x0000A7C900000000 AS DateTime), CAST(0x0000A7D900000000 AS DateTime), N'111', N'个人所有', N'1', 1, N'', N'', N'', N'', NULL, N'', N'', N'2017000047', N'', N'南昌市农村综合产权交易中心', N'', N'1', 3, 0, 1, N'11', NULL, NULL, NULL, 2, 1, CAST(0x0000A7D0010404D8 AS DateTime), N'111', N'亩', N'否', N'', N'1', N'2017-08-15 15:56:02', N'333')
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (70, N'3601', 2, N'yiciceshijingbiao', N'22', CAST(0x0000A7C200000000 AS DateTime), CAST(0x0000A7D900000000 AS DateTime), N'2222', N'个人所有', N'1', 1, N'', N'', N'', N'', NULL, N'', N'', N'2017000048', N'', N'南昌市农村综合产权交易中心', N'', N'22', 3, 0, 1, N'22', NULL, NULL, NULL, 2, 1, CAST(0x0000A7D001043610 AS DateTime), N'111', N'亩', N'否', N'222', N'1', N'2017-08-19 9:11:20', N'5555')
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (71, N'3601', 2, N'还是一次竞价', N'222', CAST(0x0000A7C900000000 AS DateTime), CAST(0x0000A7D900000000 AS DateTime), N'2222', N'个人所有', N'1', 1, N'', N'', N'', N'', NULL, N'', N'', N'2017000049', N'', N'南昌市农村综合产权交易中心', N'', N'22', 3, 0, 1, N'222', NULL, NULL, NULL, 2, 1, CAST(0x0000A7D001046748 AS DateTime), N'111', N'亩', N'否', N'222', N'1', N'2017-08-19 8:48:15', N'555')
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (72, N'3601', 2, N'yyyyy', N'33', CAST(0x0000A7CA00000000 AS DateTime), CAST(0x0000A7D800000000 AS DateTime), N'333', N'个人所有', N'1', 1, N'', N'', N'', NULL, NULL, N'2017-08-21 9:07:33', N'3601002017000009', N'2017000050', N'2017000019', N'南昌市农村综合产权交易中心', N'', N'33', 7, 0, 1, N'33', NULL, NULL, NULL, 1, 1, CAST(0x0000A7D100B65B8E AS DateTime), N'33', N'亩', N'否', N'33', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (73, N'3601', 2, N'tttt', N'tt', CAST(0x0000A7C400000000 AS DateTime), CAST(0x0000A7DF00000000 AS DateTime), N'ttt', N'个人所有', N'1', 1, N'', N'', N'', NULL, NULL, N'', N'', N'2017000051', N'', N'南昌市农村综合产权交易中心', N'', N'tt', 3, 0, 0, N'22', NULL, NULL, NULL, 1, 1, CAST(0x0000A7D100B77E4D AS DateTime), N'33', N'亩', N'否', N'33tt', NULL, NULL, NULL)
INSERT [dbo].[T_Bid] ([Id], [OrgCode], [FK_LiceTranId], [BidName], [ListingPrice], [StartDate], [EndDate], [BidBasic], [Ownership], [Properties], [TurnOut], [RightsBodies], [FeedingMechanism], [WarrantNumber], [LowTransaction], [Turnover], [ContractDate], [ContractNo], [Admissibility], [NoAssurance], [TradingCenterName], [AreContract], [RelatesNum], [DepaStatus], [ReturnStatus], [UpManager], [Publicity], [Change], [Cancel], [Lost], [StandardMode], [StandardType], [CreateDate], [guimo], [danwei], [sfzclz], [srfjbtj], [Jbzt], [Jbjzsj], [Jbqbj]) VALUES (74, N'3601', 2, N'dsfdf', N'sfd', CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7EF00000000 AS DateTime), N'asfdsaf', N'个人所有', N'1', 1, N'', N'', N'', N'', NULL, N'2017-09-07 8:48:20', N'3601002017000010', N'2017000052', N'', N'南昌市农村综合产权交易中心', N'', N'1', 5, 0, 1, N'1', NULL, NULL, NULL, 3, 1, CAST(0x0000A7E4009B391C AS DateTime), N'dfd', N'亩', N'否', N'11', N'4', N'2017/9/5 星期二 下午 2:27:18', N'77777')
SET IDENTITY_INSERT [dbo].[T_Bid] OFF
/****** Object:  Table [dbo].[T_AuditOpinion]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_AuditOpinion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_WebUserVeriId] [int] NOT NULL,
	[CheckName] [nvarchar](50) NOT NULL,
	[CheckOpinion] [nvarchar](500) NOT NULL,
	[OpinionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_AuditOpinion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_AuditOpinion] ON
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (1, 16, N'张伟伟', N'审核通过', CAST(0x0000A60200EE3487 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (2, 16, N'王科长', N'审核通过', CAST(0x0000A60200EE43F4 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (4, 16, N'李书记', N'在此审核通过', CAST(0x0000A60200EE5684 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (5, 8, N'张伟伟', N'1111', CAST(0x0000A6020153CDF0 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (6, 7, N'张伟伟', N'1212121', CAST(0x0000A60201552F04 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (7, 8, N'张伟伟', N'12121', CAST(0x0000A603008BE68F AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (8, 8, N'张伟伟', N'222', CAST(0x0000A603008C6238 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (9, 8, N'张伟伟', N'1212112', CAST(0x0000A603008CA381 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (10, 7, N'张伟伟', N'11111', CAST(0x0000A603009E53DA AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (11, 13, N'张伟伟', N'11111', CAST(0x0000A603009F36D2 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (12, 8, N'张伟伟', N'88888', CAST(0x0000A603009F9F48 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (13, 8, N'张伟伟', N'99999', CAST(0x0000A603009FFAAC AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (14, 10, N'张伟伟', N'8888888', CAST(0x0000A60300A099E2 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (15, 8, N'张伟伟', N'333333', CAST(0x0000A60300A0B21D AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (16, 8, N'张伟伟', N'44444', CAST(0x0000A60300A2405F AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (17, 8, N'张伟伟', N'000000', CAST(0x0000A60300F3059C AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (18, 6, N'张伟伟', N'67676767', CAST(0x0000A603011040A6 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (19, 6, N'张伟伟', N'ioioi', CAST(0x0000A603011056D5 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (20, 5, N'张伟伟', N'同意', CAST(0x0000A63301191C98 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (21, 68, N'张伟伟', N'同意', CAST(0x0000A63301225684 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (22, 70, N'SystemAdmin', N'111', CAST(0x0000A63B00A6212B AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (23, 1, N'SystemAdmin', N'审核通过', CAST(0x0000A64300BC2A7A AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (24, 1, N'SystemAdmin', N'审核通过', CAST(0x0000A65C00B92942 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (25, 1, N'SystemAdmin', N'审核通过', CAST(0x0000A65C00B95D71 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (26, 1, N'SystemAdmin', N'审核通过', CAST(0x0000A67600AC9CA3 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (27, 1, N'SystemAdmin', N'审核通过', CAST(0x0000A67600ACA2D7 AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (28, 1, N'SystemAdmin', N'审核通过', CAST(0x0000A71400F3D4AB AS DateTime))
INSERT [dbo].[T_AuditOpinion] ([Id], [FK_WebUserVeriId], [CheckName], [CheckOpinion], [OpinionDate]) VALUES (29, 5, N'SystemAdmin', N'审核通过', CAST(0x0000A7C800A89129 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_AuditOpinion] OFF
/****** Object:  Table [dbo].[T_Arbitration]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Arbitration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_BidId] [int] NOT NULL,
	[FK_LiceId] [int] NOT NULL,
	[FK_TranId] [int] NOT NULL,
	[Fact] [nvarchar](500) NOT NULL,
	[Grounds] [nvarchar](500) NOT NULL,
	[Results] [nvarchar](500) NOT NULL,
	[AcceptName] [nvarchar](50) NOT NULL,
	[AcceptDate] [datetime] NOT NULL,
	[OrgCode] [varchar](100) NOT NULL,
 CONSTRAINT [PK_T_Arbitration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_AdminUser]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_AdminUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminLogName] [nvarchar](50) NOT NULL,
	[AdminLogPass] [nvarchar](50) NOT NULL,
	[AdminName] [nvarchar](50) NULL,
	[AdminTel] [nvarchar](50) NULL,
	[OrgCode] [nvarchar](50) NOT NULL,
	[AdminTypeId] [int] NOT NULL,
	[JobId] [int] NOT NULL,
	[AdminState] [int] NOT NULL,
	[AdminLogNum] [int] NOT NULL,
	[IsCheck] [int] NOT NULL,
	[Editor] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_AdminUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_AdminUser] ON
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (1, N'admin', N'123456', N'SystemAdmin', N'13562138090', N'3601', 1, 6, 1, 1245, 1, N'SystemAdmin', CAST(0x0000A770009CFB63 AS DateTime), CAST(0x0000A7E700FBA212 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (2, N'guest', N'123456', N'李云龙', N'88888888', N'3601', 2, 1, 1, 0, 0, N'admin', CAST(0x0000A5FC0108227A AS DateTime), CAST(0x0000A5FC0108227A AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (9, N'yaoguang', N'123456', N'姚广', N'18970017865', N'360121', 1, 1, 1, 8, 0, N'张伟伟', CAST(0x0000A61F010267E7 AS DateTime), CAST(0x0000A63401184046 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (10, N'ceshi', N'123456', N'张飞', N'15192085121', N'3601', 3, 1, 1, 5, 0, N'张伟伟', CAST(0x0000A633011840F5 AS DateTime), CAST(0x0000A6CE00FCBA38 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (11, N'qiantai', N'123456', N'08', N'08', N'3601', 3, 1, 1, 4, 0, N'SystemAdmin', CAST(0x0000A65C00B30262 AS DateTime), CAST(0x0000A65D00EA4C5A AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (12, N'shichang', N'123456', N'0801', N'0801', N'3601', 4, 2, 1, 6, 0, N'SystemAdmin', CAST(0x0000A65C00B32814 AS DateTime), CAST(0x0000A67C00F66376 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (13, N'jiaoyi', N'123456', N'080101', N'080101', N'3601', 5, 3, 1, 12, 0, N'SystemAdmin', CAST(0x0000A65C00B34E93 AS DateTime), CAST(0x0000A67C00F7AF10 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (14, N'jianzheng', N'123456', N'123', N'123456', N'3601', 6, 4, 1, 3, 0, N'SystemAdmin', CAST(0x0000A65C00B6C765 AS DateTime), CAST(0x0000A67C00F73B3F AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (15, N'wangzhan', N'123456', N'123', N'123456', N'3601', 2, 2, 1, 1, 0, N'SystemAdmin', CAST(0x0000A65C00BABC16 AS DateTime), CAST(0x0000A65C00BAD5C6 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (16, N'cq01', N'123456', N'zhangsan', N'123421121', N'360102', 1, 1, 1, 0, 1, N'SystemAdmin', CAST(0x0000A67600AC2635 AS DateTime), CAST(0x0000A67600AC2635 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (17, N'wzceshi', N'123456', N'11', N'11', N'3601', 2, 1, 1, 1, 0, N'SystemAdmin', CAST(0x0000A6890098DEEC AS DateTime), CAST(0x0000A68900991244 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (18, N'xianzhouqu', N'123456', N'11', N'11', N'360201', 1, 7, 1, 0, 0, N'SystemAdmin', CAST(0x0000A6CE00E99709 AS DateTime), CAST(0x0000A6CE00E99709 AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (19, N'dddd', N'888888', N'dsfds', N'fsdf', N'360103', 1, 3, 1, 0, 0, N'SystemAdmin', CAST(0x0000A6F0008EC310 AS DateTime), CAST(0x0000A6F0008EC310 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_AdminUser] OFF
/****** Object:  Table [dbo].[T_AdminType]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_AdminType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminTypeName] [nvarchar](50) NOT NULL,
	[Editor] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_T_AdminType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_AdminType] ON
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (1, N'管理员', N'张伟伟', CAST(0x0000A619009CA735 AS DateTime))
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (2, N'网站管理员', N'admin', CAST(0x0000A5F7009A7BD8 AS DateTime))
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (3, N'前台受理', N'admin', CAST(0x0000A5F7009ABDB6 AS DateTime))
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (4, N'市场信息', N'admin', CAST(0x0000A5F7009B2104 AS DateTime))
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (5, N'产权交易', N'admin', CAST(0x0000A5F7009B2625 AS DateTime))
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (6, N'产权鉴证', N'admin', CAST(0x0000A5F7009B2E1E AS DateTime))
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (7, N'分管领导', N'admin', CAST(0x0000A5F7009B3B6B AS DateTime))
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (8, N'主管领导', N'admin', CAST(0x0000A5F7009B4071 AS DateTime))
INSERT [dbo].[T_AdminType] ([Id], [AdminTypeName], [Editor], [CreateDate]) VALUES (9, N'测试', N'SystemAdmin', CAST(0x0000A6CD010B3063 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_AdminType] OFF
/****** Object:  Table [dbo].[ZC]    Script Date: 09/07/2017 15:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[str] [nvarchar](500) NULL,
	[str1] [nvarchar](500) NULL,
 CONSTRAINT [PK_ZC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ZC] ON
INSERT [dbo].[ZC] ([id], [str], [str1]) VALUES (2, N'701A30C224C04BD0E3A719BACB65D163EBC5ECC25B52CCC53C0935157FAF0812D0889A338ECD745B866D2EDCAD5359EE09B532FA3279DB02', N'')
SET IDENTITY_INSERT [dbo].[ZC] OFF
/****** Object:  View [dbo].[View_notice]    Script Date: 09/07/2017 15:36:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_notice]
AS
SELECT     dbo.T_News.*, dbo.T_Notice.id AS noticeid
FROM         dbo.T_News INNER JOIN
                      dbo.T_Notice ON dbo.T_News.Id = dbo.T_Notice.newsid
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
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
         Begin Table = "T_News"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_Notice"
            Begin Extent = 
               Top = 42
               Left = 365
               Bottom = 146
               Right = 507
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
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_notice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_notice'
GO
/****** Object:  View [dbo].[View_guapai]    Script Date: 09/07/2017 15:36:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_guapai]
AS
SELECT     a.Id, b.OrgShortName AS OrgCode, a.OrgCode AS oCode, c.Name AS LiceTran, a.FK_LiceTranId, a.BidName, a.ListingPrice, a.StartDate, a.EndDate, a.BidBasic, 
                      a.Ownership, d.PropertyTypeName AS Properties, e.TurnOutTypeName AS TurnOut, a.RightsBodies, a.FeedingMechanism, a.WarrantNumber, 
                      f.StandardModeName AS StandardMode, g.StandardTypeName AS StandardType, a.LowTransaction, a.Turnover, a.ContractDate, a.ContractNo, a.Admissibility, 
                      a.NoAssurance, a.TradingCenterName, a.AreContract, a.RelatesNum, h.JobTypeName AS DepaStatus, a.DepaStatus AS DepaStatusId, a.ReturnStatus, a.UpManager, 
                      a.Publicity, a.Change, a.Cancel, a.Lost
FROM         dbo.T_Bid AS a LEFT OUTER JOIN
                      dbo.T_Organization AS b ON a.OrgCode = b.OrgCode LEFT OUTER JOIN
                      dbo.T_LiceTran AS c ON a.FK_LiceTranId = c.Id LEFT OUTER JOIN
                      dbo.T_PropertyType AS d ON a.Properties = d.Id LEFT OUTER JOIN
                      dbo.T_TurnOutType AS e ON a.TurnOut = e.Id LEFT OUTER JOIN
                      dbo.T_StandardMode AS f ON a.StandardMode = f.Id LEFT OUTER JOIN
                      dbo.T_StandardType AS g ON a.StandardType = g.Id LEFT OUTER JOIN
                      dbo.T_Job AS h ON a.DepaStatus = h.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[57] 4[4] 2[20] 3) )"
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
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 261
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 0
               Left = 384
               Bottom = 119
               Right = 544
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 0
               Left = 599
               Bottom = 119
               Right = 778
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 23
               Left = 802
               Bottom = 142
               Right = 984
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 274
               Left = 140
               Bottom = 393
               Right = 320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "f"
            Begin Extent = 
               Top = 257
               Left = 338
               Bottom = 376
               Right = 524
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 254
               Left = 657
               Bottom = 373
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_guapai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Begin Table = "h"
            Begin Extent = 
               Top = 126
               Left = 702
               Bottom = 245
               Right = 859
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_guapai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_guapai'
GO
/****** Object:  View [dbo].[View_dzjb]    Script Date: 09/07/2017 15:36:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_dzjb]
AS
SELECT     dbo.T_Bid.*, dbo.T_LiceTran.Name, dbo.T_LiceTran.JBYhm, dbo.T_LiceTran.JBmm, dbo.T_LiceTran.Id AS srfid
FROM         dbo.T_Bid INNER JOIN
                      dbo.T_BidTrans ON dbo.T_Bid.Id = dbo.T_BidTrans.FK_BidId INNER JOIN
                      dbo.T_LiceTran ON dbo.T_BidTrans.FK_LiceTranId = dbo.T_LiceTran.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
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
         Begin Table = "T_Bid"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 198
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_BidTrans"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 228
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_LiceTran"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 185
               Right = 635
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
      Begin ColumnWidths = 45
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_dzjb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_dzjb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_dzjb'
GO
/****** Object:  View [dbo].[View_Bid]    Script Date: 09/07/2017 15:36:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Bid]
AS
SELECT     dbo.T_Bid.*, dbo.T_PropertyType.PropertyTypeName
FROM         dbo.T_Bid INNER JOIN
                      dbo.T_PropertyType ON dbo.T_Bid.Properties = dbo.T_PropertyType.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
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
         Begin Table = "T_Bid"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 218
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_PropertyType"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 199
               Right = 443
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Bid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Bid'
GO
/****** Object:  Default [DF_T_WebUserVeri_UserStatus]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_UserStatus]  DEFAULT ((0)) FOR [UserStatus]
GO
/****** Object:  Default [DF_T_WebUserVeri_LoginDate]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_LoginDate]  DEFAULT (getdate()) FOR [LoginDate]
GO
/****** Object:  Default [DF_T_WebUserVeri_OutDate]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_OutDate]  DEFAULT (getdate()) FOR [OutDate]
GO
/****** Object:  Default [DF_T_WebUserVeri_Veri]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_Veri]  DEFAULT ((0)) FOR [Veri]
GO
/****** Object:  Default [DF_T_WebUserVeri_VeriStatus]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_VeriStatus]  DEFAULT ((0)) FOR [VeriStatus]
GO
/****** Object:  Default [DF_T_WebUserVeri_AuditType]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_AuditType]  DEFAULT ((0)) FOR [AuditType]
GO
/****** Object:  Default [DF_T_WebUserVeri_VeriApplyDate]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_VeriApplyDate]  DEFAULT (getdate()) FOR [VeriApplyDate]
GO
/****** Object:  Default [DF_T_WebUserVeri_VeriCheckDate]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_VeriCheckDate]  DEFAULT (getdate()) FOR [VeriCheckDate]
GO
/****** Object:  Default [DF_T_WebIntention_CheckStatus]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebIntention] ADD  CONSTRAINT [DF_T_WebIntention_CheckStatus]  DEFAULT ((0)) FOR [CheckStatus]
GO
/****** Object:  Default [DF_T_WebIntention_ClickNum]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebIntention] ADD  CONSTRAINT [DF_T_WebIntention_ClickNum]  DEFAULT ((0)) FOR [ClickNum]
GO
/****** Object:  Default [DF_T_WebIntention_CheckDate]    Script Date: 09/07/2017 15:36:16 ******/
ALTER TABLE [dbo].[T_WebIntention] ADD  CONSTRAINT [DF_T_WebIntention_CheckDate]  DEFAULT (getdate()) FOR [CheckDate]
GO
/****** Object:  Default [DF_T_UploadTypeIndicator_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_UploadTypeIndicator] ADD  CONSTRAINT [DF_T_UploadTypeIndicator_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_TurnOutType_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_TurnOutType] ADD  CONSTRAINT [DF_T_TurnOutType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_TempUser_TempStatus]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_TempUser] ADD  CONSTRAINT [DF_T_TempUser_TempStatus]  DEFAULT ((0)) FOR [TempStatus]
GO
/****** Object:  Default [DF_T_TempUser_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_TempUser] ADD  CONSTRAINT [DF_T_TempUser_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_SysLog_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_SysLog] ADD  CONSTRAINT [DF_T_SysLog_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_SysFun_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_SysFun] ADD  CONSTRAINT [DF_T_SysFun_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_StandardType_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_StandardType] ADD  CONSTRAINT [DF_T_StandardType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_StandardMode_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_StandardMode] ADD  CONSTRAINT [DF_T_StandardMode_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_RolePermissions_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_RolePermissions] ADD  CONSTRAINT [DF_T_RolePermissions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_PropertyType_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_PropertyType] ADD  CONSTRAINT [DF_T_PropertyType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_Placard_ReleaseTime]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Placard] ADD  CONSTRAINT [DF_T_Placard_ReleaseTime]  DEFAULT (getdate()) FOR [ReleaseTime]
GO
/****** Object:  Default [DF_T_Placard_NumClicks]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Placard] ADD  CONSTRAINT [DF_T_Placard_NumClicks]  DEFAULT ((0)) FOR [NumClicks]
GO
/****** Object:  Default [DF_T_Permissions_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Permissions] ADD  CONSTRAINT [DF_T_Permissions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_Organization_ShengCode]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_ShengCode]  DEFAULT ('') FOR [ShengCode]
GO
/****** Object:  Default [DF_T_Organization_ShiCode]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_ShiCode]  DEFAULT ('') FOR [ShiCode]
GO
/****** Object:  Default [DF_T_Organization_XianCode]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_XianCode]  DEFAULT ('') FOR [XianCode]
GO
/****** Object:  Default [DF_T_Organization_XiangCode]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_XiangCode]  DEFAULT ('') FOR [XiangCode]
GO
/****** Object:  Default [DF_T_Organization_CunCode]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_CunCode]  DEFAULT ('') FOR [CunCode]
GO
/****** Object:  Default [DF_T_Organization_ZunCode]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_ZunCode]  DEFAULT ('') FOR [ZuCode]
GO
/****** Object:  Default [DF_T_OnlineNumber_OnlineNumber]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_OnlineNumber] ADD  CONSTRAINT [DF_T_OnlineNumber_OnlineNumber]  DEFAULT ((0)) FOR [OnlineNumber]
GO
/****** Object:  Default [DF_T_NewsType_NewsTypeName]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_NewsType] ADD  CONSTRAINT [DF_T_NewsType_NewsTypeName]  DEFAULT ('') FOR [NewsTypeName]
GO
/****** Object:  Default [DF_T_NewsType_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_NewsType] ADD  CONSTRAINT [DF_T_NewsType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_News_NumClicks]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_News] ADD  CONSTRAINT [DF_T_News_NumClicks]  DEFAULT ((0)) FOR [NumClicks]
GO
/****** Object:  Default [DF_T_News_IsCheck]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_News] ADD  CONSTRAINT [DF_T_News_IsCheck]  DEFAULT ((0)) FOR [IsCheck]
GO
/****** Object:  Default [DF_T_News_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_News] ADD  CONSTRAINT [DF_T_News_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_MemberTypeCertification_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_MemberTypeCertification] ADD  CONSTRAINT [DF_T_MemberTypeCertification_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_Links_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Links] ADD  CONSTRAINT [DF_T_Links_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_LiceTranScan_UploadDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_LiceTranScan] ADD  CONSTRAINT [DF_T_LiceTranScan_UploadDate]  DEFAULT (getdate()) FOR [UploadDate]
GO
/****** Object:  Default [DF_T_LiceTranCheck_AuditDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_LiceTranCheck] ADD  CONSTRAINT [DF_T_LiceTranCheck_AuditDate]  DEFAULT (getdate()) FOR [AuditDate]
GO
/****** Object:  Default [DF_T_Job_Editor]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Job] ADD  CONSTRAINT [DF_T_Job_Editor]  DEFAULT ('') FOR [Editor]
GO
/****** Object:  Default [DF_T_Job_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Job] ADD  CONSTRAINT [DF_T_Job_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_IndicatorsRelations_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_IndicatorsRelations] ADD  CONSTRAINT [DF_T_IndicatorsRelations_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_Contacts_Editor]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Contacts] ADD  CONSTRAINT [DF_T_Contacts_Editor]  DEFAULT ('') FOR [Editor]
GO
/****** Object:  Default [DF_T_Contacts_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Contacts] ADD  CONSTRAINT [DF_T_Contacts_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidTrans_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidTrans] ADD  CONSTRAINT [DF_T_BidTrans_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidReturnInfo_ReturnDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidReturnInfo] ADD  CONSTRAINT [DF_T_BidReturnInfo_ReturnDate]  DEFAULT (getdate()) FOR [ReturnDate]
GO
/****** Object:  Default [DF_T_BidPrintGrounds_PrintDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidPrintGrounds] ADD  CONSTRAINT [DF_T_BidPrintGrounds_PrintDate]  DEFAULT (getdate()) FOR [PrintDate]
GO
/****** Object:  Default [DF_T_BidPlacard_ReleaseTime]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidPlacard] ADD  CONSTRAINT [DF_T_BidPlacard_ReleaseTime]  DEFAULT (getdate()) FOR [ReleaseTime]
GO
/****** Object:  Default [DF_T_BidLostScan_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidLostScan] ADD  CONSTRAINT [DF_T_BidLostScan_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidLost_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidLost] ADD  CONSTRAINT [DF_T_BidLost_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidFile_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidFile] ADD  CONSTRAINT [DF_T_BidFile_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidContractScan_UploadDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidContractScan] ADD  CONSTRAINT [DF_T_BidContractScan_UploadDate]  DEFAULT (getdate()) FOR [UploadDate]
GO
/****** Object:  Default [DF_T_BidClinchScan_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidClinchScan] ADD  CONSTRAINT [DF_T_BidClinchScan_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidChangeScan_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidChangeScan] ADD  CONSTRAINT [DF_T_BidChangeScan_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidCancellationScan_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidCancellationScan] ADD  CONSTRAINT [DF_T_BidCancellationScan_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidCancellation_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidCancellation] ADD  CONSTRAINT [DF_T_BidCancellation_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidAuction_AuctionDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_BidAuction] ADD  CONSTRAINT [DF_T_BidAuction_AuctionDate]  DEFAULT (getdate()) FOR [AuctionDate]
GO
/****** Object:  Default [DF_T_Bid_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Bid] ADD  CONSTRAINT [DF_T_Bid_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_AuditOpinion_OpinionDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_AuditOpinion] ADD  CONSTRAINT [DF_T_AuditOpinion_OpinionDate]  DEFAULT (getdate()) FOR [OpinionDate]
GO
/****** Object:  Default [DF_T_Arbitration_AcceptDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_Arbitration] ADD  CONSTRAINT [DF_T_Arbitration_AcceptDate]  DEFAULT (getdate()) FOR [AcceptDate]
GO
/****** Object:  Default [DF_T_AdminUser_AdminState]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_AdminUser] ADD  CONSTRAINT [DF_T_AdminUser_AdminState]  DEFAULT ((0)) FOR [AdminState]
GO
/****** Object:  Default [DF_T_AdminUser_AdminLogNum]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_AdminUser] ADD  CONSTRAINT [DF_T_AdminUser_AdminLogNum]  DEFAULT ((0)) FOR [AdminLogNum]
GO
/****** Object:  Default [DF_T_AdminUser_IsCheck]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_AdminUser] ADD  CONSTRAINT [DF_T_AdminUser_IsCheck]  DEFAULT ((0)) FOR [IsCheck]
GO
/****** Object:  Default [DF_T_AdminUser_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_AdminUser] ADD  CONSTRAINT [DF_T_AdminUser_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_AdminType_Editor]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_AdminType] ADD  CONSTRAINT [DF_T_AdminType_Editor]  DEFAULT ('') FOR [Editor]
GO
/****** Object:  Default [DF_T_AdminType_CreateDate]    Script Date: 09/07/2017 15:36:17 ******/
ALTER TABLE [dbo].[T_AdminType] ADD  CONSTRAINT [DF_T_AdminType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
