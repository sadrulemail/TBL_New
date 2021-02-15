<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Vendor.aspx.cs" Inherits="Vendor" %>

<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    Vendor Information
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="Grid"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="Black"
                GridLines="Vertical" OnDataBound="DetailsView1_DataBound">
                <AlternatingRowStyle BackColor="White" />
                <Fields>
                    <asp:BoundField DataField="VendorName" HeaderText="Name" SortExpression="VendorName"
                        ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Large">
                        <ItemStyle Font-Bold="True" Font-Size="Large" />
                    </asp:BoundField>
                    <asp:BoundField DataField="VendorNameDetails" HeaderText="Full Name" ItemStyle-Font-Bold="true"
                        SortExpression="VendorNameDetails">
                        <ItemStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                    <asp:TemplateField HeaderText="Type" SortExpression="VendorType">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceVendorTypes"
                                DataTextField="VendorType" DataValueField="VendorType" SelectedValue='<%# Bind("TYPE") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceVendorTypes" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="SELECT * FROM [v_VendorTypes] ORDER BY [VendorType]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceVendorTypes"
                                DataTextField="VendorType" DataValueField="VendorType" SelectedValue='<%# Bind("TYPE") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceVendorTypes" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="SELECT * FROM [v_VendorTypes] ORDER BY [VendorType]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("VendorType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" ButtonType="Button"
                        ControlStyle-Width="80px" Visible="false">
                        <ControlStyle Width="80px" />
                    </asp:CommandField>
                </Fields>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="SELECT * FROM [v_Vendors] WHERE ([ID] = @ID)" InsertCommand="INSERT INTO Vendors(VendorName, VendorNameDetails, Address, Contact, TYPE, ID) VALUES (@VendorName, @VendorNameDetails, @Address, @Contact, TYPE, @ID)"
                UpdateCommand="UPDATE Vendors SET VendorName = @VendorName, VendorNameDetails = @VendorNameDetails, Address = @Address, Contact = @Contact, TYPE = @TYPE WHERE (ID = @ID)">
                <InsertParameters>
                    <asp:Parameter Name="VendorName" />
                    <asp:Parameter Name="VendorNameDetails" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="Contact" />
                    <asp:Parameter Name="ID" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="VendorName" />
                    <asp:Parameter Name="VendorNameDetails" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="Contact" />
                    <asp:Parameter Name="TYPE" />
                    <asp:Parameter Name="ID" />
                </UpdateParameters>
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
