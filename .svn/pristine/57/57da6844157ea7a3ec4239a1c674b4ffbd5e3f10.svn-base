<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="BEFTN.aspx.cs" Inherits="BEFTN_List_Show" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Src="EMP.ascx" TagName="EMP" TagPrefix="uc2" %>
<%@ Register Src="BEFTN.ascx" TagName="BEFTN" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                <a href="Default.aspx" class="button1">
                    <img src="Images/Previous.gif" alt="Back" border="0" width="32" height="32" /></a>
            </td>
            <td>
                Bangladesh Electronic Fund Transfer Network (BEFTN) Routing Numbers
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:TabContainer ID="TabContainer1" runat="server" CssClass="NewsTab" ActiveTabIndex="0"
                OnDemand="true">
                <asp:TabPanel ID="tab1" runat="server" HeaderText="Branch List">
                    <HeaderTemplate>
                        Branch List</HeaderTemplate>
                    <ContentTemplate>
                        <div class="Panel1 ui-corner-all">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtFilter" runat="server" AutoPostBack="True" onfocus="this.select()"
                                            Width="200px" placeholder="enter information to filter"></asp:TextBox>
                                    </td>
                                    <td style="padding-left: 10px">
                                        Location:
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="SqlDataSourceDivision1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT DIV_CODE, DIV_NAME FROM [dbo].[BD_Division]"></asp:SqlDataSource>
                                        <asp:DropDownList ID="dboDivision1" runat="server" DataSourceID="SqlDataSourceDivision1"
                                            ToolTip="Division" DataTextField="DIV_NAME" DataValueField="DIV_CODE" AppendDataBoundItems="True">
                                            <asp:ListItem Text="All Division" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="dboDistrict1" runat="server" SelectedValue='<%# Eval("Dist_Code") %>'
                                            ToolTip="District">
                                        </asp:DropDownList>
                                        <asp:CascadingDropDown ID="CascadingDropDown1" runat="server" TargetControlID="dboDistrict1"
                                            Category="District" PromptText="All District" ServicePath="WebService.asmx" LoadingText="Loading..."
                                            ServiceMethod="GetDropDownContents_District" ParentControlID="dboDivision1" Enabled="True" />
                                        <asp:DropDownList ID="dboThana1" runat="server" SelectedValue='<%# Eval("Thana_Code") %>'
                                            ToolTip="Thana">
                                        </asp:DropDownList>
                                        <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" TargetControlID="dboThana1"
                                            Category="Thana" PromptText="All Thana" ServicePath="WebService.asmx" LoadingText="Loading..."
                                            ServiceMethod="GetDropDownContents_Thana" ParentControlID="dboDistrict1" Enabled="True" />
                                    </td>
                                    <td>
                                        <asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" Font-Bold="True" />
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        Bank Name:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cboBank" runat="server" DataSourceID="SqlDataSourceBank" AppendDataBoundItems="True"
                                            AutoPostBack="True" DataTextField="Bank_Name" DataValueField="BEFTN_Bank_Code">
                                            <asp:ListItem Text="ALL BANKS" Value="*"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceBank" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="sp_BEFTN_Banks" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <asp:HiddenField ID="hidID" runat="server" />
                        <asp:GridView ID="GridView1" runat="server" Width="100%" DataSourceID="SqlDataSource1"
                            DataKeyNames="Routing_Number" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                            BorderStyle="Solid" OnRowCommand="GridView1_RowCommand" BorderWidth="1px" CellPadding="3"
                            ForeColor="Black" Style="font-size: small; font-family: Arial, Helvetica, sans-serif"
                            AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                            PageSize="30" CssClass="Grid" OnDataBound="GridView1_DataBound"
                             OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
                            OnPageIndexChanged="GridView1_PageIndexChanged" EnableSortingAndPagingCallbacks="True">
                            <PagerSettings Position="TopAndBottom" Mode="NumericFirstLast" PageButtonCount="30" />
                            <SelectedRowStyle BackColor="#FFA200" />
                            <RowStyle BackColor="#F7F7DE" />
                            <Columns>
                                <asp:BoundField DataField="Bank_Code" HeaderText="Bank Code" SortExpression="Bank_Code"
                                    ReadOnly="True" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Bank_Name" HeaderText="Bank Name" SortExpression="Bank_Name"
                                    ReadOnly="True" HtmlEncode="False" />
                                <asp:BoundField DataField="Branch_Name" HeaderText="Branch Name" SortExpression="Branch_Name"
                                    ReadOnly="True" HtmlEncode="False" />
                                <asp:TemplateField HeaderText="Routing Code">
                                    <ItemTemplate>
                                        <uc3:BEFTN ID="BEFTN1" runat="server" Code='<%# Eval("Routing_Number_Highlight") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="DIV_NAME" HeaderText="Division" SortExpression="DIV_NAME"
                                    ReadOnly="True" HtmlEncode="False" />
                                <asp:BoundField DataField="DIST_NAME" HeaderText="District" SortExpression="DIST_NAME"
                                    ReadOnly="True" HtmlEncode="False" />
                                <asp:BoundField DataField="THANA_NAME" HeaderText="Thana" SortExpression="THANA_NAME"
                                    ReadOnly="True" HtmlEncode="False" />
                                <asp:BoundField DataField="Remittance_Branch" HeaderText="Remittance Branch" SortExpression="Remittance_Branch"
                                    ReadOnly="True" HtmlEncode="False" />
                                <asp:TemplateField HeaderText="DT" SortExpression="DT">
                                    <ItemTemplate>
                                        <div title='<%# Eval("DT","{0:dddd \ndd MMMM, yyyy \nh:mm:ss tt}") %>'>
                                            <time class='timeago' datetime='<%# Eval("DT", "{0:yyyy-MM-dd HH:mm:ss}") %>'></time>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField Visible="False" ShowSelectButton="True" />
                                <asp:TemplateField Visible="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("Routing_Number") %>'
                                            Height="20px" ToolTip="Open" CausesValidation="false">
                                            <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                            <EmptyDataTemplate>
                                No match found.
                            </EmptyDataTemplate>
                            <EmptyDataRowStyle Height="50px" Font-Size="Larger" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="sp_BEFTN_Codes_Search" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtFilter" Name="Filter" PropertyName="Text" Type="String"
                                    DefaultValue="" ConvertEmptyStringToNull="False" />
                                <asp:ControlParameter ControlID="cboBank" Name="BankCode" PropertyName="SelectedValue"
                                    Type="String" DefaultValue="" ConvertEmptyStringToNull="False" />
                                <asp:ControlParameter ControlID="dboDivision1" Name="Div_Code" PropertyName="SelectedValue"
                                    DefaultValue="0" Type="Int32" />
                                <asp:ControlParameter ControlID="dboDistrict1" Name="Dist_Code" PropertyName="SelectedValue"
                                    DefaultValue="0" Type="Int32" />
                                <asp:ControlParameter ControlID="dboThana1" Name="Thana_Code" PropertyName="SelectedValue"
                                    DefaultValue="0" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div style="padding: 10px">
                            <asp:Label ID="lblStatus" runat="server" Font-Size="Small"></asp:Label>
                        </div>
                        <br />
                        <span style="visibility: hidden">
                            <asp:Button runat="server" ID="cmdPopup" /></span>
                        <asp:ModalPopupExtender ID="modal" runat="server" CancelControlID="ModalClose" TargetControlID="cmdPopup"
                            PopupControlID="ModalPanel" BackgroundCssClass="ModalPopupBG" PopupDragHandleControlID="ModalTitleBar"
                            RepositionMode="RepositionOnWindowResize" Y="20" Drag="True" DynamicServicePath=""
                            Enabled="True">
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
                                    BorderStyle="Solid" BorderWidth="1px" CssClass="Grid" CellPadding="4" DataSourceID="SqlDataSourceModal"
                                    ForeColor="Black" AutoGenerateRows="False" DataKeyNames="Routing_Number" OnItemInserted="DetailsView1_ItemInserted"
                                    OnItemUpdated="DetailsView1_ItemUpdated" OnModeChanged="DetailsView1_ModeChanged"
                                    OnItemCommand="DetailsView1_ItemCommand" OnItemInserting="DetailsView1_ItemInserting">
                                    <FooterStyle BackColor="#CCCC99" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <Fields>
                                        <asp:TemplateField HeaderText="Bank Code" InsertVisible="False" SortExpression="Bank_Code">
                                            <ItemTemplate>
                                                <%# Eval("Bank_Code") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <%--<asp:Label ID="lblBank_Code" runat="server" Font-Bold="true" Text='<%# Eval("Bank_Code") %>' Font-Size="Larger"></asp:Label>                                    --%>
                                                <%# Eval("Bank_Code") %>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bank Name" SortExpression="BankName">
                                            <ItemTemplate>
                                                <%# Eval("Bank_Name")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <%# Eval("Bank_Name")%>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:DropDownList ID="cboBankModal" runat="server" DataSourceID="SqlDataSourceBank"
                                                    AppendDataBoundItems="true" SelectedValue='<%# Bind("BEFTN_Bank_Code") %>' AutoPostBack="false"
                                                    DataTextField="Bank_Name" DataValueField="BEFTN_Bank_Code">
                                                    <asp:ListItem></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBank" runat="server" ControlToValidate="cboBankModal"
                                                    ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Branch Name" SortExpression="Branch_Name">
                                            <ItemTemplate>
                                                <%# Eval("Branch_Name")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtBranch" Font-Names="Arial" runat="server" Text='<%# Bind("Branch_Name") %>'
                                                    Width="380px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBranchname" runat="server"
                                                    ControlToValidate="txtBranch" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="txtBranch" Font-Names="Arial" runat="server" Text='<%# Bind("Branch_Name") %>'
                                                    Width="380px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBranchname" runat="server"
                                                    ControlToValidate="txtBranch" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Routing Number" SortExpression="Routing_Number">
                                            <ItemTemplate>
                                                <%# Eval("Routing_Number")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="txtRouting" runat="server" Font-Bold="true" Font-Names="Arial" Text='<%# Bind("Routing_Number") %>'
                                                    Width="100px"></asp:Label>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="txtRouting" runat="server" Font-Names="Arial" MaxLength="9" Text='<%# Bind("Routing_Number") %>'
                                                    Width="100px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRouting" runat="server" ControlToValidate="txtRouting"
                                                    ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </InsertItemTemplate>
                                            <HeaderStyle VerticalAlign="Middle" />
                                            <ItemStyle Font-Bold="True" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Branch Code" SortExpression="Branch_Code">
                                            <ItemTemplate>
                                                <%# Eval("Branch_Code")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtBranchCode" Font-Names="Arial" runat="server" Text='<%# Bind("Branch_Code") %>'
                                                    Width="100px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBranchCode" runat="server"
                                                    ControlToValidate="txtBranchCode" ErrorMessage="*" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="txtBranchCode" Font-Names="Arial" runat="server" Text='<%# Bind("Branch_Code") %>'
                                                    Width="100px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBranchCode" runat="server"
                                                    ControlToValidate="txtBranchCode" ErrorMessage="*" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remittance Branch" SortExpression="Remittance_Branch">
                                            <ItemTemplate>
                                                <%# Eval("Remittance_Branch")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtRemittance_Branch" Font-Names="Arial" runat="server" Text='<%# Bind("Remittance_Branch") %>'
                                                    Width="100px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRemittance_Branch" runat="server"
                                                    ControlToValidate="txtRemittance_Branch" ErrorMessage="*" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="txtRemittance_Branch" Font-Names="Arial" runat="server" Text='<%# Bind("Remittance_Branch") %>'
                                                    Width="100px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRemittance_Branch" runat="server"
                                                    ControlToValidate="txtRemittance_Branch" ErrorMessage="*" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Region" SortExpression="Region_Name">
                                            <ItemTemplate>
                                                <%# Eval("Region_Name")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:SqlDataSource ID="SqlDataSourceRegion" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                                    SelectCommand="SELECT Region_Code, Region_Name FROM [dbo].[BD_Region]"></asp:SqlDataSource>
                                                <asp:DropDownList ID="cboRegion1" runat="server" CausesValidation="True" AppendDataBoundItems="True"
                                                    DataSourceID="SqlDataSourceRegion" DataTextField="Region_Name" DataValueField="Region_Code"
                                                    SelectedValue='<%# Bind("Region_Code") %>'>
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:SqlDataSource ID="SqlDataSourceRegion" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                                    SelectCommand="SELECT Region_Code, Region_Name FROM [dbo].[BD_Region]"></asp:SqlDataSource>
                                                <asp:DropDownList ID="cboRegion1" runat="server" CausesValidation="True" AppendDataBoundItems="True"
                                                    DataSourceID="SqlDataSourceRegion" DataTextField="Region_Name" DataValueField="Region_Code"
                                                    SelectedValue='<%# Bind("Region_Code") %>'>
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </InsertItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
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
                                                <asp:DropDownList ID="dboDivision2" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                                    DataSourceID="SqlDataSourceDivision" DataTextField="DIV_NAME" DataValueField="DIV_CODE"
                                                    OnDataBound="dboDivision2_DataBound" OnSelectedIndexChanged="dboDivision2_SelectedIndexChanged1"
                                                    SelectedValue='<%# Bind("Div_Code") %>'>
                                                    <asp:ListItem Text="Select Division" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="hidDistrict" runat="server" Value='<%# Eval("Dist_Code") %>' />
                                                <asp:HiddenField ID="hidThana" runat="server" Value='<%# Eval("Thana_Code") %>' />
                                                <asp:SqlDataSource ID="SqlDataSourceDistrict" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                                    SelectCommand="SELECT DIST_CODE, DIST_NAME FROM [dbo].[BD_District] WHERE DIV_CODE = @DIV_CODE ORDER BY DIST_NAME">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="dboDivision2" Name="DIV_CODE" PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:DropDownList ID="dboDistrict2" runat="server" AutoPostBack="True" CausesValidation="false"
                                                    DataSourceID="SqlDataSourceDistrict" DataTextField="DIST_Name" DataValueField="DIST_CODE"
                                                    EnableViewState="true" OnDataBound="dboDistrict2_DataBound" OnSelectedIndexChanged="dboDistrict2_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSourceThana" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                                    SelectCommand="SELECT [THANA_CODE],[THANA_NAME] FROM [dbo].[BD_Thana] WHERE DIST_CODE = @DIST_CODE ORDER BY THANA_NAME">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="dboDistrict2" Name="DIST_CODE" PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:DropDownList ID="dboThana2" runat="server" DataSourceID="SqlDataSourceThana"
                                                    DataTextField="THANA_NAME" DataValueField="THANA_CODE" OnDataBound="dboThana2_DataBound">
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <HeaderTemplate>
                                                Location:
                                                <img height="16" src="Images/green-dot.png" width="16" />
                                            </HeaderTemplate>
                                            <InsertItemTemplate>
                                                <asp:SqlDataSource ID="SqlDataSourceDivision" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                                    SelectCommand="SELECT DIV_CODE, DIV_NAME FROM [dbo].[BD_Division]"></asp:SqlDataSource>
                                                <asp:DropDownList ID="dboDivision2" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSourceDivision"
                                                    DataTextField="DIV_NAME" DataValueField="DIV_CODE" SelectedValue='<%# Bind("Div_Code") %>'>
                                                    <asp:ListItem Text="Select Division" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="dboDistrict2" runat="server" SelectedValue='<%# Bind("Dist_Code") %>'>
                                                </asp:DropDownList>
                                                <asp:CascadingDropDown ID="CascadingDropDown1" runat="server" Category="District"
                                                    LoadingText="Loading..." ParentControlID="dboDivision2" PromptText="Select District"
                                                    ServiceMethod="GetDropDownContents_District" ServicePath="WebService.asmx" TargetControlID="dboDistrict2" />
                                                <asp:DropDownList ID="dboThana2" runat="server" SelectedValue='<%# Bind("Thana_Code") %>'>
                                                </asp:DropDownList>
                                                <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="Thana" LoadingText="Loading..."
                                                    ParentControlID="dboDistrict2" PromptText="Select Thana" ServiceMethod="GetDropDownContents_Thana"
                                                    ServicePath="WebService.asmx" TargetControlID="dboThana2" />
                                            </InsertItemTemplate>
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
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:Button ID="Button11" runat="server" CausesValidation="False" CommandName="Edit"
                                                    Text="Edit" />
                                                &nbsp;<asp:Button ID="Button22" runat="server" CausesValidation="False" CommandName="New"
                                                    Text="New" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Button ID="cmdUpdate2" runat="server" CausesValidation="True" CommandName="Update"
                                                    Text="Update" />
                                                <asp:ConfirmButtonExtender ID="cmdUpdate2_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                                                    Enabled="True" TargetControlID="cmdUpdate2">
                                                </asp:ConfirmButtonExtender>
                                                &nbsp;<asp:Button ID="Buttoncancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancel" />
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:Button ID="cmdInsert2" runat="server" CausesValidation="True" CommandName="Insert"
                                                    Text="Insert" />
                                                <asp:ConfirmButtonExtender ID="cmdInsert2_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Save?"
                                                    Enabled="True" TargetControlID="cmdInsert2">
                                                </asp:ConfirmButtonExtender>
                                                &nbsp;<asp:Button ID="cmdCancel4" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancel" />
                                            </InsertItemTemplate>
                                            <ControlStyle Width="100px" />
                                        </asp:TemplateField>
                                    </Fields>
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" />
                                </asp:DetailsView>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSourceModal" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                InsertCommand="sp_BEFTNList_Add" InsertCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                                SelectCommand="sp_BEFTN_Codes_Select" SelectCommandType="StoredProcedure" UpdateCommand="sp_BEFTN_Codes_Update"
                                UpdateCommandType="StoredProcedure" OnInserting="SqlDataSourceModal_Updating"
                                OnUpdating="SqlDataSourceModal_Updating" OnUpdated="SqlDataSourceModal_Updated">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hidID" Name="Routing_Number" PropertyName="Value" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Branch_Name" />
                                    <asp:Parameter Name="Branch_code" />
                                    <asp:Parameter Name="Region_Code" />
                                    <asp:Parameter Name="Div_Code" />
                                    <asp:Parameter Name="Dist_Code" />
                                    <asp:Parameter Name="Thana_Code" />
                                    <asp:Parameter Name="Remittance_Branch" Type="String" />
                                    <asp:Parameter Name="Routing_Number" Type="String" />
                                    <asp:SessionParameter Name="UpdateBy" SessionField="EMPID" Type="String" />
                                    <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" Size="255" DefaultValue="" />
                                    <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="BEFTN_Bank_Code" />
                                    <asp:Parameter Name="Branch_Name" />
                                    <asp:Parameter Name="Branch_code" />
                                    <asp:Parameter Name="Region_Code" />
                                    <asp:Parameter Name="Div_Code" />
                                    <asp:Parameter Name="Dist_Code" />
                                    <asp:Parameter Name="Thana_Code" />
                                    <asp:Parameter Name="Remittance_Branch" Type="String" />
                                    <asp:Parameter Name="Routing_Number" Type="String" />
                                    <asp:SessionParameter Name="UpdateBy" SessionField="EMPID" Type="String" />
                                    <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" Size="255" DefaultValue="" />
                                    <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tab2" runat="server">
                    <HeaderTemplate>
                        Bank List</HeaderTemplate>
                    <ContentTemplate>
                        <table class="Panel1">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtBankFilter" runat="server" placeholder="enter information to filter"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="cmdBankFilter" runat="server" Text="Filter" Width="80px" />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px"
                            Width="100%" Font-Size="Small" CellPadding="4" DataSourceID="SqlDataSource2"
                            CssClass="Grid">
                            <Columns>
                                <asp:TemplateField HeaderText="Logo">
                                    <ItemTemplate>
                                        <img alt="" height="50" style="min-width: 20px" class="wait" src='BankLogo/<%# Eval("BEFTN_Bank_Code") %>.jpg' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:HyperLinkField DataTextField="Bank_Name" DataNavigateUrlFields="WebAddress"
                                    Target="_blank" HeaderText="Bank Name" SortExpression="Bank_Name" />
                                <asp:BoundField DataField="Bank_Code" HeaderText="BEFTN Bank Code" SortExpression="Bank_Code"
                                    HtmlEncode="false">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="False" ForeColor="#FFFFCC" HorizontalAlign="Center" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="sp_BEFTN_Banks" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource2_Selected">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtBankFilter" PropertyName="Text" Name="Filter"
                                    DefaultValue="*" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div style="padding: 10px">
                            <asp:Label ID="lblStatusBank" runat="server"></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
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
