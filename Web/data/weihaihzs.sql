USE [master]
GO
/****** Object:  Database [db_weihaihzs]    Script Date: 09/23/2017 11:31:14 ******/
CREATE DATABASE [db_weihaihzs] ON  PRIMARY 
( NAME = N'db_weihaihzs', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS2008\MSSQL\DATA\db_weihaihzs.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_weihaihzs_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS2008\MSSQL\DATA\db_weihaihzs_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_weihaihzs] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_weihaihzs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_weihaihzs] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [db_weihaihzs] SET ANSI_NULLS OFF
GO
ALTER DATABASE [db_weihaihzs] SET ANSI_PADDING OFF
GO
ALTER DATABASE [db_weihaihzs] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [db_weihaihzs] SET ARITHABORT OFF
GO
ALTER DATABASE [db_weihaihzs] SET AUTO_CLOSE ON
GO
ALTER DATABASE [db_weihaihzs] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [db_weihaihzs] SET AUTO_SHRINK ON
GO
ALTER DATABASE [db_weihaihzs] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [db_weihaihzs] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [db_weihaihzs] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [db_weihaihzs] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [db_weihaihzs] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [db_weihaihzs] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [db_weihaihzs] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [db_weihaihzs] SET  DISABLE_BROKER
GO
ALTER DATABASE [db_weihaihzs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [db_weihaihzs] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [db_weihaihzs] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [db_weihaihzs] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [db_weihaihzs] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [db_weihaihzs] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [db_weihaihzs] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [db_weihaihzs] SET  READ_WRITE
GO
ALTER DATABASE [db_weihaihzs] SET RECOVERY FULL
GO
ALTER DATABASE [db_weihaihzs] SET  MULTI_USER
GO
ALTER DATABASE [db_weihaihzs] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [db_weihaihzs] SET DB_CHAINING OFF
GO
USE [db_weihaihzs]
GO
/****** Object:  Table [dbo].[T_YQ]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_XMGG]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_XmBeian]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Wztou]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_WebUserVeri]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_WebIntention]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_UploadTypeIndicator]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_TurnOutType]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_TranProcess]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_TempUser]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_SysLog]    Script Date: 09/23/2017 11:31:16 ******/
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
SET IDENTITY_INSERT [dbo].[T_SysLog] ON
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18734, N'登陆页面', N'登陆成功', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00A97BDC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18735, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00A97EC1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18736, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00A97E9A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18737, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00A97FBD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18738, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00A97FFA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18739, N'出让标', N'获取出让标总和', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00A98A1E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18740, N'出让标', N'获取所有的出让标操作', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00A98A60 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18741, N'登陆页面', N'登陆成功', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00AD59EA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18742, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00AD5B4B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18743, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00AD5BE0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18744, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00AD5C79 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18745, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'00:FF:F8:3A:43:8B', N'SystemAdmin', CAST(0x0000A7EC00AD5CB6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18746, N'登陆页面', N'登陆成功', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EDEAC7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18747, N'系统后台主页面', N'用户登录获取权限列表', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EDEDBD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18748, N'组织单位', N'返回查询的组织单位树形数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EDEDC2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18749, N'系统管理员', N'通过session获取登陆用户名信息', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EDEDE3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18750, N'通讯录', N'获取通讯录总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EDEDC4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18751, N'通讯录', N'查询所有的通讯录数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EDEE03 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18752, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EDF9AB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18753, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EDFA02 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18754, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF104B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18755, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF1088 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18756, N'产权类型', N'返回产权类型combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF3D24 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18757, N'挂牌方式', N'返回挂牌方式combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF3D54 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18758, N'组织单位', N'获取组织单位树形数据2', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF3CF8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18759, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF9CCB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18760, N'组织单位', N'获取组织单位树形数据2', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF9CD8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18761, N'产权类型', N'返回产权类型combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF9CDB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18762, N'挂牌方式', N'返回挂牌方式combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF9CF3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18763, N'转出方式', N'返回转出方式combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF9CED AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18764, N'挂牌类型', N'返回挂牌类型combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF9CFA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18765, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EF9CE1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18766, N'标信息审核流程', N'返回单个标信息审核流程', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EFDE0A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18767, N'标审核返回信息', N'获取标审核返回信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EFDE2B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18768, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EFDE36 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18769, N'出让/受让方', N'获取出让/受让方总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EFF18D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18770, N'组织单位', N'获取组织单位树形数据2', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EFF193 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18771, N'会员类型', N'返回会员类型combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EFF1A1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18772, N'出让/受让方', N'查询所有的出让/受让方数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EFF1C1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18773, N'出让/受让方', N'返回出让/受让方类型combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300EFFE1C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18774, N'意向受让标信息', N'获取意向受让标信息总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0238D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18775, N'组织单位', N'获取组织单位树形数据2', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F02396 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18776, N'意向受让标信息', N'获取所有的意向受让标信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F023CE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18777, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F05B31 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18778, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F05B31 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18779, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F09456 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18780, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F09467 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18781, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0965C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18782, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F09672 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18783, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0B8C8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18784, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0B8CC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18785, N'出让/受让方', N'获取出让/受让方总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0C33E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18786, N'组织单位', N'获取组织单位树形数据2', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0C34D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18787, N'出让/受让方', N'查询所有的出让/受让方数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0C355 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18788, N'会员类型', N'返回会员类型combo数据操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0C353 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18789, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0C913 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18790, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0C923 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18791, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0CBA0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18792, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0CBAF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18793, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0CCE9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18794, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0CCF9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18795, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0CEA9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18796, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0CEB5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18797, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D0E4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18798, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D0F3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18799, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D4A1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18800, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D49E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18801, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D69D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18802, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D6AC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18803, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D829 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18804, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D82F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18805, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D9AE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18806, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0D9BC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18807, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0DD4E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18808, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0DD4C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18809, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0DDA4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18810, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0DDB3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18811, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0E00F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18812, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0E020 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18813, N'意向受让标信息', N'获取意向受让标信息总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0EDD3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18814, N'意向受让标信息', N'获取所有的意向受让标信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0EDE8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18815, N'组织单位', N'获取组织单位树形数据2', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0EDEF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18816, N'意向受让标信息', N'获取意向受让标信息总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0F3E4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18817, N'组织单位', N'获取组织单位树形数据2', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0F3EF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18818, N'意向受让标信息', N'获取所有的意向受让标信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F0F442 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18819, N'意向受让标信息', N'获取意向受让标信息总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F113CC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18820, N'组织单位', N'获取组织单位树形数据2', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F113DA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18821, N'意向受让标信息', N'获取所有的意向受让标信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F113F3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18822, N'出让/受让方审核', N'获取所有的出让/受让方审核操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F11BFA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18823, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F11C0D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18824, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F13234 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18825, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F1329E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18826, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F13CB8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18827, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F13CFF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18828, N'标信息审核流程', N'返回单个标信息审核流程', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F13F34 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18829, N'标审核返回信息', N'获取标审核返回信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F13F46 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18830, N'出让/受让方上传附件', N'查询所有的出让/受让方上传附件数据', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F13F58 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18831, N'成交附件', N'获取所有的成交附件信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F14775 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18832, N'成交附件', N'获取所有的成交附件信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F14B1A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18833, N'成交附件', N'获取所有的成交附件信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F14ED9 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18834, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F1754E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18835, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F1757F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18836, N'合同附件', N'获取所有的合同附件信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F17B13 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18837, N'成交附件', N'获取所有的成交附件信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F184B0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18838, N'成交附件', N'获取所有的成交附件信息操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F18BFD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18839, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F1B364 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18840, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F1B388 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18841, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F1C961 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18842, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F1C980 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18843, N'出让标', N'获取出让标总和', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F3BCA0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18844, N'出让标', N'获取所有的出让标操作', N'::1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F300F3BCD2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18845, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F4009F485D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18846, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F4009F4A48 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18847, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F4009F4A88 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18848, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F4009F4AF5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18849, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F4009F4B46 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18850, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F4009F4B6E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18851, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A04742 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18852, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A04749 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18853, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A047D6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18854, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A04805 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18855, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A04812 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18856, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A072C8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18857, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A072C1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18858, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A073B5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18859, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A073FC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18860, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A07426 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18861, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A0F2C4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18862, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A0F31A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18863, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A0F418 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18864, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A0F447 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18865, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A0F453 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18866, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A11902 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18867, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A11956 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18868, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A11A09 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18869, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A11A38 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18870, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A11A4B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18871, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A1CB81 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18872, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A1CB7D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18873, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A1CC9B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18874, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A1CCD3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18875, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A1CCDE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18876, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A211AE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18877, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A211B2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18878, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A212C3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18879, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A212ED AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18880, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A212F8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18881, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A28144 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18882, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2818D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18883, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A282A2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18884, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A282C9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18885, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A282DD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18886, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2954D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18887, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2959A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18888, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A29664 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18889, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A29691 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18890, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A296AC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18891, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2B895 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18892, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2B8E2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18893, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2BA18 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18894, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2B9F1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18895, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2BA2E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18896, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2CC6A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18897, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2CCAA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18898, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2CDAF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18899, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2CDE0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18900, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A2CDED AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18901, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A315AC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18902, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A315AD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18903, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3161D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18904, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A31676 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18905, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A31680 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18906, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3BC5A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18907, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3BCB3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18908, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3BCE6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18909, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3BD6D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18910, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3BD80 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18911, N'系统管理员', N'获取系统管理员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3E45D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18912, N'系统管理员', N'返回所有系统管理员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3E471 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18913, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3E483 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18914, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3FCA4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18915, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A3FCA7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18916, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A40DE4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18917, N'组织单位', N'查询单个组织单位数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A41DC4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18918, N'组织单位', N'查询单个组织单位数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A4230E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18919, N'组织单位', N'查询单个组织单位数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A42BCE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18920, N'组织单位', N'获取组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A42D23 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18921, N'友情链接', N'查询所有的友情链接数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A442D0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18922, N'友情链接', N'查询所有的友情链接数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A44AFF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18923, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A51441 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18924, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A51453 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18925, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A52CDC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18926, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A52CD8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18927, N'系统授权', N'返回系统授权数据集', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A52F04 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18928, N'系统授权', N'返回系统授权数据集', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A535F4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18929, N'系统授权', N'创建系统授权', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A53AED AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18930, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A562E9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18931, N'出让标', N'获取出让标总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A587E4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18932, N'出让标', N'获取所有的出让标操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A587F2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18933, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A5A4E3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18934, N'新闻', N'获取信息总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A5AE49 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18935, N'新闻类型', N'获取combo数据列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A5AE53 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18936, N'新闻类型', N'获取combo数据列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A5AE54 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18937, N'新闻', N'新闻信息列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A5AE74 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18938, N'出让标', N'获取出让标总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A5FA13 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18939, N'出让标', N'获取所有的出让标操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A5FA6F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18940, N'产权交易鉴证书打印理由', N'添加产权交易鉴证书打印理由操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A603FB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18941, N'产权交易鉴证书打印理由', N'添加产权交易鉴证书打印理由操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F400A608BD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18942, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2B039 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18943, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2B2AD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18944, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2B2BE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18945, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2B2EA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18946, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2B311 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18947, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2B32C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18948, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2B918 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18949, N'组织单位', N'查询单个组织单位数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2BFDA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18950, N'组织单位', N'获取组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2C13E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18951, N'组织单位', N'增加组织单位信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2CA4E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18952, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2CADF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18953, N'组织单位', N'查询单个组织单位数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2D175 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18954, N'组织单位', N'更新组织单位信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2DA2C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18955, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2DA75 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18956, N'组织单位', N'查询单个组织单位数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2E387 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18957, N'组织单位', N'查询单个组织单位数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2E68A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18958, N'组织单位', N'查询单个组织单位数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E2E79D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18959, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E32550 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18960, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E3275A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18961, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E32761 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18962, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E32771 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18963, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E327A1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18964, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E327B0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18965, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E33AEA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18966, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E33B04 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18967, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E33BC9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18968, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E33BFB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18969, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E33C04 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18970, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E40D1A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18971, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E40D37 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18972, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E40DE0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18973, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E40E70 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18974, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E40E7C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18975, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E42303 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18976, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E42318 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18977, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E4235C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18978, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E42365 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18979, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E54116 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18980, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E54276 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18981, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E54284 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18982, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E54352 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18983, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E5437C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18984, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E54387 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18985, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E5490A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18986, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E5494D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18987, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E54A13 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18988, N'通讯录', N'获取通讯录总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E54A3D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18989, N'通讯录', N'查询所有的通讯录数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E54A45 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18990, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E553B9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18991, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E553CE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18992, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E56F83 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18993, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E5715E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18994, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E57162 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18995, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E5DEFA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18996, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E5DEFE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18997, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E5F7A5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18998, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E5F7AF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (18999, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E63414 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19000, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E63412 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19001, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6457B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19002, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6457F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19003, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E64C57 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19004, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E656D3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19005, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E65CF6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19006, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6E27A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19007, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6E279 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19008, N'系统管理员', N'获取系统管理员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6E776 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19009, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6E77A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19010, N'系统管理员', N'返回所有系统管理员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6E792 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19011, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6E99C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19012, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6E9DD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19013, N'系统授权', N'返回系统授权数据集', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E6EBA9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19014, N'岗位类型', N'返回岗位类型combo数据操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E7066B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19015, N'系统管理员', N'获取系统管理员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E70669 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19016, N'系统管理员类型', N'返回系统管理员类型combo数据操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E7066E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19017, N'系统管理员', N'返回所有系统管理员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E7068C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19018, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E7068E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19019, N'系统管理员', N'删除系统管理员操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E718C6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19020, N'系统管理员', N'获取系统管理员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E7193D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19021, N'系统管理员', N'返回所有系统管理员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E71948 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19022, N'系统管理员', N'返回单个系统管理员信息操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E727CF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19023, N'系统管理员', N'更新系统管理员操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E73223 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19024, N'系统管理员', N'获取系统管理员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E732D6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19025, N'系统管理员', N'返回所有系统管理员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E732E0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19026, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E74833 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19027, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E74980 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19028, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E74988 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19029, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E74CD1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19030, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E74D05 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19031, N'系统管理员', N'获取系统管理员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E7524B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19032, N'系统管理员', N'返回所有系统管理员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E75259 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19033, N'岗位类型', N'返回岗位类型combo数据操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E752B4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19034, N'组织单位', N'返回查询的组织单位树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E752B9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19035, N'系统管理员类型', N'返回系统管理员类型combo数据操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E752B9 AS DateTime))
GO
print 'Processed 300 total records'
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19036, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E769B1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19037, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E84DD5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19038, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E84F9B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19039, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E850B2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19040, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8510F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19041, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E851E3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19042, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8522B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19043, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E85272 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19044, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8534D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19045, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E853B2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19046, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E85E5E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19047, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E86BA4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19048, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E86BFE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19049, N'认证会员', N'获取认证会员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E881CA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19050, N'认证会员', N'返回所有认证会员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E881F3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19051, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8822D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19052, N'会员类型', N'返回会员类型combo数据操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8822D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19053, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E89F2B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19054, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8A416 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19055, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8A8F0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19056, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8AEBD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19057, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500E8E7C4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19058, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ECFF11 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19059, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED0048 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19060, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED00A7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19061, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED0642 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19062, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED0647 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19063, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED0C81 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19064, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED37FF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19065, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED3802 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19066, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED3C05 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19067, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED3C05 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19068, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED3FCF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19069, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED4F0D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19070, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED4F0D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19071, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500ED53FE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19072, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EDFBBD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19073, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EDFD12 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19074, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EDFD4D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19075, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE01FF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19076, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE01FF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19077, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE05F9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19078, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE08ED AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19079, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE0A4F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19080, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE12DA AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19081, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE1408 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19082, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE17C6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19083, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE1906 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19084, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE1C58 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19085, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE23C5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19086, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE2BB7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19087, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE2C53 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19088, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE3222 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19089, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE32FD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19090, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE384C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19091, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE3936 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19092, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE3CA0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19093, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE3ECB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19094, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE416E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19095, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE44DB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19096, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE4830 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19097, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE494E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19098, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE4C40 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19099, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE4D32 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19100, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE5754 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19101, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE6D29 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19102, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE7105 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19103, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE7299 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19104, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE762E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19105, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE775C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19106, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE7B51 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19107, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE7E02 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19108, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE882B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19109, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE8980 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19110, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE8CA0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19111, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE8E0D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19112, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE8FBB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19113, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE9154 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19114, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE92DB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19115, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE942A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19116, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE9805 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19117, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE99DB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19118, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE9B24 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19119, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE9C96 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19120, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE9DC3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19121, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE9EEE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19122, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EE9FF8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19123, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEA18B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19124, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEA35E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19125, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEA502 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19126, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEA693 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19127, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEA843 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19128, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEA98B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19129, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEAB23 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19130, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEB71C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19131, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEC3B3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19132, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EEC3B6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19133, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EECF19 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19134, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EECF1C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19135, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500EED15B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19136, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F19758 AS DateTime))
GO
print 'Processed 400 total records'
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19137, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F19891 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19138, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F198A0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19139, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F2E149 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19140, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F42AF0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19141, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F434CD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19142, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F434FD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19143, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F43A41 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19144, N'系统菜单', N'更新系统菜单', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4445C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19145, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F444A7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19146, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F444CE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19147, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4A4C1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19148, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4A615 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19149, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4A6B2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19150, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4AEE5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19151, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4AF16 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19152, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4B1B0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19153, N'系统菜单', N'增加系统菜单数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4CADF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19154, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4CB56 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19155, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F4CB5F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19156, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F5303B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19157, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F53036 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19158, N'系统授权', N'返回系统授权数据集', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F531A3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19159, N'系统授权', N'创建系统授权', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F53D0C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19160, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F5420B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19161, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F5422D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19162, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F73314 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19163, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F73472 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19164, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F500F73486 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19165, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50100AC00 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19166, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50100AD57 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19167, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50100AD6A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19168, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107292E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19169, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501072B37 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19170, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501072B47 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19171, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107BD1B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19172, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107C7F4 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19173, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107C7FE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19174, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107CB17 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19175, N'系统菜单', N'更新系统菜单', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107CD8B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19176, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107CDD6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19177, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107CDF8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19178, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107D1E0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19179, N'系统菜单', N'更新系统菜单', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107DB69 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19180, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107DBB5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19181, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107DBD9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19182, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107E144 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19183, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107E13E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19184, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50107E435 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19185, N'系统管理员类型', N'获取所有的系统管理员类型操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010917A9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19186, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50109283A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19187, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50109283F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19188, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501092C41 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19189, N'系统菜单', N'更新系统菜单', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010931DD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19190, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50109322B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19191, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501093254 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19192, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010934ED AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19193, N'系统菜单', N'更新系统菜单', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501093D27 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19194, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501093D73 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19195, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501093D9A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19196, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501094191 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19197, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010948F9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19198, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501094F18 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19199, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501094F16 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19200, N'新闻类型', N'获取combo数据列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501097478 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19201, N'新闻', N'获取信息总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50109747A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19202, N'新闻类型', N'获取combo数据列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50109747A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19203, N'新闻', N'新闻信息列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F50109749C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19204, N'新闻类型', N'返回所有数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501097AD7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19205, N'网站会员', N'获取网站会员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501097E6E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19206, N'网站会员', N'返回所有网站会员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F501097E7C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19207, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CA6E7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19208, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CA744 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19209, N'系统菜单', N'查询系统菜单单个数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CAA4B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19210, N'系统菜单', N'更新系统菜单', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CAF5E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19211, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CAFE5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19212, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CAFE5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19213, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CB368 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19214, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CB3FE AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19215, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CCA9F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19216, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CCADD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19217, N'认证会员', N'获取认证会员总和', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CD135 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19218, N'会员类型', N'返回会员类型combo数据操作', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CD13B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19219, N'认证会员', N'返回所有认证会员数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CD145 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19220, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F5010CD14B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19221, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F0E163 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19222, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F0E3FB AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19223, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F0E40A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19224, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F0EECC AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19225, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F0EECF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19226, N'组织单位', N'获取组织单位树形数据2', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F106BF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19227, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1483D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19228, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F14988 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19229, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F14976 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19230, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F14BD9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19231, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F14BD9 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19232, N'系统菜单', N'增加系统菜单数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1AF5D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19233, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1AFA5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19234, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1AFD0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19235, N'系统菜单', N'增加系统菜单数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1D687 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19236, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1D6D2 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19237, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1D6F8 AS DateTime))
GO
print 'Processed 500 total records'
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19238, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1DB59 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19239, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F1DB5E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19240, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F85D03 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19241, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F85E1B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19242, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F85E28 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19243, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F89FD8 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19244, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F8A0D3 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19245, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600F8A16B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19246, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600FA7B2C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19247, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600FA7CB5 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19248, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600FA7CBD AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19249, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600FC533A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19250, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600FC5397 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19251, N'系统菜单', N'获取系统菜单树形数据', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600FECB72 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19252, N'系统菜单', N'获取菜单列表信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F600FECBCF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19253, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F601123E9D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19254, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F601124093 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19255, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F60112409B AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19256, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F601136946 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19257, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F601136956 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19258, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011C6B63 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19259, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011C6C71 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19260, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011C6C6D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19261, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011D1385 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19262, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011D1529 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19263, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011D1535 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19264, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011D9AB0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19265, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011D9C3E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19266, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011D9C49 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19267, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011DF23F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19268, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011DF3A0 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19269, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F6011DF3A7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19270, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F70089D747 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19271, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F70089EA2E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19272, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F70089EA6A AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19273, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F70094506D AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19274, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700945220 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19275, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700945234 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19276, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700983C7C AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19277, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700983D9F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19278, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700983DB6 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19279, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F70098A6B7 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19280, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F70098A7F1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19281, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F70098A835 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19282, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700AD9CBF AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19283, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700AD9F0E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19284, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700AD9F2F AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19285, N'登陆页面', N'登陆成功', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700BD0CC1 AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19286, N'系统后台主页面', N'用户登录获取权限列表', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700BD0F2E AS DateTime))
INSERT [dbo].[T_SysLog] ([Id], [LogValue], [Operates], [IpAdd], [MacAdd], [Editor], [CreateDate]) VALUES (19287, N'系统管理员', N'通过session获取登陆用户名信息', N'127.0.0.1', N'50:E5:49:AF:B2:4F', N'SystemAdmin', CAST(0x0000A7F700BD0F37 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_SysLog] OFF
/****** Object:  Table [dbo].[T_SysFun]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (3, N'数据字典', N'', 3, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (4, N'用户管理', N'', 4, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (11, N'证书管理', N'', 11, 1111, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (12, N'产权档案', N'', 12, 1212, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (13, N'数据管理', N'', 13, 0, N'', N'SystemAdmin', CAST(0x0000A7F500F4446B AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (15, N'抵押贷款', N'', 15, 100, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (16, N'网站管理', N'', 16, 0, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (17, N'新闻管理', N'WebMana/News.aspx', 3, 16, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (18, N'意向管理', N'WebMana/WebInten.aspx', 4, 16, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (19, N'系统菜单', N'Sys/SysFun.aspx', 1, 1, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (20, N'组织单位', N'Sys/Org.aspx', 2, 1, N'nav', N'System', CAST(0x0000A619009A1AA1 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (21, N'操作日志', N'Sys/Logs.aspx', 3, 1, N'nav', N'System', CAST(0x0000A619009A6AAA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (22, N'通信录', N'Sys/Contacts.aspx', 4, 1, N'nav', N'System', CAST(0x0000A61900A17203 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (23, N'通知公告', N'Sys/Placard.aspx', 5, 1, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (24, N'用户权限', N'Power/Roleper.aspx', 1, 1, N'', N'SystemAdmin', CAST(0x0000A7F5010931E7 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (25, N'类型权限', N'Power/Permis.aspx', 2, 1, N'', N'SystemAdmin', CAST(0x0000A7F501093D32 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (26, N'系统管理员', N'Us/Admin.aspx', 1, 4, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (27, N'管理员类型', N'Dic/AdminType.aspx', 1, 1, N'', N'SystemAdmin', CAST(0x0000A7F50107DB74 AS DateTime))
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
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (39, N'会员管理', N'WebMana/User.aspx', 1, 16, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (40, N'新闻类型', N'WebMana/NewsType.aspx', 2, 16, N'nav', N'System', CAST(0x0000A60B010785AA AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (56, N'产权交易汇总', N'Data/Summary.aspx', 1, 13, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (57, N'友情连接', N'Sys/Links.aspx', 6, 1, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (58, N'修改密码', N'Us/UpPass.aspx', 3, 4, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (59, N'变更登记', N'VerMana/Change.aspx', 1, 1111, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (60, N'遗失补办', N'VerMana/Loss.aspx', 2, 1111, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (61, N'注销登记', N'VerMana/Logouts.aspx', 3, 1111, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (62, N'产权交易登记', N'Files/Demands.aspx', 1, 12, N'nav', N'System', CAST(0x0000A58000000000 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (63, N'外站嵌套', N'https://www.baidu.com/', 1, 1, N'nav', N'SystemAdmin', CAST(0x0000A647011C5F31 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (64, N'测试', N'WebMana/xmgglist.aspx', 15, 16, N'', N'SystemAdmin', CAST(0x0000A7F5010CAF70 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (65, N'新闻信息', N'WebMana/Newslist.aspx', 6, 16, N'', N'SystemAdmin', CAST(0x0000A6BA00860403 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (66, N'网站头设置', N'WebMana/wztoulist.aspx', 8, 16, N'', N'SystemAdmin', CAST(0x0000A6CD0086A5A7 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (71, N'友情链接管理', N'WebMana/yqlist.aspx', 9, 16, N'', N'SystemAdmin', CAST(0x0000A71400DFE2D8 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (79, N'数据导入', N'hzs/daoru.aspx', 1, 13, N'', N'SystemAdmin', CAST(0x0000A7F500F4CAE9 AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (80, N'合作社信息管理', N'hzs/list.aspx', 1, 13, N'', N'SystemAdmin', CAST(0x0000A7F600F1AF6A AS DateTime))
INSERT [dbo].[T_SysFun] ([NodeId], [DisplayName], [NodeURL], [DisplayOrder], [ParentNodeId], [FunImgNum], [Editor], [CreateDate]) VALUES (81, N'家庭农场管理', N'hzs/listnc.aspx', 1, 13, N'', N'SystemAdmin', CAST(0x0000A7F600F1D693 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_SysFun] OFF
/****** Object:  Table [dbo].[T_StandardType]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_StandardMode]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_SoftReg]    Script Date: 09/23/2017 11:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SoftReg](
	[SequenceNumber] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[T_SoftReg] ([SequenceNumber]) VALUES (N'B4A68088CE65028E65041468B2EF2B59D0F3478BD82590E6111015BF1ECDAD4DB9EEA86E13363C4698F57B17458801F1F6895B1783C93BD8231DD3C776AA929428042593EA89D99C                                                        ')
/****** Object:  Table [dbo].[T_ShortMessageSending]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_ShieldingUsers]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_RolePermissions]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (828, 1, 1, N'admin', CAST(0x0000A7F500E73245 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (829, 1, 19, N'admin', CAST(0x0000A7F500E73255 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (830, 1, 63, N'admin', CAST(0x0000A7F500E73255 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (831, 1, 20, N'admin', CAST(0x0000A7F500E73255 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (832, 1, 21, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (833, 1, 22, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (834, 1, 23, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (835, 1, 57, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (836, 1, 2, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (837, 1, 24, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (838, 1, 25, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (839, 1, 3, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (840, 1, 27, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (841, 1, 28, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (842, 1, 29, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (843, 1, 30, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (844, 1, 31, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (845, 1, 32, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (846, 1, 33, N'admin', CAST(0x0000A7F500E7325A AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (847, 1, 34, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (848, 1, 35, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (849, 1, 4, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (850, 1, 26, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (851, 1, 36, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (852, 1, 58, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (853, 1, 5, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (854, 1, 38, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (855, 1, 41, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (856, 1, 42, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (857, 1, 69, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (858, 1, 6, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (859, 1, 43, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (860, 1, 70, N'admin', CAST(0x0000A7F500E7325E AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (861, 1, 7, N'admin', CAST(0x0000A7F500E73263 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (862, 1, 44, N'admin', CAST(0x0000A7F500E73263 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (863, 1, 77, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (864, 1, 78, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (865, 1, 45, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (866, 1, 46, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (867, 1, 55, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (868, 1, 53, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (869, 1, 8, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (870, 1, 47, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (871, 1, 54, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (872, 1, 48, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (873, 1, 9, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (874, 1, 49, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (875, 1, 67, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (876, 1, 10, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (877, 1, 50, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (878, 1, 68, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (879, 1, 72, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (880, 1, 73, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (881, 1, 13, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (882, 1, 56, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (883, 1, 14, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (884, 1, 52, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (885, 1, 16, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (886, 1, 39, N'admin', CAST(0x0000A7F500E73264 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (887, 1, 40, N'admin', CAST(0x0000A7F500E73269 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (888, 1, 17, N'admin', CAST(0x0000A7F500E73269 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (889, 1, 18, N'admin', CAST(0x0000A7F500E73269 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (890, 1, 65, N'admin', CAST(0x0000A7F500E73269 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (891, 1, 66, N'admin', CAST(0x0000A7F500E73269 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (892, 1, 74, N'admin', CAST(0x0000A7F500E73269 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (893, 1, 71, N'admin', CAST(0x0000A7F500E73269 AS DateTime))
INSERT [dbo].[T_RolePermissions] ([Id], [AdminUserId], [SysFunId], [Editor], [CreateDate]) VALUES (894, 1, 64, N'admin', CAST(0x0000A7F500E73269 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_RolePermissions] OFF
/****** Object:  Table [dbo].[T_PropertyType]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Placard]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Permissions]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (304, 9, 1, N'admin', CAST(0x0000A6CD010B4338 AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (305, 9, 19, N'admin', CAST(0x0000A6CD010B433B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (306, 9, 63, N'admin', CAST(0x0000A6CD010B433B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (426, 3, 5, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (427, 3, 38, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (428, 3, 41, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (429, 3, 42, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (430, 3, 69, N'admin', CAST(0x0000A6F900BC9A1B AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (751, 2, 3, N'admin', CAST(0x0000A7F400A53AFD AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (752, 2, 27, N'admin', CAST(0x0000A7F400A53AFF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (753, 2, 16, N'admin', CAST(0x0000A7F400A53AFF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (754, 2, 39, N'admin', CAST(0x0000A7F400A53AFF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (755, 2, 40, N'admin', CAST(0x0000A7F400A53AFF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (756, 2, 17, N'admin', CAST(0x0000A7F400A53AFF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (757, 2, 18, N'admin', CAST(0x0000A7F400A53AFF AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (758, 1, 1, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (759, 1, 19, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (760, 1, 63, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (761, 1, 20, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (762, 1, 21, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (763, 1, 22, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (764, 1, 23, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (765, 1, 57, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (766, 1, 2, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (767, 1, 24, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (768, 1, 25, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (769, 1, 3, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (770, 1, 27, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (771, 1, 28, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (772, 1, 29, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (773, 1, 30, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (774, 1, 31, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (775, 1, 32, N'admin', CAST(0x0000A7F500F53D1A AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (776, 1, 33, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (777, 1, 34, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (778, 1, 35, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (779, 1, 4, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (780, 1, 26, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (781, 1, 36, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (782, 1, 58, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (783, 1, 13, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
INSERT [dbo].[T_Permissions] ([Id], [AdminTypeId], [SysFunId], [Editor], [CreateDate]) VALUES (784, 1, 79, N'admin', CAST(0x0000A7F500F53D1E AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Permissions] OFF
/****** Object:  Table [dbo].[T_Organization]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[T_Organization] ([OrgCode], [OrgName], [OrgShortName], [UpOrgCode], [Seq], [Level], [ShengCode], [ShiCode], [XianCode], [XiangCode], [CunCode], [ZuCode]) VALUES (N'3701', N'山东省威海威海市', N'威海市', N'37', 1, 4, N'37        ', N'01        ', N'          ', N'          ', N'          ', N'          ')
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
/****** Object:  Table [dbo].[T_OnlineNumber]    Script Date: 09/23/2017 11:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_OnlineNumber](
	[OnlineNumber] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[T_OnlineNumber] ([OnlineNumber]) VALUES (110)
/****** Object:  Table [dbo].[T_Notice]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_NewsType]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_News]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_MemberTypeCertification]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Links]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_LiceTranScan]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_LiceTranCheck]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_LiceTran]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Jzs]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_jtnc]    Script Date: 09/23/2017 11:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_jtnc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xh] [int] NOT NULL,
	[quyu] [varchar](50) NULL,
	[mingcheng] [nvarchar](200) NULL,
	[dizhi] [nvarchar](500) NULL,
	[zhuceshijian] [nvarchar](50) NULL,
	[jingyingfanwei] [nvarchar](500) NULL,
	[chengyuanshu] [nvarchar](50) NULL,
	[nianshouru] [nvarchar](50) NULL,
	[lishizhang] [nvarchar](50) NULL,
	[lianxidianhua] [nvarchar](50) NULL,
	[pinpaiqingkuang] [nvarchar](50) NULL,
	[niandujibie] [nvarchar](500) NULL,
	[zuzhicode] [nvarchar](50) NULL,
	[zuobiaox] [nvarchar](50) NULL,
	[zuobiaoy] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_jtnc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_jtnc] ON
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (1, 1, N'文登', N'文登区军明家庭农场', N'泽头镇唐疃村', N'2014-08-04', N'粮食种植；水果的种植、销售。', N'50', N'40', N'蔡学刚', N'13906311933', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (2, 2, N'文登', N'文登区米山镇紫玉家庭农场', N'米山镇佛东夼村庙山', N'2015-01-20', N'农作物、经济作物种植及销售；禽畜养殖及销售。', N'150', N'30', N'于国建', N'15065178599', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (3, 3, N'文登', N'文登区宋村镇富明涛家庭农场', N'宋村镇姜家庄村', N'2015-06-24', N'水果种植、销售。', N'60', N'45', N'姜红涛', N'13061135688', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (4, 4, N'文登', N'文登区米山镇钻石家庭农场', N'米山镇新福庄村南', N'2015-05-07', N'蔬菜、水果种植、销售。', N'40', N'35', N'陈严明', N'13806315013', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (5, 5, N'文登', N'文登区郎迪家庭农场', N'文登营镇沟于家村委院内', N'2015-08-28', N'水果种植销售。', N'40', N'50', N'王支国、吴学玲', N'18669368533', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (6, 6, N'文登', N'文登区天福办经果家庭农场', N'天福办东渠格村（天福办）', N'2015-07-16', N'桃树种植。', N'35', N'40', N'何经杲', N'13792757789', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (7, 7, N'文登', N'文登区进国家庭农场', N'葛家镇旺格庄村', N'2015-02-04', N'苹果、葡萄、樱桃、桃子、梨种植及销售；蜂蜜零售。', N'35', N'40', N'张进国', N'13963133799', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (8, 8, N'文登', N'文登区华宁家庭农场', N'文登营镇驾山窑村村委大院', N'2015-08-18', N'果树、苗木的种植、销售；鸡、牛、羊的养殖。。', N'40', N'45', N'黄华宁', N'13606317798', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (9, 9, N'文登', N'文登区裕景天家庭农场', N'葛家镇西谭家口村', N'2015-08-19', N'果蔬种植，开办采摘园，生态旅游观光服务，休闲垂钓，农产品销售。', N'60', N'70', N'谭晓林', N'13306304589', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (10, 10, N'文登', N'文登区羽泰家庭农场', N'环山饲料西200米（环山办）', N'2015-05-15', N'特禽养殖及销售。', N'15', N'50', N'鞠晓明', N'13863191655', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (11, 11, N'文登', N'文登区淼源银隆家庭农场', N'大水泊镇陈驾埠村北', N'2015-08-12', N'农作物、果蔬的种植及销售；家禽、家畜的养殖及销售。', N'30', N'35', N'王仁龙', N'13863050628', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (12, 12, N'文登', N'文登区米山镇金盛家庭农场', N'米山镇横口村309道北山岚处', N'2015-05-11', N'苗木、果树种植、销售。', N'40', N'45', N'孙盼成', N'13906308986', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (13, 13, N'文登', N'文登区秀峰家庭农场', N'葛家镇林子西村', N'2014-11-28', N'淡水鱼养殖，苹果树、樱桃树种植。', N'40', N'50', N'杨秀峰', N'8882335', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (14, 14, N'文登', N'文登区米山镇蓝景家庭农场', N'米山镇南崮头村北', N'2015-05-08', N'果树、苗木种植、销售。', N'35', N'30', N'于志华', N'13475101588', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (15, 15, N'文登', N'文登区葛家镇先丰家庭农场', N'葛家镇山北头村', N'2014-12-04', N'果树种植。', N'40', N'40', N'董礼海', N'13562122598', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (16, 16, N'文登', N'文登区福满多家庭农场', N'泽头镇孔格庄村', N'2015-07-02', N'水果、蔬菜的种植与销售。', N'30', N'35', N'孙力明', N'13806315795', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (17, 17, N'文登', N'文登区大水泊镇马丽家庭农场', N'大水泊镇大台村', N'2015-07-02', N'农作物及西洋参种植、销售。', N'50', N'80', N'马丽', N'8738048', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (18, 18, N'文登', N'文登区佳慧家庭农场', N'葛家镇院东村', N'2015-07-09', N'果树种植；水果销售。', N'40', N'50', N'江永涛', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (19, 19, N'文登', N'文登区大水泊镇因杰家庭农场', N'大水泊镇泊岳家村', N'2015-06-29', N'农作物及西洋参种植、销售。', N'60', N'100', N'顾因杰', N'18606303726', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (20, 20, N'文登', N'文登区阳光绿园生态家庭农场', N'高村镇北产村12号', N'2015-04-21', N'果蔬作物种植、家禽饲养', N'30', N'40', N'于江', N'15610092555', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (21, 21, N'文登', N'文登区大水泊镇沐阳岭家庭农场', N'大水泊镇河清村', N'2015-03-09', N'果树的种植与销售。', N'30', N'35', N'牛世和', N'13869012179', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (22, 22, N'文登', N'文登区高村镇延宏家庭农场', N'高村镇望海曲家村北（305省道西）', N'2015-07-09', N'家庭农场经营', N'40', N'50', N'张可刚', N'13361165878', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (23, 23, N'文登', N'文登区苹聚苑家庭农场', N'葛家镇东宋格村', N'2015-07-09', N'果树种植；水果销售。', N'40', N'50', N'马丹祥', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (24, 24, N'文登', N'文登区晓巍家庭农场', N'葛家镇英山前村', N'2015-07-09', N'果树种植；水果销售。', N'35', N'40', N'郑晓巍', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (25, 25, N'文登', N'文登区汇成家庭农场', N'文登营镇后长湾村村中', N'2015-05-22', N'绿化苗木、果树、水果的种植及销售。', N'35', N'40', N'袁振波', N'13806303778', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (26, 26, N'文登', N'文登市均秀家庭农场', N'葛家镇南石山头村', N'2013-07-05', N'果蔬种植、采摘及加工。', N'40', N'60', N'林均秀', N'13706490360', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (27, 27, N'文登', N'文登市侯家镇昌祥家庭农场', N'侯家镇吴家滩村', N'2013-06-07', N'果树、苗圃、农作物种植；水产品工厂化养殖。', N'100', N'150', N'侯敬颂', N'13792714599', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (28, 28, N'文登', N'文登区阳之光家庭农场', N'张家产镇邹家床村163号', N'2013-08-05', N'蔬菜、果树、苗木、农作物种植。', N'40', N'50', N'田世行', N'13361196689', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (29, 29, N'文登', N'文登市千千家庭农场', N'泽头镇北庄村', N'2013-07-12', N'蔬菜、苗木、粮食作物种植。', N'100', N'50', N'于进海', N'13963166585', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (30, 30, N'文登', N'文登市泽头镇协祝家庭农场', N'泽头镇大宋家村村北', N'2013-08-09', N'树木、粮食作物的种植，销售。', N'40', N'50', N'宋协祝', N'13475104308', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (31, 31, N'文登', N'文登区昌兴家庭农场', N'宋村镇金西村村西', N'2015-05-15', N'水果种植及销售。', N'40', N'50', N'曹建光', N'13606316477', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (32, 32, N'文登', N'文登区吉斗家庭农场', N'葛家镇西崔家口村', N'2015-07-10', N'果树种植；水果销售。', N'35', N'35', N'孙吉斗', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (33, 33, N'文登', N'文登区十亩间家庭农场', N'大水泊镇后村村', N'2015-04-30', N'经济作物、果蔬种植及销售。', N'50', N'60', N'王静', N'13396317168', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (34, 34, N'文登', N'文登区顺福昌家庭农场', N'泽库镇慈家潍村838-9号', N'2015-07-17', N'小麦、玉米的种植。', N'130', N'30', N'宋协海', N'15306300984', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (35, 35, N'文登', N'文登区联农家庭农场', N'葛家镇议城村', N'2015-07-10', N'果树种植及水果销售；苗木种植及销售。', N'40', N'50', N'刘燕芬', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (36, 36, N'文登', N'文登区海韵家庭农场', N'葛家镇西孙疃村', N'2015-07-10', N'果树种植；水果销售。', N'50', N'70', N'吕海泓', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (37, 37, N'文登', N'文登区泽库镇民权家庭农场', N'泽库镇滩西头村北', N'2015-08-13', N'小麦、玉米种植。', N'150', N'30', N'丛民权', N'8785279', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (38, 38, N'文登', N'文登区宋村镇昱红家庭农场', N'宋村镇鹁鸽崖村', N'2015-07-01', N'食用菌种植、销售。', N'15', N'30', N'陈永兵', N'13371183111', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (39, 39, N'文登', N'文登区晟晏家庭农场', N'泽头镇杨家疃村', N'2015-01-19', N'葡萄种植、销售。', N'30', N'45', N'孙守云', N'18963109068', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (40, 40, N'文登', N'文登区世浩家庭农场', N'葛家镇议城村', N'2015-07-10', N'果树种植；水果销售。', N'40', N'45', N'吕青召', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (41, 41, N'文登', N'文登区大水泊镇丽声家庭农场', N'大水泊镇集东村', N'2015-06-19', N'西洋参、农作物种植及销售。', N'120', N'60', N'荣丽声', N'13346318166', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (42, 42, N'文登', N'文登区金子耩家庭农场', N'泽头镇杨家疃村', N'2015-01-19', N'苗木种植。', N'20', N'50', N'李波', N'18669335368', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (43, 43, N'文登', N'文登区农夫果园家庭农场', N'宋村镇青岭村', N'2015-07-08', N'水果、蔬菜、农作物的种植、储藏、初加工、销售。', N'40', N'50', N'孙富强', N'13706490846', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (44, 44, N'文登', N'文登区米山镇土垚家庭农场', N'米山镇北环路中段镇政府北', N'2015-06-24', N'粮油作物、西洋参、瓜果、蔬菜种植、销售。', N'120', N'60', N'王志强', N'8872893', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (45, 45, N'文登', N'文登区大水泊镇松山家庭农场', N'大水泊镇栏杆河村', N'2015-06-24', N'农作物及西洋参种植、销售。', N'150', N'70', N'邵长松', N'13792756951', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (46, 46, N'文登', N'文登区昌文家庭农场', N'泽库镇辛旺庄村', N'2015-07-23', N'小麦、玉米种植。', N'160', N'40', N'刘昌文', N'13475103222', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (47, 47, N'文登', N'文登区明麦家庭农场', N'葛家镇铺集村', N'2015-08-20', N'果树种植，开办采摘园。', N'40', N'55', N'吕明麦', N'13563155529', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (48, 48, N'文登', N'文登区家兴家庭农场', N'葛家镇西孙疃村', N'2015-07-10', N'果树种植；水果销售。', N'45', N'55', N'吕以行', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (49, 49, N'文登', N'文登区四季印象家庭农场', N'侯家镇大百户村', N'2015-07-10', N'苗木、蔬菜、水果的种植、销售', N'50', N'65', N'王新江', N'15065170333', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (50, 50, N'文登', N'文登区桃之缘家庭农场', N'葛家镇西崔家口村', N'2014-05-20', N'果品、苗木种植及销售。', N'50', N'60', N'程秀枝', N'13963195085', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (51, 51, N'文登', N'文登区界石镇然然家庭农场', N'界石镇鞠北庄村西', N'2014-05-21', N'花卉、苗木、水果种植、销售；农作物种植。', N'45', N'45', N'蔡慧敏', N'15163133008', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (52, 52, N'文登', N'文登区泽头镇玉山家庭农场', N'泽头镇眠虎岭村', N'2014-05-08', N'苗木种植与销售。', N'15', N'30', N'王占增', N'13573700261', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (53, 53, N'文登', N'文登区米山镇瑞丰家庭农场', N'米山镇横口村', N'2014-04-08', N'水果、蔬菜、农作物种植及销售。。', N'80', N'60', N'吴文章', N'18389150288', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (54, 54, N'文登', N'文登市葛家镇靠山家庭农场', N'葛家镇于家口村', N'2014-03-10', N'农作物种植。', N'140', N'30', N'于喜湖', N'15065172668', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (55, 55, N'文登', N'文登区垛山红家庭农场', N'帽埠耩村2号（环山办）', N'2014-10-28', N'果蔬采摘、家禽养殖。', N'35', N'30', N'刘科', N'18389171999', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (56, 56, N'文登', N'文登区宋村镇富贵家庭农场', N'宋村镇石羊村', N'2015-06-24', N'果树种植。', N'35', N'30', N'李福军', N'13561832465', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (57, 57, N'文登', N'文登区宁方家庭农场', N'小观镇南七口村', N'2014-10-20', N'果蔬种植，工厂化水产养殖。', N'20', N'35', N'谭旭刚', N'13646302078', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (58, 58, N'文登', N'文登区米山镇恒丰家庭农场', N'米山镇横口村309国道北', N'2015-05-13', N'苗木、水果种植、销售。', N'40', N'40', N'孙旭锋', N'15906315098', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (59, 59, N'文登', N'文登区米山镇迎春家庭农场', N'米山镇横口村', N'2014-11-19', N'果树、蔬菜、粮食作物种植，家禽、家畜养殖。', N'35', N'40', N'孙国平', N'13287806109', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (60, 60, N'文登', N'文登区天福办南磨山村本荣家庭农场', N'天福办南磨山村（天福办）', N'2015-07-16', N'苹果、葡萄种植。', N'40', N'45', N'姜本荣', N'8477852', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (61, 61, N'文登', N'文登区王老法家庭农场', N'大水泊镇河清村', N'2015-07-01', N'果蔬、苗木种植及销售。', N'40', N'40', N'王凤珍', N'13869037356', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (62, 62, N'文登', N'文登区宋村镇志芳家庭农场', N'宋村镇昌盛路6-14号', N'2015-08-18', N'水貂、狐狸、狢子养殖。', N'30', N'45', N'隋志芳', N'8186802', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (63, 63, N'文登', N'文登区张家产镇玉平家庭农场', N'张家产镇嶅山村241号', N'2015-06-29', N'芦荟种植与销售；水果和蔬菜种植与销售。', N'100', N'50', N'春阳', N'15910796642', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (64, 64, N'文登', N'文登区大水泊镇爱秀家庭农场', N'大水泊镇东邹山村', N'2015-06-29', N'农作物及西洋参种植、销售。', N'120', N'70', N'陈爱秀', N'13573726022', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (65, 65, N'文登', N'文登区米山镇宜韩家庭农场', N'米山镇佛东夼村村北于家营水库东', N'2015-03-30', N'果蔬种植、树木种植、农副产品种植及销售。', N'70', N'35', N'李新', N'13061177099', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (66, 66, N'文登', N'文登区海青家庭农场', N'葛家镇院东村', N'2015-07-09', N'果树种植；水果销售。', N'50', N'45', N'于秀海', N'15206415888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (67, 67, N'文登', N'文登区宋村镇鸿友家庭农场', N'宋村镇神格村村东', N'2015-08-26', N'农作物、水果种植，苗木、花卉种植及销售，山羊养殖，水产养殖，水产品加工、销售。', N'40', N'45', N'张思礼', N'13563146555', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (68, 68, N'文登', N'文登区凤舞九天家庭农场', N'文登营镇后北风口村', N'2014-04-25', N'山东省内野生动物驯养、繁殖、批发及零售，果树及花卉种植', N'60', N'70', N'刘贝贝', N'13156318777', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (69, 69, N'文登', N'文登区海文家庭农场', N'泽库镇慈家滩村西', N'2015-04-27', N'鱼、虾、海参、螃蟹的工厂化养殖。', N'20', N'35', N'孙大刚', N'18653549818', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (70, 70, N'文登', N'文登区米山镇宇科家庭农场', N'米山镇东下庄村北河南沿', N'2015-06-24', N'苗木种植、销售。', N'30', N'45', N'董以科', N'15306307777', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (71, 71, N'文登', N'文登区四通家庭农场', N'环山办口子后村', N'2015-08-19', N'果树种植、禽类养殖。', N'35', N'35', N'姜良玉', N'13963153159', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (72, 72, N'文登', N'文登区王政军家庭农场', N'文登营镇止马岭村路西', N'2015-07-30', N'苗木、果蔬的种植、销售；生态园的休闲观光、采摘。', N'50', N'60', N'王政军、时永芬', N'15263113168', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (73, 73, N'文登', N'文登区小观镇地生金家庭农场', N'小观镇庙东村483号', N'2015-07-10', N'蔬菜种植、销售；鹅、羊养殖。', N'40', N'45', N'孙连生', N'15318276987', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (74, 74, N'文登', N'文登区金泰园家庭农场', N'葛家镇潘家上口村129号', N'2015-08-20', N'果蔬种植及销售，开办采摘园。', N'40', N'45', N'潘生', N'15065170777', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (75, 75, N'文登', N'文登区龙云家庭农场', N'泽头镇大洼村', N'2015-03-04', N'粮食作物种植。', N'150', N'40', N'李军龙', N'13287866869', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (76, 76, N'文登', N'文登区友谊家庭农场', N'葛家镇洛格庄村', N'2015-02-05', N'苗木、水果种植及销售。', N'45', N'40', N'于喜乐', N'15163193939', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (77, 77, N'文登', N'文登区出马山茶叶家庭农场', N'文登营镇侯家庵村村东104号', N'2015-03-31', N'茶叶的种植、加工、销售。', N'100', N'60', N'时永东、徐海声', N'13406498959', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (78, 78, N'文登', N'文登区张家产镇三羊家庭农场', N'张家产镇东汤村', N'2015-06-08', N'西洋参、苹果种植与销售。', N'60', N'70', N'张启光', N'15953890386', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (79, 79, N'文登', N'文登区侯家镇和合家庭农场', N'侯家镇吴家滩村16号', N'2014-04-14', N'农作物种植。(国家法律法规禁止项目除外，需经许可的，须凭许可方可经营)。', N'300', N'120', N'杨红强', N'15263117777', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (80, 80, N'文登', N'文登区大水泊镇治山家庭农场', N'大水泊镇西南台村', N'2015-06-30', N'农作物及西洋参种植、销售。', N'120', N'60', N'于治山', N'13863084653', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (81, 81, N'文登', N'文登区大水泊镇培京家庭农场', N'大水泊镇泊高家村', N'2015-06-18', N'西洋参种植与销售。', N'50', N'60', N'丛培京', N'13563153631', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (82, 82, N'文登', N'文登区天福办北磨山村胜序家庭农场', N'天福办北磨山村（天福办）', N'2015-07-16', N'果树种植；苗圃培育。', N'40', N'50', N'曲胜序', N'13563143938', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (83, 83, N'文登', N'文登区振宇家庭农场', N'大水泊镇山后王家村', N'2015-05-13', N'农作物、果木树种植。', N'110', N'40', N'张小兰', N'8088117', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (84, 84, N'文登', N'文登区米山镇快乐怡家家庭农场', N'米山镇垛夼村村西', N'2015-06-12', N'水果、绿化苗木种植、销售。', N'40', N'30', N'鞠传岗', N'13336303878', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (85, 85, N'文登', N'文登区志强家庭农场', N'葛家镇洛格庄村', N'2015-02-05', N'苗木、水果种植及销售。', N'40', N'40', N'于志强', N'13563125588', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (86, 86, N'文登', N'文登区佳兴家庭农场', N'环山办口子后村', N'2015-08-05', N'果树种植、禽类养殖。', N'35', N'30', N'姜国庆', N'13176819929', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (87, 87, N'文登', N'文登区宏伟家庭农场', N'环山办孙家西山村92号', N'2015-08-05', N'貂、狐狸、貉养殖。', N'20', N'40', N'初元杰', N'13793358107', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (88, 88, N'文登', N'文登区张家产镇英霞家庭农场', N'张家产镇永福殷家村98号', N'2015-06-17', N'水果、蔬菜的种植与销售。', N'40', N'40', N'郭军', N'13573712636', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (89, 89, N'文登', N'文登区泽头镇忠翔家庭农场', N'泽头镇高家庄村', N'2014-01-03', N'水果的种植和销售', N'35', N'40', N'李建忠', N'13356800648', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (90, 90, N'文登', N'文登区杭达城家庭农场', N'葛家镇杭格庄村', N'2014-11-17', N'农产品种植、果蔬采摘。', N'35', N'35', N'林乐城', N'15562127396', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (91, 91, N'文登', N'文登区小观镇宏利家庭农场', N'小观镇西里岛村', N'2015-07-20', N'蛋鸡养殖。', N'15', N'30', N'王胜利', N'13793381267', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (92, 92, N'文登', N'文登区大水泊镇泉龙家庭农场', N'大水泊镇毕家店村', N'2015-06-23', N'水果、蔬菜、粮食、花卉、苗木种植及销售。', N'40', N'30', N'于泉龙', N'15610795393', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (93, 93, N'文登', N'文登区大水泊镇荣滋家庭农场', N'大水泊镇河清村', N'2015-06-26', N'农作物及西洋参种植、销售。', N'60', N'50', N'丛荣滋', N'13561830796', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (94, 94, N'文登', N'文登区宋村镇昌阳家庭农场', N'宋村镇宋村村7号', N'2015-01-21', N'粮食作物种植。', N'130', N'40', N'潘建民', N'13563153379', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (95, 95, N'文登', N'文登区泽头镇旭光家庭农场', N'泽头镇吴官屯村', N'2014-07-31', N'苹果种植、销售。', N'30', N'35', N'林旭光', N'13326241865', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (96, 96, N'文登', N'文登区泽库镇丰登家庭农场', N'泽库镇辛立庄村5号', N'2015-09-09', N'农作物（不含药材）种植。', N'130', N'40', N'王文英', N'15949847169', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (97, 97, N'文登', N'文登区张家产镇爱玲家庭农场', N'张家产镇下埠前村380号', N'2015-09-07', N'苹果、西洋参、绿化苗木种植与销售。', N'40', N'50', N'张爱玲', N'13863039555', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (98, 98, N'文登', N'文登区大水泊镇海玲家庭农场', N'大水泊镇埠前头村', N'2015-09-09', N'农作物、西洋参种植及销售。', N'110', N'60', N'于海玲', N'13361187798', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (99, 99, N'文登', N'文登区高村镇俊深家庭农场', N'高村镇礼格庄村476号', N'2015-09-10', N'小麦、玉米、花生、苹果、桃树、绿化苗木种植。', N'80', N'40', N'刘俊深', N'13506306176', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (100, 100, N'文登', N'文登区强达家庭农场', N'米山镇郭格村西山', N'2015-09-11', N'苹果树种植。', N'40', N'30', N'丛培强', N'18669346796', N'', N'', NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (101, 101, N'文登', N'文登区宋村镇连珠家庭农场', N'宋村镇集西村', N'2015-09-11', N'苗木种植。', N'30', N'35', N'王桂杰', N'13562116660', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (102, 102, N'文登', N'文登区润华家庭农场', N'龙山办李家汤后村西北', N'2015-10-09', N'水果种植、销售；餐饮服务。', N'35', N'30', N'王润华', N'1565151359', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (103, 103, N'文登', N'文登区泽库镇万兴家庭农场', N'泽库镇金海路9-1号1单元501室', N'2015-09-22', N'农作物（不含药材）种植。', N'150', N'30', N'曲秋荣', N'15506313169', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (104, 104, N'文登', N'文登区万金西洋参家庭农场', N'泽头镇小埠村213', N'2015-10-23', N'西洋参的种植、销售。', N'40', N'50', N'徐晓飞', N'18763105711', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (105, 105, N'文登', N'文登区刘学瑞家庭农场', N'环山办小汤后村西', N'2015-10-14', N'苗木种植、销售。', N'30', N'35', N'刘学瑞', N'8254064', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (106, 106, N'文登', N'文登区张家产镇春军家庭农场', N'张家产镇张家埠村727号', N'2015-06-24', N'西洋参种植与销售。', N'30', N'45', N'张春军', N'18763194300', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (107, 107, N'文登', N'文登区宋村镇明华家庭农场', N'宋村镇姚山头村', N'2015-06-24', N'果树、西洋参种植。', N'40', N'50', N'姚新明', N'13021645380', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (108, 108, N'文登', N'文登区圣海家庭农场', N'环山办帽埠耩村', N'2015-08-05', N'果树种植、禽类养殖。', N'40', N'35', N'毕可战', N'15065511719', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (109, 109, N'文登', N'文登区王基斌家庭农场', N'文登营镇止马岭村路西', N'2015-07-30', N'苗木果蔬的种植、销售；生态园的休闲观光、采摘。', N'50', N'45', N'王基斌、高红芳', N'13562122871', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (110, 110, N'文登', N'文登区米山镇佳萱家庭农场', N'米山镇大山前村村北果园内', N'2015-08-11', N'苗木种植、销售；果疏作物种植、销售、采摘；垂钓、休闲观光。', N'80', N'60', N'王俊丽', N'18663153569', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (111, 111, N'文登', N'文登区硕果家庭农场', N'龙山办金岭路西首', N'2015-05-28', N'水果种植、销售。', N'35', N'30', N'郭力', N'13356312222', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (112, 112, N'文登', N'文登华福家庭农场', N'葛家镇祝家泊子村', N'2014-01-20', N'苗木、农作物种植。', N'60', N'40', N'崔国勇', N'13863075629', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (113, 113, N'文登', N'文登市泽头镇金淼家庭农场', N'泽头镇城子耩村', N'2013-12-05', N'果树，苗木的种植和销售，水果销售。', N'40', N'30', N'林山', N'13562140235', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (114, 114, N'文登', N'文登市洪梅家庭农场', N'大水泊镇迟家河村', N'2014-01-07', N'农作物种植及销售。', N'160', N'40', N'钱悦梅', N'13346317938', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (115, 115, N'文登', N'文登区米山镇丽景家庭农场', N'米山镇西铺头村荣昌花园20号楼6单元512室', N'2015-05-11', N'苗木种植、销售。', N'30', N'35', N'于宜敬', N'13792778238', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (116, 116, N'文登', N'文登区境甜家庭农场', N'张家产镇河胡家村', N'2015-04-17', N'果蔬种植和销售。', N'35', N'30', N'鞠传发', N'13906317612', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (117, 117, N'文登', N'文登市侯家镇福库家庭农场', N'侯家镇江山泊村', N'2013-09-02', N'果树、苗圃、农作物种植', N'40', N'35', N'石永生', N'13326308168', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (118, 118, N'文登', N'文登区玉荣家庭农场', N'天福办架子山村村南', N'2015-08-19', N'苗木、粮食种植；禽畜养殖。', N'45', N'40', N'毕玉荣', N'13606316757', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (119, 119, N'文登', N'文登区王炳建家庭农场', N'文登营镇止马岭村103号', N'2015-07-30', N'苗木果蔬的种植、销售；生态园的休闲观光、采摘。', N'40', N'35', N'王炳建、鞠秀丽', N'13863076761', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (120, 120, N'文登', N'文登市峰泽家庭农场', N'泽头镇峰山村', N'2013-11-11', N'水果，粮食作物的种植、销售。', N'350', N'200', N'谭新华', N'13562122497', N'', N'2015省级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (121, 121, N'文登', N'文登区米山镇林平家庭农场', N'米山镇长山村西大方', N'2015-09-02', N'蓝莓种植、销售。', N'35', N'40', N'宫林林', N'18563197110', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (122, 122, N'文登', N'文登区泽头镇田雨家庭农场', N'泽头镇北桥村', N'2014-06-05', N'苹果种植、储藏、销售。。', N'40', N'35', N'孙英奇', N'13396302376', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (123, 123, N'文登', N'文登区光华家庭农场', N'葛家镇迟家庄村', N'2014-05-28', N'苹果种植。', N'50', N'40', N'李光华', N'15266140369', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (124, 124, N'文登', N'文登区泽库镇海平家庭农场', N'泽库镇花岛村', N'2015-09-08', N'农作物（不含药材）、蔬菜种植；苗木种植。', N'50', N'35', N'于海平', N'15506313117', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (125, 125, N'文登', N'文登区鸡鸣谷家庭农场', N'文登营镇西字城村385号', N'2015-09-18', N'水果、蔬菜、苗木的种植及销售；禽畜的养殖；淡水的养殖；生态园的休闲观光、垂钓、采摘；餐饮的服务。', N'45', N'40', N'邓振宇、吕书芬', N'18563126185', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (126, 126, N'文登', N'文登区泽库镇秀英家庭农场', N'泽库镇姚家村', N'2015-09-21', N'农作物（不含药材）、蔬菜种植。', N'120', N'40', N'王建胜', N'13906318400', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (127, 127, N'文登', N'文登区利丰家庭农场', N'米山镇郭格庄村西山', N'2015-09-11', N'果树种植。', N'35', N'30', N'张启莲', N'13563160688', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (128, 128, N'文登', N'文登区甄好家庭农场', N'天福办架子山村东南', N'2015-09-16', N'苗木、果树、蔬菜、粮食种植；禽畜养殖。', N'45', N'35', N'毕艳春', N'18660318588', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (129, 129, N'文登', N'文登区芳会家庭农场', N'葛家镇池水头村', N'2015-09-14', N'果树种植及果品销售，蔬菜种植及销售', N'40', N'35', N'党芳会', N'13646309828', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (130, 130, N'文登', N'文登区文良家庭农场', N'葛家镇祝家泊子村', N'2015-10-23', N'苗木种植及销售。', N'30', N'35', N'董文良', N'13563120037', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (131, 131, N'文登', N'文登区宋村镇健泰家庭农场', N'宋村镇山东村', N'2015-10-28', N'果树种植，果品销售。', N'35', N'30', N'于志明', N'13336314509', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (132, 132, N'文登', N'文登区向阳家庭农场', N'葛家镇西谭家口村', N'2015-10-23', N'桃子、苹果的种植及销售', N'50', N'40', N'张丽梅', N'13963177988', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (133, 133, N'文登', N'文登区紫悦家庭农场', N'泽头镇南桥村408', N'2015-10-23', N'葡萄、苹果的种植销售。', N'40', N'35', N'许新良', N'13562124588', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (134, 134, N'文登', N'文登区大水泊镇冬强家庭农场', N'大水泊镇大乔村村南', N'2015-10-27', N'农作物及果树种植。', N'50', N'40', N'王冬强', N'13963178398', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (135, 135, N'文登', N'文登区泽库镇康华家庭农场', N'泽库镇小葛家村', N'2015-10-29', N'农作物种植。', N'160', N'40', N'王国康', N'13562182908', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (136, 136, N'文登', N'文登区大水泊镇庆刚家庭农场', N'大水泊镇乐园村村东', N'2015-11-16', N'农作物及苗木种植、销售，提供农业技术咨询服务。', N'80', N'35', N'于庆刚丛辉', N'13686312790', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (137, 137, N'文登', N'文登区张家产镇瑞泰家庭农场', N'张家产镇汤村', N'2015-11-02', N'绿化用苗木花卉种植及销售、西洋参种植及销售、果树种植及销售。', N'45', N'40', N'孙宗强', N'13863055586', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (138, 138, N'文登', N'文登区侯方家庭农场', N'葛家镇西于村', N'2015-11-05', N'果树种植、生猪养殖。', N'40', N'40', N'侯方', N'18263116896', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (139, 139, N'文登', N'文登区张家产镇景华家庭农场', N'张家产镇东圈村', N'2015-11-02', N'绿化用苗木花卉种植及销售、西洋参种植及销售、果树种植及销售。', N'45', N'40', N'孙秀宝', N'13562179359', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (140, 140, N'文登', N'文登区坤霖家庭农场', N'葛家镇洛格庄村', N'2015-12-02', N'果树及观光苗木种植。', N'35', N'35', N'于政新', N'15684519198', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (141, 141, N'文登', N'文登区米山镇晓阳家庭农场', N'米山镇东山后村195号', N'2015-11-06', N'玉米、花生、小麦种植兼销售。', N'120', N'30', N'高美玉', N'13616309887', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (142, 142, N'文登', N'文登区大水泊镇长海家庭农场', N'大水泊镇迟家河', N'2015-11-16', N'农作物及苗木种植，提供农业技术咨询服务。', N'70', N'35', N'于长海', N'15106314888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (143, 143, N'文登', N'文登区米山镇凤缘家庭农场', N'米山镇南崮头村村西头', N'2015-11-30', N'家禽养殖、猕猴桃、葡萄种植。', N'35', N'30', N'王晓龙', N'13287826631', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (144, 144, N'文登', N'文登区仁信家庭农场', N'泽库镇寨前村', N'2015-12-01', N'农作物种植。', N'170', N'35', N'邵仁信', N'13963143666', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (145, 145, N'文登', N'文登区泽库镇英军家庭农场', N'泽库镇辛旺庄村', N'2015-11-25', N'农作物种植。', N'150', N'30', N'侯英军', N'15506313117', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (146, 146, N'文登', N'文登区泽头镇神格家庭农场', N'泽头镇西程格村205', N'2015-12-01', N'粮食的种植，水果的种植，蔬菜的种植。', N'50', N'35', N'孙靖波', N'13863006788', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (147, 147, N'文登', N'文登区大水泊镇华智家庭农场', N'大水泊镇西南台村', N'2015-11-02', N'农作物及苗木种植、销售，提供农业技术咨询服务。', N'50', N'30', N'于华智', N'18563146543', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (148, 148, N'文登', N'文登区峰煌家庭农场', N'葛家镇洛格庄村', N'2015-12-03', N'果树种植及观光苗木种植。', N'35', N'30', N'于国荣', N'15550693888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (149, 149, N'文登', N'文登区大水泊镇兴旺家庭农场', N'大水泊镇大乔家村村北', N'2015-11-23', N'农作物及果树的种植、销售，提供相关的技术咨询服务。', N'50', N'30', N'刘玉廷尹永收', N'13573711690', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (150, 150, N'文登', N'文登区小涵家庭农场', N'米山镇黑石屯村村西', N'2015-10-27', N'苗木、蔬菜、瓜果种植及销售。', N'35', N'30', N'王涛', N'15244010888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (151, 151, N'文登', N'文登区大水泊镇藴玉家庭农场', N'大水泊镇大河村', N'2015-11-30', N'农作物及蔬菜种植、销售，提供相关的农业技术咨询服务。', N'50', N'35', N'谷元荣顾阿乐', N'18263131356', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (152, 152, N'文登', N'文登区乐兴家庭农场', N'葛家镇东汪疃村', N'2015-11-17', N'苹果种植及销售。', N'30', N'30', N'王军', N'13361184277', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (153, 153, N'文登', N'文登区文军家庭农场', N'葛家镇院东村', N'2015-12-04', N'果树种植。', N'35', N'30', N'董仁习', N'8882881', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (154, 154, N'文登', N'文登区泽库镇和田家庭农场', N'泽库镇花岛村', N'2015-12-11', N'农作物种植。', N'170', N'35', N'于配和', N'13012739151', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (155, 155, N'文登', N'文登区栖云家庭农场', N'长会口村1177-1号', N'2015-12-21', N'农作物种植，开办采摘园，生态旅游观光服务，休闲垂钓，餐饮服务。', N'50', N'30', N'王基文', N'13606317692', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (156, 156, N'文登', N'威海市文登区美峰家庭农场', N'张家产镇大旺庄村', N'2014-10-27', N'果树、蔬菜、农作物的种植、采摘和销售；家禽养殖。', N'35', N'30', N'王峰松', N'8771029', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (157, 157, N'文登', N'威海鹏远家庭农场', N'葛家镇东旺疃村', N'2014-09-17', N'果蔬、绿化苗木种植、销售。', N'40', N'30', N'李海涛', N'18769184000', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (158, 158, N'文登', N'威海懋林家庭农场', N'米山镇东下庄村', N'2014-09-17', N'果蔬、绿化苗木种植、销售。', N'40', N'30', N'林胜利', N'15615015977', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (159, 159, N'文登', N'威海市传盛家庭农场', N'葛家镇赤金泊村', N'2014-11-04', N'苹果种植及销售。', N'40', N'30', N'鞠传波', N'13906307137', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (160, 160, N'文登', N'威海市文登区建军家庭农场', N'大水泊镇大台村', N'2014-11-06', N'苗木、农作物种植及销售，机件加工销售。', N'50', N'35', N'王建军', N'13573700438', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (161, 161, N'文登', N'威海市文登区龙山家庭农场', N'宋村镇双石村村西', N'2014-10-23', N'果树苗木繁育、水果种植、销售。', N'45', N'30', N'毕可利', N'13562163540', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (162, 162, N'文登', N'威海市灏旺家庭农场有限公司', N'天福办架子山村', N'2014-12-30', N'苗木种植、销售。', N'30', N'30', N'毕玉荣', N'13606316757', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (163, 163, N'文登', N'威海市文登区乐强家庭农场', N'界石镇大界石村138号', N'2015-03-10', N'果蔬、苗木的种植、销售。', N'35', N'30', N'林强', N'13706318163', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (164, 164, N'文登', N'威海市百泉家庭农场', N'大水泊镇泊岳家村', N'2015-02-15', N'粮食作物、经济作物、水果、蔬菜、苗木的种植和销售；家禽、家畜的养殖和销售；淡水鱼养殖。', N'50', N'35', N'余磊', N'13034563899', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (165, 165, N'文登', N'威海鑫灏家庭农场有限公司', N'张家产镇林家床村北', N'2015-09-11', N'水果、蔬菜的种植、采摘与销售；苗木的种植与销售；农副产品销售；生态旅游观光服务；餐饮服务。', N'50', N'40', N'赛强序', N'13706490454', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (166, 166, N'文登', N'威海市雅慧家庭农场有限公司', N'高村镇南产村2号', N'2015-11-27', N'农作物种植。', N'150', N'35', N'刘昌杰', N'18606317961', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (167, 167, N'文登', N'威海良科家庭农场有限公司', N'大水泊镇场南村15-1号', N'2015-08-27', N'苗木栽培、苹果树种植及销售。', N'35', N'30', N'张兰淑', N'15954056988', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (168, 168, N'文登', N'威海市文登区卓田家庭农场', N'界石镇张格庄村西南', N'2015-09-02', N'丹参、玉米、地瓜、黑果花楸的种植、销售。', N'40', N'35', N'潘美超', N'15098109998', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (169, 169, N'文登', N'威海市文登区盈信家庭农场', N'宋村镇曲疃庄村', N'2014-10-27', N'蔬菜、果树、苗木、农作物种植。', N'80', N'45', N'姜应玲', N'13863096999', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (170, 170, N'文登', N'威海市文登区金谷园家庭农场', N'宋村镇徐格村218号', N'2014-11-04', N'草莓、樱桃种植、销售；农副产品销售；生猪养殖；蜜蜂养殖。', N'50', N'40', N'闫培华', N'13863055857', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (171, 171, N'文登', N'威海市文登区金润家庭农场', N'界石镇北鲁家埠村118号', N'2015-03-20', N'果蔬、苗木的种植、销售。', N'40', N'30', N'于胜', N'13563162577', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (172, 172, N'文登', N'威海市文登区禾润家庭农场', N'界石镇石头河村南', N'2015-04-13', N'黑木耳、绿化苗木、食用菌的种植、销售，水果、蔬菜的采摘服务，垂钓服务。', N'35', N'30', N'刘常辉', N'8531011', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (173, 173, N'文登', N'威海文登区杨霏家庭农场', N'文登营镇马家岭村南', N'2015-06-04', N'瓜果、蔬菜、花卉苗木、农作物的种植、培育、研发、初加工及销售。', N'40', N'30', N'冯学锋', N'13061189941', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (174, 174, N'文登', N'威海文登区宇程家庭农场', N'下夼村西南山', N'2015-07-16', N'果树种植、家禽养殖。', N'45', N'35', N'王振威', N'18389145888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (175, 175, N'文登', N'威海市沃土丰润家庭农场', N'大水泊镇井东村', N'2015-05-28', N'果蔬的种植及销售。', N'45', N'35', N'宋元莉', N'13792791886', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (176, 176, N'文登', N'威海市万臣家庭农场', N'葛家镇生格庄村', N'2014-10-29', N'苹果种植及销售。', N'50', N'35', N'隋万臣', N'8881938', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (177, 177, N'文登', N'威海市文登区明光家庭农场', N'宋村镇宋村村村北', N'2014-10-23', N'水果、蔬菜的种植、销售。', N'35', N'30', N'王明光', N'13806314678', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (178, 178, N'文登', N'威海市文登区田雨家庭农场', N'泽头镇北桥村', N'2014-11-05', N'苹果种植、储藏、销售。', N'40', N'35', N'孙英奇', N'13396302376', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (179, 179, N'文登', N'威海市小虫家庭农场', N'张家产镇董家店村', N'2014-10-21', N'粮食作物、经济作物、蔬菜、水果、苗木的种植和销售；家禽、家畜的养殖和销售。', N'50', N'40', N'丛朝华', N'15154001735', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (180, 180, N'文登', N'威海市文登区耿氏家庭农场', N'张家产镇山阴沟村村东南', N'2014-01-10', N'苗木、果蔬、农作物的种植、销售。', N'55', N'35', N'耿修杰', N'13001630632', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (181, 181, N'文登', N'文登市米山镇昌顺家庭农场', N'米山镇东山后村', N'2014-02-19', N'粮食作物、苗圃花卉、西洋参种植、销售。', N'45', N'35', N'丛歧', N'13563188257', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (182, 182, N'文登', N'威海金茂家庭农场有限公司', N'小观镇榆树底村村西', N'2015-11-20', N'果树、苗木、蔬菜、粮食的种植、加工、销售。', N'50', N'35', N'于建茂', N'13963167918', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (183, 183, N'文登', N'威海紫轩家庭农场有限公司', N'小观镇二王家村33号', N'2015-11-20', N'农作物的种植、加工、销售。', N'190', N'50', N'蔡建辉', N'18663177861', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (184, 184, N'文登', N'威海市文登区千海家庭农场', N'泽头镇道口村214号', N'2015-12-23', N'农产品、苗木种植、销售', N'65', N'35', N'于小玲', N'13054585333', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (185, 185, N'文登', N'威海市文登区柘阳山家庭农场', N'高村镇兴高路41号', N'2014-12-12', N'家庭农场经营。', N'120', N'55', N'时述忠', N'13306307005', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (186, 186, N'文登', N'威海市文登区维丽家庭农场', N'界石镇倪家产村东', N'2015-05-11', N'果树种植、销售。', N'45', N'35', N'潘世波', N'13573729015', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (187, 187, N'文登', N'威海市文登区代代鸿家庭农场', N'侯家镇北廒村', N'2015-01-29', N'果蔬的种植与销售；农作物种植。', N'260', N'85', N'于学波', N'8723377', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (188, 188, N'文登', N'威海市文登区国庆家庭农场', N'界石镇大界石村北', N'2014-05-30', N'蔬菜、水果种植、销售', N'50', N'35', N'于国庆', N'8532191', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (189, 189, N'文登', N'威海市文登区誉洁家庭农场', N'界石镇楚岘村274号', N'2015-07-10', N'水果种植、销售。', N'35', N'30', N'王志远', N'13963132168', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (190, 190, N'文登', N'威海乙丁旺家庭农场', N'小观镇万家口村', N'2013-08-05', N'淡水鱼养殖，果树、苗木、农作物种植。', N'120', N'55', N'于瑞永', N'13792798898', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (191, 191, N'文登', N'威海市文登区举盛家庭农场', N'小观镇庙东村201号', N'2013-08-02', N'农作物、苗木种植及销售。', N'65', N'35', N'孙锅举', N'8855876', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (192, 192, N'文登', N'文登市德威家庭农场', N'界石镇南截山村村东', N'2013-10-18', N'花卉、苗木、蔬菜、水果、玉米、花生的种植、销售。', N'80', N'35', N'于傲德', N'13562116498', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (193, 193, N'文登', N'威海市文登区保竹家庭农场', N'小观镇坦埠村710号', N'2013-09-17', N'苗木、农作物种植及销售。', N'75', N'35', N'孙保可', N'8854637', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (194, 194, N'文登', N'文登市平安家庭农场', N'米山镇佛东夼村西', N'2013-07-22', N'花卉、苗木、蔬菜、水果、农作物的种植、销售；家禽、肉牛养殖。', N'70', N'40', N'宫占龙', N'13361155999', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (195, 195, N'文登', N'威海市才文家庭农场有限公司', N'大水泊镇屯宋家村288号', N'2015-10-09', N'经济苗木种植、销售；苹果果袋加工、销售。', N'40', N'35', N'宋才文', N'13475101901', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (196, 196, N'文登', N'威海市文登区迎龙家庭农场有限公司', N'文登营镇何家店村南山双顶前', N'2015-10-28', N'果树、苗木的种植；鸡、牛、羊的养殖。。', N'40', N'40', N'何玉辉', N'13561809417', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (197, 197, N'文登', N'威海市文登区海龙家庭农场', N'界石镇张格庄村东山', N'2015-10-09', N'蔬菜、苗木的种植、销售。', N'45', N'30', N'阎战海', N'13793396238', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (198, 198, N'文登', N'威海丞桂家庭农场有限公司', N'大水泊镇泽上村村西', N'2015-10-20', N'粮食作物、经济作物、水果、蔬菜、苗木的种植与销售；家禽、家畜的养殖与销售；淡水鱼养殖；采摘园服务。', N'50', N'40', N'宋小阳', N'13563122179', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (199, 199, N'文登', N'威海市春友家庭农场有限公司', N'泽库镇小葛家村', N'2015-10-20', N'果蔬的种植与销售；农作物（不含药材）种植。', N'65', N'40', N'王春友', N'13869050227', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (200, 200, N'文登', N'威海启明家庭农场有限公司', N'大水泊镇章子山村43号', N'2015-10-20', N'农作物（不含药材）、果蔬的种植与销售。', N'60', N'335', N'孙启明', N'8631909', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (201, 201, N'文登', N'威海市辉荣家庭农场有限公司', N'侯家镇石漳河村', N'2015-10-28', N'苗木、果蔬的种植与销售；家禽养殖；休闲旅游服务、采摘服务；农作物种植。', N'50', N'35', N'王辉荣', N'15163169579', N'', N'', NULL, NULL, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (202, 202, N'文登', N'威海市文登区盛日家庭农场', N'界石镇大产村东', N'2015-10-09', N'绿化苗木、农作物的种植、销售。', N'70', N'35', N'徐东莲', N'13884804148', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (203, 203, N'文登', N'威海建智家庭农场有限公司', N'大水泊镇场南村村北', N'2015-10-20', N'农作物种植；农副产品销售。', N'130', N'40', N'刘建智', N'15092590275', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (204, 204, N'文登', N'威海市绿康家庭农场有限公司', N'泽库镇尹家村东北', N'2015-10-20', N'苗木种植与销售。', N'30', N'30', N'李令超', N'13863122166', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (205, 205, N'文登', N'威海美达家庭农场', N'大水泊镇章子山村130号', N'2016-12-28', N'农作物、蔬菜、水果种植及销售；淡水鱼养殖。', N'60', N'35', N'王艳玲', N'18389110862', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (206, 206, N'文登', N'威海市大晨家庭农场', N'张家产镇董家店村', N'2014-10-16', N'粮食作物、经济作物、蔬菜、水果、苗木的种植和销售；家禽、家畜的养殖和销售。', N'55', N'40', N'王海涛', N'13666309088', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (207, 207, N'文登', N'威海海红家庭农场有限公司', N'大水泊镇场南村村东', N'2015-10-16', N'农作物种植；农副产品销售。', N'160', N'35', N'张建红', N'13573722784', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (208, 208, N'文登', N'威海永昱家庭农场有限公司', N'侯家镇上郭家村204号', N'2015-09-15', N'果蔬的种植与销售；农作物（不含药材）种植。', N'70', N'40', N'初钊云', N'13287802578', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (209, 209, N'文登', N'威海粮宝家庭农场有限公司', N'高村镇沙柳村村北公路旁', N'2015-09-22', N'农作物种植。', N'140', N'40', N'孙建良', N'13562151771', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (210, 210, N'文登', N'威海市文登区盛茂家庭农场', N'界石镇旸里后村西山', N'2015-09-25', N'果树的种植、销售。', N'35', N'30', N'于日镇', N'13061172009', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (211, 211, N'文登', N'威海市嘉昂家庭农场有限公司', N'高村镇汤西村229号', N'2015-09-25', N'果树种植。', N'40', N'35', N'周丽川', N'13963132868', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (212, 212, N'荣成', N'荣成市大田绿源家庭农场', N'大疃镇西塔后村', N'2015-04-29', N'葡萄种植、采摘', N'72', N'267', N'张庆丽', N'13206305078', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (213, 213, N'荣成', N'荣成市上水农场', N'上庄镇中古章村', N'2013-09-25', N'葡萄种植销售', N'78', N'236', N'王涛', N'王涛', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (214, 214, N'荣成', N'荣成市世外萄园家庭农场', N'崖西镇后高村', N'2014-07-07', N'蔬菜、水果、苗木、花卉种植销售。', N'404', N'623', N'张健良', N'13906306570', N'绿色食品认证', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (215, 215, N'荣成', N'荣成市常青藤农场', N'夏庄镇二胪村', N'2014-11-13', N'瓜果、蔬菜、农作物种植销售', N'500', N'238', N'张航', N'0631-7745601', N'绿色食品认证', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (216, 216, N'荣成', N'荣成市忠义农场', N'虎山镇庵里村', N'2013-09-27', N'中草药、蔬菜、水果、花卉、苗木、谷物油料种植和销售。', N'362', N'236', N'宋忠义', N'13386313126', N'绿色食品认证', N'2015年省级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (217, 217, N'荣成', N'荣成市松涛谷农场', N'夏庄镇二胪村', N'2014-11-13', N'瓜果、蔬菜、农作物种植销售', N'485', N'126', N'杨松', N'7745603', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (218, 218, N'荣成', N'荣成市埠柳镇军昊生态农场', N'埠柳镇不夜村', N'2016-01-11', N'农业种植，休闲采摘。', N'210', N'159', N'刘军', N'13963123076', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (219, 219, N'荣成', N'荣成市斥山辰丰农场', N'斥山街道志门村', N'2015-12-16', N'谷物、果树、采摘', N'729', N'246', N'刘玉广', N'15684537599', N'绿色食品认证', N'2016年市级2016年县级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (220, 220, N'荣成', N'荣成市福泰山生态休闲农场', N'夏庄镇', N'2013-12-01', N'水果、蔬菜、谷物、苗木种植销售，观光园采摘', N'200', N'256', N'张树兴', N'13806300888', N'绿色食品认证', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (221, 221, N'荣成', N'荣成市荣倡生态休闲农场', N'大疃镇', N'2013-12-01', N'苹果、猕猴桃种植销售，观光采摘', N'117', N'248', N'张秀荣', N'18863135899', N'', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (222, 222, N'荣成', N'荣成市上庄绿源生态葡萄庄园', N'上庄镇', N'2015-10-08', N'葡萄种植销售', N'106', N'246', N'曲双军', N'13906305964', N'', N'2017年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (223, 223, N'荣成', N'荣成市阿逸多农场', N'夏庄镇二胪村', N'2015-05-29', N'农产品种植、加工、销售、休闲观光采摘', N'218', N'289', N'夏一清', N'18863165056', N'', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (224, 224, N'荣成', N'荣成市宁津碧水蓝天家庭农场', N'宁津街道办事处曲家村', N'2013-12-04', N'', N'100', N'200', N'刘德强', N'15098145892', N'', N'2016年县级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (225, 225, N'荣成', N'荣成市城西果满多家庭农场', N'城西街道办事处东岭后村', N'2015-02-16', N'苹果种植销售，观光采摘', N'256', N'365', N'岳建波', N'13561882378', N'', N'2015年省级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (226, 226, N'荣成', N'荣成市百菇园家庭农场', N'上庄镇小龙庄村', N'2013-11-15', N'菇类养殖', N'100', N'39', N'常淑华', N'13563161996', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (227, 227, N'荣成', N'荣成市斥山美田农场', N'桃园街道于家河村', N'2013-11-05', N'农产品种植、加工、销售、休闲观光采摘', N'100', N'48', N'郭健', N'13506300117', N'绿色食品认证', N'2016年县级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (228, 228, N'荣成', N'荣成市海波生态农场', N'崖头街道青山后吕家村', N'2013-07-11', N'农产品种植、加工、销售、休闲观光采摘', N'880', N'480', N'于海波', N'13296308288', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (229, 229, N'荣成', N'荣成市明超农场', N'斥山街道办事处石龙山前村', N'2013-07-22', N'农产品种植、加工、销售、休闲观光采摘', N'800', N'389', N'刘明超', N'15306301998', N'', N'2016年县级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (230, 230, N'荣成', N'荣成市崖西小崔家庭农场', N'崖西镇大山口村', N'2011-03-16', N'农产品种植、加工、销售、休闲观光采摘', N'150', N'120', N'崔志宇', N'13806300759', N'', N'2016年县级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (231, 231, N'乳山', N'乳山市宏润家庭农场', N'白沙滩镇稗子刘家村8号', NULL, N'种植业', N'100', N'30', N'李红彦', N'13506301575', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (232, 232, N'乳山', N'乳山市茂盈家庭农场', N'冯家镇北刘伶庄村', NULL, N'种植业', N'270', N'40', N'宋云翔', N'15662391177', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (233, 233, N'乳山', N'乳山市春涛家庭农场', N'冯家镇东官庄村', N'2015-05-18', N'种植业', N'1300', N'60', N'姜春涛', N'15662308888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (234, 234, N'乳山', N'乳山市建旗家庭农场', N'冯家镇南泥沟村', N'2015-05-12', N'种植业', N'300', N'30', N'曹建岐', N'13561860018', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (235, 235, N'乳山', N'乳山市万树园家庭农场', N'海阳所大庄村', N'2015-05-08', N'其他', N'85', N'30', N'于江', N'13573716988', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (236, 236, N'乳山', N'乳山市福润家庭农场', N'南黄镇北斜山村', N'2004-08-14', N'其他', N'30', N'30', N'徐彬', N'13371151998', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (237, 237, N'乳山', N'乳山市靖轩家庭农场', N'南黄镇南黄村', NULL, N'种植业（粮食）', N'340', N'35', N'孙曰仁', N'18263151567', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (238, 238, N'乳山', N'乳山市高峰家庭农场', N'南黄镇湾头村', NULL, N'畜牧业（生猪）', N'240', N'35', N'高峰高振胜', N'6489397', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (239, 239, N'乳山', N'乳山市泰生家庭农场', N'乳山口镇张家庄村', NULL, N'种植业', N'50', N'30', N'杜洪国', N'15098147965', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (240, 240, N'乳山', N'乳山市双喜家庭农场', N'乳山寨镇车村村', NULL, N'种植业', N'55', N'30', N'郝宗喜', N'13508917037', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (241, 241, N'乳山', N'乳山市金凤家庭农场', N'乳山寨镇赤家口村', NULL, N'种植业', N'50', N'40', N'宋海青', N'13863033057', N'', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (242, 242, N'乳山', N'乳山市亚奥家庭农场', N'乳山寨镇南司马庄村', NULL, N'种养', N'300', N'30', N'隋兆杰', N'13863018017', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (243, 243, N'乳山', N'乳山市新自然家庭农场', N'乳山寨镇小管村', NULL, N'种植业（粮食）', N'205', N'50', N'张云芳', N'13256803087', N'', N'2015年省级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (244, 244, N'乳山', N'乳山市大翁山家庭农场', N'午极镇石字岘村', NULL, N'种植业', N'460', N'40', N'李书兴', N'15763140888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (245, 245, N'乳山', N'乳山市文山家庭农场', N'下初镇河南村', N'2015-05-18', N'种养', N'80', N'30', N'曹文山', N'13963865118', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (246, 246, N'乳山', N'乳山市忠德家庭农场', N'下初镇黄格庄村', N'2015-06-02', N'其他', N'200', N'30', N'刘忠德', N'13863001099', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (247, 247, N'乳山', N'乳山市常兴家庭农场', N'下初镇江南头村', N'2014-07-14', N'种植业', N'120', N'50', N'常大兴', N'13793367728', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (248, 248, N'乳山', N'乳山市涵波园林家庭农场', N'下初镇西马台石村', N'2015-01-21', N'种植业', N'260', N'40', N'孙忠言', N'13561873088', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (249, 249, N'乳山', N'乳山市尚丰家庭农场', N'下初镇西马台石村', N'2015-05-12', N'种植业', N'', N'40', N'惠方斌', N'18616280555', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (250, 250, N'乳山', N'乳山市建申家庭农场', N'下初镇辛庄村', N'2015-07-17', N'种植业', N'1000', N'50', N'姜新庆', N'13561813309', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (251, 251, N'乳山', N'乳山市张琼文葫芦枣家庭农场', N'下初镇驻地', N'2014-10-20', N'其他', N'110', N'40', N'张鹏', N'13906303715', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (252, 252, N'乳山', N'乳山市强宇家庭农场', N'夏村镇东家村', N'2015-11-17', N'种植业', N'100', N'50', N'张永强、于霞', N'13455853333', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (253, 253, N'乳山', N'乳山市六合居家庭农场', N'夏村镇胡八庄村', N'2015-06-23', N'种植业（粮食）', N'74', N'50', N'胡志成', N'13863188312', N'', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (254, 254, N'乳山', N'乳山市庄户人家庭农场', N'夏村镇姜家村', N'2014-11-12', N'种植业（粮食）', N'460', N'60', N'李书兴', N'15763140888', N'', N'2016年市级，2016年省级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (255, 255, N'乳山', N'乳山市盈禾家庭农场', N'夏村镇宋家庄村', N'2015-10-30', N'种植业（粮食）', N'100', N'40', N'于永明', N'15163186777', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (256, 256, N'乳山', N'乳山市守强家庭农场', N'徐家镇洋村', N'2014-08-05', N'种植业（粮食）', N'470', N'80', N'于守强', N'13184183962', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (257, 257, N'乳山', N'乳山市五良丰家庭农场', N'崖子镇西崮头村', N'2013-12-05', N'种植业', N'80', N'80', N'史荣刚', N'15154012999', N'史记五良丰商标', N'2016年市级，2016年省级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (258, 258, N'乳山', N'乳山市山箭乐家庭农场', N'育黎镇龙角山东', N'2014-04-25', N'种植业（粮食）', N'300', N'50', N'许同惠', N'15065109678', N'', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (259, 259, N'乳山', N'乳山市文晟家庭农场', N'诸往镇九龙圈村', N'2015-06-11', N'种植业', N'200', N'30', N'刘文', N'13863193456', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (260, 260, N'乳山', N'乳山市振宽家庭农场', N'诸往镇神童庙村', N'2016-01-05', N'种植业', N'100', N'30', N'许振军', N'15263111728', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (261, 261, N'环翠', N'环翠区堡子顶家庭农场', N'温泉镇邹家庄村', N'2013-11-05', N'苗木种植、畜牧养殖、农家乐', N'180', N'100', N'周承金', N'13616302888', N'网络经销平台推广', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (262, 262, N'环翠', N'环翠区长泰家庭农场', N'温泉镇后亭子村', N'2014-05-13', N'果蔬、果树及苗圃、花卉的种植销售采摘等', N'170', N'370', N'邵海滨', N'13869036988', N'委托威海制造在网络平台推广品牌建设', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (263, 263, N'环翠', N'环翠区梓霖休闲农场', N'环翠区温泉镇刘家台村', N'2015-06-16', N'农产品的加工销售', N'300', N'30', N'周惠敏', N'13255660888', N'在天猫注册农产品网络经销平台', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (264, 264, N'环翠', N'威海市万和家庭农场', N'环翠区温泉镇雨夼村', N'2015-06-30', N'苗木种植、畜牧养殖、农家乐', N'80', N'55', N'姚飞羽', N'18963112345', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (265, 265, N'环翠', N'环翠区桃源谷生态园', N'温泉镇后亭子村', N'2015-02-02', N'蔬菜、瓜果苗木种植', N'35', N'40', N'王重阳', N'13906309515', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (266, 266, N'环翠', N'环翠区甜宝家庭农场', N'环翠区羊亭镇南小城村委东北', N'2015-06-23', N'果蔬种植、销售、采摘', N'50', N'30', N'戚本建', N'13963106628', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (267, 267, N'高区', N'威海火炬高技术产业开发区长阳山家庭农场', N'初村镇远庄村', N'2015-08-06', N'农产品的采购及种植；苗木、果蔬的种植及销售。', N'700', N'34.8', N'王立元', N'15964986057', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (268, 268, N'经区', N'威海经济技术开发区崮山镇臣军家庭农场', N'威海经济技术开发区崮山镇耩东村村南', N'2015-07-23', N'蔬菜、苹果种植、销售', N'50', N'10', N'邹臣军', N'13061177030', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (269, 269, N'经区', N'威海陌上花家庭农场有限公司', N'经济技术开发区桥头镇所前泊村', N'2014-04-14', N'餐饮服务；旅游服务；组织文化艺术交流（不含演出）；农作物、水果、蔬菜的种植及批发零售；农副产品的销售；香料的加工和销售。', N'100', N'200', N'陈雪', N'18660366463', N'', N'2016市级、2016省级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (270, 270, N'经区', N'威海经济技术开发区威翔家庭农场', N'经济技术开发区桥头镇东于家村', NULL, N'水果、茶叶种植', N'370', N'50', N'周科亮', N'13356806038', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (271, 271, N'经区', N'威海经济技术开发区涛盛家庭农场', N'经济技术开发区桥头镇大贞村', NULL, N'果蔬种植销售', N'100', N'10', N'杨涛', N'13561848129', N'', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (272, 272, N'经区', N'威海老虎橛家庭农场有限公司', N'威海经济技术开发区桥头镇报信村186号', NULL, N'蔬菜、水果、苗木、花草的种植与销售；水产品、禽蛋的销售；备案范围内的货物及技术进出口。', N'500', N'没到成果期', N'刘军海', N'15163129565', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (273, 273, N'临港', N'威海神山家庭农场', N'汪疃镇吐羊口村', N'2013-03-29', N'果树、蔬菜、苗木、花卉、农作物的研发、培育、种植、初加工及销售。', N'320', N'400', N'曹志毅', N'13863179288', N'', N'2015年省级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (274, 274, N'临港', N'威海市承进家庭农场', N'汪疃镇郝家屯村村北', N'2013-11-13', N'粮食作物、苗木的培育、种植及销售。', N'100', N'50', N'徐承进', N'13906304870', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (275, 275, N'临港', N'威海市沃森家庭农场', N'汪疃镇多宝路5-1号', N'2013-12-06', N'干果的种植及销售。', N'800', N'400', N'周常桥', N'15163118333', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (276, 276, N'临港', N'威海市益波家庭农场', N'汪疃镇耩前庄村', N'2014-03-17', N'苗木、花卉、水果、蔬菜的种植与销售。', N'500', N'200', N'衣云波', N'13336317957', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (277, 277, N'临港', N'威海秦权香草种植家庭农场', N'苘山镇东许家村', N'2014-03-27', N'芳香植物的种植、加工及销售。', N'500', N'300', N'刘新波', N'8545156', N'', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (278, 278, N'临港', N'威海市汇美家庭农场', N'黄岚办事处梁家夼村', N'2014-04-09', N'苗木、农作物的种植与销售。', N'150', N'80', N'宋守艳', N'13156319636', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (279, 279, N'临港', N'威海临港经济技术开发区富盛家庭农场', N'汪疃镇三家庄村东', N'2014-05-12', N'瓜果、蔬菜、苗木种植与销售', N'200', N'300', N'丛翠霞', N'13336310665', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (280, 280, N'临港', N'威海市邢强家庭农场', N'汪疃镇桑杭埠村北', N'2014-06-26', N'苗木种植销售、生态农业休闲观光服务。', N'200', N'200', N'邢强', N'8562599', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (281, 281, N'临港', N'威海临港区大明葡萄家庭农场', N'汪疃镇地文头村', N'2014-07-23', N'葡萄种植、销售；苗木培育、销售。。', N'100', N'200', N'宋文学', N'13616301566', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (282, 282, N'临港', N'威海市御信家庭农场', N'汪疃镇翠峡口村西', N'2014-07-28', N'瓜果、蔬菜、花卉苗木及农作物的种植、初加工及销售。', N'100', N'50', N'于波生', N'8566381', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (283, 283, N'临港', N'威海大风车葡萄家庭农场', N'汪疃镇吐羊口村西南', N'2014-07-30', N'葡萄及苗木的种植与销售。', N'100', N'150', N'胡涛', N'13863109233', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (284, 284, N'临港', N'威海临港区鹏源谷家庭农场', N'汪疃镇丛家产村村北', N'2014-07-30', N'瓜果、蔬菜、花卉苗木、农作物的种植与销售。', N'200', N'100', N'谷元鹏', N'13906303026', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (285, 285, N'临港', N'威海临港经济技术开发区泓锦家庭农场', N'汪疃镇三家庄村', N'2014-08-08', N'中草药种植销售', N'300', N'100', N'衣爱军', N'13506306712', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (286, 286, N'临港', N'威海临港区原始部落家庭农场', N'汪疃镇汪疃村村南', N'2014-08-18', N'果树、蔬菜、苗木、花卉、农作物的研发、培育、种植及销售；', N'200', N'300', N'何国华', N'8565595', N'', N'2016年省级2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (287, 287, N'临港', N'威海华锦家庭农场', N'汪疃镇北大英村南', N'2014-09-03', N'苗木、瓜果、蔬菜、农作物的种植与销售。', N'200', N'200', N'王明清', N'13869013688', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (288, 288, N'临港', N'威海临港经济技术开发区旭日农场', N'黄岚办事处白玉庄村', N'2014-12-11', N'农作物种植', N'1000', N'400', N'丛旭日', N'13666319999', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (289, 289, N'临港', N'威海临港经济技术开发区毓泉生态园家庭农场', N'黄岚办事处白玉庄村东', N'2015-02-27', N'苗木、果蔬、农作物种植与销售。', N'50', N'50', N'丁振瀚', N'18563197161', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (290, 290, N'临港', N'威海祝氏家庭农场', N'汪疃镇王家产村东', N'2015-04-10', N'樱桃、草莓、蓝莓种植、采摘。', N'1000', N'1000', N'祝旦璞', N'13506310066', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (291, 291, N'临港', N'威海临港经济技术开发区品香园家庭农场', N'汪疃镇白鹿屯村', N'2015-05-28', N'瓜果、蔬菜的种植与销售', N'50', N'50', N'刘慧', N'13963160296', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_jtnc] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (292, 292, N'临港', N'威海临港经济技术开发区锦盛农场', N'黄岚办事处梁家夼村', N'2015-11-02', N'果树种植', N'150', N'50', N'于海涛', N'13361192699', N'', N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[T_jtnc] OFF
/****** Object:  Table [dbo].[T_Job]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_JBTWO]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_JBONE]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_IndicatorsRelations]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_hzs]    Script Date: 09/23/2017 11:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_hzs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xh] [int] NOT NULL,
	[quyu] [varchar](50) NULL,
	[mingcheng] [nvarchar](200) NULL,
	[dizhi] [nvarchar](500) NULL,
	[zhuceshijian] [nvarchar](50) NULL,
	[jingyingfanwei] [nvarchar](500) NULL,
	[chengyuanshu] [nvarchar](50) NULL,
	[nianshouru] [nvarchar](50) NULL,
	[lishizhang] [nvarchar](50) NULL,
	[lianxidianhua] [nvarchar](50) NULL,
	[pinpaiqingkuang] [nvarchar](50) NULL,
	[niandujibie] [nvarchar](500) NULL,
	[zuzhicode] [nvarchar](50) NULL,
	[zuobiaox] [nvarchar](50) NULL,
	[zuobiaoy] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_hzs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[T_hzs] ON
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (1, 1, N'文登', N'文登市佛鼎山果品专业合作社', N'文登营镇西字城村', N'2008-01-28', N'收购、销售生产的果品', N'107', N'200', N'吕书芬', N'8681378', N'绿色', N'2013市级', N'', N'122.240729', N'37.28118')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (2, 2, N'文登', N'文登市远峰果蔬专业合作社', N'大水泊镇迟家河村村西', N'2008-03-07', N'供应化肥、农药；收购水果、蔬菜、苗木、粮食作物', N'259', N'210', N'王建江', N'13306314671', N'无公害', N'2013市级', N'', N'122.265493', N'37.171062')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (3, 3, N'文登', N'威海紫金山果蔬种植专业合作社', N'宋村镇渠格村', N'2008-06-19', N'的水果、蔬菜产供销一体化', N'105', N'220', N'刘新花', N'13506306883', N'', N'', N'', N'122.054319', N'37.137419')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (4, 4, N'文登', N'文登市汇通果品专业合作社', N'环山办米山路庆丰街4-2号', N'2008-08-03', N'水果产供销一体化', N'262', N'3000', N'张斌', N'8251961', N'', N'2011国家级2012省级、2012市级', N'', N'122.049535', N'37.19544')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (5, 5, N'文登', N'威海市文登区和力奶业专业合作社', N'秀山西路9-1号', N'2008-08-27', N'为养殖奶牛生产的牛奶提供销售。', N'105', N'320', N'宫照欣', N'8875666', N'', N'2014省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (6, 6, N'文登', N'威海市文登区东方果品专业合作社', N'大水泊镇口子正中路34号', N'2008-12-18', N'果品产供销一体化', N'103', N'210', N'荣风虎', N'13573720099', N'无公害', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (7, 7, N'文登', N'文登市华国果蔬专业合作社', N'大水泊镇乐园村', N'2008-12-24', N'水果产供销一体化', N'108', N'210', N'于华国', N'8641283', N'', N'', N'', N'122.255131', N'37.171952')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (8, 8, N'文登', N'文登市顺兴珍皮动物养殖专业合作社', N'侯家镇侯家村', N'2009-04-16', N'采购供应饲养饲料，收购、销售生产的貂皮。', N'109', N'360', N'葛青海', N'8251691', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (9, 9, N'文登', N'文登市农得果品专业合作社', N'米山路庆丰街4-2号', N'2009-05-04', N'为生产的果品提供储藏、包装服务；收购、销售生产的果品。', N'315', N'900', N'李焕彬', N'0631-8251961', N'', N'2016国家、2015省级、2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (10, 10, N'文登', N'威海市厚德大樱桃专业合作社', N'大水泊镇后土埠岭村', N'2009-07-03', N'为种植的大樱桃提供销售、贮藏、包装服务', N'115', N'350', N'于子军', N'18663138477', N'有机', N'2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (11, 11, N'文登', N'威海市文登区岭东果蔬种植专业合作社', N'宋村镇青岭村', N'2009-07-16', N'为种植的果品、蔬菜提供贮藏、进出口销售服务', N'100', N'220', N'孙富强', N'13706490846', N'绿色', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (12, 12, N'文登', N'文登市佳园蛋鸡养殖专业合作社', N'泽头镇西程格村', N'2009-08-11', N'为统一采购鸡饲料，为养殖的蛋鸡提供销售、贮藏、包装服务', N'101', N'230', N'丛法滋', N'8861888', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (13, 13, N'文登', N'文登市柘阳果品专业合作社', N'侯家镇上郭家村', N'2009-08-21', N'提供销售、储藏、包装、病虫害专业化防治服务。', N'276', N'580', N'初钊云', N'8727385', N'绿色', N'2016省级、2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (14, 14, N'文登', N'文登市环美特色苗木专业合作社', N'米山镇新福庄村', N'2009-08-27', N'提供销售、运输、贮藏服务，引进相关新技术、新品种。', N'164', N'350', N'王传泽', N'13863085501', N'', N'2013市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (15, 15, N'文登', N'威海市文登区康之源花生专业合作社', N'侯家镇北廒村', N'2009-11-27', N'收购花生及其他农副产品。', N'355', N'360', N'于学波', N'8723377', N'', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (16, 16, N'文登', N'威海市鼎欣果蔬专业合作社', N'大水泊镇屯杨家村', N'2009-12-18', N'收购种植的果品、蔬菜；培育、推广苗木；为种植的果品、蔬菜及苗木提供销售、贮藏、包装服务。', N'104', N'1390', N'刘新良', N'8649888', N'绿色', N'2014省级、2012年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (17, 17, N'文登', N'文登市绿洲蔬菜专业合作社', N'高村镇沙柳村', N'2010-01-08', N'收购种植的蔬菜，为种植的蔬菜提供销售、贮藏服务。', N'105', N'2430', N'时述忠', N'13306307005', N'绿色', N'2016国家、2014省级、2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (18, 18, N'文登', N'文登市和丰果蔬专业合作社', N'泽头镇峰山村157号', N'2010-04-30', N'水果产供销一体化', N'313', N'3620', N'谭新华', N'13562122497', N'', N'2014国家、2014省级、2013市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (19, 19, N'文登', N'文登市汇民蔬菜水果专业合作社', N'金山路1号', N'2010-05-20', N'为种植的蔬菜、水果提供销售。', N'122', N'350', N'刘玉贤', N'8252378', N'', N'2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (20, 20, N'文登', N'文登市建茂果蔬专业合作社', N'高村镇沙柳村', N'2010-05-27', N'水果产供销一体化', N'108', N'230', N'王振建', N'13081491188', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (21, 21, N'文登', N'文登市鲁波养殖专业合作社', N'侯家镇东廒村', N'2010-07-28', N'为养殖的貂、貉子、狐狸提供销售服务。', N'191', N'390', N'刘新丰', N'13863042678', N'', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (22, 22, N'文登', N'文登市顺通养貂专业合作社', N'泽库镇泽库村', N'2010-09-21', N'为养殖的貂、狐狸、貉子提供销售服务，统一收购貂皮。', N'212', N'460', N'邢秀锋', N'13793382866', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (23, 23, N'文登', N'威海市文登区鑫福果蔬种植专业合作社', N'泽头镇唐疃村278号', N'2010-09-25', N'为种植的粮食、果蔬提供销售、贮藏服务。', N'315', N'650', N'蔡学刚', N'13916311933', N'', N'2015省级、2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (24, 24, N'文登', N'文登佳友果蔬专业合作社', N'葛家镇赤金路11-1号', N'2010-09-29', N'为种植的果蔬提供销售、贮藏服务。', N'100', N'700', N'刘绪慧', N'8881878', N'', N'2015省级、2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (25, 25, N'文登', N'文登社苑西洋参专业合作社', N'高村镇高村', N'2010-10-21', N'为种植的西洋参提供销售、储藏、包装等服务。', N'111', N'420', N'时吉跃', N'18660388353', N'', N'2014省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (26, 26, N'文登', N'文登市仙岛苹果专业合作社', N'葛家镇生格庄村', N'2010-11-08', N'水果产供销一体化', N'135', N'200', N'孙秀强', N'8883999', N'', N'2013市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (27, 27, N'文登', N'文登市昊丰农业田间管理专业合作社', N'界石镇大界石村', N'2011-02-22', N'为进行农田耕种及农作物的收割、病虫害的统治统防。', N'104', N'210', N'王守波', N'13183309678', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (28, 28, N'文登', N'文登市利民农业田间管理农业合作社', N'小观镇紫草泊村村委', N'2011-03-09', N'为进行农田耕种及农作物的收割、病虫害的统治统防服务。', N'205', N'230', N'宋文国', N'631114', N'无公害', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (29, 29, N'文登', N'文登市龙惠蔬菜专业合作社', N'宋村镇驻地', N'2011-03-23', N'为种植的蔬菜提供销售、贮藏服务。', N'161', N'1350', N'王波', N'8907111', N'', N'2011国家级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (30, 30, N'文登', N'文登市金满仓玉米专业合作社', N'文登营镇西字城村', N'2011-06-14', N'为种植的玉米提供收割、销售等服务。', N'126', N'230', N'徐浩', N'13287815611', N'', N'2014市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (31, 31, N'文登', N'文登市耕耘农机专业合作社', N'文登营镇后长湾村', N'2011-06-14', N'为种植粮食提供收割、耕种等服务。
', N'111', N'220', N'王培杰', N'18663153879', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (32, 32, N'文登', N'文登市杜梨花庄农产品专业合作社', N'文登营镇西杜里村', N'2011-09-20', N'为种植的果蔬、花生、农副产品提供销售、储藏、包装服务', N'160', N'240', N'刘承强', N'13371177711', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (33, 33, N'文登', N'文登市永红果品专业合作社', N'泽头镇唐疃村', N'2011-10-08', N'水果产供销一体化', N'145', N'220', N'邢建立', N'13793380876', N'绿色', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (34, 34, N'文登', N'文登市志运果蔬专业合作社', N'小观镇永安街39号', N'2011-10-24', N'水果产供销一体化', N'146', N'210', N'孙志运', N'13863063589', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (35, 35, N'文登', N'文登市昊廒粮油专业合作社', N'侯家镇南廒村', N'2011-10-26', N'花生产供销一体化', N'101', N'210', N'房元生', N'3582590', N'无公害', N'2013市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (36, 36, N'文登', N'文登市安丰养貂专业合作社', N'侯家镇高岛盐场', N'2011-12-01', N'为养殖的貂、狐狸、貉子提供销售服务，统一收购貂皮；引进相关新技术、新品种，。', N'122', N'360', N'周新毅', N'18769113806', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (37, 37, N'文登', N'威海市文登区米山镇山后种植专业合作社', N'米山镇后山后村', N'2011-12-14', N'为统一采购化肥，新品种。', N'548', N'590', N'丛清日', N'13061194796', N'', N'2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (38, 38, N'文登', N'文登市永健中药材专业合作社', N'大水泊镇河东乔家村', N'2011-12-16', N'收购种植的中药材。', N'114', N'230', N'王方凯', N'13533399979', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (39, 39, N'文登', N'文登市兴鞠粮油专业合作社', N'界石镇鞠北庄村', N'2012-04-11', N'为种植的小麦、玉米、花生提供销售服务。', N'106', N'220', N'张芹华', N'8531228', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (40, 40, N'文登', N'文登市安丰桑枣专业合作社', N'文山路98号', N'2012-05-23', N'收购种植的桑枣、桑叶。', N'340', N'620', N'王英进', N'8252259', N'', N'2015省级、2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (41, 41, N'文登', N'文登市航天丹参种植专业合作社', N'高村镇沙柳村', N'2012-06-11', N'收购种植的丹参；为种植的丹参提供销售、贮藏、包装服务。', N'171', N'350', N'牛小丽', N'13863124987', N'', N'2014市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (42, 42, N'文登', N'文登市圣贤苹果专业合作社', N'界石镇辛上庄村', N'2012-07-12', N'为种植的苹果提供销售、贮藏、包装服务。', N'228', N'230', N'李焕彬', N'15266159699', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (43, 43, N'文登', N'威海市文登区瑞祥果蔬种植专业合作社', N'米山镇横口村', N'2012-07-27', N'为种植的水果、蔬菜提供收购、贮藏服务、', N'117', N'980', N'刘红英', N'13563143099', N'', N'2015省级、2013年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (44, 44, N'文登', N'文登市华兴种植专业合作社', N'米山镇长耩村', N'2012-09-05', N'为统一采购化肥；收购种植的花生、玉米。', N'139', N'220', N'胡玲', N'13963148301', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (45, 45, N'文登', N'文登市文西农作物种植专业合作社', N'米山镇西古场村', N'2012-11-29', N'为统一采购供应化肥；为种植的花生、玉米、苹果、丹参、白芍、牡丹、小麦提供收购、储藏服务。', N'160', N'209', N'贾春胜', N'13792743622', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (46, 46, N'文登', N'文登市青木苗木专业合作社', N'泽头镇峰山村', N'2013-01-18', N'为苗木、农作物提供种植、销售服务；提供农业生产资料的购销服务；土地改造、治理。', N'211', N'310', N'林治凤', N'8860918', N'', N'2014市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (47, 47, N'文登', N'文登市鑫迪小麦专业合作社', N'泽头镇峰山村', N'2013-01-18', N'为种植的小麦提供销售、储藏服务。', N'304', N'360', N'李惠杰', N'8860918', N'无公害', N'2016省级、2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (48, 48, N'文登', N'文登市青山果业种植专业合作社', N'高村镇望海初家村村委大院', N'2013-01-24', N'为种植的水果提供销售、贮藏、包装服务。', N'166', N'221', N'田世新', N'15065178966', N'绿色', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (49, 49, N'文登', N'文登市绿宝丰种植专业合作社', N'米山镇横口村', N'2013-02-27', N'为统一采购供应化肥农药，收购种植的粮食作物。', N'146', N'201', N'时述芹', N'13792792755', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (50, 50, N'文登', N'文登市鑫帮粮油专业合作社', N'界石镇张格庄村', N'2013-03-18', N'为种植的小麦、玉米、花生提供销售服务。', N'109', N'210', N'李国利', N'15318277889', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (51, 51, N'文登', N'文登市兴文皮草专业合作社', N'通和路甲8号', N'2013-04-03', N'为收集、发布皮草产业相关信息以及产品销售。', N'387', N'3240', N'周秀军', N'15726318193', N'', N'2016省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (52, 52, N'文登', N'文登市威八戒养猪专业合作社', N'香山南路甲24-1号', N'2013-04-12', N'收购、销售养殖的生猪，统一采购饲料、兽药、疫苗，养猪设备。', N'286', N'3160', N'宫在虎', N'15564585999', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (53, 53, N'文登', N'文登市聚民丰果蔬种植专业合作社', N'高村镇兴高路67号', N'2013-04-23', N'为种植的苹果、蔬菜提供销售服务；采购所需要的生产资料。', N'111', N'310', N'于明卫', N'8762225', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (54, 54, N'文登', N'文登市黎明粮油专业合作社', N'高村镇深圳路23-3号', N'2013-04-23', N'为种植的小麦、花生、玉米提供销售服务；采购所需要的生产资料。', N'158', N'320', N'柯本洲', N'13636315599', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (55, 55, N'文登', N'文登市山海茶树种植专业合作社', N'高村镇沙柳村村北', N'2013-04-23', N'收购种植的茶叶；为种植的茶叶提供销售、贮藏、包装服务。', N'129', N'420', N'时述忠', N'13306307005', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (56, 56, N'文登', N'威海市文登区裕景天果蔬专业合作社', N'葛家镇西谭家口村', N'2013-04-25', N'为种植的果蔬提供购销、初加工、贮藏、包装、采摘服务；为养殖的生猪、家禽、禽蛋提供销售服务。', N'249', N'2140', N'谭晓林', N'13316304589', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (57, 57, N'文登', N'文登市西山果树苗木种植专业合作社', N'环山办孙家西山村', N'2013-05-13', N'为种植的苗木、果树、花卉提供销售服务。', N'108', N'230', N'孙佑序', N'13563181668', N'', N'2013市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (58, 58, N'文登', N'文登市文智西洋参专业合作社', N'大水泊镇口子村供销社院内', N'2013-06-05', N'收购种植的西洋参；为提供销售、初加工、贮藏、包装服务。', N'201', N'260', N'周永建', N'13396314068', N'', N'2015省级、2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (59, 59, N'文登', N'文登市德祥粮油专业合作社', N'界石镇南截山村村西', N'2013-08-26', N'为种植的小麦、玉米、花生提供销售、贮藏服务；引进相关的新品种、新技术。', N'113', N'210', N'于傲德', N'13562116498', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (60, 60, N'文登', N'文登市万家口昊龙地瓜专业合作社', N'小观镇万家口村65号', N'2013-10-08', N'收购种植的地瓜，为种植的地瓜提供销售、贮藏服务。', N'132', N'220', N'于合进', N'8854267', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (61, 61, N'文登', N'文登市丰诺农田管理专业合作社', N'界石镇交通路59-1号', N'2013-10-08', N'为种植的小麦、玉米、花生提供销售、贮藏服务。
', N'105', N'300', N'夏金涛', N'13869057889', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (62, 62, N'文登', N'文登市虎山果业种植专业合作社', N'高村镇虎山村', N'2013-10-30', N'水果产供销一体化', N'101', N'350', N'孙显武', N'13406317399', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (63, 63, N'文登', N'文登市寰发毛皮动物养殖专业合作社', N'侯家镇龙山路甲3-1号', N'2013-10-30', N'貂、狐狸、貉子产供销一体化', N'145', N'1360', N'王辉利', N'8729315', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (64, 64, N'文登', N'威海市文登区信诺农田管理专业合作社', N'天福办单山路20-41号', N'2013-11-01', N'为统一开展农田田间管理，低产田改造。', N'104', N'310', N'王永红', N'13869057889', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (65, 65, N'文登', N'文登市春阳种植专业合作社', N'埠口港管委会张家埠村', N'2013-11-07', N'为统一采购供应粮食作物、果蔬、苗木种植农业生产资料；销售生产的粮食、果蔬、苗木。', N'145', N'260', N'张书德', N'13963107214', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (66, 66, N'文登', N'文登市和谐花生专业合作社', N'泽头镇峰山村', N'2013-11-13', N'为种植的花生提供销售、储藏服务。', N'206', N'690', N'于永洋', N'8860918', N'', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (67, 67, N'文登', N'文登市丰盈玉米专业合作社', N'泽头镇峰山村', N'2013-11-13', N'为种植的玉米提供销售、储藏服务。', N'302', N'650', N'谭永长', N'8860918', N'', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (68, 68, N'文登', N'文登市宋村镇周格果蔬种植专业合作社', N'宋村镇周格村', N'2013-12-10', N'为种植的农作物、果蔬、苗木花卉提供销售服务。', N'110', N'420', N'宋协滋', N'13563134269', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (69, 69, N'文登', N'威海市文登区基德农作物种植专业合作社', N'大水泊镇陈驾埠村125号', N'2013-12-23', N'为种植的小麦、玉米、花生、水果提供销售服务。', N'105', N'210', N'王基德', N'13561834662', N'', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (70, 70, N'文登', N'威海市文登区毅腾果蔬专业合作社', N'大水泊镇场南村', N'2014-02-18', N'为种植的蔬果提供销售、储藏服务。', N'110', N'630', N'刘毅', N'18863112399', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (71, 71, N'文登', N'文登市米山镇心连心种植专业合作社', N'米山镇长山村', N'2014-03-07', N'为种植的小麦、玉米、花生、水果提供销售服务。', N'424', N'680', N'李明习', N'13561830100', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (72, 72, N'文登', N'威海市鑫高果蔬专业合作社', N'泽头镇高家庄村', N'2014-04-29', N'为种植的蔬果提供销售、储藏服务。', N'107', N'530', N'林卫兵', N'13573725586', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (73, 73, N'文登', N'威海市富秋果蔬专业合作社', N'泽头镇下泊子村', N'2014-05-08', N'为种植的蔬果提供销售、储藏服务。', N'104', N'360', N'曲路阳', N'15263168839', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (74, 74, N'文登', N'威海市文登区水头农作物种植专业合作社', N'葛家镇池水头村51号', N'2014-05-15', N'为种植的小麦、玉米、花生、水果提供销售服务。', N'100', N'320', N'田竹贵', N'13572107369', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (75, 75, N'文登', N'威海市圣木果蔬专业合作社', N'葛家镇西于村', N'2014-05-26', N'为种植的蔬果提供销售、储藏服务。', N'278', N'450', N'吕崇军', N'15176150999', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (76, 76, N'文登', N'威海市文登区瑞润祥特种动物养殖农民专业合作社', N'张家产镇张家埠村243号', N'2014-06-16', N'为养殖的貂、狐狸、貉子提供销售、运输服务。', N'142', N'200', N'张爱卿', N'18660326196', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (77, 77, N'文登', N'威海市文登区泽峰农机专业合作社', N'泽头镇峰山村', N'2014-06-30', N'为农业耕种、收割的机械作业。', N'211', N'320', N'谭先珍', N'15662388063', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (78, 78, N'文登', N'威海市广盛西洋参专业合作社', N'大水泊镇河东乔家村', N'2014-07-14', N'统一采购生产资料；收购、销售的产品。', N'107', N'670', N'王方凯', N'13256816166', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (79, 79, N'文登', N'威海市文登区振丰农业田间管理专业合作社', N'米山镇耩北头村村委大院', N'2014-07-17', N'收购的粮食产品，统一采购的农业生产资料。', N'193', N'200', N'王夕生', N'8876937', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (80, 80, N'文登', N'威海汇通农机专业合作社', N'米山镇北郑格村90号', N'2014-07-18', N'开展耕种、收割机械作业服务；采购、供应生产资料。', N'106', N'240', N'曲华', N'6318251961', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (81, 81, N'文登', N'威海市天子岭果蔬专业合作社', N'宋村镇河格庄村', N'2014-07-25', N'为种植的蔬果提供销售、储藏服务。', N'155', N'350', N'丛培杰', N'13906318600', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (82, 82, N'文登', N'威海市文登区东旭西洋参种植专业合作社', N'高村镇兴高路21-2号', N'2014-08-26', N'本社开展西洋参种植，收购、销售本社的西洋参。', N'185', N'630', N'杨树立', N'13156315665', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (83, 83, N'文登', N'威海市文登区龙发水貂养殖专业合作社', N'宋村镇马山路77-13号', N'2014-09-02', N'为养殖的貂提供销售、运输服务。', N'161', N'1350', N'于正进', N'13626309201', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (84, 84, N'文登', N'威海市文登区鑫昌油牡丹种植专业合作社', N'海泰庄园9号楼3单元505室（天福办）', N'2014-09-10', N'收购种植的油牡丹种子，为提供销售、贮藏、包装服务。', N'108', N'620', N'梁茹丹', N'13455834446', N'', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (85, 85, N'文登', N'威海市看牛山林木专业合作社', N'宋村镇河格庄村', N'2014-09-18', N'收购种植的林木；为提供销售、贮藏服务。', N'102', N'200', N'丛斌', N'13863053856', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (86, 86, N'文登', N'威海市文登区鑫川牡丹种植专业合作社', N'环山办麦疃后村', N'2014-09-29', N'收购种植的牡丹种子，为提供销售、贮藏、包装服务。', N'178', N'720', N'王传泽', N'13562186825', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (87, 87, N'文登', N'威海安为先果业专业合作社', N'米山镇北郑格村90号', N'2014-12-09', N'收购种植的果树苗木、果品，为种植的果品提供储藏。', N'109', N'1200', N'宫照月', N'13963106913', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (88, 88, N'文登', N'威海市东崔果品专业合作社', N'葛家镇东崔家口村', N'2015-04-07', N'为种植的水果提供销售、包装服务。', N'318', N'820', N'崔建志', N'13356302869', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (89, 89, N'文登', N'威海市百益粮油专业合作社', N'葛家镇于家埠村', N'2015-04-15', N'为种植的小麦、玉米、花生、蔬菜提供销售服务。', N'318', N'300', N'崔建志', N'13356302869', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (90, 90, N'文登', N'威海市为众果品专业合作社', N'葛家镇东孙疃村', N'2015-04-16', N'为种植的水果提供销售、包装服务.', N'125', N'360', N'王建强', N'13561841543', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (91, 91, N'文登', N'威海出马山生态农业专业合作社', N'文登营镇侯家庵村104号', N'2015-04-21', N'采购、供应生产资料。', N'109', N'240', N'时永东', N'13406498959', N'', N'2016省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (92, 92, N'文登', N'威海新云农作物种植专业合作社', N'泽头镇西程格村', N'2015-06-29', N'采购供应农业生产资料。', N'116', N'230', N'丛培新', N'13863060788', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (93, 93, N'文登', N'威海市文登区众顺水貂养殖专业合作社', N'侯家镇广安路2-3号', N'2015-07-14', N'统一收购养殖的水貂、狐狸、貉子皮，为养殖的水貂、狐狸、貉子统一采购饲料。', N'128', N'1320', N'房裕成', N'13963167729', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (94, 94, N'文登', N'威海市卧牛山果品专业合作社', N'葛家镇大背后村', N'2015-09-09', N'收购种植的果品。', N'104', N'210', N'宋占胜', N'18660388368', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (95, 95, N'文登', N'威海市文登区恒兴大饽饽加工专业合作社', N'侯家镇大百户村', N'2015-10-15', N'为制作的大饽饽、包子、饺子、面条、饼、豆制品、淀粉、蛋糕、果蔬肉蛋制品提供销售、运输、储存服务。', N'100', N'200', N'邱夕芳', N'15506313936', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (96, 96, N'文登', N'威海果宏果蔬专业合作社', N'葛家镇南石山头村', N'2015-10-23', N'统一采购生产资料。', N'130', N'230', N'林均秀', N'13706490360', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (97, 97, N'文登', N'威海市文登区恒舟粮油专业合作社', N'侯家镇大百户村', N'2015-10-27', N'提供粮食作物、油料作物、果品、蔬菜种植生产资料；收购、销售的粮食作物、油料作物、果品、蔬菜产品。', N'111', N'200', N'张云周', N'13863038510', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (98, 98, N'文登', N'威海润农果蔬专业合作社', N'天福办世纪大道88号C区2-13号', N'2015-11-11', N'为种植的果品、蔬菜、苗木提供统一的销售、贮藏、包装服务。', N'102', N'220', N'耿磊', N'13606318488', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (99, 99, N'文登', N'威海铨益果蔬种植专业合作社', N'张家产镇赵家床村村北', N'2015-11-17', N'为生产的水果、中药材、蔬菜提供销售、运输、贮藏、加工服务。', N'113', N'220', N'赛强序', N'18606415396', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (100, 100, N'文登', N'威海金丰公社黄金富士果品专业合作社', N'米山镇北郑格村90-4号', N'2015-11-24', N'采购、供应化肥、农药。', N'211', N'960', N'宫照月', N'8251961', N'', N'', NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (101, 101, N'文登', N'威海金丰公社花生专业合作社', N'米山镇北郑格村90-4号', N'2015-12-23', N'开展花生种植；收购、销售所产的花生。', N'123', N'360', N'刘海冰', N'8251961', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (102, 102, N'文登', N'威海市金沙观光旅游专业合作社', N'高村镇沙柳村村北', N'2015-12-25', N'本社开办西红柿采摘园及提供乡村旅游观光服务。', N'394', N'350', N'时述忠', N'13306307005', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (103, 103, N'文登', N'威海金丰公社西洋参专业合作社', N'米山镇北郑格村90-4号', N'2015-12-28', N'采购、供应化肥、农药；开展西洋参种植。', N'106', N'640', N'于战虎', N'8251961', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (104, 104, N'荣成', N'荣成市北和春茶叶专业合作社', N'宁津街道所前王家村', N'2009-05-15', N'茶叶种植、生产、销售', N'100', N'562', N'宁大永', N'7343688', N'有机食品认证', N'2014省级、2012年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (105, 105, N'荣成', N'荣成市华峰果品专业合作社', N'城西街道河西村', N'2008-03-21', N'苹果产供销一体化', N'162', N'967', N'岳建东', N'7602188', N'有机食品认证', N'2014省级、2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (106, 106, N'荣成', N'荣成市健生果蔬种植专业合作社', N'崖西镇小蒿泊村', N'2013-12-30', N'果蔬产供销一体化', N'100', N'60', N'孙佳丽', N'15506316619', N'有机食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (107, 107, N'荣成', N'荣成市蓝色海洋海参专业合作社', N'宁津富甲山庄', N'2010-09-03', N'海参产供销一体化', N'101', N'10000', N'张伟', N'15606303999', N'有机食品认证', N'2015年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (108, 108, N'荣成', N'荣成市华绿茶叶专业合作社', N'王连街道办事处大汛姜家村', N'2007-12-25', N'茶叶产供销一体化', N'100', N'200', N'张华仁', N'13863091685', N'有机食品认证', N'2012年县级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (109, 109, N'荣成', N'荣成市蓝晶蓝莓专业合作社', N'埠柳镇汉章泊村', N'2011-05-26', N'蓝莓产供销一体化', N'100', N'180', N'宁同亭', N'13220900708', N'有机食品认证', N'2017年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (110, 110, N'荣成', N'荣成市虎山农业种植专业合作社', N'虎山镇庵里村', N'2007-10-30', N'农业产供销一体化', N'3102', N'630', N'连建祝', N'13792746233', N'绿色食品认证', N'2014年国家级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (111, 111, N'荣成', N'荣成市朝阳港无花果专业合作社', N'港西镇龙家村425号', N'2011-05-26', N'无花果产供销一体化', N'180', N'980', N'龙连礼', N'7861164', N'绿色食品认证', N'2015年县级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (112, 112, N'荣成', N'荣成市鲍村三优果品专业合作社', N'滕家镇鲍村', N'2007-10-17', N'苹果产供销一体化', N'100', N'854', N'王正强', N'7681567', N'绿色食品认证', N'2014省级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (113, 113, N'荣成', N'荣成市沐昱果蔬种植专业合作社', N'滕家镇三章村', N'2011-10-09', N'果蔬产供销一体化', N'96', N'1236', N'宁同庆', N'7689628', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (114, 114, N'荣成', N'荣成市金子山果品专业合作社', N'滕家镇北庄村', N'2009-02-20', N'苹果产供销一体化', N'68', N'863', N'王建明', N'13806302122', N'绿色食品认证', N'2012年县级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (115, 115, N'荣成', N'荣成市健龙西洋参种植专业合作社', N'大疃镇大疃村', N'2011-01-18', N'西洋参产供销一体化', N'98', N'2560', N'周建龙', N'13963101548', N'绿色食品认证', N'2012年县级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (116, 116, N'荣成', N'荣成市恒泰丰无花果专业合作社', N'港西镇马格村', N'2013-10-23', N'花生产供销一体化', N'78', N'1836', N'李廷强', N'13863000832', N'绿色食品认证', N'2012年县级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (117, 117, N'荣成', N'荣成市明熠鲜食葡萄专业合作社', N'崖西镇北崖西村', N'2013-02-06', N'葡萄产供销一体化', N'56', N'900', N'潘吉涛', N'13361183839', N'绿色食品认证', N'2015年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (118, 118, N'荣成', N'荣成市汇丰果品专业合作社', N'崖西镇西藏村', N'2009-03-04', N'果品产供销一体化', N'102', N'812', N'褚超', N'18863135899', N'绿色食品认证', N'2015年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (119, 119, N'荣成', N'荣成市恒源苹果种植专业合作社', N'荫子镇耩后张家村', N'2014-06-11', N'苹果产供销一体化', N'108', N'562', N'王茂林', N'15163173556', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (120, 120, N'荣成', N'荣成市先峰苹果种植专业合作社', N'上庄镇院前村', N'2014-03-25', N'苹果产供销一体化', N'67', N'679', N'伯先锋', N'13963161662', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (121, 121, N'荣成', N'荣成市荣兴农业种植专业合作社', N'上庄镇西旗杆石村', N'2007-12-17', N'西洋参产供销一体化', N'56', N'982', N'王永君', N'7411136', N'绿色食品认证', N'2012年县级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (122, 122, N'荣成', N'荣成市宏信果品专业合作社', N'荫子镇头甲村', N'2014-03-11', N'果品产供销一体化', N'56', N'2000', N'彭云山', N'13606316759', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (123, 123, N'荣成', N'荣成市滕大果品专业合作社', N'俚岛镇前神堂口村', N'2008-08-12', N'果品产供销一体化', N'76', N'300', N'高兆亭', N'7680622', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (124, 124, N'荣成', N'荣成市晓世圣果无花果专业合作社', N'成山镇岳家村', N'2012-04-20', N'无花果产供销一体化', N'91', N'2189', N'王晓峰', N'13884793866', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (125, 125, N'荣成', N'荣成市金兴苹果专业合作社', N'上庄镇邢格庄村', N'2009-10-10', N'果品产供销一体化', N'96', N'1263', N'宋保青', N'7411703', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (126, 126, N'荣成', N'荣成市悦多果品种植专业合作社', N'夏庄镇甲夼马家村', N'2011-12-05', N'果品产供销一体化', N'126', N'2569', N'姜丽芹', N'7588186', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (127, 127, N'荣成', N'荣成市龙庙山小麦种植专业合作社', N'虎山镇庵里村', N'2012-12-11', N'小麦产供销一体化', N'108', N'590', N'连洁', N'13386313126', N'无公害食品认证', N'2016年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (128, 128, N'荣成', N'荣成市青阳果蔬休闲采摘专业合作社', N'王连街道北桥头村', N'2013-06-25', N'果蔬产供销一体化', N'36', N'201', N'王信波', N'13806312624', N'有机食品认证', N'2014年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (129, 129, N'荣成', N'荣成市汇嘉园果品专业合作社', N'邹家小区9号楼门市9号', N'2013-06-08', N'果品产供销一体化', N'108', N'328', N'宋莲英', N'7588180', N'有机食品认证', N'2016年省级、2015年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (130, 130, N'荣成', N'荣成市双和无花果专业合作社', N'埠柳镇蓦驾山村', N'2009-05-26', N'无花果产供销一体化', N'82', N'1800', N'涂涛', N'8288882', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (131, 131, N'荣成', N'荣成市惠民花生种植专业合作社', N'夏庄镇驻地', N'2009-03-23', N'花生产供销一体化', N'67', N'230', N'黄建', N'13573706077', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (132, 132, N'荣成', N'荣成市荫子宏泰花生专业合作社', N'荫子镇姜家泊村', N'2008-09-18', N'花生产供销一体化', N'56', N'252', N'刘永', N'7623658', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (133, 133, N'荣成', N'荣成市国钊板栗种植专业合作社', N'夏庄镇北山冷家村', N'2009-06-03', N'板栗产供销一体化', N'79', N'600', N'冷国钊', N'7742006', N'绿色食品认证', N'2013年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (134, 134, N'荣成', N'荣成市浩润茶叶专业合作社', N'成山镇天鹅湖中路', N'2009-03-23', N'茶叶产供销一体化', N'62', N'293', N'咸延国', N'13963182799', N'绿色食品认证', N'2012年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (135, 135, N'荣成', N'荣成市彤林果品专业合作社', N'城西街道河西村', N'2012-08-29', N'果品产供销一体化', N'107', N'1269', N'姚丽红', N'7602188', N'绿色食品认证', N'2016年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (136, 136, N'荣成', N'荣成市亿路莹果蔬种植专业合作社', N'俚岛镇小疃林家村', N'2015-01-07', N'果蔬产供销一体化', N'59', N'200', N'王丽荣', N'15550636114', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (137, 137, N'荣成', N'荣成市东滩农机专业合作社', N'滕家镇东滩郭家村', N'2015-09-16', N'农机耕作', N'29', N'261', N'郭华胜', N'15098117211', N'', N'2016年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (138, 138, N'荣成', N'荣成市金地种植专业合作社', N'寻山街道办事处西迎驾山村', N'2014-03-26', N'农业', N'106', N'248', N'许林祖', N'13356813888', N'绿色食品认证', N'2016年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (139, 139, N'荣成', N'荣成市润祥蔬菜种植专业合作社', N'夏庄镇三胪村', N'2008-11-04', N'蔬菜产供销一体化', N'56', N'892', N'刘波', N'13356806557', N'绿色食品认证', N'2012年县级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (140, 140, N'荣成', N'荣成市勇福食用菌专业合作社', N'寻山竹村', N'2009-11-19', N'食用菌产供销一体化', N'32', N'90', N'鲍克勇', N'13326316535', N'绿色食品认证', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (141, 141, N'荣成', N'荣成市学福地瓜专业合作社', N'埠柳镇学福村', N'2008-04-07', N'地瓜产供销一体化', N'109', N'469', N'王少华', N'7891051', N'绿色食品认证', N'2012年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (142, 142, N'荣成', N'荣成市红岭蔬菜种植专业合作社', N'上庄镇院前村', N'2008-12-12', N'蔬菜产供销一体化', N'46', N'357', N'于维阳', N'7410009', N'绿色食品认证', N'2013年县级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (143, 143, N'荣成', N'荣成市下回头果品专业合作社', N'滕家下回头', N'2010-11-30', N'果品产供销一体化', N'60', N'1269', N'张增吉', N'13506308737', N'无公害食品', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (144, 144, N'荣成', N'荣成市友盛果品专业合作社', N'崖西北柳', N'2010-11-30', N'果品产供销一体化', N'71', N'2356', N'赵新礼', N'13013575437', N'无公害食品', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (145, 145, N'荣成', N'荣成市正茂果蔬专业合作社', N'荣成市夏庄镇后寨村', N'2008-07-31', N'果蔬产供销一体化', N'158', N'159', N'乔振宇', N'15063159988', N'无公害食品', N'2015年省级、2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (146, 146, N'荣成', N'荣成市健绿食用菌专业合作社', N'荣成市上庄镇小龙庄村', N'2007-11-05', N'食用菌产供销一体化', N'59', N'80', N'邹积峰', N'7411898', N'无公害食品', N'2015年省级、2013年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (147, 147, N'荣成', N'荣成市惠农蔬菜种植专业合作社', N'荣成市崂山街道办事处古塔村', N'2009-02-13', N'蔬菜产供销一体化', N'149', N'218', N'于文礼', N'7695009', N'无公害食品', N'2015年省级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (148, 148, N'荣成', N'荣成市大田牧歌果蔬专业合作社', N'荣成市大疃镇双石于家村', N'2013-10-17', N'果蔬产供销一体化', N'168', N'569', N'孙庆武', N'18660329517', N'无公害食品', N'2014年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (149, 149, N'荣成', N'荣成市嘉源苹果种植专业合作社', N'荣成市夏庄镇大胪村', N'2012-09-07', N'苹果产供销一体化', N'89', N'436', N'鲁世良', N'13706313661', N'无公害食品', N'2016年市级示范社', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (150, 150, N'乳山', N'乳山市国安花生专业合作社', N'徐家镇驻地', N'2010-05-05', N'种植业', N'837', N'200', N'单春玲', N'6781588', N'', N'2013市级、2015省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (151, 151, N'乳山', N'乳山市新自然草莓专业合作社', N'乳山寨镇小管村386号', N'2007-12-14', N'种植业', N'354', N'300', N'邵长新', N'6847242', N'绿色，新自然博士商标，地理标志', N'2012市级、2015省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (152, 152, N'乳山', N'乳山市久大海珍品养殖专业合作社', N'徐家镇徐家村721号', N'2011-07-18', N'种植业', N'312', N'300', N'姜云才', N'13863151788', N'绿色，九大州商标，地理标志', N'2012市级、2014省级、2014国家级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (153, 153, N'乳山', N'乳山市振胜果蔬专业合作社', N'南黄镇湾头村', N'2013-06-06', N'种植业（蔬菜）', N'280', N'200', N'高振胜', N'13034592937', N'南黄湾头商标', N'2015市级、2016省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (154, 154, N'乳山', N'乳山市金华果蔬专业合作社', N'冯家镇唐家店子村', N'2008-08-08', N'种植业（蔬菜）', N'244', N'200', N'唐学华', N'6561216', N'公奎商标', N'2012市级、2012省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (155, 155, N'乳山', N'乳山市人和果蔬专业合作社', N'城区金三角工业园', N'2007-10-26', N'种植业', N'216', N'200', N'姜钦贺', N'6661996', N'无公害', N'2012市级、2012省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (156, 156, N'乳山', N'乳山市小康蔬菜专业合作社', N'乳山口镇崔家村', N'2008-01-15', N'种植业', N'214', N'200', N'黄福聪', N'13606312057', N'绿色，小康商标', N'2012市级、2014省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (157, 157, N'乳山', N'乳山市南黄镇振兴大姜专业合作社', N'南黄镇北塂村', N'2010-11-09', N'种植业', N'209', N'200', N'王树勤', N'6481918', N'', N'2013市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (158, 158, N'乳山', N'正华茶叶专业合作社', N'乳山寨镇赤家口村', N'2010-04-07', N'种植业（蔬菜）', N'207', N'200', N'郑福玉', N'18389144123', N'', N'2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (159, 159, N'乳山', N'乳山市鑫鸿果蔬专业合作社', N'南黄镇朱家屯村', N'2015-12-11', N'种植业', N'203', N'200', N'李卫海', N'13963157719', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (160, 160, N'乳山', N'乳山市士子果蔬专业合作社', N'乳山寨镇驻地', N'2012-02-15', N'畜牧业', N'202', N'200', N'于洋', N'13561815510', N'', N'2014市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (161, 161, N'乳山', N'乳山市秋园蔬菜专业合作社', N'南黄镇院后村', N'2012-02-27', N'林业', N'200', N'200', N'肖爱妮', N'18663171668', N'绿色，秋园商标', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (162, 162, N'乳山', N'乳山市强民果蔬专业合作社', N'夏村镇邵家村', N'2013-06-17', N'种植业', N'184', N'200', N'邵永晶', N'13963171285', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (163, 163, N'乳山', N'乳山市金凤繁养专业合作社', N'乳山寨镇赤家口村416号', N'2012-01-10', N'种植业（蔬菜）', N'175', N'200', N'宋海青', N'13863033057', N'绿色，海福星博士商标', N'2014市级、2015省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (164, 164, N'乳山', N'乳山市在强柞蚕良种繁育专业合作社', N'大孤山镇河东村', N'2011-06-27', N'种植业', N'173', N'300', N'孙在强', N'13963190053', N'', N'2013市级、2014省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (165, 165, N'乳山', N'乳山市宏利来果蔬专业合作社', N'下初镇段家村', N'2009-07-03', N'种植业', N'168', N'300', N'段志宏', N'13561868721', N'', N'2013市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (166, 166, N'乳山', N'乳山市众合蔬菜专业合作社', N'乳山口镇封增山村', N'2009-12-21', N'种植业', N'159', N'200', N'任述茂', N'13863188985', N'', N'2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (167, 167, N'乳山', N'乳山市爱母茶叶专业合作社', N'海阳所镇后山村', N'2009-06-18', N'种植业（蔬菜）', N'159', N'200', N'于江', N'13573716988', N'爱母商标', N'2013市级、2014省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (168, 168, N'乳山', N'乳山市维洲地瓜种植专业合作社', N'乳山寨镇赤家口村', N'2012-01-10', N'种植业', N'158', N'300', N'宋维洲', N'13792776958', N'', N'2013市级、2015省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (169, 169, N'乳山', N'乳山市果丰苹果专业合作社', N'午极镇石字砚村', N'2008-09-25', N'种植业', N'158', N'200', N'孔祥林', N'6508045', N'', N'2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (170, 170, N'乳山', N'乳山市青艺蔬菜农民专业合作社', N'白沙滩镇桃村李家村', N'2011-10-27', N'种植业', N'155', N'300', N'冯波', N'13963120789', N'绿色食品，', N'2013市级、2015省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (171, 171, N'乳山', N'乳山市大乳山富民茶叶专业合作社', N'大孤山镇上夼村', N'2008-10-06', N'种植业', N'153', N'200', N'丁乐赴', N'6715888', N'无公害，极北商标', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (172, 172, N'乳山', N'乳山市吉福利民果蔬专业合作社', N'冯家镇瑞木山村', N'2014-09-12', N'种植业', N'152', N'200', N'于福利', N'15166166795', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (173, 173, N'乳山', N'乳山市青山果品专业合作社', N'崖子镇青山村', N'2008-05-23', N'种植业', N'152', N'410', N'宫家宾', N'13506301161', N'', N'2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (174, 174, N'乳山', N'乳山市兴达樱桃大枣专业合作社', N'诸往镇铁山村', N'2012-03-05', N'种植业（粮食）', N'151', N'200', N'王军', N'6369926', N'兴达山果商标', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (175, 175, N'乳山', N'乳山市绿色阳光果蔬专业合作社', N'南黄镇西浪暖村', N'2012-05-16', N'种植业（蔬菜）', N'150', N'200', N'林强', N'13034569877', N'绿色食品，', N'2015市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (176, 176, N'乳山', N'乳山市华冠特色农作物专业合作社', N'乳山寨镇赤家口村', N'2012-03-20', N'种植业', N'150', N'200', N'宋维涛', N'6687388', N'', N'2014市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (177, 177, N'乳山', N'乳山市永兴农产品农民专业合作社', N'徐家镇徐家村580号', N'2012-03-07', N'种植业', N'150', N'200', N'孙剑锋', N'13506301006', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (178, 178, N'乳山', N'乳山市民富大姜专业合作社', N'白沙滩镇丈八石村', N'2009-03-24', N'种植业', N'139', N'200', N'刘夕祥', N'13306317293', N'', N'2014市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (179, 179, N'乳山', N'乳山市午极镇行行行果蔬农民专业合作社', N'午极镇中庄村', N'2011-09-21', N'种植业（粮食）', N'126', N'200', N'李刚', N'13792761111', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (180, 180, N'乳山', N'乳山市志华果蔬专业合作社', N'夏村镇宋家庄村', N'2015-12-28', N'种植业', N'122', N'200', N'于永明', N'15163186777', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (181, 181, N'乳山', N'乳山市大根果蔬专业合作社', N'育黎镇西纪村村南', N'2007-09-29', N'种植业', N'120', N'100', N'王仁敏', N'6599288', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (182, 182, N'乳山', N'乳山金桥花生专业合作社', N'下初镇巫山村', N'2008-09-09', N'种植业（蔬菜）', N'109', N'200', N'宋修金', N'6446216', N'', N'2014市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (183, 183, N'乳山', N'乳山市马润果蔬种植农民专业合作社', N'育黎镇马庄村', N'2015-02-05', N'种植业', N'109', N'200', N'孙晓波', N'13562196791', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (184, 184, N'乳山', N'乳山市兴盛果蔬专业合作社', N'城区工业园（城区天津路）', N'2008-11-04', N'种植业', N'108', N'200', N'单义辉', N'6860778', N'绿色', N'2012市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (185, 185, N'乳山', N'乳山市大川生姜农民专业合作社', N'夏村镇战家夼村', N'2010-08-31', N'种植业', N'108', N'333', N'孙同波', N'6699760', N'无公害', N'2014市级、2015省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (186, 186, N'乳山', N'乳山市福进葡萄农民专业合作社', N'诸往镇许家村', N'2015-01-09', N'种植业', N'108', N'200', N'许付进', N'13793369717', N'无公害，老少乐商标', N'2017年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (187, 187, N'乳山', N'乳山永鹏牡丹农民专业合作社', N'诸往镇神童庙村', N'2014-06-18', N'种植业', N'106', N'200', N'许永鹏', N'18463010120', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (188, 188, N'乳山', N'乳山市龙润葡萄种植专业合作社', N'诸往镇二龙口村', N'2014-03-05', N'种植业', N'104', N'200', N'刘建波', N'18863133000', N'', N'2016市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (189, 189, N'乳山', N'乳山市仁德克瑞森葡萄专业合作社', N'诸往镇许家村', N'2013-12-05', N'种植业', N'100', N'200', N'隋仁高', N'18669330656', N'', N'', N'', N'', N'')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (190, 190, N'环翠', N'威海望联种禽养殖专业合作社', N'张村镇王家疃村西45-9号', N'2012-09-01', N'为养殖户提供技术咨询，销售家禽', N'100', N'220', N'祝端成', N'18906317623', N'无公害农产品证书', N'2015省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (191, 191, N'环翠', N'威海市隆来果蔬专业合作社', N'温泉镇冶口村', N'2016-09-12', N'苹果等果蔬销售', N'117', N'300', N'丛英滋', N'13869053999', N'绿色、无公害', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (192, 192, N'环翠', N'威海市环翠区威盛大樱桃农民专业合作社', N'羊亭镇北上夼村', N'2008-11-20', N'水果大樱桃', N'103', N'300', N'王东', N'5773078', N'绿色食品注册“威盛”', N'2012年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (193, 193, N'环翠', N'威海市宝丰果蔬专业合作社', N'羊亭镇梅家沟村', N'2013-08-28', N'采摘、果蔬种植、储运', N'133', N'300', N'孙波', N'18663195199', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (194, 194, N'高区', N'威海市伟波果蔬专业合作社', N'初村镇佃里院', N'2015-04-07', N'种植蔬菜、水果、花卉，为成员开展乡村旅游提供果品采摘服务。', N'201', N'211', N'王培波', N'18669342633', N'拥有苹果1个品牌“伟仔”', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (195, 195, N'经区', N'威海经济技术开发区新春果品及水产农民专业合作社', N' 经济技术开发区泊于镇泊于家村', N'2008-12-08', N'草莓、葡萄、无花果、蔬菜', N'102', N'200', N' 王可春', N' 13396301912', N'', N'2012年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (196, 196, N'经区', N'威海市环翠区康嘉园粮油农民专业合作社', N'桥头镇驻地', N'2008-10-29', N'花生、玉米、大豆、杂粮的种植.', N'302', N'900', N'王鹏', N'5526003', N'', N'2012年市级、2011
国家级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (197, 197, N'经区', N'威海市环翠区康嘉园果品农民专业合作社', N'桥头镇孟家庄', N'2009-04-21', N'农产品、水果、蔬菜种植销售。', N'306', N'600', N'王鹏', N'5526003', N'', N'2014年国家级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (198, 198, N'经区', N'威海市环翠区裕丰果品专业合作社', N'环翠区桥头镇方吉南路268号', N'2009-04-07', N'果木、蔬菜、粮油种植；组织采购，供应成员所需生产资料；组织收购，销售社员生产的产品。', N'334', N'500', N'李强', N'5568888', N'绿色，BlueDolphin，2006.05注册', N'2012年国家级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (199, 199, N'经区', N'山东山壮家禽养殖专业合作社', N'环翠区桥头镇西龙山村', N'2009-07-07', N'家禽养殖；组织采购、供应成员所需的生产资料；组织收购、销售社员生产的产品。', N'109', N'500', N'王术状', N'13396313282', N'', N'2012年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (200, 200, N'经区', N'威海经济技术开发区红点花木专业合作社', N'桥头镇桥头村', N'2013-08-12', N'用材林苗、经济苗木、容器育苗、绿化用苗的生产和销售、引进花木、苗木种植技术。', N'100', N'300', N'张建明', N'13306313536', N'', N'2015年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (201, 201, N'经区', N'威海市鹏和果蔬专业合作社', N'桥头镇驻地', N'2014-04-09', N'用材林苗、经济苗木、容器育苗、绿化用苗的生产和销售、引进花木、苗木种植技术；果木、农产品种植。', N'106', N'300', N'刘新和', N'13356802963', N'', N'2016年市级', NULL, NULL, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (202, 202, N'经区', N'威海市华峰三优富士专业合作社', N'环翠区桥头镇南子城村', N'2011-01-12', N'果蔬种植；组织采购、供应成员所需生产资料；组织收购、销售社员生产的产品；销售成员的苗木。', N'354', N'600', N'岳建东', N'13656318599', N'绿色。商标“翠红”，2008.07注册', N'2014年省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (203, 203, N'经区', N'威海市经济技术开发区红苹果果品专业合作社', N'桥头镇桥头村（泰丰果蔬气调库）', N'2008-11-28', N'组织收购、运输、销售成员种植的水果，为成员种植的水果提供贮藏、包装服务。', N'390', N'400', N'王振清', N'13706495810', N'', N'2013年市级
2015年省级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (204, 204, N'经区', N'威海市经济技术开发区兴源果蔬专业合作社', N'桥头镇所前泊村', N'2009-08-04', N'农产品种植；组织采购，供应成员所需生产资料。', N'101', N'400', N'鞠洪勇', N'13869065188', N'', N'2017年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (205, 205, N'经区', N'威海市环翠区双盛果蔬农民专业合作社', N'桥头镇观里东村', N'2009-07-07', N'农产品、果蔬种植；组织采购、供应成员所需的生产资料。', N'100', N'200', N'夏宝江', N'5523205', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (206, 206, N'经区', N' 威海经济技术开发区恒通水产农民专业合作社', N'泊于镇白马北村', N'2007-11-28', N'海产品加工', N'100', N'260', N' 蒲玉林', N'13455841000', N'贝加思品牌', N'2016年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (207, 207, N'临港', N'威海临港区绿旺蔬菜专业合作社', N'汪疃镇耩前庄村89号', N'2013-04-07', N'蔬菜草莓火龙果', N'530', N'500', N'孙波', N'13306312299', N'社员有绿色食品', N'2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (208, 208, N'临港', N'威海市神山葡萄专业合作社', N'苘山镇小黄村', N'2008-03-28', N'葡萄', N'514', N'200', N'曹玉波', N'13863179288', N'社员有绿色食品', N'2016年省级、2012年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (209, 209, N'临港', N'威海临港区汪疃村土地股份专业合作社', N'汪疃镇汪疃村', N'2014-08-27', N'小麦玉米', N'452', N'200', N'姜术樵', N'0631-8561888', N'无公害农产品', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (210, 210, N'临港', N'威海临港区盛苑花卉专业合作社', N'苘山镇苘兴路3-1号', N'2011-01-20', N'薰衣草玫瑰及其产品', N'325', N'600', N'刘维刚', N'8545156', N'社员有绿色食品', N'2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (211, 211, N'临港', N'威海临港区樱聚缘大樱桃专业合作社', N'汪疃镇王家产村东北山', N'2011-02-16', N'大樱桃葡萄', N'306', N'400', N'祝端成', N'13906318527', N'绿色食品（过期）', N'2014年市级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (212, 212, N'临港', N'威海绿诚苗木专业合作社', N'汪疃镇府前街1号', N'2009-08-31', N'苗木', N'300', N'2000', N'丛龙珍', N'8561999', N'', N'2014年国家级', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (213, 213, N'临港', N'威海金井湾果蔬专业合作社', N'汪疃吐羊口103', N'2014-12-26', N'苹果苗木', N'263', N'200', N'周志卫', N'13153576991', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (214, 214, N'临港', N'威海国强果蔬专业合作社', N'汪疃镇三家庄村东', N'2015-01-22', N'苹果', N'154', N'300', N'戚文', N'18663198988', N'', N'2016年市级', N'', N'121.957655', N'37.366499')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (215, 215, N'临港', N'威海开泰苗木专业合作社', N'汪疃镇翠峡口村', N'2014-06-05', N'园林苗木', N'149', N'200', N'王俊博', N'0631-5588577', N'', N'2016年市级', N'', N'121.947697', N'37.314898')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (216, 216, N'临港', N'威海凰玉苹果专业合作社', N'汪疃镇西梁格村村东', N'2016-02-17', N'苹果', N'143', N'200', N'邵金玉', N'13176319076', N'', N'', N'', N'121.954205', N'37.288858')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (217, 217, N'临港', N'威海市仁生果蔬种植专业合作社', N'汪疃镇鞠家庄村', N'2014-06-18', N'苹果', N'111', N'200', N'曲志亮', N'13034599011', N'', N'2017年市级', N'', N'122.019373', N'37.355344')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (218, 218, N'临港', N'威海正气果蔬专业合作社', N'苘山镇北申格村', N'2015-07-07', N'桑葚', N'109', N'200', N'李培浩', N'13475149789', N'', N'', N'', N'122.094267', N'37.296155')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (219, 219, N'临港', N'威海临港区元鹏西瓜专业合作社', N'汪疃镇王家产村东', N'2013-03-04', N'西瓜桑葚', N'106', N'200', N'谷元鹏', N'13906303026', N'', N'2015年市级', N'', N'121.997804', N'37.373721')
INSERT [dbo].[T_hzs] ([id], [xh], [quyu], [mingcheng], [dizhi], [zhuceshijian], [jingyingfanwei], [chengyuanshu], [nianshouru], [lishizhang], [lianxidianhua], [pinpaiqingkuang], [niandujibie], [zuzhicode], [zuobiaox], [zuobiaoy]) VALUES (220, 220, N'临港', N'威海嘉禾养殖专业合作社', N'汪疃镇北英武村', N'2010-01-18', N'蛋鸡', N'106', N'560', N'任吉杰', N'13563123913', N'', N'2015年省级、2014年市级', N'', N'121.956638', N'37.302265')
SET IDENTITY_INSERT [dbo].[T_hzs] OFF
/****** Object:  Table [dbo].[T_FujianBiao]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Fujian]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Dyzt]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[T_Dyzt] ([id], [binid], [dyzt]) VALUES (16, N'55', N'1')
SET IDENTITY_INSERT [dbo].[T_Dyzt] OFF
/****** Object:  Table [dbo].[T_Dysq]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[T_Dysq] ([id], [fid], [dycs], [dysqnr], [dysqsj], [dyzt], [beiyong]) VALUES (19, N'55', N'1', N'第一次打印', N'2017-09-20', N'1', NULL)
SET IDENTITY_INSERT [dbo].[T_Dysq] OFF
/****** Object:  Table [dbo].[T_Dyjl]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Contacts]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidTrans]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidReturnInfo]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidPrintGrounds]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (169, 7, 61, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A7F400A60409 AS DateTime))
INSERT [dbo].[T_BidPrintGrounds] ([Id], [FK_BidId], [PrintNum], [PrintName], [Reason], [PrintDate]) VALUES (170, 55, 1, N'SystemAdmin', N'正常打印鉴证书', CAST(0x0000A7F400A608C8 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_BidPrintGrounds] OFF
/****** Object:  Table [dbo].[T_BidPlacard]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidOneBaojia]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidOne]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidLostScan]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidLost]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidFile]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidContractScan]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidClinchScan]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidChangeScan]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidChange]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidCancellationScan]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidCancellation]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_BidAuction]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Bid]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_AuditOpinion]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_Arbitration]    Script Date: 09/23/2017 11:31:16 ******/
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
/****** Object:  Table [dbo].[T_AdminUser]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (1, N'admin', N'123456', N'SystemAdmin', N'13562138090', N'3701', 1, 6, 1, 1277, 1, N'SystemAdmin', CAST(0x0000A7F500E73233 AS DateTime), CAST(0x0000A7F700BD0CBF AS DateTime))
INSERT [dbo].[T_AdminUser] ([Id], [AdminLogName], [AdminLogPass], [AdminName], [AdminTel], [OrgCode], [AdminTypeId], [JobId], [AdminState], [AdminLogNum], [IsCheck], [Editor], [CreateDate], [EndDate]) VALUES (18, N'xianzhouqu', N'123456', N'11', N'11', N'360201', 1, 7, 1, 0, 0, N'SystemAdmin', CAST(0x0000A6CE00E99709 AS DateTime), CAST(0x0000A6CE00E99709 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_AdminUser] OFF
/****** Object:  Table [dbo].[T_AdminType]    Script Date: 09/23/2017 11:31:16 ******/
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
SET IDENTITY_INSERT [dbo].[T_AdminType] OFF
/****** Object:  Table [dbo].[ZC]    Script Date: 09/23/2017 11:31:16 ******/
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
INSERT [dbo].[ZC] ([id], [str], [str1]) VALUES (4, N'701A30C224C04BD0E3A719BACB65D163EBC5ECC25B52CCC53C0935157FAF08122F2A8857D93042465E8482F31134CE32F9AB05175DC00189', N'')
SET IDENTITY_INSERT [dbo].[ZC] OFF
/****** Object:  View [dbo].[View_notice]    Script Date: 09/23/2017 11:31:17 ******/
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
/****** Object:  View [dbo].[View_guapai]    Script Date: 09/23/2017 11:31:17 ******/
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
/****** Object:  View [dbo].[View_dzjb]    Script Date: 09/23/2017 11:31:17 ******/
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
/****** Object:  View [dbo].[View_Bid]    Script Date: 09/23/2017 11:31:17 ******/
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
/****** Object:  Default [DF_T_WebUserVeri_UserStatus]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_UserStatus]  DEFAULT ((0)) FOR [UserStatus]
GO
/****** Object:  Default [DF_T_WebUserVeri_LoginDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_LoginDate]  DEFAULT (getdate()) FOR [LoginDate]
GO
/****** Object:  Default [DF_T_WebUserVeri_OutDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_OutDate]  DEFAULT (getdate()) FOR [OutDate]
GO
/****** Object:  Default [DF_T_WebUserVeri_Veri]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_Veri]  DEFAULT ((0)) FOR [Veri]
GO
/****** Object:  Default [DF_T_WebUserVeri_VeriStatus]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_VeriStatus]  DEFAULT ((0)) FOR [VeriStatus]
GO
/****** Object:  Default [DF_T_WebUserVeri_AuditType]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_AuditType]  DEFAULT ((0)) FOR [AuditType]
GO
/****** Object:  Default [DF_T_WebUserVeri_VeriApplyDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_VeriApplyDate]  DEFAULT (getdate()) FOR [VeriApplyDate]
GO
/****** Object:  Default [DF_T_WebUserVeri_VeriCheckDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebUserVeri] ADD  CONSTRAINT [DF_T_WebUserVeri_VeriCheckDate]  DEFAULT (getdate()) FOR [VeriCheckDate]
GO
/****** Object:  Default [DF_T_WebIntention_CheckStatus]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebIntention] ADD  CONSTRAINT [DF_T_WebIntention_CheckStatus]  DEFAULT ((0)) FOR [CheckStatus]
GO
/****** Object:  Default [DF_T_WebIntention_ClickNum]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebIntention] ADD  CONSTRAINT [DF_T_WebIntention_ClickNum]  DEFAULT ((0)) FOR [ClickNum]
GO
/****** Object:  Default [DF_T_WebIntention_CheckDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_WebIntention] ADD  CONSTRAINT [DF_T_WebIntention_CheckDate]  DEFAULT (getdate()) FOR [CheckDate]
GO
/****** Object:  Default [DF_T_UploadTypeIndicator_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_UploadTypeIndicator] ADD  CONSTRAINT [DF_T_UploadTypeIndicator_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_TurnOutType_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_TurnOutType] ADD  CONSTRAINT [DF_T_TurnOutType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_TempUser_TempStatus]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_TempUser] ADD  CONSTRAINT [DF_T_TempUser_TempStatus]  DEFAULT ((0)) FOR [TempStatus]
GO
/****** Object:  Default [DF_T_TempUser_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_TempUser] ADD  CONSTRAINT [DF_T_TempUser_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_SysLog_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_SysLog] ADD  CONSTRAINT [DF_T_SysLog_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_SysFun_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_SysFun] ADD  CONSTRAINT [DF_T_SysFun_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_StandardType_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_StandardType] ADD  CONSTRAINT [DF_T_StandardType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_StandardMode_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_StandardMode] ADD  CONSTRAINT [DF_T_StandardMode_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_RolePermissions_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_RolePermissions] ADD  CONSTRAINT [DF_T_RolePermissions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_PropertyType_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_PropertyType] ADD  CONSTRAINT [DF_T_PropertyType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_Placard_ReleaseTime]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Placard] ADD  CONSTRAINT [DF_T_Placard_ReleaseTime]  DEFAULT (getdate()) FOR [ReleaseTime]
GO
/****** Object:  Default [DF_T_Placard_NumClicks]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Placard] ADD  CONSTRAINT [DF_T_Placard_NumClicks]  DEFAULT ((0)) FOR [NumClicks]
GO
/****** Object:  Default [DF_T_Permissions_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Permissions] ADD  CONSTRAINT [DF_T_Permissions_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_Organization_ShengCode]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_ShengCode]  DEFAULT ('') FOR [ShengCode]
GO
/****** Object:  Default [DF_T_Organization_ShiCode]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_ShiCode]  DEFAULT ('') FOR [ShiCode]
GO
/****** Object:  Default [DF_T_Organization_XianCode]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_XianCode]  DEFAULT ('') FOR [XianCode]
GO
/****** Object:  Default [DF_T_Organization_XiangCode]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_XiangCode]  DEFAULT ('') FOR [XiangCode]
GO
/****** Object:  Default [DF_T_Organization_CunCode]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_CunCode]  DEFAULT ('') FOR [CunCode]
GO
/****** Object:  Default [DF_T_Organization_ZunCode]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Organization] ADD  CONSTRAINT [DF_T_Organization_ZunCode]  DEFAULT ('') FOR [ZuCode]
GO
/****** Object:  Default [DF_T_OnlineNumber_OnlineNumber]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_OnlineNumber] ADD  CONSTRAINT [DF_T_OnlineNumber_OnlineNumber]  DEFAULT ((0)) FOR [OnlineNumber]
GO
/****** Object:  Default [DF_T_NewsType_NewsTypeName]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_NewsType] ADD  CONSTRAINT [DF_T_NewsType_NewsTypeName]  DEFAULT ('') FOR [NewsTypeName]
GO
/****** Object:  Default [DF_T_NewsType_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_NewsType] ADD  CONSTRAINT [DF_T_NewsType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_News_NumClicks]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_News] ADD  CONSTRAINT [DF_T_News_NumClicks]  DEFAULT ((0)) FOR [NumClicks]
GO
/****** Object:  Default [DF_T_News_IsCheck]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_News] ADD  CONSTRAINT [DF_T_News_IsCheck]  DEFAULT ((0)) FOR [IsCheck]
GO
/****** Object:  Default [DF_T_News_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_News] ADD  CONSTRAINT [DF_T_News_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_MemberTypeCertification_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_MemberTypeCertification] ADD  CONSTRAINT [DF_T_MemberTypeCertification_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_Links_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Links] ADD  CONSTRAINT [DF_T_Links_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_LiceTranScan_UploadDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_LiceTranScan] ADD  CONSTRAINT [DF_T_LiceTranScan_UploadDate]  DEFAULT (getdate()) FOR [UploadDate]
GO
/****** Object:  Default [DF_T_LiceTranCheck_AuditDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_LiceTranCheck] ADD  CONSTRAINT [DF_T_LiceTranCheck_AuditDate]  DEFAULT (getdate()) FOR [AuditDate]
GO
/****** Object:  Default [DF_T_Job_Editor]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Job] ADD  CONSTRAINT [DF_T_Job_Editor]  DEFAULT ('') FOR [Editor]
GO
/****** Object:  Default [DF_T_Job_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Job] ADD  CONSTRAINT [DF_T_Job_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_IndicatorsRelations_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_IndicatorsRelations] ADD  CONSTRAINT [DF_T_IndicatorsRelations_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_Contacts_Editor]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Contacts] ADD  CONSTRAINT [DF_T_Contacts_Editor]  DEFAULT ('') FOR [Editor]
GO
/****** Object:  Default [DF_T_Contacts_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Contacts] ADD  CONSTRAINT [DF_T_Contacts_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidTrans_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidTrans] ADD  CONSTRAINT [DF_T_BidTrans_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidReturnInfo_ReturnDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidReturnInfo] ADD  CONSTRAINT [DF_T_BidReturnInfo_ReturnDate]  DEFAULT (getdate()) FOR [ReturnDate]
GO
/****** Object:  Default [DF_T_BidPrintGrounds_PrintDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidPrintGrounds] ADD  CONSTRAINT [DF_T_BidPrintGrounds_PrintDate]  DEFAULT (getdate()) FOR [PrintDate]
GO
/****** Object:  Default [DF_T_BidPlacard_ReleaseTime]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidPlacard] ADD  CONSTRAINT [DF_T_BidPlacard_ReleaseTime]  DEFAULT (getdate()) FOR [ReleaseTime]
GO
/****** Object:  Default [DF_T_BidLostScan_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidLostScan] ADD  CONSTRAINT [DF_T_BidLostScan_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidLost_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidLost] ADD  CONSTRAINT [DF_T_BidLost_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidFile_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidFile] ADD  CONSTRAINT [DF_T_BidFile_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidContractScan_UploadDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidContractScan] ADD  CONSTRAINT [DF_T_BidContractScan_UploadDate]  DEFAULT (getdate()) FOR [UploadDate]
GO
/****** Object:  Default [DF_T_BidClinchScan_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidClinchScan] ADD  CONSTRAINT [DF_T_BidClinchScan_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidChangeScan_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidChangeScan] ADD  CONSTRAINT [DF_T_BidChangeScan_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidCancellationScan_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidCancellationScan] ADD  CONSTRAINT [DF_T_BidCancellationScan_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidCancellation_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidCancellation] ADD  CONSTRAINT [DF_T_BidCancellation_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_BidAuction_AuctionDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_BidAuction] ADD  CONSTRAINT [DF_T_BidAuction_AuctionDate]  DEFAULT (getdate()) FOR [AuctionDate]
GO
/****** Object:  Default [DF_T_Bid_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Bid] ADD  CONSTRAINT [DF_T_Bid_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_AuditOpinion_OpinionDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_AuditOpinion] ADD  CONSTRAINT [DF_T_AuditOpinion_OpinionDate]  DEFAULT (getdate()) FOR [OpinionDate]
GO
/****** Object:  Default [DF_T_Arbitration_AcceptDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_Arbitration] ADD  CONSTRAINT [DF_T_Arbitration_AcceptDate]  DEFAULT (getdate()) FOR [AcceptDate]
GO
/****** Object:  Default [DF_T_AdminUser_AdminState]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_AdminUser] ADD  CONSTRAINT [DF_T_AdminUser_AdminState]  DEFAULT ((0)) FOR [AdminState]
GO
/****** Object:  Default [DF_T_AdminUser_AdminLogNum]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_AdminUser] ADD  CONSTRAINT [DF_T_AdminUser_AdminLogNum]  DEFAULT ((0)) FOR [AdminLogNum]
GO
/****** Object:  Default [DF_T_AdminUser_IsCheck]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_AdminUser] ADD  CONSTRAINT [DF_T_AdminUser_IsCheck]  DEFAULT ((0)) FOR [IsCheck]
GO
/****** Object:  Default [DF_T_AdminUser_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_AdminUser] ADD  CONSTRAINT [DF_T_AdminUser_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_T_AdminType_Editor]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_AdminType] ADD  CONSTRAINT [DF_T_AdminType_Editor]  DEFAULT ('') FOR [Editor]
GO
/****** Object:  Default [DF_T_AdminType_CreateDate]    Script Date: 09/23/2017 11:31:16 ******/
ALTER TABLE [dbo].[T_AdminType] ADD  CONSTRAINT [DF_T_AdminType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
