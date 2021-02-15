<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="EmpBranch.aspx.cs" Inherits="EmpBranch" enableviewstate="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content4" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelBranch" runat="server" Visible="false">
                <table>
                    <tr>
                        <td style="width: 40px; padding-top: 8px" valign="top">
                            <a href="Branches.aspx" title="Branch List" class="button1">
                                <img src="Images/Previous.gif" alt="Back" border="0" /></a>
                        </td>
                        <td>
                            <asp:GridView ID="GridViewPanelBranch" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" Width="900px" DataSourceID="SqlDataSourceBranch" ForeColor="#333333"
                                CssClass="Grid" ShowHeader="False" OnDataBound="GridViewPanelBranch_DataBound">
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" VerticalAlign="Top" />
                                <Columns>
                                    <asp:TemplateField ItemStyle-BackColor="#8FAA4A" ItemStyle-ForeColor="White" 
                                    ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <span style="font-size: 26pt; font-weight: bold;">
                                                <%# Eval("BranchID")%></span><br />
                                            <strong>
                                                <%# Eval("BranchPrefix")%></strong>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hidBranchName" runat="server" Value='<%# Eval("BranchName") %>' />
                                            <div style="font-size: large; font-weight: bold;">
                                                <%# Eval("BranchName") %></div>
                                            <div>
                                                <%# Eval("BranchAddress").ToString().Replace("\n", "<br />")%>
                                            </div>
                                            <div style="white-space: nowrap;">
                                                <img src="Images/green-dot.png" width="16" height="16" />
                                                <div class="location-path" style="border-top: solid 1px silver; margin-top: 10px;
                                                    padding: 2px 2px 0px 0px;">
                                                    <%# Eval("DIV_NAME","<span title='Division'>{0}</span>")%>
                                                    <%# Eval("DIST_NAME", "» <span title='District'>{0}</span>")%>
                                                    <%# Eval("THANA_NAME", "» <span title='Thana'>{0}</span>")%>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Eval("Phoneno", "<b>Phone:</b> {0}")%>
                                            <%# Eval("faxno","<br><b>Fax:</b> {0}") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table class="table-noborder">
                                                <%# Eval("BEFTN_Code", "<tr><td nowrap><b>Routing No:</b></td><td nowrap>{0}</td></tr>")%>
                                                <%# Eval("SWIFT", "<tr><td nowrap><b>SWIFT:</b></td><td nowrap>{0}</td></tr>")%>
                                                <%# Eval("FIU_Code", "<tr><td nowrap><b>FIU Code:</b></td><td nowrap>{0}</td></tr>")%>
                                                <%# Eval("ClusterDetails", "<tr><td nowrap><b>Cluster:</b></td><td nowrap>{0}</td></tr>")%>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>                                        
                                            <a href='/msg/New.aspx?to=<%# Eval("GroupID") %>' title="Send Message" class="Nounderline" target="_blank">                                               
                                               <img src='Images/msg_20.png' width='20' height='20' border='0' />
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceBranch" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="sp_Branch_Select" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="BranchID" QueryStringField="branch" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Panel runat="server" ID="PanelDeptList" Visible="false">
                                <br />
                                <table style="border: solid 1px #8FAA4A; border-collapse: collapse">
                                    <tr>
                                        <td style="background: #8FAA4A; color: White; font-size: large; font-weight: bold;
                                            padding: 5px">
                                            <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridViewDept" runat="server" DataSourceID="SqlDataSourceDepartments"
                                                ShowHeader="False" AutoGenerateColumns="False" AllowSorting="True" Width="100%"
                                                CssClass="Grid" Style="font-size: small" BackColor="White" BorderColor="#DEDFDE"
                                                DataKeyNames="DeptID" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                                                OnDataBound="GridViewDept_DataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Department" SortExpression="Department">
                                                        <ItemTemplate>
                                                            <a href='EmpBranch.aspx?branch=1&dept=<%# Eval("DeptID") %>' title="Show Employees">
                                                                <%# Eval("Department") %></a>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtDepartment" Text='<%# Bind("Department") %>' Width="300px" MaxLength="255"
                                                                runat="server"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemStyle Font-Bold="true" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                                                        <ItemTemplate>
                                                            <%# Eval("Address").ToString().Replace("\n", "<br />") %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtAddress" Text='<%# Bind("Address") %>' Width="300px" MaxLength="255"
                                                                TextMode="MultiLine" Font-Names="Arial" Height="50px" runat="server"></asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                                                        <ItemTemplate>
                                                            <%# Eval("phoneno","<b>Phone:</b> {0}") %>
                                                            <%# Eval("faxno","<br><b>Fax:</b> {0}") %>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <table style="border-collapse: collapse" class="None">
                                                                <tr>
                                                                    <td>
                                                                        Phone:
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtPhone" Text='<%# Bind("phoneno") %>' Width="400px" MaxLength="255"
                                                                            runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Fax:
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtfax" Text='<%# Bind("faxno") %>' Width="200px" MaxLength="50"
                                                                            runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ShowHeader="False" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Button ID="cmdUpdate" runat="server" CausesValidation="False" CommandName="Edit"
                                                                Text="Edit" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:Button ID="cmdUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                                                Text="Update" />
                                                            <asp:ConfirmButtonExtender ID="cmdUpdate_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to update?"
                                                                Enabled="True" TargetControlID="cmdUpdate">
                                                            </asp:ConfirmButtonExtender>
                                                            &nbsp;<asp:Button ID="cmdCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                Text="Cancel" />
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                                                <FooterStyle BackColor="#CCCC99" />
                                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceDepartments" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                                SelectCommand="SELECT * FROM [Department] WHERE ([ShowInHeadOffice] = 1) ORDER BY [Department]"
                                                UpdateCommand="UPDATE [Department]
                                                  SET [Department] = @Department
                                                        ,[Address] = @Address
                                                        ,[phoneno] = @phoneno
                                                        ,[faxno] = @faxno
                                                        WHERE DeptID = @DeptID AND REVID=9999">
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Department" />
                                                    <asp:Parameter Name="Address" />
                                                    <asp:Parameter Name="phoneno" />
                                                    <asp:Parameter Name="faxno" />
                                                    <asp:Parameter Name="DeptID" DbType="Int32" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="PanelDeptName" runat="server" Visible="false">
                <table>
                    <tr>
                        <td style="width: 40px;" valign="top">
                            <a href="EmpBranch.aspx?branch=1" title="Head Office" class="button1">
                                <img src="Images/Previous.gif" alt="Back" border="0" /></a>
                        </td>
                        <td>
                            <asp:GridView ID="GridViewDeptName" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                Width="700px" DataSourceID="SqlDataSourceDepartment" ForeColor="#333333" CssClass="Grid"
                                ShowHeader="False" OnDataBound="GridViewDeptName_DataBound">
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" VerticalAlign="Top" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hidDepartment" runat="server" Value='<%# Eval("Department") %>' />
                                            <span style="font-size: large; font-weight: bold;">
                                                <%# Eval("Department")%></span><br />
                                            <%# Eval("Address").ToString().Replace("\n", "<br />")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Eval("phoneno","<b>Phone:</b> {0}")%>
                                            <%# Eval("faxno","<br><b>Fax:</b> {0}")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                        
                                            <a href='/msg/New.aspx?to=<%# Eval("GroupID") %>' title="Send Message" class="Nounderline" target="_blank">                                               
                                               <%# Eval("GroupID").ToString() == "" ? "" : "<img src='Images/msg_20.png' width='20' height='20' border='0' />" %>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="s_Dept_HO" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="DeptID" QueryStringField="dept" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="PanelTeam" runat="server">
                <br />
                <table style="border: solid 1px #008000; border-collapse: collapse">
                    <tr>                    
                        <td style="background: #008000; padding: 2px; color: White">
                            <asp:Label ID="lblTeams" runat="server" Text="Departments/Teams"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 3px">
                            <asp:DataList ID="DataListTeams" runat="server" DataSourceID="SqlDataSourceTeams"
                                    RepeatDirection="Horizontal" GridLines="None" RepeatColumns="3" ItemStyle-VerticalAlign="Top">
                                    <ItemTemplate>
                                        <a href='Group.aspx?id=<%# Eval("GroupID") %>' class="Nounderline" target="_blank">
                                            <div class="ProfileDiv ui-corner-all">
                                                <table>
                                                    <tr>
                                                        <td valign="top" style="width: 40px">
                                                            <img alt='<%# Eval("GroupID") %>' title='<%# Eval("GroupID") %>' src='Images/NoGroupFace.png'
                                                                width="35" height="35" class="ProfilePic" />
                                                        </td>
                                                        <td valign="middle" style="color: Black; text-decoration: none">
                                                            <b><%# Eval("GroupName") %></b>
                                                            <div><%# Eval("GroupDescription")%></div>                                                          
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </a>
                                    </ItemTemplate>
                                </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSourceTeams" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="s_Groups_HO" SelectCommandType="StoredProcedure" 
                                onselected="SqlDataSourceTeams_Selected">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="" Name="DeptID" QueryStringField="dept" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="PanelEmp" runat="server">
                <div class="Panel1" style="margin:10px 0 10px 0;padding:3px 10px 3px 10px" >Department/Team: 
                    <asp:DropDownList ID="cmdDept" runat="server" DataSourceID="SqlDataSourceDept" 
                        DataTextField="Department" DataValueField="DeptID" 
                        AppendDataBoundItems="true"
                        OnDataBound="cmdDept_DataBound" AutoPostBack="True" OnSelectedIndexChanged="cmdDept_SelectedIndexChanged" >
                        <asp:ListItem Text="All" Value="-1"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSourceDept" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>" SelectCommand="s_Emp_Dept_All" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="BranchID" QueryStringField="branch" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
                
                <asp:Panel ID="PanelEmpExecutives" runat="server">
                    <table style="border: solid 1px #8FAA4A; border-collapse: collapse">
                        <tr>
                            <td style="background: #8FAA4A; padding: 2px; color: White">
                                <asp:Label ID="lblExecutives" runat="server" Text="Executives"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 3px">
                                <asp:SqlDataSource ID="SqlDataSourceExecutives" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                    SelectCommand="sp_getExecutives" SelectCommandType="StoredProcedure" OnSelected="SqlDataSourceExecutives_Selected">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="BranchID" QueryStringField="branch" Type="Int32" />
                                        <asp:QueryStringParameter Name="DeptID" QueryStringField="dept" Type="Int32" DefaultValue="0" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceExecutives"
                                    RepeatDirection="Horizontal" GridLines="None" RepeatColumns="3" ItemStyle-VerticalAlign="Top">
                                    <ItemTemplate>
                                        <a href='Profile.aspx?id=<%# Eval("EMPID") %>' class="Nounderline" target="_blank">
                                            <div class="ProfileDiv ui-corner-all">
                                                <table width="100%">
                                                <tr>
                                                    <td valign="top">
                                                        <img alt='<%# Eval("EMPID") %>' title='<%# Eval("EMPID") %>' src='<%# ConfigurationManager.AppSettings["Prefix"] %>EmpImage.aspx?empid=<%# Eval("EMPID") %>&imgid=<%# Eval("Imageidentifier") %>&W=100&H=100'
                                                            width="50" height="50" class="ProfilePic wait" />
                                                    </td>
                                                    <td valign="top" style="color: Black; text-decoration: none;width:100%">
                                                        <b>
                                                            <%# Eval("EmpName") %></b><br />
                                                            <div><%# Eval("FunctionalDesignation")%></div>
                                                        <%# Eval("DesigFullName")%>
                                                        <div style="font-size: 85%">
                                                            <%# Eval("Mobile","{0} ")%><%# Eval("Ext", "(Ext: {0})")%></div>
                                                    </td>
                                                    <td valign="top" style="font-size:70%;text-align:right"><%# Common.getStatusIcon(Eval("LastOnline")) %></td>
                                                </tr>
                                            </table>
                                            </div>
                                        </a>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
                <table style="border: solid 1px #8FAA4A; border-collapse: collapse">
                    <tr>
                        <td style="background: #8FAA4A; padding: 2px; color: White">
                            <asp:Label ID="lblOfficers" runat="server" Text="Officers"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 3px">
                            <asp:SqlDataSource ID="SqlDataSourceOfficers" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="sp_getOfficers" SelectCommandType="StoredProcedure" OnSelected="SqlDataSourceOfficers_Selected">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="BranchID" QueryStringField="branch" Type="Int32" />
                                    <asp:QueryStringParameter Name="DeptID" QueryStringField="dept" Type="Int32" DefaultValue="0" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSourceOfficers"
                                ItemStyle-VerticalAlign="Top" GridLines="None" RepeatColumns="3" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <a href='Profile.aspx?id=<%# Eval("EMPID") %>' class="Nounderline" target="_blank">
                                        <div class="ProfileDiv ui-corner-all">
                                            <table width="100%">
                                                <tr>
                                                    <td valign="top">
                                                        <img alt='<%# Eval("EMPID") %>' title='<%# Eval("EMPID") %>' src='<%# ConfigurationManager.AppSettings["Prefix"] %>EmpImage.aspx?empid=<%# Eval("EMPID") %>&imgid=<%# Eval("Imageidentifier") %>&W=100&H=100'
                                                            width="50" height="50" class="ProfilePic wait" />
                                                    </td>
                                                    <td valign="top" style="color: Black; text-decoration: none;width:100%">
                                                        <b>
                                                            <%# Eval("EmpName") %></b><br />
                                                            <div><%# Eval("FunctionalDesignation")%></div>
                                                        <%# Eval("DesigFullName")%>
                                                        <div style="font-size: 85%">
                                                            <%# Eval("Mobile","{0} ")%><%# Eval("Ext", "(Ext: {0})")%></div>
                                                    </td>
                                                    <td valign="top" style="font-size:70%;text-align:right"><%# Common.getStatusIcon(Eval("LastOnline")) %></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="PanelSales" runat="server" Visible="true" style="margin-top:15px">
                <table style="border: solid 1px Gray; border-collapse: collapse">
                    <tr>
                        <td style="background: Gray; padding: 2px; color: White">
                            <asp:Label ID="lblSales" runat="server" Text="Sales & Marketing"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 3px">
                            <asp:SqlDataSource ID="SqlDataSourceSalesOff" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="sp_getOfficers_Sales" SelectCommandType="StoredProcedure" OnSelected="SqlDataSourceSalesOff_Selected">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="BranchID" QueryStringField="branch" Type="Int32" />
                                    <asp:QueryStringParameter Name="DeptID" QueryStringField="dept" Type="Int32" DefaultValue="0" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSourceSalesOff"
                                ItemStyle-VerticalAlign="Top" GridLines="None" RepeatColumns="3" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <a href='Profile.aspx?id=<%# Eval("EMPID") %>' class="Nounderline" target="_blank">
                                        <div class="ProfileDiv ui-corner-all" style="border-color:Gray">
                                            <table width="100%">
                                                <tr>
                                                    <td valign="top">
                                                        <img alt='<%# Eval("EMPID") %>' title='<%# Eval("EMPID") %>' src='<%# ConfigurationManager.AppSettings["Prefix"] %>EmpImage.aspx?empid=<%# Eval("EMPID") %>&imgid=<%# Eval("Imageidentifier") %>&W=100&H=100'
                                                            width="50" height="50" class="ProfilePic wait" />
                                                    </td>
                                                    <td valign="top" style="color: Black; text-decoration: none;width:100%">
                                                        <b>
                                                            <%# Eval("EmpName") %></b><br />
                                                            <div><%# Eval("FunctionalDesignation")%></div>
                                                        <%# Eval("DesigFullName")%>
                                                        <div style="font-size: 85%">
                                                            <%# Eval("Mobile","{0} ")%><%# Eval("Ext", "(Ext: {0})")%></div>
                                                    </td>
                                                    <td valign="top" style="font-size:70%;text-align:right"><%# Common.getStatusIcon(Eval("LastOnline")) %></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
                    </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
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
