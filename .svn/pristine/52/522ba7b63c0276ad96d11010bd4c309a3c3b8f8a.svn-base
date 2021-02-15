<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Notice.aspx.cs" Inherits="Notice" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content4" ContentPlaceHolderID="head" runat="Server">
<script src="script/jquery-ui-timepicker-addon.js" type="text/javascript"></script>  

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitle" runat="Server">
    <table>
        <tr>
            <td style="width: 40px">
                <a href="Default.aspx" class="button1">
                    <img src="Images/Previous.gif" alt="Back" border="0" /></a>
            </td>
            <td>
                Notice Board
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DetailsView ID="DetailsView1" runat="server" DefaultMode="Insert" AutoGenerateRows="False"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid" BorderWidth="1px"
                Width="650px"
                CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="Black">
                <FooterStyle BackColor="#CCCC99" />
                <RowStyle  />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" />
                    <asp:TemplateField HeaderText="Notice" SortExpression="Notice" HeaderStyle-VerticalAlign="Top">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Notice") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <CKEditor:CKEditorControl ID="CKEditor1" runat="server" TextMode="MultiLine" Text='<%# Bind("Notice") %>'
                                EnterMode="DIV" ToolbarCanCollapse="False" Width="550px" Height="200px" Toolbar="
Undo|Redo|-|Find|Replace|-|SelectAll|RemoveFormat
Bold|Italic|Underline|Strike|-|Subscript|Superscript
Link|Unlink
|Smiley|SpecialChar
Source
"></CKEditor:CKEditorControl>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <CKEditor:CKEditorControl ID="CKEditor1" runat="server" TextMode="MultiLine" Text='<%# Bind("Notice") %>'
                                EnterMode="DIV" ToolbarCanCollapse="False" Width="550px" Height="200px" Toolbar="
