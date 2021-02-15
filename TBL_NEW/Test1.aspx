<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Test1.aspx.cs" Inherits="Test1" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    Division:
    <asp:DropDownList ID="dboDivision" runat="server" DataSourceID="SqlDataSourceDivision"
        DataTextField="DIV_NAME" DataValueField="DIV_CODE" AppendDataBoundItems="true">
        <asp:ListItem Value="" Text="Select Division"></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceDivision" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
        SelectCommand="SELECT DIV_CODE, DIV_NAME FROM [dbo].[BD_Division]"></asp:SqlDataSource>
    <br />
    District:
    <asp:DropDownList ID="dboDistrict" runat="server">
    </asp:DropDownList>
    <asp:cascadingdropdown id="CascadingDropDown1" runat="server" targetcontrolid="dboDistrict"
        category="District" prompttext="Select District" servicepath="WebService.asmx" 
        LoadingText="Loading..."
        servicemethod="GetDropDownContents_District" ParentControlID="dboDivision" />
    <br />
    Thana:
    <asp:DropDownList ID="dboThana" runat="server">
    </asp:DropDownList>
    <asp:cascadingdropdown id="CascadingDropDown2" runat="server" targetcontrolid="dboThana"
        category="Thana" prompttext="Select Thana" servicepath="WebService.asmx" 
        LoadingText="Loading..."
        servicemethod="GetDropDownContents_Thana" ParentControlID="dboDistrict" />

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
