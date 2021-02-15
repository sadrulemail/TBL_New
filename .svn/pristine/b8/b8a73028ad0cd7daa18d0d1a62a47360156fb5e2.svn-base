<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="TrustYouniverse.aspx.cs" Inherits="TrustYouniverse" EnableEventValidation="false"
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
    
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table><td valign="top">
                <table>
        <tr>
            <td style="width: 40px">
                <a href="Default.aspx" class="button1">
                    <img src="Images/Previous.gif" width="32px" height="32px" alt="Back" border="0" />
                </a>
            </td>
            <td style="font-size:x-large;font-weight:bold">
                Trust Youniverse
            </td>
        </tr>
    </table>
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
                                <td>
                                    <asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" Style="font-weight: 700" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
                </td><td style="padding-left:20px">
                    <a href="Images/Trust-Youniverse-Banner.png" target="_blank"><img src="Images/Trust-Youniverse-Banner.png" height="150" /></a></td></table>
            <br />
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" 
                AllowSorting="True" EnableViewState="false"
                CssClass="Grid" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1"
                ForeColor="Black" PagerSettings-Position="TopAndBottom" Style="font-size: small"
                Width="700px" OnDataBound="GridView1_DataBound" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" SortExpression="ID">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    
                    <asp:TemplateField HeaderText="Company Name" SortExpression="CompanyName">
                        <ItemTemplate>
                            <div style="font-weight: bold; font-size: 140%">                                
                                    <%# Eval("CompanyName") %></div>
                            <div style="max-width: 350px;margin-left:30px">
                                <%#  getBranchAddress(Eval("Address")) %>
                                <%#  Eval("ContactInfo","<div>Contact: {0}</div>")%>
                                <%#  Eval("Email", "<div>Email: {0}</div>")%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Discount" SortExpression="DiscountDetails">
                        <ItemTemplate>
                            <%# Eval("DiscountDetails") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EMI" SortExpression="EMI">
                        <ItemTemplate>
                            <%# (Eval("EMI").ToString() == "True" ? "<img src='Images/tick2.png' title='EMI' width='16px' height='16px'>" : "")%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="" HeaderStyle-Font-Bold="true">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
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
                Font-Bold="true" OnClick="cmdExport_Click" Visible="false" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommandType="StoredProcedure" SelectCommand="s_TrustYouniverse_Browse" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                OnSelected="SqlDataSource1_Selected">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="Filter" PropertyName="Text" DefaultValue=""
                        Type="String" ConvertEmptyStringToNull="false" />
                    
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
                        ForeColor="Black" AutoGenerateRows="False" DataKeyNames="ID" OnItemInserted="DetailsView1_ItemInserted"
                        OnItemUpdated="DetailsView1_ItemUpdated" OnModeChanged="DetailsView1_ModeChanged"
                        OnDataBound="DetailsView1_DataBound">
                        <FooterStyle BackColor="#CCCC99" />
                        <RowStyle BackColor="#F7F7DE" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <Fields>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID"
                                ReadOnly="true" InsertVisible="false" >
                                <ItemStyle />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Company Name" SortExpression="CompanyName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCompanyName" runat="server" Text='<%# Bind("CompanyName") %>' Width="400px"
                                        MaxLength="200"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtCompanyName" runat="server" Text='<%# Bind("CompanyName") %>' Width="400px"
                                        MaxLength="200"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>                                    
                                        <%# Eval("CompanyName") %>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Font-Bold="true" Font-Size="Medium" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" Font-Names="Arial" runat="server" Text='<%# Bind("Address") %>'
                                        TextMode="MultiLine" Width="300px" Rows="3"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddress" Font-Names="Arial" runat="server" Text='<%# Bind("Address") %>'
                                        TextMode="MultiLine" Width="300px" Rows="3"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("Address").ToString().Replace("\n", "<br>") %>
                                </ItemTemplate>
                                <HeaderStyle VerticalAlign="Top" />
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="Contact Info" >
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtContactInfo" Font-Names="Arial" runat="server" Text='<%# Bind("ContactInfo") %>'
                                        TextMode="MultiLine" Width="300px" Rows="3"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtContactInfo" Font-Names="Arial" runat="server" Text='<%# Bind("ContactInfo") %>'
                                        TextMode="MultiLine" Width="300px" Rows="3"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("ContactInfo").ToString().Replace("\n", "<br>") %>
                                </ItemTemplate>
                                <HeaderStyle VerticalAlign="Top" />
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Discount Details" >
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDiscountDetails" Font-Names="Arial" runat="server" Text='<%# Bind("DiscountDetails") %>'
                                        TextMode="MultiLine" Width="300px" Rows="3"></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtDiscountDetails" Font-Names="Arial" runat="server" Text='<%# Bind("DiscountDetails") %>'
                                        TextMode="MultiLine" Width="300px" Rows="3"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("DiscountDetails").ToString().Replace("\n", "<br>") %>
                                </ItemTemplate>
                                <HeaderStyle VerticalAlign="Top" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Url" >
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUrl" Font-Names="Arial" runat="server" Text='<%# Bind("Url") %>'
                                        TextMode="SingleLine" Width="300px" ></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtUrl" Font-Names="Arial" runat="server" Text='<%# Bind("Url") %>'
                                        TextMode="SingleLine" Width="300px" ></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("Url","<a href='{0}' target='_blank'>{0}<a>") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email" >
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" Font-Names="Arial" runat="server" Text='<%# Bind("Email") %>'
                                        TextMode="SingleLine" Width="300px" ></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtEmail" Font-Names="Arial" runat="server" Text='<%# Bind("Email") %>'
                                        TextMode="SingleLine" Width="300px" ></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("Email") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Logo" >
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtLogo" Font-Names="Arial" runat="server" Text='<%# Bind("Logo") %>'
                                        TextMode="SingleLine" Width="300px" ></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtLogo" Font-Names="Arial" runat="server" Text='<%# Bind("Logo") %>'
                                        TextMode="SingleLine" Width="300px" ></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <img src='<%# Eval("Logo") %>' style="max-height:40px;max-width:120px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            

                            <asp:TemplateField HeaderText="EMI" SortExpression="EMI">
                                <ItemTemplate>
                                    <%# (Eval("EMI").ToString() == "True" ? "<img src='Images/tick2.png' width='16px' height='16px'>" : "")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList runat="server" ID="DboEMI" SelectedValue='<%# Bind("EMI") %>'>                                        
                                        <asp:ListItem Text="N" Value="False"></asp:ListItem>
                                        <asp:ListItem Text="Y" Value="True"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList runat="server" ID="DboEMI" SelectedValue='<%# Bind("EMI") %>'>                                        
                                        <asp:ListItem Text="N" Value="False"></asp:ListItem>
                                        <asp:ListItem Text="Y" Value="True"></asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>                            
                            <asp:TemplateField HeaderText="Map" >
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
                                    <a href='GoogleMapTrustYouniverse.aspx?id=<%# Eval("ID") %>' target="_blank">
                                        <%# Eval("Latitude", "View in Google Map")%></a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Font-Bold="true" Font-Size="Small" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="By" SortExpression="InsertDT" InsertVisible="false" Visible="false">
                                <ItemTemplate>
                                    <uc2:EMP ID="EMP1" runat="server" Username='<%# Eval("InsertBy") %>' />
                                    , On: <span title='<%# Eval("InsertDT","{0:dddd, \ndd MMMM, yyyy \nh:mm:ss tt}") %>'>
                                        <%# Common.ToRecentDateTime(Eval("InsertDT"))%>
                                        <span class="time-small" style="margin: 0px 15px 0px 5px">
                                            <%# Common.ToRelativeDate(Eval("InsertDT"))%></span> </span>
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
                InsertCommand="s_TrustYouniverse_Add" InsertCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                SelectCommand="s_TrustYouniverse_Browse" SelectCommandType="StoredProcedure" UpdateCommand="s_TrustYouniverse_Update"
                UpdateCommandType="StoredProcedure" OnUpdating="SqlDataSource2_Updating">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>                    
                    <asp:SessionParameter Name="InsertBy" SessionField="EMPID" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="InsertBy" SessionField="EMPID" />
                </InsertParameters>
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
