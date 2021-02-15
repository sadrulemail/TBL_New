<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Apps" EnableViewState="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .MenuStyle {
            background-color: #ccebd6;
            padding: 0px 5px 0px 5px;
            border-color: #ccebd6;
            border-style: solid;
            border-width: 1px;
            font-size: 10pt;
            margin: 0;
        }

        .MenuStyleSelected {
            background-color: #ccebd6;
            background-position: center;
            background-image: url( 'Images/tab_back.gif' );
            border-color: #ccebd6;
            padding: 3px 7px 1px 7px;
            border-width: 1px;
            border-style: solid;
            font-size: 10pt;
            font-weight: bolder;
            margin: 0;
        }

        .buttonover {
            background-color: #e8f19f;
            background-image: url( 'Images/tab_back.gif' );
            padding-right: 3px;
            text-align: right;
        }

        .AppRow {
            background-image: url( "Images/Shade3.gif" );
            background-position: bottom;
            background-repeat: repeat-x;
            padding: 5px;
            border: solid 1px Silver;
            width: 33%;
            vertical-align: top;
        }

            .AppRow table td {
                border: none;
            }

        .NoticeRow0 {
            background-image: url( "Images/Shade3.gif" );
            background-position: bottom;
            background-repeat: repeat-x;
            border: solid 1px white;
        }

        .NoticeRow1 {
            background-image: url( "Images/Shade1.gif" );
            background-position: bottom;
            background-repeat: repeat-x;
            border: solid 1px white;
        }

        .ListRow {
            padding: 5px 7px;
            vertical-align: top;
            background: #FFF5D5; /* Old browsers */
            background: -moz-linear-gradient(top, #fff4d0 0%, #fff6d9 15%, #fffae8 30%, #fffefa 72%, #ffffff 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fff4d0), color-stop(15%,#fff6d9), color-stop(30%,#fffae8), color-stop(72%,#fffefa), color-stop(100%,#ffffff)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, #fff4d0 0%,#fff6d9 15%,#fffae8 30%,#fffefa 72%,#ffffff 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, #fff4d0 0%,#fff6d9 15%,#fffae8 30%,#fffefa 72%,#ffffff 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, #fff4d0 0%,#fff6d9 15%,#fffae8 30%,#fffefa 72%,#ffffff 100%); /* IE10+ */
            background: linear-gradient(to bottom, #fff4d0 0%,#fff6d9 15%,#fffae8 30%,#fffefa 72%,#ffffff 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fff4d0', endColorstr='#ffffff',GradientType=0 ); /* IE6-9 */
            display: inline-block;
            width: 300px;
            min-height: 55px;
            border-radius: 8px;
            margin: 3px;
            border: solid 1px Silver;
        }

            .ListRow:hover {
                box-shadow: 0 0 10px silver;
            }

        .DataList {
            border: solid 1px Silver;
        }

            .DataList td {
                border: solid 1px Silver;
            }

        .appdiv {
            padding: 3px 5px 3px 5px;
        }

            .appdiv a {
                font-size: 11pt;
                font-weight: bolder;
                font-family: tahoma,verdana,arial,sans-serif;
                color: Green !important;
            }

        .listdiv {
            background: #ffffff;
            padding: 5px 7px 5px 7px;
            min-height: 50px;
            vertical-align: top;
        }

        .list-title {
            font-size: 11pt;
            font-weight: bolder;
            font-family: tahoma,verdana,arial,sans-serif;
            font-weight: bold;
            margin-bottom: 5px;
        }

            .list-title a {
                color: #008000 !important;
            }
        .sidemenu {
            list-style:none;
            margin-left:-40px;            
        }
            .sidemenu li a {background-color:#eee;color:black;padding:3px 7px;border-radius:0 8px 8px 0;display:flex;margin-bottom:2px}
            .sidemenu li a:hover {background-color:gray;color:white;text-decoration:none}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <%--<asp:Timer ID="Timer1" runat="server" Enabled="true" Interval="60000" OnTick="Timer1_Tick"
                EnableViewState="False">
            </asp:Timer>--%>
            <div class="caution" id="caution" style="display: none;">
                <h2>You need to update this Internet Explorer</h2>
                Please contact with IT Division (<a href="https://intraweb.tblbd.com/Profile.aspx?ID=1580">Tareq</a>,
                <a href="https://intraweb.tblbd.com/Profile.aspx?ID=1594">Razib</a>)
            </div>
            <div class="caution" style="display: none;">
                <a href="http://172.24.1.2/mbank">Merchant Banking</a><br />
                <a href="http://172.22.1.118/exchange">Webmail</a>
            </div>
            <asp:Panel ID="PanelNotice" runat="server">
                <span class="cphTitle">Notice Board </span>
                <asp:HyperLink ID="hypNoticeEdit" Font-Size="X-Small" NavigateUrl="~/Notice.aspx"
                    runat="server">Edit</asp:HyperLink>
                <div class="target-blank">
                    <asp:GridView ID="GridViewNotice" runat="server" BorderColor="#FFA200" CssClass=""
                        BorderStyle="solid" BorderWidth="3px" Width="640px" CellPadding="2" DataSourceID="SqlDataSourceNotice"
                        ShowHeader="False" AutoGenerateColumns="False" DataKeyNames="ID" GridLines="None">
                        <RowStyle ForeColor="#4A3C8C" BackColor="white" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class='<%# Eval("Highlight","NoticeRow{0}") %>'>
                                        <time style="text-align: left; color: #AAAAAA; font-style: italic; font-family: Courier New; font-weight: normal; font-size: 8pt"
                                            class='timeago' datetime='<%# Eval("PublishedDT", "{0:yyyy-MM-dd HH:mm:ss}") %>'>
                                            </time>
                                        <table style="border-collapse: collapse">
                                            <tr>
                                                <td style="border: none" valign="top">
                                                    <%# Eval("Highlight").ToString() == "1" ? "<img src='Images/New.gif' alt='new' width='35' />" : "" %>
                                                </td>
                                                <td style="border: none">
                                                    <div style="font-size: small; padding: 0px 0px 2px 10px; font-family: Verdana; font-weight: normal">
                                                        <%# Eval("Notice") %>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceNotice" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                        SelectCommand="sp_Notice_Board" SelectCommandType="StoredProcedure" OnSelected="SqlDataSourceNotice_Selected"></asp:SqlDataSource>
                </div>
            </asp:Panel>
        </ContentTemplate>
        <%--<Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" />
        </Triggers>--%>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <table><td valign="top">
            <span class="cphTitle">Applications</span>
            <div id="tabs" style="width: 960px;" class="shadow">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceApplicationType">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li style="display: inline"><a href='<%# Eval("ID","#{0}") %>'>
                            <%# Eval("ApplicationType") %></a></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSourceApplicationType"
                    OnItemDataBound="Repeater2_ItemDataBound">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div id='<%# Eval("ID","{0}") %>'>
                            <asp:DataList CssClass="DataList" ID="DataList1" runat="server" DataSourceID="SqlDataSource_Applications0"
                                RepeatColumns="3" GridLines="Both" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <a href='<%# Eval("ApplicationPath") %>'>
                                                    <img src='<%# Eval("Logo") %>' height="30" border="0" />
                                                </a>
                                            </td>
                                            <td>
                                                <div class="appdiv">
                                                    <a href='<%# Eval("ApplicationPath") %>' class="Link">
                                                        <%# Eval("ApplicationName") %></a>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="padding-top: 3px">
                                        <%# Eval("AppDescription")%>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="AppRow" />
                            </asp:DataList>
                        </div>
                        <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT ID, ApplicationName, ApplicationPath, AppDescription, Logo FROM Applications with (nolock) WHERE (ShowIn = @Type and ShowInMenu = 1) ORDER BY ApplicationName"
                            ID="SqlDataSource_Applications0" EnableCaching="false" CacheDuration="60">
                            <SelectParameters>
                                <asp:Parameter Name="Type" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            </td><td valign="top" style="min-width:170px;padding-left:10px;padding-top:15px">
           
					<ul class="sidemenu">
                        <li>                            
                            <a href="https://intraweb.tblbd.com/Msg"><img src="https://intraweb.tblbd.com/Images/msg.png" style="max-width:18px;max-height:18px" />
                                <span style="padding-left:5px;font-weight:bold;vertical-align:middle;display:table">intra Message</span>
                            </a>
                            <a href="https://intraweb.tblbd.com/Helpdesk"><img src="https://intraweb.tblbd.com/Images/service-cube.png" style="max-width:18px;max-height:18px" />
                                <span style="padding-left:5px;font-weight:bold;vertical-align:middle;display:table">Helpdesk</span>
                            </a>
                        </li>
					    
                    </ul>
		   
		   
		   
                 <span style="font-weight:bold">Other Links:</span>
                <ul class="sidemenu">
                    <li>
                        <a href="Emp_New.aspx">New Employees</a>
                    </li>
					<li>
                        <a href="Status.aspx">Employee Status</a>
                    </li>
                    <li>
                        <a href="LifeEvents.aspx">Life Events</a>
                    </li>
                    <li>
                        <a href="GoodbyeMsg.aspx">Goodbye Messages</a>
                    </li>
                </ul>
				<asp:Panel runat="server" ID="PanelLoggedin" Visible="false">
                        <span style="font-weight: bold">Profile:</span>
                        <ul class="sidemenu">
                            <li>
                                <a href="Profile.aspx">My Profile</a>
                            </li>
                            <li>
                                <a href="LoginLog.aspx">Login Log</a>
                            </li>
                            <li>
                                <a href="PasswordChange.aspx">Password Change</a>
                            </li>
                            <li>
                                <asp:Literal ID="Login1" runat="server"></asp:Literal>
                            </li>
                        </ul>
					</asp:Panel>
            </td></table>
            <br /><br />
            <div class="cphTitle">
                Lists
            </div>
            <div style="">
                <asp:ListView ID="DataList2" runat="server" DataSourceID="SqlDataSourceLists" EnableViewState="false"
                    ItemPlaceholderID="PlaceHolder1">
                    <ItemTemplate>
                        <div class="ListRow">
                            <div class="list-title">
                                <a href='<%# Eval("Url") %>'>
                                    <%# Eval("ListName")%></a>
                            </div>
                            <div>
                                <%# Eval("ListDescription")%>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div style="max-width: 1000px">
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceLists" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                    SelectCommand="SELECT * FROM [List] ORDER BY [OrderCol]" EnableCaching="true"
                    CacheDuration="60"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSourceApplicationType" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                    SelectCommand="SELECT [ID], [ApplicationType] FROM [ApplicationType] with (nolock) WHERE TabVisible = 'Y' ORDER BY [OrderCol]"
                    EnableCaching="true" CacheDuration="60"></asp:SqlDataSource>
            </div>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false" AssociatedUpdatePanelID="UpdatePanel1"
        DisplayAfter="10">
        <ProgressTemplate>
            <div class="TransparentGrayBackground">
            </div>
            <asp:Image ID="Image1" runat="server" alt="" ImageUrl="~/Images/processing.gif" CssClass="LoadingImage"
                Width="214" Height="138" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:AlwaysVisibleControlExtender ID="UpdateProgress1_AlwaysVisibleControlExtender"
        runat="server" Enabled="True" HorizontalSide="Center" TargetControlID="Image1"
        UseAnimation="false" VerticalSide="Middle">
    </asp:AlwaysVisibleControlExtender>
</asp:Content>