Undo|Redo|-|Find|Replace|-|SelectAll|RemoveFormat
Bold|Italic|Underline|Strike|-|Subscript|Superscript
Link|Unlink
|Smiley|SpecialChar
Source
"></CKEditor:CKEditorControl>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Tooltips" HeaderText="Tooltips" ControlStyle-Width="550px"
                        SortExpression="Tooltips">
                        <ControlStyle Width="540px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Publish DT">
                        <ItemTemplate>
                            <%# Eval("PublishedDT", "{0:dd/MM/yyyy hh:mm tt}")%>
                            <%# Eval("EndDT", " to {0:dd/MM/yyyy hh:mm tt}")%>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox class="DateTime" runat="server" ID="txtPublishedDT" Text='<%# Bind("PublishedDT", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator class="hasDatepicker" ID="RequiredFieldValidatorVISITED_DT" runat="server"
                                ControlToValidate="txtPublishedDT" ErrorMessage="*">*</asp:RequiredFieldValidator>
                            to
                            <asp:TextBox runat="server" class="DateTime" ID="txtEndDT" Text='<%# Bind("EndDT", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" class="DateTime" ID="txtPublishedDT" Text='<%# Bind("PublishedDT", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorVISITED_DT" runat="server"
                                ControlToValidate="txtPublishedDT" ErrorMessage="*">*</asp:RequiredFieldValidator>
                            to
                            <asp:TextBox runat="server" class="DateTime" ID="txtEndDT" Text='<%# Bind("EndDT", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Highlight DT" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <%# Eval("HighlightStart", "{0:dd/MM/yyyy hh:mm tt}")%>
                            <%# Eval("HighlightStop", " to {0:dd/MM/yyyy hh:mm tt}")%>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox runat="server" class="DateTime" ID="txtHighlightStart" Text='<%# Bind("HighlightStart", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:TextBox>                            
                            to
                            <asp:TextBox runat="server" class="DateTime" ID="txtHighlightStop" Text='<%# Bind("HighlightStop", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" class="DateTime" ID="txtHighlightStart" Text='<%# Bind("HighlightStart", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:TextBox>                            
                            to
                            <asp:TextBox runat="server" class="DateTime" ID="txtHighlightStop" Text='<%# Bind("HighlightStop", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active">
                        <ItemTemplate>
                            <%# Eval("Active")%>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList runat="server" ID="cboActive" SelectedValue='<%# Bind("Active") %>'>
                                <asp:ListItem Value="Y" Text="Y"></asp:ListItem>
                                <asp:ListItem Value="N" Text="N"></asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="cboActive" SelectedValue='<%# Bind("Active") %>'>
                                <asp:ListItem Value="Y" Text="Y"></asp:ListItem>
                                <asp:ListItem Value="N" Text="N"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <%# Eval("Category")%>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList runat="server" ID="cboCategory" SelectedValue='<%# Bind("Category") %>'>
                                <asp:ListItem Text="intraweb" Value="intraweb"></asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="cboCategory" SelectedValue='<%# Bind("Category") %>'>
                                <asp:ListItem Text="intraweb" Value="intraweb"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" InsertVisible="false"
                        ReadOnly="true" />
                    <asp:TemplateField ShowHeader="False" ControlStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="Edit" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New"
                                Text="New" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                            <asp:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                                Enabled="True" TargetControlID="Button1">
                            </asp:ConfirmButtonExtender>
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                            <asp:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Save?"
                                Enabled="True" TargetControlID="Button1">
                            </asp:ConfirmButtonExtender>
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancel" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="SELECT * FROM [Notice] WHERE ([ID] = @ID)" UpdateCommand="sp_Notice_AddEdit"
                UpdateCommandType="StoredProcedure" InsertCommand="sp_Notice_AddEdit" InsertCommandType="StoredProcedure"
                OnInserted="SqlDataSource1_Inserted" OnUpdated="SqlDataSource1_Updated">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="Notice" Type="String" />
                    <asp:Parameter Name="Tooltips" Type="String" />
                    <asp:Parameter Name="PublishedDT" Type="DateTime" />
                    <asp:Parameter Name="Active" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:SessionParameter Name="EmpID" SessionField="EMPID" Type="String" />
                    <asp:Parameter Name="EndDT" Type="DateTime" />
                    <asp:Parameter Name="HighlightStart" Type="DateTime" />
                    <asp:Parameter Name="HighlightStop" Type="DateTime" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="ID" Type="Int32" />
                    <asp:Parameter DefaultValue="" Name="Notice" Type="String" />
                    <asp:Parameter Name="Tooltips" Type="String" />
                    <asp:Parameter Name="PublishedDT" Type="DateTime" />
                    <asp:Parameter Name="Active" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:SessionParameter Name="EmpID" SessionField="EMPID" Type="String" />
                    <asp:Parameter Name="EndDT" Type="DateTime" />
                    <asp:Parameter Name="HighlightStart" Type="DateTime" />
                    <asp:Parameter Name="HighlightStop" Type="DateTime" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <div style="font-size: small; background-color: #FAFAD2">
                <table>
                    <tr>
                        <td>
                            Filter:
                        </td>
                        <td>
                            <asp:TextBox ID="txtFilter" runat="server" AutoPostBack="True" OnTextChanged="txtFilter_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                CssClass="Grid" DataKeyNames="ID" DataSourceID="SqlDataSourceNotice" BackColor="LightGoldenrodYellow"
                PagerSettings-Mode="NumericFirstLast" PagerSettings-Position="TopAndBottom" BorderColor="Tan"
                BorderWidth="1px" CellPadding="4" ForeColor="Black" Style="font-size: small"
                AllowSorting="True" AllowPaging="True" HeaderStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Top"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="20">
                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                <RowStyle VerticalAlign="Top" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" ControlStyle-Width="70px" />
                    <asp:TemplateField HeaderText="Notice" SortExpression="Notice">
                        <ItemTemplate>
                            <%# Eval("Notice")%>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tooltips" SortExpression="Tooltips">
                        <ItemTemplate>
                            <%# Eval("Tooltips") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publish" SortExpression="PublishedDT" ItemStyle-Wrap="false"
                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("PublishedDT", "{0:dd/MM/yyyy hh:mm tt}")%>
                            <%# Eval("EndDT", "<br>to {0:dd/MM/yyyy hh:mm tt}")%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Highlight" SortExpression="HighlightStart" ItemStyle-Wrap="false"
                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("HighlightStart", "{0:dd/MM/yyyy hh:mm tt}")%>
                            <%# Eval("HighlightStop", "<br>to {0:dd/MM/yyyy hh:mm tt}")%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category" SortExpression="Category" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("Category")%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active" SortExpression="Active" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Eval("Active")%></ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="Tan" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Left"
                    CssClass="PagerStyle" />
                <SelectedRowStyle BackColor="#FFA200" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceNotice" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="sp_Notice_Browse" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtFilter" Name="Filter" PropertyName="Text" Type="String"
                        ConvertEmptyStringToNull="false" />
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
