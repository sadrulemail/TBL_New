<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="EmpInfo.aspx.cs" Inherits="EmpInfo" %>

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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <asp:Label ID="lblEmpName" runat="server" Text="" Font-Size="300%" Font-Names="Tahoma"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="usp_getEmpInfo" SelectCommandType="StoredProcedure" UpdateCommand="sp_EmpProfileUpdate"
                UpdateCommandType="StoredProcedure">
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
                    <asp:Parameter Name="dskphone" Type="String" />
                    <asp:Parameter Name="ext" Type="String" />
                    <asp:Parameter Name="Email1" Type="String" />
                    <asp:Parameter Name="Email2" Type="String" />
                    <asp:Parameter Name="Website" Type="String" />
                    <asp:Parameter Name="Blood_Group" Type="String" />
                    <asp:Parameter Name="NID" Type="String" />
                    <asp:Parameter Name="TIN" Type="String" />
                    <asp:Parameter Name="TaxArea" Type="String" />
                    <asp:Parameter Name="TaxCircle" Type="String" />
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
                                                    <a href='msg/New.aspx?to=<%# Eval("EmpID") %>' target="_blank" title="Send Message">
                                                        <img src="Images/msg_20.png" width="20" height="20" border="0" /></a></div>
                                                <b>
                                                    <%# Eval("DesigFullName") %></b><br />
                                                <%# (Eval("Branch_BranchID").ToString() == "1" ? "<a href='EmpBranch.aspx?branch=1&dept=" + Eval("Department_DeptID").ToString() + "' target='_blank'>" : "")%><%# Eval("Department")%></a><br />
                                                <%# (Eval("Branch_BranchID").ToString() != "1" ? "<a href='EmpBranch.aspx?branch=" + Eval("Branch_BranchID").ToString() + "' target='_blank'>" : "")%><%# Eval("BranchName") %></a>
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
                                    <asp:BoundField DataField="JoinDate" HeaderText="Join Date" SortExpression="JoinDate"
                                        ReadOnly="True" DataFormatString="{0:dd MMMM yyyy}" />
                                    <asp:BoundField DataField="ResignDate" HeaderText="Resign Date" SortExpression="ResignDate"
                                        ReadOnly="True" DataFormatString="{0:dd MMMM yyyy}" />
                                    <asp:BoundField DataField="ServiceStatusDetails" HeaderText="Service Status" ReadOnly="True" />
                                    <asp:TemplateField HeaderText="TBL Email" SortExpression="Email">
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
                                    <asp:TemplateField HeaderText="Mobile" SortExpression="mobile">
                                        <ItemTemplate>
                                            <%# Eval("mobile") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxMobile" Width="400px" runat="server" Text='<%# Bind("mobile") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ControlToValidate="TextBoxMobile"
                                                ErrorMessage="*">*</asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" ControlStyle-Width="400px">
                                        <ControlStyle Width="400px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="dskphone" HeaderText="Desk Phone" SortExpression="dskphone"
                                        ControlStyle-Width="400px">
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
                                    <asp:TemplateField HeaderText="Website" SortExpression="Website">
                                        <ItemTemplate>
                                            <%# Eval("Website" ,"<a href='{0}' target='_blank'>{0}</a>")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtWebsite" runat="server" Text='<%# Bind("Website") %>' Width="330px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorWeb" runat="server"
                                                ControlToValidate="txtWebsite" ErrorMessage="Invalid URL" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="false" ItemStyle-BackColor="#F7F7DE">
                                        <ItemTemplate>
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
                                Target="_blank" ToolTip="Change Your Profile Picture" CssClass="Button" Font-Size="Small"
                                Text="Change"></asp:HyperLink>
                        </div>
                    </td>
                </tr>
            </table>
            <asp:TabContainer ID="TabContainer1" runat="server" CssClass="NewsTab" ScrollBars="Vertical"
                OnDemand="true" Width="960px" Height="550px" ActiveTabIndex="4" OnActiveTabChanged="TabContainer1_ActiveTabChanged">
                <asp:TabPanel runat="server" ID="TabPanelEducation" HeaderText="Education">
                    <HeaderTemplate>
                        Education
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewEducation" runat="server" AutoGenerateRows="False"
                            CssClass="Grid" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            DataSourceID="SqlDataSourceEducation" CellPadding="4" DataKeyNames="ID" DefaultMode="ReadOnly"
                            ForeColor="Black" GridLines="Vertical">
                            <FooterStyle BackColor="#CCCC99" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Middle" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                <asp:Button ID="cmdNewEducation" runat="server" Text="Add New" CommandName="New" Width="100px" />
                            </EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField HeaderText="Degree" SortExpression="Degree">
                                    <%--<ItemTemplate>
                                        <asp:Label ID="lblOrg" runat="server" Text='<%# Eval("Organization") %>'></asp:Label>
                                    </ItemTemplate>--%>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="cboDegree" runat="server" DataSourceID="SqlDataSourceDegree"
                                            DataTextField="Degree_Name" DataValueField="ID_Degree">
                                            <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDegree" runat="server" ControlToValidate="cboDegree"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:SqlDataSource ID="SqlDataSourceDegree" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT [ID_Degree],[Degree_Name] FROM [EmpInfo_Degree] ORDER BY OrderCol ASC" SelectCommandType="Text">                                            
                                        </asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="cboDegree" runat="server" DataSourceID="SqlDataSourceDegree"
                                            DataTextField="Degree_Name" DataValueField="ID_Degree">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDegree" runat="server" ControlToValidate="cboDegree"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        <asp:SqlDataSource ID="SqlDataSourceDegree" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT [ID_Degree],[Degree_Name] FROM [EmpInfo_Degree] ORDER BY OrderCol ASC" SelectCommandType="Text">                                            
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Exam/Degree Title" SortExpression="Exam_Degree_Title">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Exam_Degree_Title") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTitle" runat="server" Width="450px" Text='<%# Bind("Exam_Degree_Title") %>' MaxLength="255"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="txtTitle"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtTitle" runat="server" Width="450px" Text='<%# Bind("Exam_Degree_Title") %>' MaxLength="255"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="txtTitle"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Board" SortExpression="Board">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBoard" runat="server" Text='<%# Eval("Board") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtBoard" runat="server" Width="450px" Text='<%# Bind("Board") %>' MaxLength="255"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBoard" runat="server" ControlToValidate="txtBoard"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtBoard" runat="server" Width="450px" Text='<%# Bind("Board") %>' MaxLength="255"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBoard" runat="server" ControlToValidate="txtBoard"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Concentration/Major/Group" SortExpression="Subject_Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("Subject_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="cboSubject" runat="server" AppendDataBoundItems="true"  >
                                            <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="Accounting" Value="Accounting"></asp:ListItem>
                                            <asp:ListItem Text="Accounting &amp; Information System" Value="Accounting &amp; Information System"></asp:ListItem>
                                            <asp:ListItem Text="Agriculture" Value="Agriculture"></asp:ListItem>
                                            <asp:ListItem Text="Agro-technology" Value="Agro-technology"></asp:ListItem>                                            
                                            <asp:ListItem Text="Animal Husbandry" value="Animal Husbandry"></asp:ListItem>
                                            <asp:ListItem value="Anthropology" Text="Anthropology"></asp:ListItem>
                                            <asp:ListItem value="Applied Chemistry" Text="Applied Chemistry"></asp:ListItem>
                                            <asp:ListItem value="Applied Physics" Text="Applied Physics"></asp:ListItem>
                                            <asp:ListItem value="Arabic" Text="Arabic"></asp:ListItem>
                                            <asp:ListItem value="Archaeology" Text="Archaeology"></asp:ListItem>
                                            <asp:ListItem value="Architecture" Text="Architecture"></asp:ListItem>
                                            <asp:ListItem value="Arts" Text="Arts"></asp:ListItem>
                                            <asp:ListItem value="Automobile" Text="Automobile"></asp:ListItem>
                                            <asp:ListItem value="Banking" Text="Banking"></asp:ListItem>
                                            <asp:ListItem value="Bengali" Text="Bengali"></asp:ListItem>
                                            <asp:ListItem value="Biochemistry" Text="Biochemistry"></asp:ListItem>
                                            <asp:ListItem value="Biology" Text="Biology"></asp:ListItem>
                                            <asp:ListItem value="Biotechnology" Text="Biotechnology"></asp:ListItem>
                                            <asp:ListItem value="Botany" Text="Botany"></asp:ListItem>
                                            <asp:ListItem value="Brand Management" Text="Brand Management"></asp:ListItem>
                                            <asp:ListItem value="Business Administration" Text="Business Administration"></asp:ListItem>
                                            <asp:ListItem value="Business Studies" Text="Business Studies"></asp:ListItem>
                                            <asp:ListItem value="Chemical Technical/Engineering" Text="Chemical Technical/Engineering"></asp:ListItem>
                                            <asp:ListItem value="Chemistry" Text="Chemistry"></asp:ListItem>
                                            <asp:ListItem value="Civil Engineering" Text="Civil Engineering"></asp:ListItem>
                                            <asp:ListItem value="Commerce" Text="Commerce"></asp:ListItem>
                                            <asp:ListItem value="Communication Engineering" Text="Communication Engineering"></asp:ListItem>
                                            <asp:ListItem value="Computer Applications" Text="Computer Applications"></asp:ListItem>
                                            <asp:ListItem value="Computer Engineering" Text="Computer Engineering"></asp:ListItem>
                                            <asp:ListItem value="Computer Science" Text="Computer Science"></asp:ListItem>
                                            <asp:ListItem value="Computer Science &amp; Engineering" Text="Computer Science &amp; Engineering"></asp:ListItem>
                                            <asp:ListItem value="Computing &amp; Information System" Text="Computing &amp; Information System"></asp:ListItem>
                                            <asp:ListItem value="Cost &amp; Management Accounting" Text="Cost &amp; Management Accounting"></asp:ListItem>
                                            <asp:ListItem value="Cost Accounting" Text="Cost Accounting"></asp:ListItem>
                                            <asp:ListItem value="Development Studies" Text="Development Studies"></asp:ListItem>
                                            <asp:ListItem value="Economics" Text="Economics"></asp:ListItem>
                                            <asp:ListItem value="Education" Text="Education"></asp:ListItem>
                                            <asp:ListItem value="Electrical &amp; Electronic Engineering" Text="Electrical &amp; Electronic Engineering"></asp:ListItem>
                                            <asp:ListItem value="Electronics" Text="Electronics"></asp:ListItem>
                                            <asp:ListItem value="Electronics and Telecommunication Engineering" Text="Electronics and Telecommunication Engineering"></asp:ListItem>
                                            <asp:ListItem value="English" Text="English"></asp:ListItem>
                                            <asp:ListItem value="Environmental Planning" Text="Environmental Planning"></asp:ListItem>
                                            <asp:ListItem value="Finance" Text="Finance"></asp:ListItem>
                                            <asp:ListItem value="Finance &amp; Banking" Text="Finance &amp; Banking"></asp:ListItem>
                                            <asp:ListItem value="Fine Arts" Text="Fine Arts"></asp:ListItem>
                                            <asp:ListItem value="Fisheries" Text="Fisheries"></asp:ListItem>
                                            <asp:ListItem value="Flim and Media" Text="Flim and Media"></asp:ListItem>
                                            <asp:ListItem value="Forestry" Text="Forestry"></asp:ListItem>
                                            <asp:ListItem value="Genetics" Text="Genetics"></asp:ListItem>
                                            <asp:ListItem value="Geography" Text="Geography"></asp:ListItem>
                                            <asp:ListItem value="Geography and Environment" Text="Geography and Environment"></asp:ListItem>
                                            <asp:ListItem value="Geology" Text="Geology"></asp:ListItem>
                                            <asp:ListItem value="Government &amp; Politics" Text="Government &amp; Politics"></asp:ListItem>
                                            <asp:ListItem value="History" Text="History"></asp:ListItem>
                                            <asp:ListItem value="Horticulture" Text="Horticulture"></asp:ListItem>
                                            <asp:ListItem value="Hospitality Management" Text="Hospitality Management"></asp:ListItem>
                                            <asp:ListItem value="Human Resource Management" Text="Human Resource Management"></asp:ListItem>
                                            <asp:ListItem value="Industrial Eng &amp; Production" Text="Industrial Eng &amp; Production"></asp:ListItem>
                                            <asp:ListItem value="Industrial Engineering" Text="Industrial Engineering"></asp:ListItem>
                                            <asp:ListItem value="Industrial Management" Text="Industrial Management"></asp:ListItem>
                                            <asp:ListItem value="Industrial Relations" Text="Industrial Relations"></asp:ListItem>
                                            <asp:ListItem value="Information Engineering" Text="Information Engineering"></asp:ListItem>
                                            <asp:ListItem value="Information Science &amp; Library Management" Text="Information Science &amp; Library Management"></asp:ListItem>
                                            <asp:ListItem value="Information Systems" Text="Information Systems"></asp:ListItem>
                                            <asp:ListItem value="Information Technology" Text="Information Technology"></asp:ListItem>
                                            <asp:ListItem value="Insurance" Text="Insurance"></asp:ListItem>
                                            <asp:ListItem value="International Business" Text="International Business"></asp:ListItem>
                                            <asp:ListItem value="International Relations" Text="International Relations"></asp:ListItem>
                                            <asp:ListItem value="Islamic History &amp; Culture" Text="Islamic History &amp; Culture"></asp:ListItem>
                                            <asp:ListItem value="Islamic Studies" Text="Islamic Studies"></asp:ListItem>
                                            <asp:ListItem value="Journalism" Text="Journalism"></asp:ListItem>
                                            <asp:ListItem value="Law" Text="Law"></asp:ListItem>
                                            <asp:ListItem value="Linguistics" Text="Linguistics"></asp:ListItem>
                                            <asp:ListItem value="Management" Text="Management"></asp:ListItem>
                                            <asp:ListItem value="Management Information System" Text="Management Information System"></asp:ListItem>
                                            <asp:ListItem value="Management Studies/Science" Text="Management Studies/Science"></asp:ListItem>
                                            <asp:ListItem value="Marine Engineering" Text="Marine Engineering"></asp:ListItem>
                                            <asp:ListItem value="Marketing" Text="Marketing"></asp:ListItem>
                                            <asp:ListItem value="Mass Communication &amp; Journalism" Text="Mass Communication &amp; Journalism"></asp:ListItem>
                                            <asp:ListItem value="Materials &amp; Metallurgical Engineering" Text="Materials &amp; Metallurgical Engineering"></asp:ListItem>
                                            <asp:ListItem value="Mathematics" Text="Mathematics"></asp:ListItem>
                                            <asp:ListItem value="Mechanical Engineering" Text="Mechanical Engineering"></asp:ListItem>
                                            <asp:ListItem value="Medicine" Text="Medicine"></asp:ListItem>
                                            <asp:ListItem value="Microbiology" Text="Microbiology"></asp:ListItem>
                                            <asp:ListItem value="Nautical Science" Text="Nautical Science"></asp:ListItem>
                                            <asp:ListItem value="Naval Architecture and Marine Engineering" Text="Naval Architecture and Marine Engineering"></asp:ListItem>
                                            <asp:ListItem value="Personnel Management" Text="Personnel Management"></asp:ListItem>
                                            <asp:ListItem value="Petroleum and Mineral Resource Engineering" Text="Petroleum and Mineral Resource Engineering"></asp:ListItem>
                                            <asp:ListItem value="Pharmaceutical Technology" Text="Pharmaceutical Technology"></asp:ListItem>
                                            <asp:ListItem value="Pharmacology" Text="Pharmacology"></asp:ListItem>
                                            <asp:ListItem value="Pharmacy" Text="Pharmacy"></asp:ListItem>
                                            <asp:ListItem value="Philosophy" Text="Philosophy"></asp:ListItem>
                                            <asp:ListItem value="Physics" Text="Physics"></asp:ListItem>
                                            <asp:ListItem value="Political Science" Text="Political Science"></asp:ListItem>
                                            <asp:ListItem value="Population Science" Text="Population Science"></asp:ListItem>
                                            <asp:ListItem value="Psychology" Text="Psychology"></asp:ListItem>
                                            <asp:ListItem value="Public Administration" Text="Public Administration"></asp:ListItem>
                                            <asp:ListItem value="Public Health" Text="Public Health"></asp:ListItem>
                                            <asp:ListItem value="Public Relations" Text="Public Relations"></asp:ListItem>
                                            <asp:ListItem value="Sanskrit &amp; Pali" Text="Sanskrit &amp; Pali"></asp:ListItem>
                                            <asp:ListItem value="Science" Text="Science"></asp:ListItem>
                                            <asp:ListItem value="Service Marketing" Text="Service Marketing"></asp:ListItem>
                                            <asp:ListItem value="Social Science" Text="Social Science"></asp:ListItem>
                                            <asp:ListItem value="Sociology" Text="Sociology"></asp:ListItem>
                                            <asp:ListItem value="Statistics" Text="Statistics"></asp:ListItem>
                                            <asp:ListItem value="Strategic Management" Text="Strategic Management"></asp:ListItem>
                                            <asp:ListItem value="Supply Chain Management" Text="Supply Chain Management"></asp:ListItem>
                                            <asp:ListItem value="Telecommunication" Text="Telecommunication"></asp:ListItem>
                                            <asp:ListItem value="Textile Technology" Text="Textile Technology"></asp:ListItem>
                                            <asp:ListItem value="Theater &amp; Music" Text="Theater &amp; Music"></asp:ListItem>
                                            <asp:ListItem value="Urban &amp; Regional Planning" Text="Urban &amp; Regional Planning"></asp:ListItem>
                                            <asp:ListItem value="Urdu &amp; Persian" Text="Urdu &amp; Persian"></asp:ListItem>
                                            <asp:ListItem value="Veterinary Science" Text="Veterinary Science"></asp:ListItem>
                                            <asp:ListItem value="Water Resources Engineering" Text="Water Resources Engineering"></asp:ListItem>
                                            <asp:ListItem value="Women Studies" Text="Women Studies"></asp:ListItem>
                                            <asp:ListItem value="World Religions" Text="World Religions"></asp:ListItem>
                                            <asp:ListItem value="Zoology" Text="Zoology"></asp:ListItem>
                                            <asp:ListItem value="-10" Text="Others"></asp:ListItem>                                            
                                        </asp:DropDownList>
                                        <br />
                                        <asp:TextBox ID="txtSubject" runat="server" Width="450px" Text='<%# Bind("Subject_Name") %>' MaxLength="255"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="cboSubject" runat="server" AppendDataBoundItems="true" >
                                            <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="Accounting" Value="Accounting"></asp:ListItem>
                                            <asp:ListItem Text="Accounting &amp; Information System" Value="Accounting &amp; Information System"></asp:ListItem>
                                            <asp:ListItem Text="Agriculture" Value="Agriculture"></asp:ListItem>
                                            <asp:ListItem Text="Agro-technology" Value="Agro-technology"></asp:ListItem>                                            
                                            <asp:ListItem Text="Animal Husbandry" value="Animal Husbandry"></asp:ListItem>
                                            <asp:ListItem value="Anthropology" Text="Anthropology"></asp:ListItem>
                                            <asp:ListItem value="Applied Chemistry" Text="Applied Chemistry"></asp:ListItem>
                                            <asp:ListItem value="Applied Physics" Text="Applied Physics"></asp:ListItem>
                                            <asp:ListItem value="Arabic" Text="Arabic"></asp:ListItem>
                                            <asp:ListItem value="Archaeology" Text="Archaeology"></asp:ListItem>
                                            <asp:ListItem value="Architecture" Text="Architecture"></asp:ListItem>
                                            <asp:ListItem value="Arts" Text="Arts"></asp:ListItem>
                                            <asp:ListItem value="Automobile" Text="Automobile"></asp:ListItem>
                                            <asp:ListItem value="Banking" Text="Banking"></asp:ListItem>
                                            <asp:ListItem value="Bengali" Text="Bengali"></asp:ListItem>
                                            <asp:ListItem value="Biochemistry" Text="Biochemistry"></asp:ListItem>
                                            <asp:ListItem value="Biology" Text="Biology"></asp:ListItem>
                                            <asp:ListItem value="Biotechnology" Text="Biotechnology"></asp:ListItem>
                                            <asp:ListItem value="Botany" Text="Botany"></asp:ListItem>
                                            <asp:ListItem value="Brand Management" Text="Brand Management"></asp:ListItem>
                                            <asp:ListItem value="Business Administration" Text="Business Administration"></asp:ListItem>
                                            <asp:ListItem value="Business Studies" Text="Business Studies"></asp:ListItem>
                                            <asp:ListItem value="Chemical Technical/Engineering" Text="Chemical Technical/Engineering"></asp:ListItem>
                                            <asp:ListItem value="Chemistry" Text="Chemistry"></asp:ListItem>
                                            <asp:ListItem value="Civil Engineering" Text="Civil Engineering"></asp:ListItem>
                                            <asp:ListItem value="Commerce" Text="Commerce"></asp:ListItem>
                                            <asp:ListItem value="Communication Engineering" Text="Communication Engineering"></asp:ListItem>
                                            <asp:ListItem value="Computer Applications" Text="Computer Applications"></asp:ListItem>
                                            <asp:ListItem value="Computer Engineering" Text="Computer Engineering"></asp:ListItem>
                                            <asp:ListItem value="Computer Science" Text="Computer Science"></asp:ListItem>
                                            <asp:ListItem value="Computer Science &amp; Engineering" Text="Computer Science &amp; Engineering"></asp:ListItem>
                                            <asp:ListItem value="Computing &amp; Information System" Text="Computing &amp; Information System"></asp:ListItem>
                                            <asp:ListItem value="Cost &amp; Management Accounting" Text="Cost &amp; Management Accounting"></asp:ListItem>
                                            <asp:ListItem value="Cost Accounting" Text="Cost Accounting"></asp:ListItem>
                                            <asp:ListItem value="Development Studies" Text="Development Studies"></asp:ListItem>
                                            <asp:ListItem value="Economics" Text="Economics"></asp:ListItem>
                                            <asp:ListItem value="Education" Text="Education"></asp:ListItem>
                                            <asp:ListItem value="Electrical &amp; Electronic Engineering" Text="Electrical &amp; Electronic Engineering"></asp:ListItem>
                                            <asp:ListItem value="Electronics" Text="Electronics"></asp:ListItem>
                                            <asp:ListItem value="Electronics and Telecommunication Engineering" Text="Electronics and Telecommunication Engineering"></asp:ListItem>
                                            <asp:ListItem value="English" Text="English"></asp:ListItem>
                                            <asp:ListItem value="Environmental Planning" Text="Environmental Planning"></asp:ListItem>
                                            <asp:ListItem value="Finance" Text="Finance"></asp:ListItem>
                                            <asp:ListItem value="Finance &amp; Banking" Text="Finance &amp; Banking"></asp:ListItem>
                                            <asp:ListItem value="Fine Arts" Text="Fine Arts"></asp:ListItem>
                                            <asp:ListItem value="Fisheries" Text="Fisheries"></asp:ListItem>
                                            <asp:ListItem value="Flim and Media" Text="Flim and Media"></asp:ListItem>
                                            <asp:ListItem value="Forestry" Text="Forestry"></asp:ListItem>
                                            <asp:ListItem value="Genetics" Text="Genetics"></asp:ListItem>
                                            <asp:ListItem value="Geography" Text="Geography"></asp:ListItem>
                                            <asp:ListItem value="Geography and Environment" Text="Geography and Environment"></asp:ListItem>
                                            <asp:ListItem value="Geology" Text="Geology"></asp:ListItem>
                                            <asp:ListItem value="Government &amp; Politics" Text="Government &amp; Politics"></asp:ListItem>
                                            <asp:ListItem value="History" Text="History"></asp:ListItem>
                                            <asp:ListItem value="Horticulture" Text="Horticulture"></asp:ListItem>
                                            <asp:ListItem value="Hospitality Management" Text="Hospitality Management"></asp:ListItem>
                                            <asp:ListItem value="Human Resource Management" Text="Human Resource Management"></asp:ListItem>
                                            <asp:ListItem value="Industrial Eng &amp; Production" Text="Industrial Eng &amp; Production"></asp:ListItem>
                                            <asp:ListItem value="Industrial Engineering" Text="Industrial Engineering"></asp:ListItem>
                                            <asp:ListItem value="Industrial Management" Text="Industrial Management"></asp:ListItem>
                                            <asp:ListItem value="Industrial Relations" Text="Industrial Relations"></asp:ListItem>
                                            <asp:ListItem value="Information Engineering" Text="Information Engineering"></asp:ListItem>
                                            <asp:ListItem value="Information Science &amp; Library Management" Text="Information Science &amp; Library Management"></asp:ListItem>
                                            <asp:ListItem value="Information Systems" Text="Information Systems"></asp:ListItem>
                                            <asp:ListItem value="Information Technology" Text="Information Technology"></asp:ListItem>
                                            <asp:ListItem value="Insurance" Text="Insurance"></asp:ListItem>
                                            <asp:ListItem value="International Business" Text="International Business"></asp:ListItem>
                                            <asp:ListItem value="International Relations" Text="International Relations"></asp:ListItem>
                                            <asp:ListItem value="Islamic History &amp; Culture" Text="Islamic History &amp; Culture"></asp:ListItem>
                                            <asp:ListItem value="Islamic Studies" Text="Islamic Studies"></asp:ListItem>
                                            <asp:ListItem value="Journalism" Text="Journalism"></asp:ListItem>
                                            <asp:ListItem value="Law" Text="Law"></asp:ListItem>
                                            <asp:ListItem value="Linguistics" Text="Linguistics"></asp:ListItem>
                                            <asp:ListItem value="Management" Text="Management"></asp:ListItem>
                                            <asp:ListItem value="Management Information System" Text="Management Information System"></asp:ListItem>
                                            <asp:ListItem value="Management Studies/Science" Text="Management Studies/Science"></asp:ListItem>
                                            <asp:ListItem value="Marine Engineering" Text="Marine Engineering"></asp:ListItem>
                                            <asp:ListItem value="Marketing" Text="Marketing"></asp:ListItem>
                                            <asp:ListItem value="Mass Communication &amp; Journalism" Text="Mass Communication &amp; Journalism"></asp:ListItem>
                                            <asp:ListItem value="Materials &amp; Metallurgical Engineering" Text="Materials &amp; Metallurgical Engineering"></asp:ListItem>
                                            <asp:ListItem value="Mathematics" Text="Mathematics"></asp:ListItem>
                                            <asp:ListItem value="Mechanical Engineering" Text="Mechanical Engineering"></asp:ListItem>
                                            <asp:ListItem value="Medicine" Text="Medicine"></asp:ListItem>
                                            <asp:ListItem value="Microbiology" Text="Microbiology"></asp:ListItem>
                                            <asp:ListItem value="Nautical Science" Text="Nautical Science"></asp:ListItem>
                                            <asp:ListItem value="Naval Architecture and Marine Engineering" Text="Naval Architecture and Marine Engineering"></asp:ListItem>
                                            <asp:ListItem value="Personnel Management" Text="Personnel Management"></asp:ListItem>
                                            <asp:ListItem value="Petroleum and Mineral Resource Engineering" Text="Petroleum and Mineral Resource Engineering"></asp:ListItem>
                                            <asp:ListItem value="Pharmaceutical Technology" Text="Pharmaceutical Technology"></asp:ListItem>
                                            <asp:ListItem value="Pharmacology" Text="Pharmacology"></asp:ListItem>
                                            <asp:ListItem value="Pharmacy" Text="Pharmacy"></asp:ListItem>
                                            <asp:ListItem value="Philosophy" Text="Philosophy"></asp:ListItem>
                                            <asp:ListItem value="Physics" Text="Physics"></asp:ListItem>
                                            <asp:ListItem value="Political Science" Text="Political Science"></asp:ListItem>
                                            <asp:ListItem value="Population Science" Text="Population Science"></asp:ListItem>
                                            <asp:ListItem value="Psychology" Text="Psychology"></asp:ListItem>
                                            <asp:ListItem value="Public Administration" Text="Public Administration"></asp:ListItem>
                                            <asp:ListItem value="Public Health" Text="Public Health"></asp:ListItem>
                                            <asp:ListItem value="Public Relations" Text="Public Relations"></asp:ListItem>
                                            <asp:ListItem value="Sanskrit &amp; Pali" Text="Sanskrit &amp; Pali"></asp:ListItem>
                                            <asp:ListItem value="Science" Text="Science"></asp:ListItem>
                                            <asp:ListItem value="Service Marketing" Text="Service Marketing"></asp:ListItem>
                                            <asp:ListItem value="Social Science" Text="Social Science"></asp:ListItem>
                                            <asp:ListItem value="Sociology" Text="Sociology"></asp:ListItem>
                                            <asp:ListItem value="Statistics" Text="Statistics"></asp:ListItem>
                                            <asp:ListItem value="Strategic Management" Text="Strategic Management"></asp:ListItem>
                                            <asp:ListItem value="Supply Chain Management" Text="Supply Chain Management"></asp:ListItem>
                                            <asp:ListItem value="Telecommunication" Text="Telecommunication"></asp:ListItem>
                                            <asp:ListItem value="Textile Technology" Text="Textile Technology"></asp:ListItem>
                                            <asp:ListItem value="Theater &amp; Music" Text="Theater &amp; Music"></asp:ListItem>
                                            <asp:ListItem value="Urban &amp; Regional Planning" Text="Urban &amp; Regional Planning"></asp:ListItem>
                                            <asp:ListItem value="Urdu &amp; Persian" Text="Urdu &amp; Persian"></asp:ListItem>
                                            <asp:ListItem value="Veterinary Science" Text="Veterinary Science"></asp:ListItem>
                                            <asp:ListItem value="Water Resources Engineering" Text="Water Resources Engineering"></asp:ListItem>
                                            <asp:ListItem value="Women Studies" Text="Women Studies"></asp:ListItem>
                                            <asp:ListItem value="World Religions" Text="World Religions"></asp:ListItem>
                                            <asp:ListItem value="Zoology" Text="Zoology"></asp:ListItem>
                                            <asp:ListItem value="-10" Text="Others"></asp:ListItem>                                            
                                        </asp:DropDownList>
                                        <br />
                                        <asp:TextBox ID="txtSubject" runat="server" Width="450px" Text='<%# Bind("Subject_Name") %>' MaxLength="255"></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Institute Name" SortExpression="Institute_Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInstitute" runat="server" Text='<%# Eval("Institute_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="cboInstitute" runat="server" AppendDataBoundItems="true" SelectedValue='<%# Bind("Institute_Name") %>'>                                            
                                            <asp:ListItem value="-1" Text="Select"></asp:ListItem>
                                            <asp:ListItem Text="Ahsanullah University of Science and Technology" Value="Ahsanullah University of Science and 

                                            Technology"></asp:ListItem>

                                            <asp:ListItem value="America Bangladesh University" Text="America Bangladesh University"></asp:ListItem>
                                            <asp:ListItem value="American International University Bangladesh" Text="American International University 

                                            Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="ASA University Bangladesh" Text="ASA University Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Asian University for Women" Text="Asian University for Women"></asp:ListItem>
                                            <asp:ListItem value="Asian University of Bangladesh" Text="Asian University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Atish Dipankar University of Science and Technology" Text="Atish Dipankar University of Science and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Bangabandhu Sheikh Mujib Medical University" Text="Bangabandhu Sheikh Mujib Medical 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="Bangabandhu Sheikh Mujibur Rahman Agricultural University" Text="Bangabandhu Sheikh Mujibur Rahman 

                                            Agricultural University"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh Agricultural University, Mymensingh" Text="Bangladesh Agricultural University, 

                                            Mymensingh"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh Islami University" Text="Bangladesh Islami University"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh Open University" Text="Bangladesh Open University"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University" Text="Bangladesh University"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University of Business and Technology" Text="Bangladesh University of Business and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University of Engineering and Technology" Text="Bangladesh University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University of Professionals" Text="Bangladesh University of Professionals"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University of Textiles" Text="Bangladesh University of Textiles"></asp:ListItem>
                                            <asp:ListItem value="Begum Gulchemonara Trust University" Text="Begum Gulchemonara Trust University"></asp:ListItem>
                                            <asp:ListItem value="BGC Trust University Bangladesh, Chittagong" Text="BGC Trust University Bangladesh, 

                                            Chittagong"></asp:ListItem>
                                            <asp:ListItem value="BGMEA University of Fashion Technology" Text="BGMEA University of Fashion Technology"></asp:ListItem>
                                            <asp:ListItem value="BRAC University" Text="BRAC University"></asp:ListItem>
                                            <asp:ListItem value="Central Women`s University" Text="Central Women`s University"></asp:ListItem>
                                            <asp:ListItem value="Chittagong University of Engineering and Technology" Text="Chittagong University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Chittagong Veterinary and Animal Sciences University" Text="Chittagong Veterinary and Animal Sciences 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="City University" Text="City University"></asp:ListItem>
                                            <asp:ListItem value="Comilla University" Text="Comilla University"></asp:ListItem>
                                            <asp:ListItem value="Daffodil International University" Text="Daffodil International University"></asp:ListItem>
                                            <asp:ListItem value="Darul Ihsan University" Text="Darul Ihsan University"></asp:ListItem>
                                            <asp:ListItem value="Dhaka International University" Text="Dhaka International University"></asp:ListItem>
                                            <asp:ListItem value="Dhaka University of Engineering &amp; Technology" Text="Dhaka University of Engineering &amp; 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Dhaka University of Engineering and Technology" Text="Dhaka University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="East Delta University, Chittagong" Text="East Delta University, Chittagong"></asp:ListItem>
                                            <asp:ListItem value="East West University" selected="" Text="East West University"></asp:ListItem>
                                            <asp:ListItem value="Eastern University" Text="Eastern University"></asp:ListItem>
                                            <asp:ListItem value="Gono Bishwabidyalay" Text="Gono Bishwabidyalay"></asp:ListItem>
                                            <asp:ListItem value="Green University of Bangladesh" Text="Green University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Hajee Mohammad Danesh Science and Technology University" Text="Hajee Mohammad Danesh Science and 

                                            Technology University"></asp:ListItem>
                                            <asp:ListItem value="IBA, Dhaka University" Text="IBA, Dhaka University"></asp:ListItem>
                                            <asp:ListItem value="IBA, Jahangirnagar University" Text="IBA, Jahangirnagar University"></asp:ListItem>
                                            <asp:ListItem value="IBA, Rajshahi University" Text="IBA, Rajshahi University"></asp:ListItem>
                                            <asp:ListItem value="IBAIS University" Text="IBAIS University"></asp:ListItem>
                                            <asp:ListItem value="Independent University, Bangladesh" Text="Independent University, Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="International Islamic University, Chittagong" Text="International Islamic University, 

                                            Chittagong"></asp:ListItem>
                                            <asp:ListItem value="International University of Business Agriculture and Technology" Text="International University of 

                                            Business Agriculture and Technology"></asp:ListItem>
                                            <asp:ListItem value="Islamic University" Text="Islamic University"></asp:ListItem>
                                            <asp:ListItem value="Islamic University of Technology" Text="Islamic University of Technology"></asp:ListItem>
                                            <asp:ListItem value="Jagannath University" Text="Jagannath University"></asp:ListItem>
                                            <asp:ListItem value="Jahangirnagar University" Text="Jahangirnagar University"></asp:ListItem>
                                            <asp:ListItem value="Jatiya Kabi Kazi Nazrul Islam University" Text="Jatiya Kabi Kazi Nazrul Islam University"></asp:ListItem>
                                            <asp:ListItem value="Jessore Science &amp; Technology University" Text="Jessore Science &amp; Technology 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="Khulna University" Text="Khulna University"></asp:ListItem>
                                            <asp:ListItem value="Khulna University of Engineering and Technology" Text="Khulna University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Leading University" Text="Leading University"></asp:ListItem>
                                            <asp:ListItem value="Manarat International University" Text="Manarat International University"></asp:ListItem>
                                            <asp:ListItem value="Mawlana Bhasani Science and Technology University" Text="Mawlana Bhasani Science and Technology 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="Metropolitan University, Sylhet" Text="Metropolitan University, Sylhet"></asp:ListItem>
                                            <asp:ListItem value="Military Institute of Science and Technology (MIST)" Text="Military Institute of Science and 

                                            Technology (MIST)"></asp:ListItem>
                                            <asp:ListItem value="National University" Text="National University"></asp:ListItem>
                                            <asp:ListItem value="Noakhali Science and Technology University" Text="Noakhali Science and Technology University"></asp:ListItem>
                                            <asp:ListItem value="North South University" Text="North South University"></asp:ListItem>
                                            <asp:ListItem value="Northern University Bangladesh" Text="Northern University Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Pabna University of Science and Technology" Text="Pabna University of Science and Technology"></asp:ListItem>
                                            <asp:ListItem value="Patuakhali Science and Technology University" Text="Patuakhali Science and Technology 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="Premier University, Chittagong" Text="Premier University, Chittagong"></asp:ListItem>
                                            <asp:ListItem value="Presidency University" Text="Presidency University"></asp:ListItem>
                                            <asp:ListItem value="Prime University" Text="Prime University"></asp:ListItem>
                                            <asp:ListItem value="Primeasia University" Text="Primeasia University"></asp:ListItem>
                                            <asp:ListItem value="Pundra University of Science and Technology" Text="Pundra University of Science and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Queens University" Text="Queens University"></asp:ListItem>
                                            <asp:ListItem value="Rajshahi University" Text="Rajshahi University"></asp:ListItem>
                                            <asp:ListItem value="Rajshahi University of Engineering and Technology" Text="Rajshahi University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Rangpur University" Text="Rangpur University"></asp:ListItem>
                                            <asp:ListItem value="Royal University of Dhaka" Text="Royal University of Dhaka"></asp:ListItem>
                                            <asp:ListItem value="Shahjalal University of Science &amp; Technology" Text="Shahjalal University of Science &amp; 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Shanto Mariam University of Creative Technology" Text="Shanto Mariam University of Creative 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Sher-e-Bangla Agricultural University" Text="Sher-e-Bangla Agricultural University"></asp:ListItem>
                                            <asp:ListItem value="South Asian University" Text="South Asian University"></asp:ListItem>
                                            <asp:ListItem value="Southeast University" Text="Southeast University"></asp:ListItem>
                                            <asp:ListItem value="Southern University of Bangladesh, Chittagong" Text="Southern University of Bangladesh, 

                                            Chittagong"></asp:ListItem>
                                            <asp:ListItem value="Stamford University Bangladesh" Text="Stamford University Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="State University of Bangladesh" Text="State University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Sylhet Agricultural University" Text="Sylhet Agricultural University"></asp:ListItem>
                                            <asp:ListItem value="Sylhet International University, Sylhet" Text="Sylhet International University, Sylhet"></asp:ListItem>
                                            <asp:ListItem value="The Millenium University" Text="The Millenium University"></asp:ListItem>
                                            <asp:ListItem value="The Peoples University of Bangladesh" Text="The Peoples University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="The University of Asia Pacific" Text="The University of Asia Pacific"></asp:ListItem>
                                            <asp:ListItem value="United International University" Text="United International University"></asp:ListItem>
                                            <asp:ListItem value="University of Chittagong" Text="University of Chittagong"></asp:ListItem>
                                            <asp:ListItem value="University of Development Alternative" Text="University of Development Alternative"></asp:ListItem>
                                            <asp:ListItem value="University of Dhaka" Text="University of Dhaka"></asp:ListItem>
                                            <asp:ListItem value="University of Information Technology &amp; Science" Text="University of Information Technology &amp; 

                                            Science"></asp:ListItem>
                                            <asp:ListItem value="University of Liberal Arts Bangladesh" Text="University of Liberal Arts Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="University of Science and Technology, Chittagong" Text="University of Science and Technology, 

                                            Chittagong"></asp:ListItem>
                                            <asp:ListItem value="University of South Asia" Text="University of South Asia"></asp:ListItem>
                                            <asp:ListItem value="Uttara University" Text="Uttara University"></asp:ListItem>
                                            <asp:ListItem value="Victoria University of Bangladesh" Text="Victoria University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="World University of Bangladesh" Text="World University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="-10" Text="Others"></asp:ListItem>		
                                        </asp:DropDownList>
                                        <br />
                                        <asp:TextBox ID="txtInstitute" runat="server" Width="450px" Text='<%# Bind("Institute_Name") %>' MaxLength="255"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                         <asp:DropDownList ID="cboInstitute" runat="server" AppendDataBoundItems="true" SelectedValue='<%# Bind("Institute_Name") %>'>                                            
                                            <asp:ListItem value="-1" Text="Select"></asp:ListItem>
                                            <asp:ListItem Text="Ahsanullah University of Science and Technology" Value="Ahsanullah University of Science and Technology"></asp:ListItem>
                                            <asp:ListItem value="America Bangladesh University" Text="America Bangladesh University"></asp:ListItem>
                                            <asp:ListItem value="American International University Bangladesh" Text="American International University Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="ASA University Bangladesh" Text="ASA University Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Asian University for Women" Text="Asian University for Women"></asp:ListItem>
                                            <asp:ListItem value="Asian University of Bangladesh" Text="Asian University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Atish Dipankar University of Science and Technology" Text="Atish Dipankar University of Science and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Bangabandhu Sheikh Mujib Medical University" Text="Bangabandhu Sheikh Mujib Medical 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="Bangabandhu Sheikh Mujibur Rahman Agricultural University" Text="Bangabandhu Sheikh Mujibur Rahman 

                                            Agricultural University"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh Agricultural University, Mymensingh" Text="Bangladesh Agricultural University, 

                                            Mymensingh"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh Islami University" Text="Bangladesh Islami University"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh Open University" Text="Bangladesh Open University"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University" Text="Bangladesh University"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University of Business and Technology" Text="Bangladesh University of Business and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University of Engineering and Technology" Text="Bangladesh University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University of Professionals" Text="Bangladesh University of Professionals"></asp:ListItem>
                                            <asp:ListItem value="Bangladesh University of Textiles" Text="Bangladesh University of Textiles"></asp:ListItem>
                                            <asp:ListItem value="Begum Gulchemonara Trust University" Text="Begum Gulchemonara Trust University"></asp:ListItem>
                                            <asp:ListItem value="BGC Trust University Bangladesh, Chittagong" Text="BGC Trust University Bangladesh, 

                                            Chittagong"></asp:ListItem>
                                            <asp:ListItem value="BGMEA University of Fashion Technology" Text="BGMEA University of Fashion Technology"></asp:ListItem>
                                            <asp:ListItem value="BRAC University" Text="BRAC University"></asp:ListItem>
                                            <asp:ListItem value="Central Women`s University" Text="Central Women`s University"></asp:ListItem>
                                            <asp:ListItem value="Chittagong University of Engineering and Technology" Text="Chittagong University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Chittagong Veterinary and Animal Sciences University" Text="Chittagong Veterinary and Animal Sciences 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="City University" Text="City University"></asp:ListItem>
                                            <asp:ListItem value="Comilla University" Text="Comilla University"></asp:ListItem>
                                            <asp:ListItem value="Daffodil International University" Text="Daffodil International University"></asp:ListItem>
                                            <asp:ListItem value="Darul Ihsan University" Text="Darul Ihsan University"></asp:ListItem>
                                            <asp:ListItem value="Dhaka International University" Text="Dhaka International University"></asp:ListItem>
                                            <asp:ListItem value="Dhaka University of Engineering &amp; Technology" Text="Dhaka University of Engineering &amp; 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Dhaka University of Engineering and Technology" Text="Dhaka University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="East Delta University, Chittagong" Text="East Delta University, Chittagong"></asp:ListItem>
                                            <asp:ListItem value="East West University" selected="" Text="East West University"></asp:ListItem>
                                            <asp:ListItem value="Eastern University" Text="Eastern University"></asp:ListItem>
                                            <asp:ListItem value="Gono Bishwabidyalay" Text="Gono Bishwabidyalay"></asp:ListItem>
                                            <asp:ListItem value="Green University of Bangladesh" Text="Green University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Hajee Mohammad Danesh Science and Technology University" Text="Hajee Mohammad Danesh Science and 

                                            Technology University"></asp:ListItem>
                                            <asp:ListItem value="IBA, Dhaka University" Text="IBA, Dhaka University"></asp:ListItem>
                                            <asp:ListItem value="IBA, Jahangirnagar University" Text="IBA, Jahangirnagar University"></asp:ListItem>
                                            <asp:ListItem value="IBA, Rajshahi University" Text="IBA, Rajshahi University"></asp:ListItem>
                                            <asp:ListItem value="IBAIS University" Text="IBAIS University"></asp:ListItem>
                                            <asp:ListItem value="Independent University, Bangladesh" Text="Independent University, Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="International Islamic University, Chittagong" Text="International Islamic University, 

                                            Chittagong"></asp:ListItem>
                                            <asp:ListItem value="International University of Business Agriculture and Technology" Text="International University of 

                                            Business Agriculture and Technology"></asp:ListItem>
                                            <asp:ListItem value="Islamic University" Text="Islamic University"></asp:ListItem>
                                            <asp:ListItem value="Islamic University of Technology" Text="Islamic University of Technology"></asp:ListItem>
                                            <asp:ListItem value="Jagannath University" Text="Jagannath University"></asp:ListItem>
                                            <asp:ListItem value="Jahangirnagar University" Text="Jahangirnagar University"></asp:ListItem>
                                            <asp:ListItem value="Jatiya Kabi Kazi Nazrul Islam University" Text="Jatiya Kabi Kazi Nazrul Islam University"></asp:ListItem>
                                            <asp:ListItem value="Jessore Science &amp; Technology University" Text="Jessore Science &amp; Technology 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="Khulna University" Text="Khulna University"></asp:ListItem>
                                            <asp:ListItem value="Khulna University of Engineering and Technology" Text="Khulna University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Leading University" Text="Leading University"></asp:ListItem>
                                            <asp:ListItem value="Manarat International University" Text="Manarat International University"></asp:ListItem>
                                            <asp:ListItem value="Mawlana Bhasani Science and Technology University" Text="Mawlana Bhasani Science and Technology 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="Metropolitan University, Sylhet" Text="Metropolitan University, Sylhet"></asp:ListItem>
                                            <asp:ListItem value="Military Institute of Science and Technology (MIST)" Text="Military Institute of Science and 

                                            Technology (MIST)"></asp:ListItem>
                                            <asp:ListItem value="National University" Text="National University"></asp:ListItem>
                                            <asp:ListItem value="Noakhali Science and Technology University" Text="Noakhali Science and Technology University"></asp:ListItem>
                                            <asp:ListItem value="North South University" Text="North South University"></asp:ListItem>
                                            <asp:ListItem value="Northern University Bangladesh" Text="Northern University Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Pabna University of Science and Technology" Text="Pabna University of Science and Technology"></asp:ListItem>
                                            <asp:ListItem value="Patuakhali Science and Technology University" Text="Patuakhali Science and Technology 

                                            University"></asp:ListItem>
                                            <asp:ListItem value="Premier University, Chittagong" Text="Premier University, Chittagong"></asp:ListItem>
                                            <asp:ListItem value="Presidency University" Text="Presidency University"></asp:ListItem>
                                            <asp:ListItem value="Prime University" Text="Prime University"></asp:ListItem>
                                            <asp:ListItem value="Primeasia University" Text="Primeasia University"></asp:ListItem>
                                            <asp:ListItem value="Pundra University of Science and Technology" Text="Pundra University of Science and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Queens University" Text="Queens University"></asp:ListItem>
                                            <asp:ListItem value="Rajshahi University" Text="Rajshahi University"></asp:ListItem>
                                            <asp:ListItem value="Rajshahi University of Engineering and Technology" Text="Rajshahi University of Engineering and 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Rangpur University" Text="Rangpur University"></asp:ListItem>
                                            <asp:ListItem value="Royal University of Dhaka" Text="Royal University of Dhaka"></asp:ListItem>
                                            <asp:ListItem value="Shahjalal University of Science &amp; Technology" Text="Shahjalal University of Science &amp; 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Shanto Mariam University of Creative Technology" Text="Shanto Mariam University of Creative 

                                            Technology"></asp:ListItem>
                                            <asp:ListItem value="Sher-e-Bangla Agricultural University" Text="Sher-e-Bangla Agricultural University"></asp:ListItem>
                                            <asp:ListItem value="South Asian University" Text="South Asian University"></asp:ListItem>
                                            <asp:ListItem value="Southeast University" Text="Southeast University"></asp:ListItem>
                                            <asp:ListItem value="Southern University of Bangladesh, Chittagong" Text="Southern University of Bangladesh, Chittagong"></asp:ListItem>
                                            <asp:ListItem value="Stamford University Bangladesh" Text="Stamford University Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="State University of Bangladesh" Text="State University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="Sylhet Agricultural University" Text="Sylhet Agricultural University"></asp:ListItem>
                                            <asp:ListItem value="Sylhet International University, Sylhet" Text="Sylhet International University, Sylhet"></asp:ListItem>
                                            <asp:ListItem value="The Millenium University" Text="The Millenium University"></asp:ListItem>
                                            <asp:ListItem value="The Peoples University of Bangladesh" Text="The Peoples University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="The University of Asia Pacific" Text="The University of Asia Pacific"></asp:ListItem>
                                            <asp:ListItem value="United International University" Text="United International University"></asp:ListItem>
                                            <asp:ListItem value="University of Chittagong" Text="University of Chittagong"></asp:ListItem>
                                            <asp:ListItem value="University of Development Alternative" Text="University of Development Alternative"></asp:ListItem>
                                            <asp:ListItem value="University of Dhaka" Text="University of Dhaka"></asp:ListItem>
                                            <asp:ListItem value="University of Information Technology &amp; Science" Text="University of Information Technology &amp; Science"></asp:ListItem>
                                            <asp:ListItem value="University of Liberal Arts Bangladesh" Text="University of Liberal Arts Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="University of Science and Technology, Chittagong" Text="University of Science and Technology, Chittagong"></asp:ListItem>
                                            <asp:ListItem value="University of South Asia" Text="University of South Asia"></asp:ListItem>
                                            <asp:ListItem value="Uttara University" Text="Uttara University"></asp:ListItem>
                                            <asp:ListItem value="Victoria University of Bangladesh" Text="Victoria University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="World University of Bangladesh" Text="World University of Bangladesh"></asp:ListItem>
                                            <asp:ListItem value="-10" Text="Others"></asp:ListItem>		
                                        </asp:DropDownList>
                                        <br />
                                        <asp:TextBox ID="txtInstitute" runat="server" Width="450px" Text='<%# Bind("Institute_Name") %>' MaxLength="255"></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Result" SortExpression="Result">
                                    <ItemTemplate>
                                        <asp:Label ID="lblResult" runat="server" Text='<%# Eval("Result") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                       <asp:DropDownList ID="cboResult" runat="server" AppendDataBoundItems="true" SelectedValue='<%# Bind("Result") %>'>
                                            <asp:ListItem value="-1" Text="Select"></asp:ListItem>
                                            <asp:ListItem value="First Division/Class" Text="First Division/Class"></asp:ListItem>
                                            <asp:ListItem value="Second  Division/Class" Text="Second  Division/Class"></asp:ListItem>
                                            <asp:ListItem value="Third Division/Class" Text="Third Division/Class"></asp:ListItem>
                                            <asp:ListItem value="Grade" Text="Grade"></asp:ListItem>
                                            <asp:ListItem value="Appeared" Text="Appeared"></asp:ListItem>
                                            <asp:ListItem value="Enrolled" Text="Enrolled"></asp:ListItem>
                                            <asp:ListItem value="Awarded" Text="Awarded"></asp:ListItem>
                                            <asp:ListItem value="Do not mention" Text="Do not mention"></asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:TextBox ID="txtResult" runat="server" Width="200px" Text='<%# Bind("Result") %>' MaxLength="100"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="cboResult" runat="server" AppendDataBoundItems="true" SelectedValue='<%# Bind("Result") %>'>
                                            <asp:ListItem value="-1" Text="Select"></asp:ListItem>
                                            <asp:ListItem value="First Division/Class" Text="First Division/Class"></asp:ListItem>
                                            <asp:ListItem value="Second  Division/Class" Text="Second  Division/Class"></asp:ListItem>
                                            <asp:ListItem value="Third Division/Class" Text="Third Division/Class"></asp:ListItem>
                                            <asp:ListItem value="Grade" Text="Grade"></asp:ListItem>
                                            <asp:ListItem value="Appeared" Text="Appeared"></asp:ListItem>
                                            <asp:ListItem value="Enrolled" Text="Enrolled"></asp:ListItem>
                                            <asp:ListItem value="Awarded" Text="Awarded"></asp:ListItem>
                                            <asp:ListItem value="Do not mention" Text="Do not mention"></asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:TextBox ID="txtResult" runat="server" Width="200px" Text='<%# Bind("Result") %>' MaxLength="100"></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField> 
                            </Fields>
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:GridView ID="GridViewEducation" runat="server" CssClass="Grid" AllowSorting="True"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceEducationGrid" DataKeyNames="ID"
                            ForeColor="Black" GridLines="Vertical" AllowPaging="true" PageSize="20" PagerSettings-Mode="NumericFirstLast"
                            PagerSettings-Position="TopAndBottom" OnSelectedIndexChanging="GridViewEducation_SelectedIndexChanging">
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" PageButtonCount="30" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <Columns>                                
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                <asp:TemplateField HeaderText="From" SortExpression="FromDT">
                                    <ItemTemplate>
                                        <span title='<%# Eval("FromDT","{0:dddd, \ndd MMMM, yyyy }") %>'>
                                            <%# Eval("FromDT","{0:dd/MM/yyyy}")%>
                                            <span class="time-small" style="margin: 0px 15px 0px 5px">
                                                <%# Common.ToRelativeDate(Eval("FromDT"))%></span> </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To" SortExpression="ToDT">
                                    <ItemTemplate>
                                        <span title='<%# Eval("ToDT","{0:dddd, \ndd MMMM, yyyy }") %>'>
                                            <%# Eval("ToDT","{0:dd/MM/yyyy}")%>
                                            <span class="time-small" style="margin: 0px 15px 0px 5px">
                                                <%# Common.ToRelativeDate(Eval("ToDT"))%></span> </span>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                <asp:BoundField DataField="Department" HeaderText="No. Of Days" SortExpression="Department" ItemStyle-HorizontalAlign="Center"/>
                                <asp:TemplateField Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdGridtraining" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
                                            Height="20px" ToolTip="Open" CausesValidation="false" >
                                            <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                                        </asp:LinkButton>                                
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
                            <SelectedRowStyle BackColor="#FFD24D" />
                            <HeaderStyle BackColor="#6B696B" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                No Data Found.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceEducationGrid" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Education WHERE EmpID=@EMPID ORDER BY ID DESC"
                            SelectCommandType="Text">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceEducation" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Education WHERE ID=@ID" SelectCommandType="Text"
                            UpdateCommand="sp_EmpInfo_Professional_Experience_Edit" OnUpdated="SqlDataSourceEducation_Updated"
                            UpdateCommandType="StoredProcedure" InsertCommand="sp_EmpInfo_Professional_Experience_Add" InsertCommandType="StoredProcedure"
                            OnInserted="SqlDataSourceEducation_Inserted">
                            <SelectParameters>
                                <asp:ControlParameter Name="ID" ControlID="GridViewEducation" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Organization" Type="String" />
                                <asp:Parameter Name="Designation" Type="String" />                                
                                <asp:Parameter Name="FromDT" Type="DateTime" />
                                <asp:Parameter Name="ToDT" Type="DateTime" />
                                <asp:Parameter Name="Department" Type="String" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </UpdateParameters>
                            <InsertParameters>
                                <%--<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />--%>
                                <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Organization" Type="String" />
                                <asp:Parameter Name="Designation" Type="String" />                                
                                <asp:Parameter Name="FromDT" Type="DateTime" />
                                <asp:Parameter Name="ToDT" Type="DateTime" />
                                <asp:Parameter Name="Department" Type="String" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="TabPanelExperience" HeaderText="Experience">
                    <HeaderTemplate>
                        Professional Experience
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewExperience" runat="server" AutoGenerateRows="False"
                            CssClass="Grid" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            DataSourceID="SqlDataSourceExperience" CellPadding="4" DataKeyNames="ID" DefaultMode="ReadOnly"
                            ForeColor="Black" GridLines="Vertical">
                            <FooterStyle BackColor="#CCCC99" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Middle" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                <asp:Button ID="cmdNewExperience" runat="server" Text="Add New" CommandName="New" Width="100px" />
                            </EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField HeaderText="Organization" SortExpression="Organization">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrg" runat="server" Text='<%# Eval("Organization") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtOrg" runat="server" Text='<%# Bind("Organization") %>' Width="300px"
                                            ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorOrg" runat="server" ControlToValidate="txtOrg"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtOrg" runat="server" Text='<%# Bind("Organization") %>' Width="300px"
                                            ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorOrg" runat="server" ControlToValidate="txtOrg"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation" SortExpression="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("Designation") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDesignation" runat="server" Width="300px" Text='<%# Bind("Designation") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDesignation" runat="server" ControlToValidate="txtDesignation"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtDesignation" runat="server" Width="300px" Text='<%# Bind("Designation") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDesignation" runat="server" ControlToValidate="txtDesignation"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Duration" SortExpression="FromDT">
                                    <ItemTemplate>
                                        From:
                                        <%# Eval("FromDT", "{0:dd/MM/yyyy}")%>
                                        To:
                                        <%# Eval("ToDT", "{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        From:
                                        <asp:TextBox CssClass="Date" ID="txtFDateExp" Width="80px" runat="server" Text='<%# Bind("FromDT","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFExp" runat="server" ControlToValidate="txtFDateExp"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;&nbsp;&nbsp; To:
                                        <asp:TextBox CssClass="Date" ID="txtToDateExp" Width="80px" runat="server" Text='<%# Bind("ToDT","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorToExp" runat="server" ControlToValidate="txtToDateExp"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        From:
                                        <asp:TextBox CssClass="Date" ID="txtFDateExp" Width="80px" runat="server" Text='<%# Bind("FromDT","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFExp" runat="server" ControlToValidate="txtFDateExp"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;&nbsp;&nbsp; To:
                                        <asp:TextBox CssClass="Date" ID="txtToDateExp" Width="80px" runat="server" Text='<%# Bind("ToDT","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorToExp" runat="server" ControlToValidate="txtToDateExp"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department" SortExpression="Department">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("Department") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDepartment" runat="server" Width="200px" Text='<%# Bind("Department") %>' MaxLength="120"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDepartment" runat="server" ControlToValidate="txtDepartment"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtDepartment" runat="server" Width="200px" Text='<%# Bind("Department") %>' MaxLength="120"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDepartment" runat="server" ControlToValidate="txtDepartment"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Button ID="cmdEditExperience" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="Edit" />
                                        &nbsp;<asp:Button ID="ButtonExperience" runat="server" CausesValidation="False" CommandName="New"
                                            Text="New" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="cmdUpdateExperience" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="Update" />
                                        <asp:ConfirmButtonExtender ID="cmdUpdateExperience_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Update?" Enabled="True" TargetControlID="cmdUpdateExperience">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="ButtonExperience" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="cmdInsertExperience" runat="server" CausesValidation="false" CommandName="Insert"
                                            Text="Insert"  />
                                        <asp:ConfirmButtonExtender ID="cmdInsertExperience_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Save?" Enabled="True" TargetControlID="cmdInsertExperience">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="cmdCancelExperience" runat="server" CausesValidation="False"
                                            CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:GridView ID="GridViewExperience" runat="server" CssClass="Grid" AllowSorting="True"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceExperienceGrid" DataKeyNames="ID"
                            ForeColor="Black" GridLines="Vertical" AllowPaging="true" PageSize="20" PagerSettings-Mode="NumericFirstLast"
                            PagerSettings-Position="TopAndBottom" OnSelectedIndexChanging="GridViewExperience_SelectedIndexChanging">
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" PageButtonCount="30" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <Columns>                                
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                <asp:TemplateField HeaderText="From" SortExpression="FromDT">
                                    <ItemTemplate>
                                        <span title='<%# Eval("FromDT","{0:dddd, \ndd MMMM, yyyy }") %>'>
                                            <%# Eval("FromDT","{0:dd/MM/yyyy}")%>
                                            <span class="time-small" style="margin: 0px 15px 0px 5px">
                                                <%# Common.ToRelativeDate(Eval("FromDT"))%></span> </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To" SortExpression="ToDT">
                                    <ItemTemplate>
                                        <span title='<%# Eval("ToDT","{0:dddd, \ndd MMMM, yyyy }") %>'>
                                            <%# Eval("ToDT","{0:dd/MM/yyyy}")%>
                                            <span class="time-small" style="margin: 0px 15px 0px 5px">
                                                <%# Common.ToRelativeDate(Eval("ToDT"))%></span> </span>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                <asp:BoundField DataField="Department" HeaderText="No. Of Days" SortExpression="Department" ItemStyle-HorizontalAlign="Center"/>
                                <asp:TemplateField Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdGridtraining" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
                                            Height="20px" ToolTip="Open" CausesValidation="false" >
                                            <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                                        </asp:LinkButton>                                
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
                            <SelectedRowStyle BackColor="#FFD24D" />
                            <HeaderStyle BackColor="#6B696B" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                No Data Found.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceExperienceGrid" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Professional_Experience WHERE EmpID=@EMPID ORDER BY ID DESC"
                            SelectCommandType="Text">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceExperience" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Professional_Experience WHERE ID=@ID" SelectCommandType="Text"
                            UpdateCommand="sp_EmpInfo_Professional_Experience_Edit" OnUpdated="SqlDataSourceExperience_Updated"
                            UpdateCommandType="StoredProcedure" InsertCommand="sp_EmpInfo_Professional_Experience_Add" InsertCommandType="StoredProcedure"
                            OnInserted="SqlDataSourceExperience_Inserted">
                            <SelectParameters>
                                <asp:ControlParameter Name="ID" ControlID="GridViewExperience" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Organization" Type="String" />
                                <asp:Parameter Name="Designation" Type="String" />                                
                                <asp:Parameter Name="FromDT" Type="DateTime" />
                                <asp:Parameter Name="ToDT" Type="DateTime" />
                                <asp:Parameter Name="Department" Type="String" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </UpdateParameters>
                            <InsertParameters>
                                <%--<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />--%>
                                <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Organization" Type="String" />
                                <asp:Parameter Name="Designation" Type="String" />                                
                                <asp:Parameter Name="FromDT" Type="DateTime" />
                                <asp:Parameter Name="ToDT" Type="DateTime" />
                                <asp:Parameter Name="Department" Type="String" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="TabPanel2" HeaderText="Membership">
                    <HeaderTemplate>
                        Membership
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewMembership" runat="server" AutoGenerateRows="False"
                            CssClass="Grid" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            DataSourceID="SqlDataSourceMembership" CellPadding="4" DataKeyNames="ID" DefaultMode="ReadOnly"
                            ForeColor="Black" GridLines="Vertical">
                            <FooterStyle BackColor="#CCCC99" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Middle" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                <asp:Button ID="cmdNewMembership" runat="server" Text="Add New" CommandName="New" Width="100px" />
                            </EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField HeaderText="Name of the Association" SortExpression="Name_Association">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAssociation" runat="server" Text='<%# Eval("Name_Association") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAssociation" runat="server" Text='<%# Bind("Name_Association") %>' Width="300px"
                                            ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAssociation" runat="server" ControlToValidate="txtAssociation"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtAssociation" runat="server" Text='<%# Bind("Name_Association") %>' Width="300px"
                                            ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAssociation" runat="server" ControlToValidate="txtAssociation"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Member Category" SortExpression="Member_Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Member_Category") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCategory" runat="server" Width="300px" Text='<%# Bind("Member_Category") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" ControlToValidate="txtCategory"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtCategory" runat="server" Width="300px" Text='<%# Bind("Member_Category") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" ControlToValidate="txtCategory"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Button ID="cmdEditMember" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="Edit" />
                                        &nbsp;<asp:Button ID="ButtonMember" runat="server" CausesValidation="False" CommandName="New"
                                            Text="New" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="cmdUpdateMember" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="Update" />
                                        <asp:ConfirmButtonExtender ID="cmdUpdateMember_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Update?" Enabled="True" TargetControlID="cmdUpdateMember">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="ButtonMember" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="cmdInsertMember" runat="server" CausesValidation="false" CommandName="Insert"
                                            Text="Insert"  />
                                        <asp:ConfirmButtonExtender ID="cmdInsertMember_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Save?" Enabled="True" TargetControlID="cmdInsertMember">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="cmdCancelMember" runat="server" CausesValidation="False"
                                            CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:GridView ID="GridViewMemberAssociation" runat="server" CssClass="Grid" AllowSorting="True"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceMemberGrid" DataKeyNames="ID"
                            ForeColor="Black" GridLines="Vertical" AllowPaging="true" PageSize="20" PagerSettings-Mode="NumericFirstLast"
                            PagerSettings-Position="TopAndBottom" OnSelectedIndexChanging="GridViewMemberAssociation_SelectedIndexChanging">
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" PageButtonCount="30" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <Columns>                                
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                <asp:BoundField DataField="Name_Association" HeaderText="Name of the Association" SortExpression="Name_Association" />
                                <asp:BoundField DataField="Member_Category" HeaderText="Member Category" SortExpression="Member_Category" />                                
                                <asp:TemplateField Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdGridMember" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
                                            Height="20px" ToolTip="Open" CausesValidation="false" >
                                            <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                                        </asp:LinkButton>                                
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
                            <SelectedRowStyle BackColor="#FFD24D" />
                            <HeaderStyle BackColor="#6B696B" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                No Data Found.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceMemberGrid" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Member_Association WHERE EmpID=@EMPID ORDER BY ID DESC"
                            SelectCommandType="Text">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceMembership" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Member_Association WHERE ID=@ID" SelectCommandType="Text"
                            UpdateCommand="sp_EmpInfo_Member_Association_Edit" OnUpdated="SqlDataSourceMembership_Updated"
                            UpdateCommandType="StoredProcedure" InsertCommand="sp_EmpInfo_Member_Association_Add" InsertCommandType="StoredProcedure"
                            OnInserted="SqlDataSourceMembership_Inserted">
                            <SelectParameters>
                                <asp:ControlParameter Name="ID" ControlID="GridViewMemberAssociation" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Name_Association" Type="String" />
                                <asp:Parameter Name="Member_Category" Type="String" />                                
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </UpdateParameters>
                            <InsertParameters>
                                <%--<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />--%>
                                <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Name_Association" Type="String" />
                                <asp:Parameter Name="Member_Category" Type="String" />                                
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="TabPanelTraining" HeaderText="Training">
                    <HeaderTemplate>
                        Training
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewTraining" runat="server" AutoGenerateRows="False"
                            CssClass="Grid" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            DataSourceID="SqlDataSourceTraining" CellPadding="4" DataKeyNames="ID" DefaultMode="ReadOnly"
                            ForeColor="Black" GridLines="Vertical">
                            <FooterStyle BackColor="#CCCC99" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Middle" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                <asp:Button ID="cmdNewTraining" runat="server" Text="Add New" CommandName="New" Width="100px" />
                            </EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField HeaderText="Title of the Training" SortExpression="Title_Training">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title_Training") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("Title_Training") %>' Width="300px"
                                            TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="txtTitle"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("Title_Training") %>' Width="300px"
                                            TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="txtTitle"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Institute" SortExpression="Institute">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInst" runat="server" Text='<%# Eval("Institute") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtInst" runat="server" Width="300px" Text='<%# Bind("Institute") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorInst" runat="server" ControlToValidate="txtInst"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtInst" runat="server" Width="300px" Text='<%# Bind("Institute") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorInst" runat="server" ControlToValidate="txtInst"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Duration" SortExpression="FromDT">
                                    <ItemTemplate>
                                        From:
                                        <%# Eval("FromDT", "{0:dd/MM/yyyy}")%>
                                        To:
                                        <%# Eval("ToDT", "{0:dd/MM/yyyy}")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        From:
                                        <asp:TextBox CssClass="Date" ID="txtFDate" Width="80px" runat="server" Text='<%# Bind("FromDT","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorF" runat="server" ControlToValidate="txtFDate"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;&nbsp;&nbsp; To:
                                        <asp:TextBox CssClass="Date" ID="txtToDate" Width="80px" runat="server" Text='<%# Bind("ToDT","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTo" runat="server" ControlToValidate="txtToDate"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        From:
                                        <asp:TextBox CssClass="Date" ID="txtFDate" Width="80px" runat="server" Text='<%# Bind("FromDT","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorF" runat="server" ControlToValidate="txtFDate"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;&nbsp;&nbsp; To:
                                        <asp:TextBox CssClass="Date" ID="txtToDate" Width="80px" runat="server" Text='<%# Bind("ToDT","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTo" runat="server" ControlToValidate="txtToDate"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No. Of Days" SortExpression="NoOfDays">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNoOfDays" runat="server" Text='<%# Eval("NoOfDays") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNoOfDays" runat="server" Width="40px" Text='<%# Bind("NoOfDays") %>' MaxLength="3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNoOfDays" runat="server" ControlToValidate="txtNoOfDays"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtNoOfDays" runat="server" Width="40px" Text='<%# Bind("NoOfDays") %>' MaxLength="3"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNoOfDays" runat="server" ControlToValidate="txtNoOfDays"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Button ID="cmdEditTraining" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="Edit" />
                                        &nbsp;<asp:Button ID="ButtonTraining" runat="server" CausesValidation="False" CommandName="New"
                                            Text="New" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="cmdUpdateTraining" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="Update" />
                                        <asp:ConfirmButtonExtender ID="cmdUpdateTraining_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Update?" Enabled="True" TargetControlID="cmdUpdateTraining">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="ButtonTraining" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="cmdInsertTraining" runat="server" CausesValidation="false" CommandName="Insert"
                                            Text="Insert"  />
                                        <asp:ConfirmButtonExtender ID="cmdInsertTraining_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Save?" Enabled="True" TargetControlID="cmdInsertTraining">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="cmdCancelTraining" runat="server" CausesValidation="False"
                                            CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:GridView ID="GridViewTraining" runat="server" CssClass="Grid" AllowSorting="True"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceTrainingGrid" DataKeyNames="ID"
                            ForeColor="Black" GridLines="Vertical" AllowPaging="true" PageSize="20" PagerSettings-Mode="NumericFirstLast"
                            PagerSettings-Position="TopAndBottom" OnSelectedIndexChanging="GridViewTraining_SelectedIndexChanging">
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" PageButtonCount="30" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <Columns>                                
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                <asp:BoundField DataField="Title_Training" HeaderText="Title of the Training" SortExpression="Title_Training" />
                                <asp:BoundField DataField="Institute" HeaderText="Institute" SortExpression="Institute" />
                                <asp:TemplateField HeaderText="From" SortExpression="FromDT">
                                    <ItemTemplate>
                                        <span title='<%# Eval("FromDT","{0:dddd, \ndd MMMM, yyyy }") %>'>
                                            <%# Eval("FromDT","{0:dd/MM/yyyy}")%>
                                            <span class="time-small" style="margin: 0px 15px 0px 5px">
                                                <%# Common.ToRelativeDate(Eval("FromDT"))%></span> </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To" SortExpression="ToDT">
                                    <ItemTemplate>
                                        <span title='<%# Eval("ToDT","{0:dddd, \ndd MMMM, yyyy }") %>'>
                                            <%# Eval("ToDT","{0:dd/MM/yyyy}")%>
                                            <span class="time-small" style="margin: 0px 15px 0px 5px">
                                                <%# Common.ToRelativeDate(Eval("ToDT"))%></span> </span>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                <asp:BoundField DataField="NoOfDays" HeaderText="No. Of Days" SortExpression="NoOfDays" ItemStyle-HorizontalAlign="Center"/>
                                <asp:TemplateField Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdGridtraining" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
                                            Height="20px" ToolTip="Open" CausesValidation="false" >
                                            <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                                        </asp:LinkButton>                                
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
                            <SelectedRowStyle BackColor="#FFD24D" />
                            <HeaderStyle BackColor="#6B696B" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                No Data Found.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceTrainingGrid" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Training WHERE EmpID=@EMPID ORDER BY ID DESC"
                            SelectCommandType="Text">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceTraining" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Training WHERE ID=@ID" SelectCommandType="Text"
                            UpdateCommand="sp_EmpInfo_Training_Edit" OnUpdated="SqlDataSourceTraining_Updated"
                            UpdateCommandType="StoredProcedure" InsertCommand="sp_EmpInfo_Training_Add" InsertCommandType="StoredProcedure"
                            OnInserted="SqlDataSourceTraining_Inserted">
                            <SelectParameters>
                                <asp:ControlParameter Name="ID" ControlID="GridViewTraining" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Title_Training" Type="String" />
                                <asp:Parameter Name="Institute" Type="String" />
                                <asp:Parameter Name="NoOfDays" Type="String" />
                                <asp:Parameter Name="FromDT" Type="DateTime" />
                                <asp:Parameter Name="ToDT" Type="DateTime" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </UpdateParameters>
                            <InsertParameters>
                                <%--<asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />--%>
                                <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Title_Training" Type="String" />
                                <asp:Parameter Name="Institute" Type="String" />
                                <asp:Parameter Name="NoOfDays" Type="String" />
                                <asp:Parameter Name="FromDT" Type="DateTime" />
                                <asp:Parameter Name="ToDT" Type="DateTime" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                 <asp:TabPanel runat="server" ID="TabPanelPersonalInterest" HeaderText="Personal Interest">
                    <HeaderTemplate>
                        Personal Interest
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewPersonalInterest" runat="server" AutoGenerateRows="False"
                            CssClass="Grid" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            DataSourceID="SqlDataSourceInterest" CellPadding="4" DataKeyNames="ID"
                            ForeColor="Black" GridLines="Vertical">
                            <FooterStyle BackColor="#CCCC99" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                <asp:Button ID="cmdNewPersonalInterest" runat="server" Text="Add New" CommandName="New" Width="100px" />
                            </EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField HeaderText="Personal Interest" SortExpression="Personal_Interest_Desc">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPersonalInst" runat="server" Text='<%# Eval("Personal_Interest_Desc") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPersonalInst" runat="server" Text='<%# Bind("Personal_Interest_Desc") %>' Width="500px"
                                            TextMode="MultiLine" Rows="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPersonalInst" runat="server" ControlToValidate="txtPersonalInst"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtPersonalInst" runat="server" Text='<%# Bind("Personal_Interest_Desc") %>' Width="500px"
                                            TextMode="MultiLine" Rows="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPersonalInst" runat="server" ControlToValidate="txtPersonalInst"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" />
                                </asp:TemplateField>                                
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="cmdEditPersonalInterest" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="Edit" />
                                        &nbsp;<asp:Button ID="ButtonInterest" runat="server" CausesValidation="False" CommandName="New"
                                            Text="New" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="cmdUpdatePersonalInterest" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="Update" />
                                        <asp:ConfirmButtonExtender ID="cmdUpdatePersonalInterest_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Update?" Enabled="True" TargetControlID="cmdUpdatePersonalInterest">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="ButtonInterest" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="cmdInsertInterest" runat="server" CausesValidation="false" CommandName="Insert"
                                            Text="Insert"  />
                                        <asp:ConfirmButtonExtender ID="cmdInsertInterest_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Save?" Enabled="True" TargetControlID="cmdInsertInterest">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="cmdCancelInterest" runat="server" CausesValidation="False"
                                            CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ControlStyle Width="80px" />
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Middle" />
                        </asp:DetailsView>
                        <asp:GridView ID="GridViewInterest" runat="server" CssClass="Grid" AllowSorting="True"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceInterestGrid" DataKeyNames="ID"
                            ForeColor="Black" GridLines="Vertical" AllowPaging="True" PageSize="20" 
                            OnSelectedIndexChanging="GridViewInterest_SelectedIndexChanging">
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" PageButtonCount="30" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>                                
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" Visible="False" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Personal_Interest_Desc" HeaderText="Personal Interest" SortExpression="Personal_Interest_Desc" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdGridInterest" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
                                            Height="20px" ToolTip="Open" CausesValidation="false" >
                                            <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                                        </asp:LinkButton>                                
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                No Data Found.
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" ForeColor="White" HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <SelectedRowStyle BackColor="#FFD24D" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceInterestGrid" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            
                            SelectCommand="SELECT * FROM EmpInfo_Personal_Interest WHERE EmpID=@EMPID ORDER BY ID DESC">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceInterest" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Personal_Interest WHERE ID=@ID"
                            UpdateCommand="sp_EmpInfo_Interest_Edit" OnUpdated="SqlDataSourceInterest_Updated"
                            UpdateCommandType="StoredProcedure" 
                            InsertCommand="sp_EmpInfo_Interest_Add" InsertCommandType="StoredProcedure"
                            OnInserted="SqlDataSourceInterest_Inserted">
                            <SelectParameters>
                                <asp:ControlParameter Name="ID" ControlID="GridViewInterest" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Personal_Interest_Desc" Type="String" />                                
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Personal_Interest_Desc" Type="String" />                                
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="TabPanelRef" HeaderText="References">
                    <HeaderTemplate>
                        References
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewRef" runat="server" AutoGenerateRows="False" CssClass="Grid"
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            DataSourceID="SqlDataSourceRef" CellPadding="4" DataKeyNames="ID" DefaultMode="ReadOnly"
                            ForeColor="Black" GridLines="Vertical">
                            <FooterStyle BackColor="#CCCC99" />
                            <RowStyle BackColor="#F7F7DE" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                <asp:Button ID="cmdNewRef" runat="server" Text="Add New" CommandName="New" Width="100px" />
                            </EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField HeaderText="Name" SortExpression="Ref_Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRef" runat="server" Text='<%# Eval("Ref_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtRef" runat="server" MaxLength="255" Text='<%# Bind("Ref_Name") %>'
                                            Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRef"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtRef" runat="server" MaxLength="255" Text='<%# Bind("Ref_Name") %>'
                                            Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRef"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Organization" SortExpression="Ref_Organization">
                                    <ItemTemplate>
                                        <asp:Label ID="lblorg" runat="server" Text='<%# Eval("Ref_Organization") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtOrg" runat="server" MaxLength="255" Text='<%# Bind("Ref_Organization") %>'
                                            Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorOrg" runat="server" ControlToValidate="txtOrg"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtOrg" runat="server" MaxLength="255" Text='<%# Bind("Ref_Organization") %>'
                                            Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorOrg" runat="server" ControlToValidate="txtOrg"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation" SortExpression="Ref_Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesig" runat="server" Text='<%# Eval("Ref_Designation") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDesig" runat="server" MaxLength="255" Text='<%# Bind("Ref_Designation") %>'
                                            Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDesig" runat="server" ControlToValidate="txtDesig"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtDesig" runat="server" MaxLength="255" Text='<%# Bind("Ref_Designation") %>'
                                            Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDesig" runat="server" ControlToValidate="txtDesig"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address" SortExpression="Ref_Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Ref_Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" Rows="3" Width="300px"
                                            Text='<%# Bind("Ref_Address") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="txtAddress"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" Rows="3" Width="300px"
                                            Text='<%# Bind("Ref_Address") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="txtAddress"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <HeaderStyle VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone (Off)" SortExpression="Ref_Phone_Off">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Ref_Phone_Off") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPhone" runat="server" MaxLength="255" Text='<%# Bind("Ref_Phone_Off") %>'
                                            Width="200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ControlToValidate="txtPhone"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtPhone" runat="server" MaxLength="255" Text='<%# Bind("Ref_Phone_Off") %>'
                                            Width="200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ControlToValidate="txtPhone"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone (Res)" SortExpression="Ref_Phone_Res">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRes" runat="server" Text='<%# Eval("Ref_Phone_Res") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtRes" runat="server" MaxLength="255" Text='<%# Bind("Ref_Phone_Res") %>'
                                            Width="200px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtRes" runat="server" MaxLength="255" Text='<%# Bind("Ref_Phone_Res") %>'
                                            Width="200px"></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile" SortExpression="Ref_Mobile">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Ref_Mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="255" Text='<%# Bind("Ref_Mobile") %>'
                                            Width="200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ControlToValidate="txtMobile"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="255" Text='<%# Bind("Ref_Mobile") %>'
                                            Width="200px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ControlToValidate="txtMobile"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="Ref_Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Ref_Email") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="255" Text='<%# Bind("Ref_Email") %>'
                                            Width="200px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="255" Text='<%# Bind("Ref_Email") %>'
                                            Width="200px"></asp:TextBox>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Relation" SortExpression="Ref_Relation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRelation" runat="server" Text='<%# Bind("Ref_Relation") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="cboRelation" runat="server" AppendDataBoundItems="true" SelectedValue='<%# Bind("Ref_Relation") %>'>
                                            <asp:ListItem Text="Relative" Value="Relative"></asp:ListItem>
                                            <asp:ListItem Text="Family Friend" Value="Family Friend"></asp:ListItem>
                                            <asp:ListItem Text="Academic" Value="Academic"></asp:ListItem>
                                            <asp:ListItem Text="Professional" Value="Professional"></asp:ListItem>
                                            <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorRelation" runat="server" ControlToValidate="cboRelation"
                                            ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="cboRelation" runat="server" AppendDataBoundItems="true" SelectedValue='<%# Bind("Ref_Relation") %>'>
                                            <asp:ListItem Text="Relative" Value="Relative"></asp:ListItem>
                                            <asp:ListItem Text="Family Friend" Value="Family Friend"></asp:ListItem>
                                            <asp:ListItem Text="Academic" Value="Academic"></asp:ListItem>
                                            <asp:ListItem Text="Professional" Value="Professional"></asp:ListItem>
                                            <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorRelation" runat="server" ControlToValidate="cboRelation"
                                            ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Button ID="cmdEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="Edit" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New"
                                            Text="New" />
                                    </ItemTemplate>
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
                                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Insert"
                                            Text="Insert" />
                                        <asp:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Save?"
                                            Enabled="True" TargetControlID="Button1">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="cmdCancel2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="Cancel" />
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:GridView ID="GridView2" runat="server" CssClass="Grid" AllowSorting="True" AutoGenerateColumns="False"
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            CellPadding="4" DataSourceID="SqlDataSourceGrid" DataKeyNames="ID" ForeColor="Black"
                            GridLines="Vertical" AllowPaging="true" PageSize="20" PagerSettings-Mode="NumericFirstLast"
                            PagerSettings-Position="TopAndBottom" Width="100%" OnSelectedIndexChanging="GridView2_SelectedIndexChanging">
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" PageButtonCount="30" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <Columns>                                
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ItemID" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                <asp:BoundField DataField="Ref_Name" HeaderText="Name" SortExpression="Ref_Name" />
                                <asp:BoundField DataField="Ref_Organization" HeaderText="Organization" SortExpression="Ref_Organization"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="Ref_Designation" HeaderText="Designation" SortExpression="Ref_Designation"
                                    ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Ref_Address" HeaderText="Address" SortExpression="Ref_Address"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="Ref_Phone_Off" HeaderText="Phone (Off)" SortExpression="Ref_Phone_Off" />
                                <asp:BoundField DataField="Ref_Phone_Res" HeaderText="Phone (Res)" SortExpression="Ref_Phone_Res" />
                                <asp:BoundField DataField="Ref_Mobile" HeaderText="Mobile" SortExpression="Ref_Mobile" />
                                <asp:BoundField DataField="Ref_Email" HeaderText="Email" SortExpression="Ref_Email" />
                                <asp:BoundField DataField="Ref_Relation" HeaderText="Relation" SortExpression="Ref_Relation" />
                                <asp:TemplateField Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdGridRef" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
                                            Height="20px" ToolTip="Open" CausesValidation="false" >
                                            <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                                        </asp:LinkButton>                                
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
                            <SelectedRowStyle BackColor="#FFD24D" />
                            <HeaderStyle BackColor="#6B696B" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                No Data Found.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceGrid" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Reference WHERE EmpID=@EMPID ORDER BY ID DESC"
                            SelectCommandType="Text">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceRef" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM EmpInfo_Reference WHERE ID=@ID" SelectCommandType="Text"
                            UpdateCommand="sp_EmpInfo_Ref_Edit" OnUpdated="SqlDataSourceRef_Updated" UpdateCommandType="StoredProcedure"
                            OnSelected="SqlDataSourceRef_Selected" InsertCommand="sp_EmpInfo_Ref_Add" InsertCommandType="StoredProcedure"
                            OnInserted="SqlDataSourceRef_Inserted">
                            <SelectParameters>
                                <%--<asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />--%>
                                <asp:ControlParameter Name="ID" ControlID="GridView2" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Ref_Organization" Type="String" />
                                <asp:Parameter Name="Ref_Designation" Type="String" />
                                <asp:Parameter Name="Ref_Address" Type="String" />
                                <asp:Parameter Name="Ref_Phone_Off" Type="String" />
                                <asp:Parameter Name="Ref_Phone_Res" Type="String" />
                                <asp:Parameter Name="Ref_Email" Type="String" />
                                <asp:Parameter Name="Ref_Mobile" Type="String" />
                                <asp:Parameter Name="Ref_Relation" Type="String" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="Ref_Designation" Type="String" />
                                <asp:Parameter Name="Ref_Address" Type="String" />
                                <asp:Parameter Name="Ref_Phone_Off" Type="String" />
                                <asp:Parameter Name="Ref_Phone_Res" Type="String" />
                                <asp:Parameter Name="Ref_Email" Type="String" />
                                <asp:Parameter Name="Ref_Mobile" Type="String" />
                                <asp:Parameter Name="Ref_Relation" Type="String" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel runat="server" ID="TabPanel1" HeaderText="References">
                    <HeaderTemplate>
                        Relatives at TBL
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsViewRelatives" runat="server" AutoGenerateRows="False"
                            CssClass="Grid" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            DataSourceID="SqlDataSourceRelatives" CellPadding="4" DataKeyNames="ID" DefaultMode="ReadOnly"
                            ForeColor="Black" GridLines="Vertical">
                            <FooterStyle BackColor="#CCCC99" />
                            <RowStyle BackColor="#F7F7DE" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                <asp:Button ID="cmdNewRelationship" runat="server" Text="Add New" CommandName="New"
                                    Width="100px" />
                            </EmptyDataTemplate>
                            <Fields>
                                <asp:TemplateField HeaderText="Emp ID" SortExpression="RelativeEmpID">
                                    <ItemTemplate>
                                        <%# Eval("RelativeEmpID") %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtRelEmpID" runat="server" MaxLength="120" Text='<%# Bind("RelativeEmpID") %>'
                                            Width="80px" placeholder="emp info" CssClass="emp-add-control-all"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpRelID" runat="server" ControlToValidate="txtRelEmpID"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtRelEmpID" CssClass="emp-add-control-all" AutoPostBack="false"
                                            runat="server" Text='<%# Bind("RelativeEmpID") %>' placeholder="emp info" Width="80px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpRelID" runat="server" ControlToValidate="txtRelEmpID"
                                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Relationship" SortExpression="RelationshipName">
                                    <ItemTemplate>
                                        <%# Eval("RelationshipName")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="cboRelationship" runat="server" AppendDataBoundItems="true"
                                            DataSourceID="SqlDataSourceRelationship" DataTextField="RelationshipName" DataValueField="ID"
                                            SelectedValue='<%# Bind("RelationshipID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="cboRelationship" runat="server" AppendDataBoundItems="true"
                                            DataSourceID="SqlDataSourceRelationship" DataTextField="RelationshipName" DataValueField="ID"
                                            SelectedValue='<%# Bind("RelationshipID") %>'>
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemStyle Font-Bold="false" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" ControlStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Button ID="cmdEditRel" runat="server" CausesValidation="false" CommandName="Edit"
                                            Text="Edit" />
                                        &nbsp;<asp:Button ID="cmdAddRelNew" runat="server" CausesValidation="false" CommandName="New"
                                            Text="New" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="cmdUpdateRel" runat="server" CausesValidation="true" CommandName="Update"
                                            Text="Update" />
                                        <asp:ConfirmButtonExtender ID="cmdUpdateRel_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Update?" Enabled="True" TargetControlID="cmdUpdateRel">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="cmdCancelRel" runat="server" CausesValidation="false" CommandName="Cancel"
                                            Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="cmdRelInsert" runat="server" CausesValidation="false" CommandName="Insert"
                                            Text="Insert" />
                                        <asp:ConfirmButtonExtender ID="cmdRelInsert_ConfirmButtonExtender" runat="server"
                                            ConfirmText="Do you want to Save?" Enabled="True" TargetControlID="cmdRelInsert">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;<asp:Button ID="cmdCancelRel2" runat="server" CausesValidation="false" CommandName="Cancel"
                                            Text="Cancel" />
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                        <asp:GridView ID="GridViewRelatives" runat="server" CssClass="Grid" AllowSorting="True"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                            BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceGridRelatives" DataKeyNames="ID"
                            ForeColor="Black" GridLines="Vertical" AllowPaging="true" PageSize="20" PagerSettings-Mode="NumericFirstLast"
                            PagerSettings-Position="TopAndBottom" OnSelectedIndexChanging="GridViewRelatives_SelectedIndexChanging">
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" PageButtonCount="30" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <Columns>                                
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" ItemStyle-HorizontalAlign="Center" Visible="false" />
                                <asp:TemplateField HeaderText="RelativeEmpID" SortExpression="RelativeEmpID">
                                    <ItemTemplate>
                                        <uc2:EMP runat="server" ID="EMP_RelativeEmpID" Username='<%# Eval("RelativeEmpID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RelationshipName" HeaderText="Relationship" SortExpression="RelationshipName"
                                    ItemStyle-HorizontalAlign="Center" />
                               <asp:TemplateField Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cmdGridRel" runat="server" CommandName="SELECT" CommandArgument='<%# Eval("ID") %>'
                                            Height="20px" ToolTip="Open" CausesValidation="false" >
                                            <img alt="" height="16px" width="16px" src='Images/new_window.png' border="0" />
                                        </asp:LinkButton>                                
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
                            <SelectedRowStyle BackColor="#FFD24D" />
                            <HeaderStyle BackColor="#6B696B" ForeColor="White" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                No Data Found.
                            </EmptyDataTemplate>
                        </asp:GridView>                        
                        <asp:SqlDataSource ID="SqlDataSourceGridRelatives" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM v_EmpInfo_Relatives WHERE EmpID=@EMPID ORDER BY ID DESC" SelectCommandType="Text">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceRelatives" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT * FROM v_EmpInfo_Relatives WHERE ID=@ID" SelectCommandType="Text"
                            UpdateCommand="sp_EmpInfo_Relationship_Edit" OnUpdated="SqlDataSourceRelatives_Updated"
                            UpdateCommandType="StoredProcedure" InsertCommand="sp_EmpInfo_Relationship_Add"
                            InsertCommandType="StoredProcedure" OnInserted="SqlDataSourceRelatives_Inserted">
                            <SelectParameters>
                                <%--<asp:QueryStringParameter Name="EMPID" QueryStringField="ID" Type="String" />--%>
                                <asp:ControlParameter Name="ID" ControlID="GridViewRelatives" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="RelativeEmpID" Type="String" />
                                <asp:Parameter Name="RelationshipID" Type="Int32" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter DefaultValue="0" Direction="InputOutput" Name="ID" Type="Int32" />
                                <asp:QueryStringParameter Name="EmpID" QueryStringField="ID" Type="String" />
                                <asp:Parameter Name="RelativeEmpID" Type="String" />
                                <asp:Parameter Name="RelationshipID" Type="Int32" />
                                <asp:SessionParameter SessionField="EMPID" Name="ModifiedBY" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue="" Size="255" />
                                <asp:Parameter Direction="InputOutput" Name="Done" Type="Boolean" DefaultValue="false" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceRelationship" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT [ID], [RelationshipName] FROM [EmpInfo_Relationship] ORDER BY [ID]">
                        </asp:SqlDataSource>
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
