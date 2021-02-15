<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" enableviewstate="false"
    CodeFile="EmpBrowse.aspx.cs" Inherits="EmpBrowse" Title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/jquery.multiselect.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.multiselect.filter.css" rel="stylesheet" type="text/css" />
    <script src="script/jquery.multiselect.min.js" type="text/javascript"></script>
    <script src="script/jquery.multiselect.filter.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width: 40px" valign="middle">
                        <a href="Default.aspx" class="button1">
                            <img src="Images/Previous.gif" alt="Back" border="0" width="32" height="32" /></a>
                    </td>
                    <td valign="middle">
                        <asp:Label ID="lblTitle" runat="server" Text="Employee Information" CssClass="cphTitle"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <div>
                <table>
                    <tr>
                        <td>
                            <table class="Panel1 ui-corner-all">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="false" CausesValidation="false"
                                            onfocus="this.select()" CssClass="Watermark" Watermark="enter information to filter"
                                            Width="200px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:ListBox ID="cboBranches" runat="server" AppendDataBoundItems="true" SelectionMode="Multiple"
                                            DataSourceID="SqlDataSourceBranch" DataTextField="BranchName" DataValueField="BranchID"
                                            Width="320px" Height="28px" CssClass="Branches">
                                            <asp:ListItem Text="Head Office" Value="1"></asp:ListItem>
                                        </asp:ListBox>
                                        <asp:SqlDataSource ID="SqlDataSourceBranch" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT [BranchID], [BranchName] FROM [ViewBranchOnly] ORDER BY [BranchName]">
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:ListBox ID="cboDesignation" runat="server" AppendDataBoundItems="true" SelectionMode="Multiple"
                                            DataSourceID="SqlDataSourceDesignations" DataTextField="Designation" DataValueField="DesigID"
                                            Width="320px" Height="28px" CssClass="Designation"></asp:ListBox>
                                        <asp:SqlDataSource ID="SqlDataSourceDesignations" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT  [DesigID] ,
        [DesigName] + ' - ' + [DesigFullName] AS Designation ,
        [DesigType]
FROM    [dbo].v_Desig_Live
ORDER BY OrderCol desc"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" Style="font-weight: 700"
                                            OnClick="cmdSearch_Click" />
                                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td>
                                        <asp:ListBox ID="cboDepartments" runat="server" AppendDataBoundItems="true" SelectionMode="Multiple"
                                            DataSourceID="SqlDataSourceDepartment" DataTextField="Department" DataValueField="DeptID"
                                            Width="320px" Height="28px" CssClass="Departments"></asp:ListBox>
                                        <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT  [DeptID] ,
        [Department]
