<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Profile.aspx.cs" Inherits="ProfilePage" enableviewstate="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="EMP.ascx" TagName="EMP" TagPrefix="uc2" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/StyleSheet.css?rand=1" rel="stylesheet" type="text/css" />
    <style>
        .AboutMe
        {
            line-height: 150%;
        }
        .AboutMe a:visited
        {
            color: Green;
            text-decoration: none;
        }
        .AboutMe a
        {
            color: Green;
            text-decoration: none;
        }
        .AboutMe a:hover
        {
            color: Blue;</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    <asp:HiddenField ID="hidPageUrl" runat="server" Value="Profile.aspx" />
    <asp:HiddenField ID="hidEmpID" runat="server" Value="" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <div style="font-size: 300%; font-family: Tahoma">
                <asp:Literal ID="lblEmpName" runat="server" Text=""></asp:Literal>
            </div>
            <asp:Literal ID="lblFunctionalDesignation" runat="server" Text=""></asp:Literal>
            <%--<asp:Label ID="litEmpOnlineStatus" style="margin-left:10px" runat="server"></asp:Label>--%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="usp_getEmpInfo" SelectCommandType="StoredProcedure" UpdateCommand="sp_EmpProfileUpdate"
                UpdateCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
                <SelectParameters>
                    <asp:QueryStringParameter Name="param_EMPID" QueryStringField="ID" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="EmpName" Type="String" />
                    <asp:Parameter Name="EmpID" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="mobile" Type="String" />
                    <asp:Parameter Name="mobile2" Type="String" />
                    <asp:Parameter Name="dskphone" Type="String" />
                    <asp:Parameter Name="ext" Type="String" />
                    <asp:Parameter Name="Email1" Type="String" />
                    <asp:Parameter Name="Email2" Type="String" />
                    <asp:Parameter Name="Blood_Group" Type="String" />
                    <asp:Parameter Name="NID" Type="String" />
                    <asp:Parameter Name="TIN" Type="String" />
                    <asp:Parameter Name="TaxArea" Type="String" />
                    <asp:Parameter Name="TaxCircle" Type="String" />
                    <asp:Parameter Name="IP_Phone" Type="String" />
                    <asp:SessionParameter SessionField="EMPID" Name="UpdateBY" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceEmp_Sign_Key" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="SELECT FileKey FROM Emp_Sign Where EMPID = @EMPID">
                <SelectParameters>
                    <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table>
                <tr>
                    <td valign="top">
                        <div class="content-back">
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White"
                                BorderColor="#DEDFDE" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1"
                                ForeColor="Black" DataKeyNames="EMPID" CssClass="Grid" OnDataBound="DetailsView1_DataBound"
                                OnItemUpdating="DetailsView1_ItemUpdating" Width="100%">
                                <FooterStyle BackColor="#CCCC99" />
                                <RowStyle BackColor="white" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <EmptyDataRowStyle Font-Bold="true" Font-Size="X-Large" HorizontalAlign="Center"
                                    Height="210px" />
                                <EmptyDataTemplate>
                                    Profile Not Found!
                                </EmptyDataTemplate>
                                <Fields>
                                    <asp:TemplateField ShowHeader="false" ItemStyle-Font-Size="Medium" ItemStyle-BackColor="#F7F7DE">
                                        <ItemTemplate>
                                            <div>
                                                <div style="float: right;">
                                                    <div style="text-align: right">
                                                        <table style="font-size: 70%; display: inline-block" class="table-noborder">
                                                            <tr>
                                                                <td>
                                                                    <div id="DivLastOnlineStatus">
                                                                    </div>
                                                                </td>
                                                                <td style="display: inline-block">
                                                                    <a href='msg/New.aspx?to=<%# Eval("EmpID") %>' target="_blank" title="Send Message">
                                                                        <img src="Images/msg_20.png" width="20" height="20" border="0" /></a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div style="margin-top: 13px">
                                                            <%# Eval("FB_URL", "<a href='{0}' target='_blank' title='Facebook'><img border='0' src='Images/fb.png' /></a>")%>
                                                            <%# Eval("Google_URL", "<a href='{0}' target='_blank' title='Google+'><img border='0' src='Images/googleplus.gif' /></a>")%>
                                                            <%# Eval("Linkedin_URL", "<a href='{0}' target='_blank' title='LinkedIn'><img border='0' src='Images/linkedin.gif' /></a>")%>
                                                            <%# Eval("Website", "<a href='{0}' target='_blank' title='Website'><img border='0' src='Images/web.gif' /></a>")%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%# Eval("DesigFullName", "<div style='font-weight:bold'>{0}</div>")%>
                                                <%# (Eval("Branch_BranchID").ToString() == "1" ? "<a href='EmpBranch.aspx?branch=1&dept=" + Eval("Department_DeptID").ToString() + "' target='_blank'>" : "")%><%# Eval("Department", "<div>{0}</div>")%></a>
                                                <%# (Eval("Branch_BranchID").ToString() != "1" ? "<a href='EmpBranch.aspx?branch=" + Eval("Branch_BranchID").ToString() + "' target='_blank'>" : "")%><%# Eval("BranchName", "<div>{0}</div>")%></a>
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle Font-Size="Medium" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="EmpID" HeaderText="ID" SortExpression="EmpID" ReadOnly="True" />
                                    <asp:TemplateField HeaderText="Name" SortExpression="EmpName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmpName" runat="server" Width="400px" MaxLength="255" Text='<%# Bind("EmpName") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmpName"
                                                ErrorMessage="*">*</asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <%# Eval("EmpName") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DesigName" HeaderText="Designation" SortExpression="DesigName"
                                        ReadOnly="True" />
                                    <asp:TemplateField HeaderText="Join Date">
                                        <ItemTemplate>
                                            <%# Eval("JoinDate","{0:dd MMMM yyyy}")%>
                                            <span title="Job Duration" style="color: Gray; font-size: 85%; margin-left: 5px">(<%# getAge(Eval("JoinDate")) %>)</span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Promotion" Visible="false">
                                        <ItemTemplate>
                                            <%# Eval("LastPromotionDate","{0:dd MMMM, yyyy}")%>                
											<span style="color: Gray; font-size: 85%; margin-left: 5px">(<%# getAge(Eval("LastPromotionDate")) %>)</span>											
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ResignDate" HeaderText="Resign Date" SortExpression="ResignDate"
                                        ReadOnly="True" DataFormatString="{0:dd MMMM yyyy}" />
                                    <asp:BoundField DataField="ServiceStatusDetails" HeaderText="Service Status" ReadOnly="True" />
                                    <%--<asp:TemplateField HeaderText="TBL Email" SortExpression="Email">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmail" runat="server" Width="120px" MaxLength="50" Text='<%# Bind("Email") %>'></asp:TextBox>
                                            @trustbanklimited.com
                                            <asp:FilteredTextBoxExtender ID="txtEmail_FilteredTextBoxExtender" runat="server"
                                                Enabled="True" ValidChars="abcdefghijklmnopqrstuvwxyz.-_1234567890" TargetControlID="txtEmail">
                                            </asp:FilteredTextBoxExtender>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <%# Eval("email", "{0}@trustbanklimited.com") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="TBL Email">
                                        <ItemTemplate>
                                            <%# Eval("AD_ID", "<div>{0}@tblbd.com</div>") %>
                                            <%# Eval("Email", "<div>{0}@trustbanklimited.com</div>")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%# Eval("AD_ID", "<div>{0}@tblbd.com</div>") %>
                                            <%# Eval("Email", "<div>{0}@trustbanklimited.com</div>")%>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email1">
                                        <ItemTemplate>
                                            <%# Eval("Email1") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmail1" runat="server" Text='<%# Bind("Email1") %>' Width="300px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail1"
                                                ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email2">
                                        <ItemTemplate>
                                            <%# Eval("Email2")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmail2" runat="server" Text='<%# Bind("Email2") %>' Width="300px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail2"
                                                ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" ControlStyle-Width="400px"
                                        ReadOnly="true" ControlStyle-CssClass="mobile">
                                        <ControlStyle Width="400px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Mobile2" HeaderText="Mobile2" ControlStyle-Width="400px"
                                        ReadOnly="true" ControlStyle-CssClass="mobile">
                                        <ControlStyle Width="400px" />
                                    </asp:BoundField>
                                    <%--<asp:TemplateField HeaderText="Mobile" SortExpression="mobile">
                                        <ItemTemplate>
                                            <%# Eval("mobile") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxMobile" Width="400px" runat="server" Text='<%# Bind("mobile") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ControlToValidate="TextBoxMobile"
                                                ErrorMessage="*">*</asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" ControlStyle-Width="400px">
                                        <ControlStyle Width="400px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dskphone" HeaderText="Desk Phone" SortExpression="dskphone"
                                        ControlStyle-Width="400px">
                                        <ControlStyle Width="400px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IP_Phone" HeaderText="IP Phone" SortExpression="IP_Phone"
                                        ReadOnly="true" ControlStyle-Width="400px">
                                        <ControlStyle Width="400px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Ext" SortExpression="ext">
                                        <ItemTemplate>
                                            <%# Eval("ext") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxExt" Width="80px" runat="server" Text='<%# Bind("ext") %>'
                                                MaxLength="10"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Blood Group" SortExpression="Blood_Group">
                                        <ItemTemplate>
                                            <%# Eval("Blood_Group")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="dboBlood_Group" runat="server" AppendDataBoundItems="true"
                                                DataSourceID="SqlDataSourceBloodGroup" DataTextField="BloodGroup" DataValueField="BloodGroup"
                                                SelectedValue='<%# Bind("Blood_Group") %>'>
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceBloodGroup" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                                SelectCommand="SELECT [BloodGroup] FROM [v_BloodGroups]"></asp:SqlDataSource>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="National ID" SortExpression="NID">
                                        <ItemTemplate>
                                            <%# Eval("NID")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextNID" Width="200px" runat="server" Text='<%# Bind("NID") %>'
                                                MaxLength="20"></asp:TextBox>
                                            <asp:FilteredTextBoxExtender ID="extFilterNID" runat="server" ValidChars="0123456789"
                                                TargetControlID="TextNID">
                                            </asp:FilteredTextBoxExtender>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TIN" SortExpression="TIN">
                                        <ItemTemplate>
                                            <%# Eval("TIN")%><%# Eval("TaxArea",", Area-{0}")%><%# Eval("TaxCircle", ", Circle-{0}")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextTIN" Width="100px" runat="server" Text='<%# Bind("TIN") %>'
                                                MaxLength="12"></asp:TextBox>
                                            <asp:FilteredTextBoxExtender ID="extFilterTIN" runat="server" ValidChars="0123456789-"
                                                TargetControlID="TextTIN">
                                            </asp:FilteredTextBoxExtender>
                                            &nbsp;&nbsp;&nbsp;&nbsp; Area:
                                            <asp:TextBox ID="txtTaxArea" Width="50px" runat="server" Text='<%# Bind("TaxArea") %>'
                                                MaxLength="10"></asp:TextBox>
                                            &nbsp;&nbsp;Circle:
                                            <asp:TextBox ID="txtTaxCircle" Width="50px" runat="server" Text='<%# Bind("TaxCircle") %>'
                                                MaxLength="10"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="false" ItemStyle-BackColor="#F7F7DE">
                                        <ItemTemplate>
                                            <div style="float: right; font-weight: bold; margin: 6px">
                                                <a target="_blank" href='EmpInfo/EmpInfo.aspx?id=<%# Eval("EMPID") %>'>Show Details</a></div>
                                            <asp:Button ID="cmdEdit" runat="server" Text="Edit" Width="100px" CommandName="EDIT"
                                                CausesValidation="false" Font-Bold="true" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Button ID="cmdEdit" runat="server" Text="Update" Width="100px" CommandName="UPDATE"
                                                Font-Bold="true" />
                                            <asp:ConfirmButtonExtender ID="cmdEdit_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                                                Enabled="True" TargetControlID="cmdEdit">
                                            </asp:ConfirmButtonExtender>
                                            <asp:Button ID="cmdCancel" runat="server" Text="Cancel" Width="100px" CommandName="Cancel"
                                                CausesValidation="false" Font-Bold="true" />
                                        </EditItemTemplate>
                                        <ItemStyle BackColor="#F7F7DE" />
                                    </asp:TemplateField>
                                </Fields>
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#F7F7DE" />
                            </asp:DetailsView>
                        </div>
                    </td>
                    <td valign="top" style="padding-left: 10px; padding-top: 10px;">
                        <asp:HyperLink runat="server" ID="hypImg" Target="_blank" ToolTip="View">
                            <div style="display: inline-block">
                                <asp:Image ID="imgEmp" runat="server" CssClass="image" Width="200px" BorderWidth="1px"
                                    ImageUrl="~/Images/NoFace.jpg" />
                                <asp:Panel runat="server" ID="byline" CssClass="byline" Visible="false">
                                    <asp:Label runat="server" ID="lblServiceStatus"></asp:Label></asp:Panel>
                            </div>
                        </asp:HyperLink>
                        <div style="margin-top: 10px;">
                            <asp:HyperLink NavigateUrl="~/Profile_Upload.aspx" ID="cmdChangeProPic" runat="server"
                                ToolTip="Change Your Profile Picture" CssClass="Button" Font-Size="Small">Change</asp:HyperLink>
                        </div>
                    </td>
                    <td valign="top" style="padding-left:200px;font-size:85%">
                        <asp:Label ID="lblDuplicateMobile" runat="server" Text="" Font-Bold="true"></asp:Label>
                        
                        <br />
                        <asp:GridView ID="DetailsViewDuplicateMobile" runat="server" CellPadding="4" 
                            AutoGenerateColumns="false" ShowHeader="false" CssClass="Grid"
                            DataSourceID="SqlDataSourceDuplicateMobile">
                            <Columns>                     
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='Profile.aspx?ID=<%# Eval("EmpID") %>' target="_blank" title='<%# Eval("EmpID") %>'>
                                            <img src='EmpImage.aspx?empid=<%# Eval("EMPID") %>&W=100' width="45" height="45" border="0" />
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>          
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%# Eval("EMP") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle VerticalAlign="Top" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceDuplicateMobile" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>" 
                            SelectCommandType="StoredProcedure"
                            SelectCommand="s_Emp_Duplicate_Mobile_No" 
                            onselected="SqlDataSourceDuplicateMobile_Selected">
                            <SelectParameters>
                                
                                <asp:QueryStringParameter QueryStringField="ID" Name="EmpID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <asp:Button ID="Button1" Visible="false" runat="server" Text="Progress Test" Width="120px"
                OnClick="Button1_Click" />
            <asp:TabContainer ID="TabContainer1" runat="server" CssClass="" 
                ScrollBars="Vertical" EnableViewState="false" 
                OnDemand="false" Width="800px" Height="450px" ActiveTabIndex="0" 
                OnActiveTabChanged="TabContainer1_ActiveTabChanged" >
                <asp:TabPanel ID="tabEmpStatus" runat="server">
                    <HeaderTemplate>
                        Status</HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewEmpStatus" runat="server" AutoGenerateRows="False"
                            Width="700px" GridLines="None" DataKeyNames="EmpID" BorderWidth="1px" BorderColor="White"
                            BorderStyle="Solid" DataSourceID="SqlDataSourceEmpStatus" OnDataBound="DetailsViewEmpStatus_DataBound">
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" BorderColor="LightGoldenrodYellow" />
                            <EmptyDataTemplate>
                                
                                

                                    <asp:LinkButton ID="cmdEmpStatus" runat="server" CommandName="NEW" CausesValidation="false"
                                            Text="Set My Status" Visible="false" ></asp:LinkButton>
                                            </EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                      
                                        
                                        <div ><%# Eval("Status").ToString().Replace("\n","<br />") %></div>
                                        <div style="margin:10px 0" title='<%# Eval("PostDT","{0:dddd \ndd MMMM, yyyy \nh:mm:ss tt}") %>'>
                                            <time class='timeago' datetime='<%# Eval("PostDT", "{0:yyyy-MM-dd HH:mm:ss}") %>'></time>
                                        </div>
                                       
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                    
                                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="4" Width="600px" ID="txtStatus" Text='<%# Bind("Status") %>'></asp:TextBox>
                                       <p style="color:Red;font-weight:bold">Warning: Status must be for official purpose only.</p>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="4" Width="600px" ID="txtStatus" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        <p style="color:Red;font-weight:bold">Warning: Status must be for official purpose only.</p>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdEmpStatus" runat="server" CommandName="Edit" CausesValidation="false"
                                            Text="Edit My Status" Visible="false" ></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="cmdEmpStatus" runat="server" CommandName="Update" CausesValidation="false"
                                            Text="Update"  ></asp:LinkButton>
                                        <asp:ConfirmButtonExtender ID="cmdAboutMe_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                                            Enabled="True" TargetControlID="cmdEmpStatus">
                                        </asp:ConfirmButtonExtender>
                                        <asp:LinkButton ID="cmdEmpStatusCancel" runat="server" CommandName="Cancel" CausesValidation="false"
                                            Text="Cancel" ></asp:LinkButton>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        
                                        <asp:LinkButton ID="cmdEmpStatus" runat="server" CommandName="Insert" CausesValidation="false"
                                            Text="Save"  Visible="false" ></asp:LinkButton>
                                        <asp:ConfirmButtonExtender ID="cmdAboutMe_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Save?"
                                            Enabled="True" TargetControlID="cmdEmpStatus">
                                        </asp:ConfirmButtonExtender>
                                        <asp:LinkButton ID="cmdEmpStatusCancel" runat="server" CommandName="Cancel" CausesValidation="false"
                                            Text="Cancel" ></asp:LinkButton>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSourceEmpStatus" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            InsertCommand="s_Emp_Status_Add_Edit" InsertCommandType="StoredProcedure" SelectCommand="s_Emp_Status_Select"
                            UpdateCommand="s_Emp_Status_Add_Edit" UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:QueryStringParameter QueryStringField="ID" Name="EmpID" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:QueryStringParameter QueryStringField="ID" Name="EmpID" Type="String" />
                                <asp:Parameter Name="Status" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button2_Click1" Visible="False" />
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tabAboutMe" runat="server">
                    <HeaderTemplate>
                        Job Description</HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewAboutMe" runat="server" AutoGenerateRows="False"
                            Width="700px" GridLines="None" DataKeyNames="EmpID" BorderWidth="1px" BorderColor="White"
                            BorderStyle="Solid" DataSourceID="SqlDataSourceAboutMe" OnDataBound="DetailsViewAboutMe_DataBound">
                            <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" BorderColor="LightGoldenrodYellow" />
                            <EmptyDataTemplate>
                                Not Available<br />
                                <asp:Button ID="cmdAboutMe" runat="server" CommandName="NEW" CausesValidation="false"
                                    Text="Edit" Width="100px" Visible="false" /></EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <div class="AboutMe">
                                            <%# Eval("AboutMe") %></div>
                                        <div style="text-align: left; color: #AAAAAA; font-style: italic; font-family: Courier New"
                                            title='<%# Eval("DT","{0:dd MMMM yyyy, hh:mm tt}") %>'>
                                            <%# "Last update: " + ToRelativeDate((DateTime)Eval("DT"))%></div>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <CKEditor:CKEditorControl ID="CKEditor1" runat="server" TextMode="MultiLine" Text='<%# Bind("AboutMe") %>'
                                            ResizeDir="Vertical" ToolbarCanCollapse="False" Width="700px" DisableNativeSpellChecker="true"
                                            ToolbarFull="
Cut|Copy|Paste|PasteText|PasteFromWord-
|Undo|Redo|-|Find|Replace|-|SelectAll|RemoveFormat

Maximize
Source
/
Bold|Italic|Underline|Strike|-|Subscript|Superscript
JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock
NumberedList|BulletedList|-|Outdent|Indent|Blockquote
Link|Unlink
Table|HorizontalRule|Smiley|SpecialChar|
"></CKEditor:CKEditorControl>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <CKEditor:CKEditorControl ID="CKEditor1" runat="server" TextMode="MultiLine" Text='<%# Bind("AboutMe") %>'
                                            Width="700px" ResizeDir="Vertical" ToolbarCanCollapse="False" DisableNativeSpellChecker="true"
                                            ToolbarFull="
Cut|Copy|Paste|PasteText|PasteFromWord-
|Undo|Redo|-|Find|Replace|-|SelectAll|RemoveFormat

Maximize
Source
/
Bold|Italic|Underline|Strike|-|Subscript|Superscript
JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock
NumberedList|BulletedList|-|Outdent|Indent|Blockquote
Link|Unlink
Table|HorizontalRule|Smiley|SpecialChar|
"></CKEditor:CKEditorControl>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="cmdAboutMe" runat="server" CommandName="Edit" CausesValidation="false"
                                            Text="Edit" Visible="false" Width="100px" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="cmdAboutMe" runat="server" CommandName="Update" CausesValidation="false"
                                            Text="Update" Width="100px" />
                                        <asp:ConfirmButtonExtender ID="cmdAboutMe_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                                            Enabled="True" TargetControlID="cmdAboutMe">
                                        </asp:ConfirmButtonExtender>
                                        <asp:Button ID="cmdAboutMeCancel" runat="server" CommandName="Cancel" CausesValidation="false"
                                            Text="Cancel" Width="100px" /></Button>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        </Button>
                                        <asp:Button ID="cmdAboutMe" runat="server" CommandName="Insert" CausesValidation="false"
                                            Text="Save" Width="100px" Visible="false" />
                                        <asp:ConfirmButtonExtender ID="cmdAboutMe_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Save?"
                                            Enabled="True" TargetControlID="cmdAboutMe">
                                        </asp:ConfirmButtonExtender>
                                        <asp:Button ID="cmdAboutMeCancel" runat="server" CommandName="Cancel" CausesValidation="false"
                                            Text="Cancel" Width="100px" /></Button>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSourceAboutMe" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            InsertCommand="sp_Emp_AboutMe_Add_Edit" InsertCommandType="StoredProcedure" SelectCommand="sp_Emp_AboutMe_Select"
                            UpdateCommand="sp_Emp_AboutMe_Add_Edit" UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:QueryStringParameter QueryStringField="ID" Name="EmpID" Type="String" />
                                <asp:Parameter Name="AboutMe" Type="String" />
                                <asp:SessionParameter Name="ByEmp" SessionField="EMPID" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:QueryStringParameter QueryStringField="ID" Name="EmpID" Type="String" />
                                <asp:Parameter Name="AboutMe" Type="String" />
                                <asp:SessionParameter Name="ByEmp" SessionField="EMPID" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click1" Visible="False" />
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="TabTag" HeaderText="Teams">
                    <HeaderTemplate>
                        Teams
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:GridView ID="GridView2" runat="server" ShowHeader="false" CssClass="Grid" DataSourceID="SqlDataSourceTagDept"
                            AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid"
                            DataKeyNames="ID" AutoGenerateColumns="False" BorderWidth="1px" CellPadding="5"
                            ForeColor="Black" OnSelectedIndexChanging="GridView2_SelectedIndexChanging" OnRowDataBound="GridView2_RowDataBound"
                            OnDataBound="GridView2_DataBound">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Departments" SortExpression="Department">
                                    <ItemTemplate>
                                        <img title="205" src="Images/D.png" height="24" width="24" alt="logo" border="0">
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Departments" SortExpression="Department">
                                    <ItemTemplate>
                                        <%# Eval("Department")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                No Tagged Dept Found.</EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle Wrap="False" BackColor="#6B696B" Font-Bold="False" ForeColor="White"
                                HorizontalAlign="Center" />
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <SelectedRowStyle BackColor="#FFD24D" />
                        </asp:GridView>
                        <br />
                        <asp:Label ID="lblTotal" runat="server" Visible="false"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceTagDept" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM [v_Emp_Tag_Dept] where empid = @EMPID order by [Department]"
                            OnDeleted="SqlDataSourceTagDept_Deleted" OnSelected="SqlDataSourceTagDept_Selected">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="id" Type="String" />
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="tabApplications" HeaderText="Applications">
                    <HeaderTemplate>
                        intra Apps
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" CssClass="Grid" DataSourceID="SqlDataSourceApplications"
                            AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid"
                            AutoGenerateColumns="False" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Logo">
                                    <ItemTemplate>
                                        <img src='<%# Eval("Logo")%>' height="30px" alt="logo" border="0" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Application Name" SortExpression="Application Name">
                                    <ItemTemplate>
                                        <a href='<%# Eval("ApplicationPath") %>'>
                                            <%# Eval("Application Name") %></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Application Role" SortExpression="Role">
                                    <ItemTemplate>
                                        <%# Eval("Roles").ToString().Replace(",",", ") %>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Branch Name" SortExpression="Branch Name">
                                    <ItemTemplate>
                                        <span title='<%# Eval("BranchID")%>'>
                                            <%# Eval("Branch Name")%></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                No Application Found.</EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle Wrap="False" BackColor="#6B696B" Font-Bold="False" ForeColor="White"
                                HorizontalAlign="Center" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceApplications" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="usp_Emp_Role" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="id" Type="String" />
                                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="TabGroups" HeaderText="Groups">
                    <HeaderTemplate>
                        Groups
                    </HeaderTemplate>
                    <ContentTemplate>
                        <div class="group">
                            <h2>
                                Group Membership</h2>
                            <asp:GridView ID="GridViewGroups" runat="server" CssClass="Grid" DataSourceID="SqlDataSourceGroups"
                                AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid"
                                AutoGenerateColumns="False" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Logo">
                                        <ItemTemplate>
                                            <img src='Images/NoGroupFace.jpg' height="30px" alt="logo" border="0" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Group Name" SortExpression="GroupName">
                                        <ItemTemplate>
                                            <a target="_blank" href='Group.aspx?id=<%# Eval("GroupID") %>'>
                                                <%# Eval("GroupName")%></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="GroupDescription">
                                        <ItemTemplate>
                                            <%# Eval("GroupDescription")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Group Assigned.</EmptyDataTemplate>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle Wrap="False" BackColor="#6B696B" Font-Bold="False" ForeColor="White"
                                    HorizontalAlign="Center" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceGroups" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="sp_Emp_Groups" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="EMPID" QueryStringField="id" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="tabPaSign" HeaderText="PA Sign" Visible="false">
                    <HeaderTemplate>
                        PA Sign
                    </HeaderTemplate>
                    <ContentTemplate>
                        <div class="group">
                            <h2>
                                Power of Attorney Signature</h2>
                            <h6>
                                <asp:HyperLink runat="server" ID="hypEmpSign" Target="_blank" NavigateUrl="">
                                    <asp:Image ID="EmpSignImage" runat="server" CssClass="image" Width="300px" Height="200px"
                                        BorderWidth="1px" ImageUrl="~/Images/NoSign.jpg" /></asp:HyperLink><br />
                                <br />
                                <asp:HyperLink runat="server" NavigateUrl='' ID="hypEmpSignImageChange" Visible="false"
                                    Text="Change" Font-Size="Small" CssClass="Button ui-corner-all"></asp:HyperLink>
                            </h6>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tabPayslip" HeaderText="HRD" runat="server">
                    <HeaderTemplate>
                        HRD</HeaderTemplate>
                    <ContentTemplate>
                        <div class="group">
                            <div>
                                <asp:RadioButtonList ID="rdoHrdFileType" runat="server" AutoPostBack="true" CssClass="radio"
                                    RepeatLayout="Flow" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Pay Slips" Value="PAYSLIP" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Tax" Value="TAX_CERTIFICATE"></asp:ListItem>
                                    <asp:ListItem Text="PF" Value="PF_STATEMENT"></asp:ListItem>
									<asp:ListItem Text="Trainings" Value="TRAINING"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <asp:GridView ID="GridViewPaySlips" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                                BorderWidth="1px" CellPadding="4" DataKeyNames="AID" DataSourceID="SqlDataSourcePaySlips"
                                ForeColor="Black" GridLines="Vertical" CssClass="Grid">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                    <asp:TemplateField HeaderText="Added on" SortExpression="InsertDT">
                                        <ItemTemplate>
                                            <span title='<%# Eval("InsertDT","{0:dddd \ndd MMMM, yyyy \nh:mm tt}") %>'>
                                                <%# Common.ToRecentDateTime(Eval("InsertDT"))%></span>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="About" SortExpression="InsertDT">
                                        <ItemTemplate>
                                            <%# Common.ToRelativeDate(Eval("InsertDT"))%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="File" SortExpression="FileName">
                                        <ItemTemplate>
                                            <img src='<%# Common.getExtensionImage(Eval("FileName")) %>' width="16px" />
                                            <a href='Attachment.ashx?aid=<%# Eval("AID") %>&key=<%# Eval("FileKey") %>' target="_blank"
                                                title='<%# Common.FileSize(Eval("FileSize")) %>'>
                                                <%# Eval("FileName")%></a>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataRowStyle BorderStyle="None" />
                                <EmptyDataTemplate>
                                    No Data Found.</EmptyDataTemplate>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourcePaySlips" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="SELECT * FROM [Attachments] WHERE ([EMPID] = @EMPID AND [Type] = @Type) ORDER BY [Batch] DESC">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                                    <asp:ControlParameter ControlID="rdoHrdFileType" Name="Type" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tabHistory" HeaderText="History" runat="server">
                    <HeaderTemplate>
                        History</HeaderTemplate>
                    <ContentTemplate>
                        <div class="group">
                            <h2>
                                Password Change History</h2>
                            <asp:SqlDataSource ID="SqlDSChangePassword_Log_Show" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="ChangePassword_Log_Show" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" DefaultValue=" " />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridViewPasswordHistory" runat="server" CssClass="Grid" AllowPaging="True"
                                AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" AllowSorting="True"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDSChangePassword_Log_Show"
                                ForeColor="Black" GridLines="Vertical" OnDataBound="GridViewPasswordHistory_DataBound">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Changed on" SortExpression="DT">
                                        <ItemTemplate>
                                            <span title='<%# Eval("DT","{0:dddd \ndd MMMM, yyyy \n h:mm:ss tt}") %>'>
                                                <%# Common.ToRecentDateTime(Eval("DT"))%></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="About" SortExpression="DT">
                                        <ItemTemplate>
                                            <span title='<%# Eval("DT","{0:dddd \ndd MMMM, yyyy \n h:mm:ss tt}") %>'>
                                                <%# Common.ToRelativeDate(Eval("DT")) %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Changed By" SortExpression="ChangedBy">
                                        <ItemTemplate>
                                            <uc2:EMP ID="EMP1" Username='<%# Eval("ChangedBy") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <PagerSettings Mode="NumericFirstLast" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                                <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
                                <EmptyDataTemplate>
                                    No Data Found</EmptyDataTemplate>
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="tabQRCode" HeaderText="QR Code" runat="server">
                    <HeaderTemplate>
                        QR Code</HeaderTemplate>
                    <ContentTemplate>
                        <img src='http://172.22.1.26/EmpInfo/qrcode.ashx?id=<%=Request.QueryString["ID"] %>'
                            style="max-height: 400px; margin: -10px">
                        <br />
                        <a href='http://172.22.1.26/EmpInfo/vcf.ashx?id=<%=Request.QueryString["ID"] %>'
                            title="Variant Call Format for Google Contact" target="_blank">Download as VCF</a>
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
