<%@ Page Title="" Language="C#" MasterPageFile="~/TblMasterPage.master" AutoEventWireup="true" CodeFile="FloraBranches.aspx.cs" Inherits="FloraBranches" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            font-size: xx-large;
            font-weight: bold;
            background-color: #FFFFCC;
            padding:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Trust Bank Branches
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
<table style="border: 3px solid silver;border-collapse:collapse" cellpadding="0" width="900px"><tr>
<td style="background-color:Silver;background-image:url('Images/shade5.jpg')">                    
<table><tr><td><asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" CausesValidation="True" onfocus="this.select()" ontextchanged="txtSearch_TextChanged" Width="200px"></asp:TextBox>
<cc1:TextBoxWatermarkExtender ID="txtSearch_TextBoxWatermarkExtender" 
    runat="server" Enabled="True" TargetControlID="txtSearch" 
    WatermarkCssClass="Watermark" WatermarkText="enter information to filter">
</cc1:TextBoxWatermarkExtender>
</td><td><asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" 
            style="font-weight: 700" /></td></tr>
<tr><td></td></tr></table></td></tr>
<tr><td>
    <asp:GridView ID="GridView1" runat="server" 
    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
    BorderColor="#DEDFDE" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" 
    DataSourceID="SqlDataSource1" ForeColor="Black" style="font-size: small" 
        Width="100%" DataKeyNames="Branch Code" >
                            <RowStyle BackColor="#F7F7DE" />
                            <Columns>
                                <asp:BoundField DataField="Branch Code" HeaderText="Branch Code" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" 
            SortExpression="Branch Code" ReadOnly="True" >
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Branch Name" HeaderText="Branch Name" 
                                    HeaderStyle-Wrap="false" ItemStyle-Wrap="false"
            SortExpression="Branch Name" >
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address" 
            SortExpression="Address" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                                <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                <span class="style3"> No March Found </span>
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>" 
    
                            SelectCommand="usp_Flora_BranchList" 
        ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>" 
        SelectCommandType="StoredProcedure">
<SelectParameters>
<asp:ControlParameter ControlID="txtSearch" PropertyName="Text" Name="Filter" ConvertEmptyStringToNull="false" 
        Type="String" />
</SelectParameters>
                        </asp:SqlDataSource>
</td></tr>
<tr><td style="text-align:center;font-size:smaller;padding:10px;font-weight:bolder;background-image:url('Images/shade5.jpg')">
    This Branch List is generated from Flora Database</td></tr>
</table>
<br /><br />
</ContentTemplate>
                </asp:UpdatePanel>                        
</asp:Content>

