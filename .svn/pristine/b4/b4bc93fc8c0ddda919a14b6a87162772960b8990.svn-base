<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="PostalCode.aspx.cs" Inherits="PostalCode" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .Y
        {
            background-color: #ffff00;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitle" runat="Server">
    <table>
        <tr>
            <td style="width: 40px">
                <a href="Default.aspx">
                    <img src="Images/Previous.gif" alt="Back" border="0" /></a>
            </td>
            <td>
                Postal Codes of Bangladesh
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="Panel1 ui-corner-all">
                <tr>
                    <td>
                        <asp:TextBox ID="txtFilter" runat="server" AutoPostBack="True" CssClass="Watermark"
                            CausesValidation="True" onfocus="this.select()" Width="200px" Watermark="enter information to filter"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" Style="font-weight: 700" />
                    </td>
                </tr>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" Width="700px" DataSourceID="SqlDataSource1"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid"
                BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Both" Style="font-size: small;
                font-family: Arial, Helvetica, sans-serif" AllowPaging="True" AllowSorting="True"
                CssClass="Grid" PagerSettings-Position="TopAndBottom" PageSize="30">
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="20" Position="TopAndBottom" />
                <RowStyle BackColor="#F7F7DE" />
                <Columns>
                    <asp:BoundField DataField="Division" HeaderText="Division" HtmlEncode="false" SortExpression="Division" />
                    <asp:BoundField DataField="District" HeaderText="District" HtmlEncode="false" SortExpression="District" />
                    <asp:BoundField DataField="Thana" HeaderText="Thana" SortExpression="Thana" HtmlEncode="false" />
                    <asp:BoundField DataField="Sub Office" HeaderText="Sub Office" HtmlEncode="false"
                        SortExpression="Sub Office" />
                    <asp:BoundField DataField="Post Code" HeaderText="Post Code" HtmlEncode="false" ItemStyle-HorizontalAlign="Center"
                        SortExpression="Post Code">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                <EmptyDataTemplate>
                    No match found.
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="sp_postalcode" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:ControlParameter ControlID="txtFilter" Name="Filter" PropertyName="Text" Type="String"
                        ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Division" Type="String" ConvertEmptyStringToNull="false" DefaultValue="" />
                    <asp:Parameter Name="District" Type="String" ConvertEmptyStringToNull="false" DefaultValue="" />
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
