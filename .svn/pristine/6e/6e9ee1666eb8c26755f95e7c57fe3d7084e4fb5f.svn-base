<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeFile="CDM.aspx.cs" Inherits="CDM" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Src="EMP.ascx" TagName="EMP" TagPrefix="uc2" %>
<asp:Content ID="Content4" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitle" runat="Server">
    <table>
        <tr>
            <td style="width: 40px">
                <a href="Default.aspx" class="button1">
                    <img src="Images/Previous.gif" alt="Back" border="0" /></a>
            </td>
            <td>
                Trust Bank T-Lobby & CDMs (Cash Deposit Machine)
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
                        <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" CausesValidation="True"
                            onfocus="this.select()" CssClass="Watermark" Watermark="enter information to filter"
                            OnTextChanged="txtSearch_TextChanged" Width="150px"></asp:TextBox>
                    </td>
                    <td style="padding-left: 10px; white-space: nowrap">
                        Maintaining Branch:
                    </td>
                    <td>
                        <asp:DropDownList ID="dboBranch" runat="server" AppendDataBoundItems="true" AutoPostBack="true"
                            CausesValidation="false" DataSourceID="SqlDataSourceBranchName" DataTextField="BranchName"
                            DataValueField="BranchID">
                            <asp:ListItem Text="All Branch" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceBranchName" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT DISTINCT FeedingBranch AS BranchID ,BranchName FROM    dbo.ATM AS A
                                        INNER JOIN dbo.ViewBranch AS B ON A.FeedingBranch = B.BranchID and A.Type = 'CDM' ORDER BY BranchName">
                        </asp:SqlDataSource>
                    </td>
                    <td style="padding-left: 10px;">
                        Location:
                    </td>
                    <td style="white-space: nowrap">
                        <asp:SqlDataSource ID="SqlDataSourceDivision1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT DIV_CODE, DIV_NAME FROM [dbo].[BD_Division]"></asp:SqlDataSource>
                        <asp:DropDownList ID="dboDivision1" runat="server" DataSourceID="SqlDataSourceDivision1"
                            DataTextField="DIV_NAME" DataValueField="DIV_CODE" AppendDataBoundItems="true">
                            <asp:ListItem Value="" Text="All Division"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="dboDistrict1" runat="server" SelectedValue='<%# Eval("Dist_Code") %>'>
                        </asp:DropDownList>
                        <asp:CascadingDropDown ID="CascadingDropDown1" runat="server" TargetControlID="dboDistrict1"
                            Category="District" PromptText="All District" ServicePath="WebService.asmx" LoadingText="Loading..."
                            ServiceMethod="GetDropDownContents_District" ParentControlID="dboDivision1" />
                        <asp:DropDownList ID="dboThana1" runat="server" SelectedValue='<%# Eval("Thana_Code") %>'>
                        </asp:DropDownList>
                        <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" TargetControlID="dboThana1"
                            Category="Thana" PromptText="All Thana" ServicePath="WebService.asmx" LoadingText="Loading..."
                            ServiceMethod="GetDropDownContents_Thana" ParentControlID="dboDistrict1" />
                    </td>
                    <td>
                        <asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" Style="font-weight: 700" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" AllowSorting="True"
                PagerSettings-PageButtonCount="30" CssClass="Grid" PageSize="20" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid" AllowPaging="true"
                PagerSettings-Position="TopAndBottom" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1"
                ForeColor="Black" PagerSettings-Mode="NumericFirstLast" Style="font-size: small"
                OnDataBound="GridView1_DataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                onrowdatabound="GridView1_RowDataBound">
                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" SortExpression="ID">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Width="200px" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# Eval("Name")%>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" Font-Bold="true" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" SortExpression="BranchAddress">
                        <ItemTemplate>
                            <%#  getBranchAddress(Eval("Address")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Division" SortExpression="DIV_NAME">
                        <ItemTemplate>
                            <%#  Eval("DIV_NAME")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="District" SortExpression="DIST_NAME">
                        <ItemTemplate>
                            <%#  Eval("DIST_NAME")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Thana" SortExpression="THANA_NAME">
                        <ItemTemplate>
                            <%#  Eval("THANA_NAME")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Maintaining Branch" SortExpression="FeedingBranchName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxFeedingBranchName" runat="server" Text='<%# Bind("FeedingBranch") %>'
                                Width="200px" Font-Names="Arial"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <a title='<%# Eval("FeedingBranch") %>' target="_blank" href='<%# Eval("FeedingBranch", "EmpBranch.aspx?branch={0}") %>'>
                                <%# Eval("FeedingBranchName") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Link Vendors" SortExpression="LinkVendor1Name">
                        <ItemTemplate>
                            <a target="_blank" href='<%# Eval("LinkVendor1", "Vendor.aspx?id={0}") %>'>
                                <%# Eval("LinkVendor1Name")%></a><%# Eval("LinkVendor2", ", <a target='_blank' href='Vendor.aspx?id={0}'>") %>
                            <%# Eval("LinkVendor2Name")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField Visible="false" ShowSelectButton="True" ButtonType="Link" />
                    <asp:TemplateField HeaderText="Map">
                        <ItemTemplate>
                            <a href='GoogleMap.aspx?atm=<%# Eval("ID") %>' target="_blank" title="View in Google Map">
                                <%# Eval("Latitude", "<img src='Images/marker-cdm.png' width='24' height='24' />")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active" SortExpression="IsActive" Visible="false">
                                <ItemTemplate>
                                    <%# (Eval("IsActive").ToString() == "True" ? "<img src='Images/tick.png' width='20px' height='20px' />" : "") %></ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                    <asp:TemplateField Visible="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
                                Height="20px" ToolTip="Open" CausesValidation="false">
                                <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                            </asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle1" />
                <EmptyDataTemplate>
                    <span class="style3">No March Found </span>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#FFA200" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" HorizontalAlign="Center" ForeColor="White"
                    Wrap="false" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Button ID="cmdExport" runat="server" Text="Download as xlsx" Width="150px" Height="30px"
                Font-Bold="true" OnClick="cmdExport_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommandType="StoredProcedure" SelectCommand="sp_ATM" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
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
                    <asp:ControlParameter ControlID="dboBranch" Name="FeedingBranch" PropertyName="SelectedValue"
                        DefaultValue="-1" Type="Int32" />
                    <asp:Parameter Name="Type" DefaultValue="CDM" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span style="visibility: hidden">
                <asp:Button runat="server" ID="cmdPopup" /></span>
            <asp:ModalPopupExtender ID="modal" runat="server" CancelControlID="ModalClose" TargetControlID="cmdPopup"
                PopupControlID="ModalPanel" BackgroundCssClass="ModalPopupBG" PopupDragHandleControlID="ModalTitleBar"
                RepositionMode="RepositionOnWindowResize" X="-1" Y="20" CacheDynamicResults="False"
                Drag="True">
            </asp:ModalPopupExtender>
            <asp:Panel ID="ModalPanel" runat="server" CssClass="Panel1 ui-corner-all">
                <div style="padding: 5px">
                    <table width="100%">
                        <tr>
                            <td>
                            </td>
                            <td align="right">
                                <asp:Image ID="ModalClose" runat="server" ImageUrl="~/Images/close.gif" ToolTip="Close"
                                    Style="cursor: pointer" />
                            </td>
                        </tr>
                    </table>
                    <asp:DetailsView ID="DetailsView1" runat="server" BackColor="White" BorderColor="#DEDFDE"
                        BorderStyle="Solid" BorderWidth="1px" CssClass="Grid" CellPadding="4" DataSourceID="SqlDataSource2"
                        ForeColor="Black" AutoGenerateRows="False" DataKeyNames="ID" OnItemInserted="DetailsView1_ItemInserted"
                        OnItemUpdated="DetailsView1_ItemUpdated" OnModeChanged="DetailsView1_ModeChanged">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="ID" HeaderText="CDM ID" SortExpression="ID" ReadOnly="true"
                                ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Large">
                                <ItemStyle Font-Bold="True" Font-Size="Large" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ControlStyle-Width="400px">
                                <ControlStyle Width="400px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" Font-Names="Arial" runat="server" Text='<%# Bind("Address") %>'
                                        TextMode="MultiLine" Width="300px" Height="70px"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" Font-Names="Arial" runat="server" Text='<%# Bind("Address") %>'
                                        TextMode="MultiLine" Width="300px" Height="70px"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("Address").ToString().Replace("\n", "<br>")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Maintaining Branch" SortExpression="FeedingBranch">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceBranch"
                                        DataTextField="BranchName" DataValueField="BranchID" SelectedValue='<%# Bind("FeedingBranch") %>'>
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1"
                                        ErrorMessage="*"> </asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlDataSourceBranch" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [BranchID], [BranchName] FROM [ViewBranchOnly] ORDER BY [BranchName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceBranch"
                                        DataTextField="BranchName" DataValueField="BranchID" SelectedValue='<%# Bind("FeedingBranch") %>'>
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1"
                                        ErrorMessage="*"> </asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlDataSourceBranch" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT [BranchID], [BranchName] FROM [ViewBranchOnly] ORDER BY [BranchName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("FeedingBranchName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Link Vendor 1" SortExpression="LinkVendor1">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceVendor"
                                        DataTextField="VendorName" DataValueField="ID" SelectedValue='<%# Bind("LinkVendor1") %>'>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceVendor"
                                        DataTextField="VendorName" DataValueField="ID" SelectedValue='<%# Bind("LinkVendor1") %>'>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("LinkVendor1Name")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Link Vendor 2" SortExpression="LinkVendor2">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceVendor"
                                        DataTextField="VendorName" DataValueField="ID" SelectedValue='<%# Bind("LinkVendor2") %>'>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceVendor"
                                        DataTextField="VendorName" DataValueField="ID" SelectedValue='<%# Bind("LinkVendor2") %>'>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("LinkVendor2Name")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location">
                                <ItemTemplate>
                                    <%# Eval("DIV_NAME")%>
                                    »
                                    <%# Eval("DIST_NAME")%>
                                    »
                                    <%# Eval("THANA_NAME")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:SqlDataSource ID="SqlDataSourceDivision" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT DIV_CODE, DIV_NAME FROM [dbo].[BD_Division]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="dboDivision" runat="server" DataSourceID="SqlDataSourceDivision"
                                        DataTextField="DIV_NAME" DataValueField="DIV_CODE" AppendDataBoundItems="true"
                                        SelectedValue='<%# Bind("Div_Code") %>' AutoPostBack="True" OnSelectedIndexChanged="dboDivision_SelectedIndexChanged1">
                                        <asp:ListItem Value="" Text="Select Division"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:HiddenField ID="hidDistrict" Value='<%# Eval("Dist_Code") %>' runat="server" />
                                    <asp:HiddenField ID="hidThana" Value='<%# Eval("Thana_Code") %>' runat="server" />
                                    <asp:SqlDataSource ID="SqlDataSourceDistrict" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                        SelectCommand="SELECT DIST_CODE, DIST_NAME FROM [dbo].[BD_District] WHERE DIV_CODE = @DIV_CODE ORDER BY DIST_NAME">
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
                                    <a href='GoogleMap.aspx?atm=<%# Eval("ID") %>' target="_blank">
                                        <%# Eval("Latitude", "View in Google Map")%></a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Font-Bold="true" Font-Size="Small" />
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="By" InsertVisible="False" SortExpression="DT">
                                <ItemTemplate>
                                    <uc2:EMP ID="EMP1" runat="server" Username='<%# Eval("UpdateBy") %>' />
                                    , On: <span title='<%# Eval("DT","{0:dddd, \ndd MMMM, yyyy \nh:mm:ss tt}") %>'>
                                        <%# Common.ToRecentDateTime(Eval("DT"))%>
                                        <span class="time-small" style="margin: 0px 15px 0px 5px">
                                            <%# Common.ToRelativeDate(Eval("DT"))%></span> </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" ControlStyle-Width="100px">
                                <EditItemTemplate>
                                    <asp:CheckBox runat="server" ID="chkIsActive" Text="Active" Checked='<%# Bind("IsActive") %>' />
                                    <asp:Button ID="cmdUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    <asp:ConfirmButtonExtender ID="cmdUpdate_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                                        Enabled="True" TargetControlID="cmdUpdate">
                                    </asp:ConfirmButtonExtender>
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:CheckBox runat="server" ID="chkIsActive" Text="Active" Checked='<%# Bind("IsActive") %>' />
                                    <asp:Button ID="cmdInsert" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    <asp:ConfirmButtonExtender ID="cmdInsert_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Save?"
                                        Enabled="True" TargetControlID="cmdInsert">
                                    </asp:ConfirmButtonExtender>
                                    &nbsp;<asp:Button ID="cmdCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="chkIsActive" Text="Active" Checked='<%# Bind("IsActive") %>' />
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
                InsertCommand="sp_ATM_Insert" InsertCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                SelectCommand="SELECT * FROM v_ATM WHERE (ID = @ID AND Type='CDM')" UpdateCommand="sp_ATM_Update"
                UpdateCommandType="StoredProcedure" OnUpdating="SqlDataSource2_Updating">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="FeedingBranch" />
                    <asp:Parameter Name="LinkVendor1" />
                    <asp:Parameter Name="LinkVendor2" />
                    <asp:Parameter Name="Div_Code" />
                    <asp:Parameter Name="Dist_Code" />
                    <asp:Parameter Name="Thana_Code" />
                    <asp:Parameter Name="ITCL_ATM_ID" DefaultValue='0' />
                    <asp:Parameter Name="MinimumAtmBalance" Type="Decimal" DefaultValue='0' />
                    <asp:Parameter Name="Type" DefaultValue="CDM" />
                    <asp:Parameter Name="Latitude" />
                    <asp:Parameter Name="Longitude" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:SessionParameter Name="UpdateBy" SessionField="EMPID" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="FeedingBranch" />
                    <asp:Parameter Name="LinkVendor1" />
                    <asp:Parameter Name="LinkVendor2" />
                    <asp:Parameter Name="Div_Code" />
                    <asp:Parameter Name="Dist_Code" />
                    <asp:Parameter Name="Thana_Code" />
                    <asp:Parameter Name="ITCL_ATM_ID" />
                    <asp:Parameter Name="MinimumAtmBalance" Type="Decimal" />
                    <asp:Parameter Name="Type" DefaultValue="CDM" />
                    <asp:Parameter Name="Latitude" />
                    <asp:Parameter Name="Longitude" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:SessionParameter Name="UpdateBy" SessionField="EMPID" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceVendor" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="SELECT [ID], [VendorName] FROM [V_Vendors] WHERE TYPEID = 1 ORDER BY [VendorName]">
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
