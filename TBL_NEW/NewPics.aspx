<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="NewPics.aspx.cs" Inherits="NewPics" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .ProfilePicActive
        {
            border: 2px solid Black !important;
        }
        .ProfilePicOld
        {
            border: 2px solid Silver !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    <table>
        <tr>
            <td style="width: 40px">
                <a href="Default.aspx" class="button1">
                    <img src="Images/Previous.gif" alt="Back" border="0" /></a>
            </td>
            <td>
                New Profile Pictues
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:TabContainer runat="server" ID="TabContainer1" CssClass="" OnActiveTabChanged="TabContainer1_ActiveTabChanged"
                OnDemand="true" AutoPostBack="True">
                <asp:TabPanel runat="server" ID="tab1">
                    <HeaderTemplate>
                        Profile Pictures</HeaderTemplate>
                    <ContentTemplate>
                        <div align="center">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="sp_EmpPic_Browse" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="chkActive" Name="Active" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtEmpID" Name="EmpID" PropertyName="Text" DefaultValue="*" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="chkActive" runat="server" AutoPostBack="true">
                                <asp:ListItem Value="1" Text="Active Images"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Old Images"></asp:ListItem>
                                <asp:ListItem Value="2" Text="All Images"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtEmpID" runat="server" placeholder="emp id" Width="80px" AutoPostBack="true"></asp:TextBox>
                            <br />
                            <br />
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
                        </div>
                        <div align="center">
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" ItemPlaceholderID="PlaceHolder1">
                                <ItemTemplate>
                                    <a target="_blank" href='Profile.aspx?ID=<%# Eval("EmpID") %>' title='EmpID: <%# Eval("EmpID","{0}\n") %>Added on: <%# ToRelativeDate(Eval("InsertDT"))%><%# Eval("InsertDT","\n{0:dddd, dd MMMM yyyy, h:mm:ss tt}\n") %>'>
                                        <img height="110px" src='EmpImage.aspx?EMPID=<%# Eval("EmpID") %>&W=200&imgid=<%# Eval("ImageIdentifier") %>&ID=<%# Eval("ID") %>'
                                            border="1px" width="110px" class='wait <%# Eval("CSS") %>' /></a>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <div align="center">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="100"
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
                            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="tab2">
                    <HeaderTemplate>
                        No Image Employees</HeaderTemplate>
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" CssClass="Grid" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" BackColor="White" PagerSettings-Position="TopAndBottom"
                            PagerSettings-PageButtonCount="30" PagerSettings-Mode="NumericFirstLast" BorderColor="#DEDFDE"
                            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="EMPID" DataSourceID="SqlDataSource2"
                            ForeColor="Black" GridLines="Both">
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <Columns>
                                <asp:TemplateField HeaderText="Emp ID" SortExpression="EMPID">
                                    <ItemTemplate>
                                        <a target="_blank" href='<%# Eval("EMPID","Profile.aspx?ID={0}") %>'>
                                            <%# Eval("EMPID") %></a>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="true" Font-Size="X-Large" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Emp Info" SortExpression="EMP" DataField="EMP" HtmlEncode="false" />
                                <asp:BoundField HeaderText="Service Status" SortExpression="ServiceStatus" DataField="ServiceStatus"
                                    ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <br />
                        <asp:Label ID="lblStatus1" runat="server" Text=""></asp:Label>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="[sp_Emp_No_Image]" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource2_Selected">
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="cmdExport" runat="server" Text="Download as xlsx" OnClick="cmdExport_Click"
                Visible="false" />
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="cmdExport" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false" AssociatedUpdatePanelID="UpdatePanel1"
        DisplayAfter="100">
        <ProgressTemplate>
            <img alt="" src="Images/processing.gif" class="LoadingImage" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:AlwaysVisibleControlExtender ID="UpdateProgress1_AlwaysVisibleControlExtender"
        runat="server" Enabled="True" HorizontalSide="Center" TargetControlID="UpdateProgress1"
        UseAnimation="True" VerticalSide="Middle">
    </asp:AlwaysVisibleControlExtender>
</asp:Content>