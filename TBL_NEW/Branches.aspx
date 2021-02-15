<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Branches.aspx.cs" Inherits="Branches" EnableEventValidation="false"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Src="EMP.ascx" TagName="EMP" TagPrefix="uc2" %>
<asp:Content ID="Content4" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/jquery.multiselect.css" rel="stylesheet" type="text/css" />
    <link href="CSS/jquery.multiselect.filter.css" rel="stylesheet" type="text/css" />
    <script src="script/jquery.multiselect.min.js" type="text/javascript"></script>
    <script src="script/jquery.multiselect.filter.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitle" runat="Server">
    <table>
        <tr>
            <td style="width: 40px">
                <a href="Default.aspx" class="button1">
                    <img src="Images/Previous.gif" width="32px" height="32px" alt="Back" border="0" />
                </a>
            </td>
            <td>
                Trust Bank Branches
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="Panel1 ui-corner-all">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" CausesValidation="True"
                                        onfocus="this.select()" CssClass="Watermark" Watermark="enter information to filter"
                                        OnTextChanged="txtSearch_TextChanged" Width="200px"></asp:TextBox>
                                </td>
                                <td style="padding-left: 10px">
                                    Type (s):
                                </td>
                                <td align="left" style="padding-right: 2px">
                                    <asp:ListBox ID="cboType" runat="server" AppendDataBoundItems="true" SelectionMode="Multiple" Height="29px"
                                        DataSourceID="SqlDataSourceBranchType" DataTextField="Type" DataValueField="BranchTypeID"
                                        Width="320px" CssClass="Types" OnSelectedIndexChanged="cboType_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Text="ALL"></asp:ListItem>
                                    </asp:ListBox>
                                    <asp:SqlDataSource ID="SqlDataSourceBranchType" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [BranchTypeID], [Type] FROM [TblUserDB].[dbo].[BranchType] where [BranchTypeID] <> 3 ORDER BY BranchTypeID">
                                    </asp:SqlDataSource>
                                </td>
                                <td align="left" style="padding-right: 2px">
                                    <asp:DropDownList ID="cboAD" runat="server" AutoPostBack="True" CausesValidation="false">
                                        <asp:ListItem Value="*" Text="ALL"></asp:ListItem>
                                        <asp:ListItem Text="AD" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Non AD" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td style="padding-left: 10px">
                                    Location:
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:SqlDataSource ID="SqlDataSourceDivision1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT DIV_CODE, DIV_NAME FROM [dbo].[BD_Division]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="dboDivision1" runat="server" DataSourceID="SqlDataSourceDivision1"
                                        ToolTip="Division" DataTextField="DIV_NAME" DataValueField="DIV_CODE" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="All Division"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="dboDistrict1" runat="server" SelectedValue='<%# Eval("Dist_Code") %>'
                                        ToolTip="District">
                                    </asp:DropDownList>
                                    <asp:CascadingDropDown ID="CascadingDropDown1" runat="server" TargetControlID="dboDistrict1"
                                        Category="District" PromptText="All District" ServicePath="WebService.asmx" LoadingText="Loading..."
                                        ServiceMethod="GetDropDownContents_District" ParentControlID="dboDivision1" />
                                    <asp:DropDownList ID="dboThana1" runat="server" SelectedValue='<%# Eval("Thana_Code") %>'
                                        ToolTip="Thana">
                                    </asp:DropDownList>
                                    <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" TargetControlID="dboThana1"
                                        Category="Thana" PromptText="All Thana" ServicePath="WebService.asmx" LoadingText="Loading..."
                                        ServiceMethod="GetDropDownContents_Thana" ParentControlID="dboDistrict1" />
                                </td>
                                <td>
                                    Cluster(s):
                                </td>
                                <td align="left" style="padding-left: 2px" colspan="3">
                                    <asp:ListBox ID="cboClusters" runat="server" AppendDataBoundItems="true" SelectionMode="Multiple" Height="29px"
                                        DataSourceID="SqlDataSourceCluster" DataTextField="ClusterName" DataValueField="ClusterID"
                                        Width="320px" CssClass="Clusters"></asp:ListBox>
                                    <asp:SqlDataSource ID="SqlDataSourceCluster" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [ClusterID], [ClusterName] FROM [Cluster] ORDER BY [ClusterID]">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" Style="font-weight: 700" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="BranchID" AllowSorting="True" EnableViewState="false"
                CssClass="Grid" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1"
                ForeColor="Black" PagerSettings-Position="TopAndBottom" Style="font-size: small"
                Width="900px" OnDataBound="GridView1_DataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="BranchID" HeaderText="ID" ReadOnly="true" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" SortExpression="BranchID">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="140%" />
                    </asp:BoundField>
                    
                    <asp:TemplateField HeaderText="Branch Name & Address" SortExpression="BranchName">
                        <ItemTemplate>
                            <div style="font-weight: bold; font-size: 140%">
                                <a href='EmpBranch.aspx?branch=<%# Eval("BranchID") %>' title="View Details" target="_blank">
                                    <%# Eval("BranchName") %></a></div>
                            <div style="max-width: 350px;margin-left:30px">
                                <%#  getBranchAddress(Eval("BranchAddress")) %>
                                <%#  Eval("phoneno","<div>Phone: {0}</div>")%>
                                <%#  Eval("faxno", "<div>Fax: {0}</div>")%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prefix" SortExpression="BranchPrefix">
                        <ItemTemplate>
                            <%# Eval("BranchPrefix") %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="BEFTN_Code" HeaderText="Routing" SortExpression="BEFTN_Code" />
                    <asp:BoundField DataField="FIU_Code" HeaderText="FIU" SortExpression="FIU_Code" />
                    <asp:BoundField DataField="SWIFT" HeaderText="SWIFT" SortExpression="SWIFT" />
                    <asp:TemplateField HeaderText="AD" SortExpression="isAD">
                        <ItemTemplate>
                            <%# (Eval("isAd").ToString() == "True" ? "<img src='Images/tick2.png' title='Authorized Dealer' width='16px' height='16px'>" : "")%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cluster" SortExpression="ClusterID">
                        <ItemTemplate>
                            <div title='<%# Eval("ClusterName")%>'>
                                <%# Eval("ClusterID")%></div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:CommandField Visible="false" ShowSelectButton="True" ButtonType="Link" />
                    <asp:TemplateField HeaderText="Map">
                        <ItemTemplate>
                            <a href='GoogleMap.aspx?branch=<%# Eval("BranchID") %>' target="_blank" title="View in Google Map">
                                <%# Eval("Latitude", "<img src='Images/marker-br.png' width='24' height='24' />")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location" SortExpression="Dist_Name">
                        <ItemTemplate>
                            <%# Eval("DIV_NAME", "<div title='Division'>{0} »</div>")%>
                            <%# Eval("DIST_NAME", "<div title='District'>{0} »</div>")%>
                            <%# Eval("THANA_NAME", "<div title='Thana'>{0}</div>")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-Font-Bold="true">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("BranchID") %>'
                                Height="20px" ToolTip="Open" CausesValidation="false">
                                <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                            </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle1" />
                <EmptyDataTemplate>
                    <span class="style3">No March Found </span>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#FFA200" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Button ID="cmdExport" runat="server" Text="Download as xlsx" Width="150px" Height="30px"
                Font-Bold="true" OnClick="cmdExport_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommandType="StoredProcedure" SelectCommand="sp_BranchList_Browse1" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                OnSelected="SqlDataSource1_Selected">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="Filter" PropertyName="Text" DefaultValue=""
                        Type="String" ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter ControlID="dboDivision1" Name="Div_Code" PropertyName="SelectedValue"
                        DefaultValue="0" Type="Int32" />
                    <asp:ControlParameter ControlID="dboDistrict1" Name="Dist_Code" PropertyName="SelectedValue"
                        DefaultValue="0" Type="Int32" />
                    <asp:ControlParameter ControlID="dboThana1" Name="Thana_Code" PropertyName="SelectedValue"
                        DefaultValue="0" Type="Int32" />
                    <%--<asp:ControlParameter ControlID="cboType" Name="BranchTypeID" PropertyName="SelectedValue"
                        DefaultValue="0" Type="Int32" ConvertEmptyStringToNull="false" />--%>
                    <asp:Parameter Name="BranchTypeIDs" ConvertEmptyStringToNull="false" DefaultValue="" />
                    <asp:Parameter Name="ClusterIDs" ConvertEmptyStringToNull="false" DefaultValue="" />
                    <asp:ControlParameter ControlID="cboAD" Name="isAD" PropertyName="SelectedValue"
                        Size="2" DefaultValue="*" Type="String" ConvertEmptyStringToNull="false" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span style="visibility: hidden">
                <asp:Button runat="server" ID="cmdPopup" /></span>
            <asp:ModalPopupExtender ID="modal" runat="server" CancelControlID="ModalClose" TargetControlID="cmdPopup"
                PopupControlID="ModalPanel" BackgroundCssClass="ModalPopupBG" PopupDragHandleControlID="ModalTitleBar"
                RepositionMode="RepositionOnWindowResize" X="-1" Y="1" CacheDynamicResults="False"
                Drag="false">
            </asp:ModalPopupExtender>
            <asp:Panel ID="ModalPanel" runat="server" CssClass="Panel1 ui-corner-all">
                <div style="padding: 5px">
                    <table width="100%" style="border-collapse: collapse">
                        <tr>
                            <td>
                            </td>
                            <td align="right">
                                <asp:Image ID="ModalClose" runat="server" ImageUrl="~/Images/close.gif" ToolTip="Close"
                                    Style="cursor: pointer" />
                            </td>
                        </tr>
                    </table>
                    <asp:DetailsView ID="DetailsView1" runat="server" BackColor="White" BorderColor="#DEDFDE" EnableViewState="false"
                        BorderStyle="Solid" BorderWidth="1px" CssClass="Grid" CellPadding="4" DataSourceID="SqlDataSource2"
                        ForeColor="Black" AutoGenerateRows="False" DataKeyNames="BranchID" OnItemInserted="DetailsView1_ItemInserted"
                        OnItemUpdated="DetailsView1_ItemUpdated" OnModeChanged="DetailsView1_ModeChanged"
                        OnDataBound="DetailsView1_DataBound">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="BranchID" HeaderText="Branch ID" SortExpression="BranchID"
                                ReadOnly="true" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Large">
                                <ItemStyle Font-Bold="True" Font-Size="Large" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Branch Name" SortExpression="BranchName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtBranchName" runat="server" Text='<%# Bind("BranchName") %>' Width="400px"
                                        MaxLength="200"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtBranchName" runat="server" Text='<%# Bind("BranchName") %>' Width="400px"
                                        MaxLength="200"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <a href='EmpBranch.aspx?branch=<%# Eval("BranchID") %>' title="View Details" target="_blank">
                                        <%# Eval("BranchName") %></a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Font-Bold="true" Font-Size="Medium" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" SortExpression="BranchAddress">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" Font-Names="Arial" runat="server" Text='<%# Bind("BranchAddress") %>'
                                        TextMode="MultiLine" Width="300px" Height="70px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" Font-Names="Arial" runat="server" Text='<%# Bind("BranchAddress") %>'
                                        TextMode="MultiLine" Width="300px" Height="70px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("BranchAddress").ToString().Replace("\n", "<br>") %>
                                </ItemTemplate>
                                <HeaderStyle VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="BranchPrefix" HeaderText="Branch Prefix" SortExpression="BranchPrefix">
                                <ItemStyle Font-Bold="true" />
                                <ControlStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="phoneno" HeaderText="Phone No." SortExpression="phoneno"
                                ControlStyle-Width="400px">
                                <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="faxno" HeaderText="Fax" SortExpression="faxno" />
                            <asp:TemplateField HeaderText="Type" SortExpression="Type">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="cboType1" runat="server" OnSelectedIndexChanged="cboType_SelectedIndexChanged"
                                        CausesValidation="True" AppendDataBoundItems="True" DataSourceID="SqlDataSourceBranchType1"
                                        DataTextField="Type" DataValueField="BranchTypeID" SelectedValue='<%# Bind("BranchTypeID") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceBranchType1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [BranchTypeID], [Type] FROM [TblUserDB].[dbo].[BranchType] where [BranchTypeID] <> 3 ORDER BY BranchTypeID">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="cboType1" runat="server" OnSelectedIndexChanged="cboType_SelectedIndexChanged"
                                        CausesValidation="True" AppendDataBoundItems="True" DataSourceID="SqlDataSourceBranchType1"
                                        DataTextField="Type" DataValueField="BranchTypeID" SelectedValue='<%# Bind("BranchTypeID") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceBranchType1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [BranchTypeID], [Type] FROM [TblUserDB].[dbo].[BranchType] where [BranchTypeID] <> 3 ORDER BY BranchTypeID">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("Type") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cluster" SortExpression="ClusterID">
                                <InsertItemTemplate>
                                    <asp:SqlDataSource ID="SqlDataSourceCluster" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [ClusterID], [ClusterDetails] FROM [TblUserDB].[dbo].[v_Cluster] where [Active] = 1 ORDER BY ClusterID">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="cboCluster" runat="server" CausesValidation="True" AppendDataBoundItems="True"
                                        DataSourceID="SqlDataSourceCluster" DataTextField="ClusterDetails" DataValueField="ClusterID"
                                        SelectedValue='<%# Bind("ClusterID") %>'>
                                        <asp:ListItem Value="" Text=""></asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:SqlDataSource ID="SqlDataSourceCluster" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [ClusterID], [ClusterDetails] FROM [TblUserDB].[dbo].[v_Cluster] where [Active] = 1 ORDER BY ClusterID">
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="cboCluster" runat="server" CausesValidation="True" AppendDataBoundItems="True"
                                        DataSourceID="SqlDataSourceCluster" DataTextField="ClusterDetails" DataValueField="ClusterID"
                                        SelectedValue='<%# Bind("ClusterID") %>'>
                                        <asp:ListItem Value="" Text=""></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("ClusterID")%>.
                                    <%# Eval("ClusterName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BEFTN_Code" HeaderText="Routing" SortExpression="BEFTN_Code"
                                ReadOnly="true" />
                            <asp:BoundField DataField="FIU_Code" HeaderText="FIU Code" ReadOnly="true" />
                            <asp:BoundField DataField="SWIFT" HeaderText="SWIFT" ReadOnly="true" />
                            <asp:TemplateField HeaderText="AD" SortExpression="isAD">
                                <ItemTemplate>
                                    <%# (Eval("isAd").ToString() == "True" ? "<img src='Images/tick2.png' width='16px' height='16px'>" : "")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList runat="server" ID="DboAD" SelectedValue='<%# Bind("isAD") %>'>
                                        <asp:ListItem Text="Y" Value="True"></asp:ListItem>
                                        <asp:ListItem Text="N" Value="False"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList runat="server" ID="DboAD" SelectedValue='<%# Bind("isAD") %>'>
                                        <asp:ListItem Text="Y" Value="True"></asp:ListItem>
                                        <asp:ListItem Text="N" Value="False"></asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Location:
                                    <img src="Images/green-dot.png" width="16" height="16" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="location-path">
                                        <%# Eval("DIV_NAME","<span title='Division'>{0}</span>")%>
                                        <%# Eval("DIST_NAME", "» <span title='District'>{0}</span>")%>
                                        <%# Eval("THANA_NAME", "» <span title='Thana'>{0}</span>")%>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:SqlDataSource ID="SqlDataSourceDivision" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT DIV_CODE, DIV_NAME FROM [dbo].[BD_Division]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="dboDivision" runat="server" DataSourceID="SqlDataSourceDivision"
                                        DataTextField="DIV_NAME" DataValueField="DIV_CODE" AppendDataBoundItems="true"
                                        SelectedValue='<%# Bind("Div_Code") %>' OnDataBound="dboDivision_DataBound" AutoPostBack="True"
                                        OnSelectedIndexChanged="dboDivision_SelectedIndexChanged1">
                                        <asp:ListItem Value="" Text="Select Division"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:HiddenField ID="hidDistrict" Value='<%# Eval("Dist_Code") %>' runat="server" />
                                    <asp:HiddenField ID="hidThana" Value='<%# Eval("Thana_Code") %>' runat="server" />
                                    <asp:SqlDataSource ID="SqlDataSourceDistrict" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT DIST_CODE, DIST_NAME FROM [dbo].[BD_District] WHERE DIV_CODE = @DIV_CODE ORDER BY DIST_NAME"
                                        OnSelecting="SqlDataSourceDistrict_Selecting">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="dboDivision" Name="DIV_CODE" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="dboDistrict" runat="server" DataSourceID="SqlDataSourceDistrict"
                                        DataTextField="DIST_Name" DataValueField="DIST_CODE" EnableViewState="true" CausesValidation="false"
                                        AutoPostBack="True" OnSelectedIndexChanged="dboDistrict_SelectedIndexChanged"
                                        OnDataBound="dboDistrict_DataBound">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceThana" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [THANA_CODE],[THANA_NAME] FROM [dbo].[BD_Thana] WHERE DIST_CODE = @DIST_CODE ORDER BY THANA_NAME">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="dboDistrict" Name="DIST_CODE" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DropDownList ID="dboThana" runat="server" DataSourceID="SqlDataSourceThana"
                                        DataTextField="THANA_NAME" DataValueField="THANA_CODE" OnDataBound="dboThana_DataBound">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:SqlDataSource ID="SqlDataSourceDivision" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT DIV_CODE, DIV_NAME FROM [dbo].[BD_Division]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="dboDivision" runat="server" DataSourceID="SqlDataSourceDivision"
                                        DataTextField="DIV_NAME" DataValueField="DIV_CODE" AppendDataBoundItems="true"
                                        SelectedValue='<%# Bind("Div_Code") %>'>
                                        <asp:ListItem Value="" Text="Select Division"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="dboDistrict" runat="server" SelectedValue='<%# Bind("Dist_Code") %>'>
                                    </asp:DropDownList>
                                    <asp:CascadingDropDown ID="CascadingDropDown1" runat="server" TargetControlID="dboDistrict"
                                        Category="District" PromptText="Select District" ServicePath="WebService.asmx"
                                        LoadingText="Loading..." ServiceMethod="GetDropDownContents_District" ParentControlID="dboDivision" />
                                    <asp:DropDownList ID="dboThana" runat="server" SelectedValue='<%# Bind("Thana_Code") %>'>
                                    </asp:DropDownList>
                                    <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" TargetControlID="dboThana"
                                        Category="Thana" PromptText="Select Thana" ServicePath="WebService.asmx" LoadingText="Loading..."
                                        ServiceMethod="GetDropDownContents_Thana" ParentControlID="dboDistrict" />
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Map" SortExpression="BranchName">
                                <EditItemTemplate>
                                    <label class="">
                                        Latitude</label>
                                    <asp:TextBox ID="txtLatitude" runat="server" Text='<%# Bind("Latitude") %>' Width="100px"
                                        MaxLength="50"></asp:TextBox>
                                    <label class="">
                                        Longitude</label>
                                    <asp:TextBox ID="txtLongitude" runat="server" Text='<%# Bind("Longitude") %>' Width="100px"
                                        MaxLength="50"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <label class="">
                                        Latitude</label>
                                    <asp:TextBox ID="txtLatitude" runat="server" Text='<%# Bind("Latitude") %>' Width="100px"
                                        MaxLength="50"></asp:TextBox>
                                    <label class="">
                                        Longitude</label>
                                    <asp:TextBox ID="txtLongitude" runat="server" Text='<%# Bind("Longitude") %>' Width="100px"
                                        MaxLength="50"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <a href='GoogleMap.aspx?branch=<%# Eval("BranchID") %>' target="_blank">
                                        <%# Eval("Latitude", "View in Google Map")%></a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Font-Bold="true" Font-Size="Small" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="By" SortExpression="DT" InsertVisible="false" Visible="false">
                                <ItemTemplate>
                                    <uc2:EMP ID="EMP1" runat="server" Username='<%# Eval("UpdateBy") %>' />
                                    , On: <span title='<%# Eval("DT","{0:dddd, \ndd MMMM, yyyy \nh:mm:ss tt}") %>'>
                                        <%# Common.ToRecentDateTime(Eval("DT"))%>
                                        <span class="time-small" style="margin: 0px 15px 0px 5px">
                                            <%# Common.ToRelativeDate(Eval("DT"))%></span> </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" ControlStyle-Width="100px" Visible="false">
                                <EditItemTemplate>
                                    <asp:Button ID="cmdUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    <asp:ConfirmButtonExtender ID="cmdUpdate_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                                        Enabled="True" TargetControlID="cmdUpdate">
                                    </asp:ConfirmButtonExtender>
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Button ID="cmdInsert" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    <asp:ConfirmButtonExtender ID="cmdInsert_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Save?"
                                        Enabled="True" TargetControlID="cmdInsert">
                                    </asp:ConfirmButtonExtender>
                                    &nbsp;<asp:Button ID="cmdCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New" />
                                </ItemTemplate>
                                <ControlStyle Width="100px" />
                            </asp:TemplateField>
                        </Fields>
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                </div>
            </asp:Panel>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                InsertCommand="usp_BranchList_Add" InsertCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                SelectCommand="sp_Branch_Select" SelectCommandType="StoredProcedure" UpdateCommand="sp_Branch_Update"
                UpdateCommandType="StoredProcedure" OnUpdating="SqlDataSource2_Updating">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="BranchID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BranchAddress" />
                    <asp:Parameter Name="BranchPrefix" />
                    <asp:Parameter Name="phoneno" />
                    <asp:Parameter Name="faxno" />
                    <asp:Parameter Name="BranchID" />
                    <asp:Parameter Name="ClusterID" />
                    <asp:Parameter Name="BranchTypeID" />
                    <asp:Parameter Name="isAD" />
                    <asp:Parameter Name="Div_Code" />
                    <asp:Parameter Name="Dist_Code" />
                    <asp:Parameter Name="Thana_Code" />
                    <asp:Parameter Name="FIU_Code" />
                    <asp:Parameter Name="SWIFT" />
                    <asp:Parameter Name="Latitude" />
                    <asp:Parameter Name="Longitude" />
                    <asp:Parameter Name="BRTA_Payment" />
                    <asp:SessionParameter Name="UpdateBy" SessionField="EMPID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="cmdExport" />
        </Triggers>
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