FROM    [dbo].[v_Dept_Live]
ORDER BY Department"></asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlServiceStatus" runat="server" DataSourceID="SqlServiceStatus"
                                            AppendDataBoundItems="true" DataTextField="ServiceStatusDetails" DataValueField="ServiceStatusID"
                                            AutoPostBack="true" CausesValidation="false">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlServiceStatus" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT [ServiceStatusDetails], [ServiceStatusID] FROM [ServiceStatus] union all SELECT 'All' [ServiceStatusDetails], -1 [ServiceStatusID]">
                                        </asp:SqlDataSource>
                                        Blood Group
                                        <asp:DropDownList ID="dboBlood_Group" runat="server" AppendDataBoundItems="true"
                                            AutoPostBack="true" CausesValidation="true" DataSourceID="SqlDataSourceBloodGroup"
                                            DataTextField="BloodGroup" DataValueField="BloodGroup">
                                            <asp:ListItem Value="*" Text="All"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceBloodGroup" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT [BloodGroup] FROM [v_BloodGroups]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <asp:ImageButton ID="lnkToggle" runat="server" ImageUrl="~/Images/Grid-icon.png"
                                Height="32px" Width="32px" ToolTip="Grid View" OnClick="lnkToggle_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" PagerSettings-PageButtonCount="30"
                CssClass="Grid" PageSize="20" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                BorderStyle="Solid" AllowPaging="True" PagerSettings-Position="TopAndBottom" EnableViewState="false"
                BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black"
                PagerSettings-Mode="NumericFirstLast" Style="font-size: small" OnDataBinding="GridView1_DataBinding"
                OnRowDataBound="GridView1_RowDataBound">
                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="BranchID" HeaderText="BranchID" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" SortExpression="BranchID" Visible="false">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="EmpID" SortExpression="EmpID">
                        <ItemTemplate>
                            <a href='Profile.aspx?ID=<%# Eval("EmpID") %>' target="_blank">
                                <%# Eval("EmpID") %></a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Large" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href='Profile.aspx?ID=<%# Eval("EmpID") %>' target="_blank">
                                <img class="wait" height="50" width="50" src='EmpImage.aspx?EMPID=<%# Eval("EmpID") %>&imgid=<%# Eval("Imageidentifier") %>&W=100' /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Information" SortExpression="EmpName">
                        <ItemTemplate>
                            <b><%# Eval("EmpName")%></b>
                            <%# Eval("FunctionalDesignation", "<br>{0}")%>
                            <%# Eval("DesigFullName","<br>{0}")%>
                            <%# Eval("Department", "<br>{0}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Designation" SortExpression="DesignationOrderCol">
                        <ItemTemplate>
                            <span title='<%# Eval("DesigFullName") %>'>
                                <%# Eval("DesigName")%></span>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Branch Name" SortExpression="BranchName">
                        <ItemTemplate>
                            <a title='<%# Eval("BranchID") %>' href='<%# Eval("BranchID","EmpBranch.aspx?branch={0}") %>'
                                target="_blank">
                                <%# Eval("BranchName")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" SortExpression="LastOnline">
                        <ItemTemplate>                           
                              <%# Common.getStatusText(Eval("LastOnline")) %>                         
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email ID" SortExpression="Email">
                        <ItemTemplate>
                            
                                <%# Eval("Email_TBLBD")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="mobile" HeaderText="Mobile No." SortExpression="mobile" />
                    <asp:TemplateField HeaderText="Contact No." SortExpression="Phone">
                        <ItemTemplate>
                            <%# Eval("mobile2", "{0}, ")%>
                            <%# Eval("phone", "{0}, ")%>
                            <%# Eval("dskphone", "{0}, ")%>
                            <%# Eval("ext", "Ext-{0}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Other Emails" SortExpression="Email1">
                        <ItemTemplate>
                            <%# Eval("Email1") %>
                            <%# Eval("Email2","<br>{0}") %>
                           
                                <%# Eval("Email_TBL","<br>{0}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Status">
                        <ItemTemplate>
                            <%# Eval("ServiceStatusDetails")%>
                            <asp:Label ID="lb_status_id" Visible="false" runat="server" Text='<%# Eval("ServiceStatusID")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="30" Position="TopAndBottom" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                <EmptyDataTemplate>
                    <span class="style3">No March Found </span>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#FFA200" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" ItemPlaceholderID="PlaceHolder1"
                Visible="false">
                <ItemTemplate>
                    <a target="_blank" href='Profile.aspx?ID=<%# Eval("EmpID") %>' title="">
                        <img height="90px" src='EmpImage.aspx?EMPID=<%# Eval("EmpID") %>&H=200&imgid=<%# Eval("ImageIdentifier") %>'
                            border="1px" width="90" class="ProfilePic" /></a>
                </ItemTemplate>
                <LayoutTemplate>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>
            </asp:ListView>
            <br />
            <asp:Button ID="cmdExport" runat="server" Text="Download as xlsx" Width="150px" Height="30px"
                Visible="true" Font-Bold="true" OnClick="cmdExport_Click" />
            <asp:Button ID="cmdExportVCF" runat="server" Text="Download as VCF" Width="150px"
                Height="30px" Visible="true" Font-Bold="true" OnClick="cmdExportVCF_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommandType="StoredProcedure" SelectCommand="sp_EmpInfo_Browse" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                OnSelected="SqlDataSource1_Selected">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="Filter" PropertyName="Text" DefaultValue=""
                        Type="String" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="BranchIDs" ConvertEmptyStringToNull="false" DefaultValue="" />
                    <asp:Parameter Name="DepartmentIDs" ConvertEmptyStringToNull="false" DefaultValue="" />
                    <asp:Parameter Name="DeignationIDs" ConvertEmptyStringToNull="false" DefaultValue="" />
                    <asp:ControlParameter ControlID="ddlServiceStatus" Name="ServiceStatus" DefaultValue="-1"
                        Type="String" ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter ControlID="dboBlood_Group" Name="BloodGroup" DefaultValue="*"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_Download" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommandType="StoredProcedure" SelectCommand="sp_EmpInfo_Browse_WithImage"
                ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="Filter" PropertyName="Text" DefaultValue=""
                        Type="String" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="BranchIDs" ConvertEmptyStringToNull="false" DefaultValue="" />
                    <asp:Parameter Name="DepartmentIDs" ConvertEmptyStringToNull="false" DefaultValue="" />
                    <asp:Parameter Name="DeignationIDs" ConvertEmptyStringToNull="false" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="cmdExport" />
            <asp:PostBackTrigger ControlID="cmdExportVCF" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender2" runat="server"
        TargetControlID="UpdatePanel1">
        
    </asp:UpdatePanelAnimationExtender>
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
