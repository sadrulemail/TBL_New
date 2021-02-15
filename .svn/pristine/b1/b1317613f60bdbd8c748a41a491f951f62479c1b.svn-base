<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" 
    CodeFile="Status.aspx.cs" Inherits="Status" EnableViewState="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .status-box{
            width:700px;
            background:white;
            text-align:left;
            margin:7px;
            padding:7px;
            border:1px solid #ddd;
            vertical-align:top;
        }
        .status-box:hover{
            background:#f8f8ff;
        }
        .aspNetDisabled {
            visibility:hidden;
        }
        .bold{font-weight:bold}
        .img-profile {
            float:left;
            margin-right:5px;
            width:50px !important;
            height:50px !important;
            border:1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" Runat="Server">
<table>
        <tr>
            <td style="width: 40px">
                <a href='<%= (Request.QueryString["id"] == null ? "Default.aspx" : "Status.aspx") %>' class="button1">
                    <img src="Images/Previous.gif" alt="Back" border="0" /></a>
            </td>
            <td>
                Employee Status
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            
                            <%--<div align="center">
                            <asp:DataPager ID="DataPager2" runat="server" PagedControlID="ListView1" PageSize="100"
                                EnableViewState="true">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ShowNextPageButton="false"
                                        ShowPreviousPageButton="true" ShowFirstPageButton="true" ButtonCssClass="NumericButton" />
                                    <asp:NumericPagerField ButtonType="Link" ButtonCount="30" CurrentPageLabelCssClass="CurrentPageLabel"
                                        NumericButtonCssClass="NumericButton" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="true"
                                        ShowPreviousPageButton="false" ShowFirstPageButton="false" ButtonCssClass="NumericButton" />
                                    <asp:TemplatePagerField>
                                        <PagerTemplate>
                                            <br />
                                            <br />
                                        </PagerTemplate>
                                    </asp:TemplatePagerField>
                                </Fields>
                            </asp:DataPager>
                        </div>--%>
                        <div align="center">
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" ItemPlaceholderID="PlaceHolder1">
                                <ItemTemplate>
                                <div class="status-box">
                                    <div>
                                        <div style="float:right">
                                            <a href='Status.aspx?id=<%# Eval("EMPID") %>' title="Only this employee"><img src="Images/View.png" width="16" height="16" /></a></div>
                                        <a href='Profile.aspx?id=<%# Eval("EmpID")%>' target='_blank' class="ProfilePic">
                                        <img src='EmpImage.aspx?EMPID=<%# Eval("EmpID") %>&W=100&H=100&imgid=<%# Eval("ImageIdentifier") %>' class="img-profile" />
                                            </a>
                                            <div class="bold"><a href='Profile.aspx?id=<%# Eval("EmpID")%>' target='_blank' style="color:Green">
                                                <%# Eval("EmpName")%>
                                            </a></div>
                                            <div style="font-size:85%">
                                                <%# Eval("DesigFullName", "<div>{0}</div>")%>
                                                <%# (Eval("Branch_BranchID").ToString() == "1" ? "<a href='EmpBranch.aspx?branch=1&dept=" + Eval("Department_DeptID").ToString() + "' target='_blank'>" : "")%><%# Eval("Department", "<div>{0}</div>")%></a>
                                                <%# (Eval("Branch_BranchID").ToString() != "1" ? "<a href='EmpBranch.aspx?branch=" + Eval("Branch_BranchID").ToString() + "' target='_blank'>" : "")%><%# Eval("BranchName", "<div>{0}</div>")%></a>
                                            </div>
                                    </div>
                                    <div style="clear:left;height:10px"></div>
                                    <div class="emp-status">
                                        <%# Eval("Status") %>
                                    </div>
                                    <div style="margin-top:5px" title='<%# Eval("PostDT","{0:dddd \ndd MMMM, yyyy \nh:mm:ss tt}") %>'>&nbsp;
                                        <time class='timeago' datetime='<%# Eval("PostDT", "{0:yyyy-MM-dd HH:mm:ss}") %>'></time>
                                    </div>
                                </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <div align="center">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="30"
                                EnableViewState="true">
                                <Fields>
                                    <asp:TemplatePagerField>
                                        <PagerTemplate>
                                            <br />
                                        </PagerTemplate>
                                    </asp:TemplatePagerField>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ShowNextPageButton="false"
                                        ShowPreviousPageButton="true" ShowFirstPageButton="true" ButtonCssClass="NumericButton" />
                                    <asp:NumericPagerField ButtonType="Link" ButtonCount="30" CurrentPageLabelCssClass="CurrentPageLabel"
                                        NumericButtonCssClass="NumericButton" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="true"
                                        ShowPreviousPageButton="false" ShowFirstPageButton="false" ButtonCssClass="NumericButton" />
                                    <asp:TemplatePagerField>
                                        <PagerTemplate>
                                            <br />
                                        </PagerTemplate>
                                    </asp:TemplatePagerField>
                                </Fields>
                            </asp:DataPager>
                        </div>
                        <br />
                        <div align="center">
                            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                        </div>
            <br />
            <asp:Label ID="lblStatus1" runat="server" Text=""></asp:Label>
                
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="s_Emp_Status_Browse" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="id" Name="empid" DefaultValue="*" />
                </SelectParameters>
            </asp:SqlDataSource>
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

