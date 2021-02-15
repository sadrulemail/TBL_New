<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="LoginLog.aspx.cs" Inherits="LoginLog" %>

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
            <asp:Label ID="lblEmpName" runat="server" Font-Size="300%" Text="Login Log" Font-Names="Tahoma"></asp:Label>
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
                                Width="100%">
                                <FooterStyle BackColor="#CCCC99" />
                                <RowStyle BackColor="white" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <EmptyDataRowStyle Font-Bold="true" Font-Size="X-Large" HorizontalAlign="Center"
                                    Height="210px" />
                                <EmptyDataTemplate>
                                    Profile Not Found!
                                </EmptyDataTemplate>
                                <Fields>
                                    <asp:TemplateField ShowHeader="false" ItemStyle-BackColor="#F7F7DE">
                                        <ItemTemplate>
                                            <table class="table-noborder">
                                                <tr>
                                                    <td>
                                                        <img alt="" class="" width="90" height="90" src='EmpImage.aspx?EMPID=<%# Eval("empid") %><%# Eval("ImageIdentifier","&imgid={0}") %>&W=100'
                                                            style="border: 1px solid silver; padding: 1px" />
                                                    </td>
                                                    <td style="padding-left: 7px">
                                                        <div style="font-size: 200%; font-family: tahoma; margin-bottom: 7px">
                                                            <%# Eval("EmpName")%>
                                                        </div>
                                                        <b>
                                                            <%# Eval("DesigFullName") %></b><br />
                                                        <%# (Eval("Branch_BranchID").ToString() == "1" ? "<a href='EmpBranch.aspx?branch=1&dept=" + Eval("Department_DeptID").ToString() + "' target='_blank'>" : "")%><%# Eval("Department")%></a><br />
                                                        <%# (Eval("Branch_BranchID").ToString() != "1" ? "<a href='EmpBranch.aspx?branch=" + Eval("Branch_BranchID").ToString() + "' target='_blank'>" : "")%><%# Eval("BranchName") %></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#F7F7DE" />
                            </asp:DetailsView>
                        </div>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Panel1" runat="server" Visible="false">
                <table>
                    <tr>
                        <td class="Panel1" style="padding: 5px">
                            <table style="cellspacing: 5; font-size: small; font-weight: bolder">
                                <tr>
                                    <td>
                                        Application:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cboApplications" runat="server" AppendDataBoundItems="True"
                                            AutoPostBack="True" DataSourceID="SqlDataSourceApplications" DataTextField="ApplicationName"
                                            DataValueField="ID">
                                            <asp:ListItem Value="">All</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceApplications" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                            SelectCommand="SELECT [ID], [ApplicationName] FROM [Applications] where AccessControl = 1 ORDER BY [ApplicationName]">
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="padding-left: 10px">
                                        IP:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtIPAddress" runat="server" MaxLength="50" Width="120px" Watermark="000.000.000.000"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right">
                                        Date:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDateFrom" runat="server" CssClass="Date" Width="80px" AutoPostBack="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        to
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDateTo" runat="server" CssClass="Date" Width="80px" AutoPostBack="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" Height="30px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="padding-left: 10px">
                            <asp:LinkButton ID="cmdPreviousDay" runat="server" OnClick="cmdPreviousDay_Click"
                                CssClass="button1"><img src="Images/Previous.gif" width="32px" height="32px" border="0" /></asp:LinkButton>
                            <asp:LinkButton ID="cmdNextDay" runat="server" OnClick="cmdNextDay_Click" CssClass="button1"><img src="Images/Next.gif" width="32px" height="32px" border="0" /></asp:LinkButton>
                        </td>
                    </tr>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="Small"
                    DataSourceID="SqlDataSource_LoginLog" AllowPaging="True" CssClass="Grid" AllowSorting="True"
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="Solid" PagerSettings-Position="TopAndBottom"
                    PageSize="30" PagerSettings-Mode="NumericFirstLast" PagerSettings-PageButtonCount="30"
                    BorderWidth="1px" CellPadding="4" ForeColor="Black">
                    <PagerSettings PageButtonCount="30" Mode="NumericFirstLast" Position="TopAndBottom" />
                    <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID">
                            <ItemStyle ForeColor="Silver" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Login Date" SortExpression="LogInDT">
                            <ItemTemplate>
                                <%# Eval("LogInDT","{0:dd MMM yyyy}") %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Login Time" SortExpression="LogInDT">
                            <ItemTemplate>
                                <%# Eval("LogInDT","{0:h:mm:ss tt}") %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="About" SortExpression="LogInDT">
                            <ItemTemplate>
                                <div title='<%# Eval("LogInDT","{0:dddd \ndd, MMMM yyyy \nh:mm:ss tt}")%>'>
                                    <time class="timeago" datetime='<%# Eval("LogInDT","{0:yyyy-MM-dd HH:mm:ss}") %>'></time>
                                </div>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ApplicationName" HeaderText="Application Name" SortExpression="ApplicationName">
                            <ItemStyle Wrap="false" />
                        </asp:BoundField>
                        <%--<asp:TemplateField HeaderText="Emp ID" SortExpression="EMPID">
                        <ItemTemplate>
                            <a target="_blank" href='EmpSearch.aspx?EMPID=<%# Eval("EMPID") %>'>
                                <%# Eval("EMPID") %></a>
                        </ItemTemplate>
                        <ItemStyle CssClass="LeftRightPad" Font-Bold="True" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a target="_blank" href='Profile.aspx?ID=<%# Eval("EMPID") %>'>
                                <img src='EmpImage.aspx?EMPID=<%# Eval("EMPID") %>&W=100&imgid=<%# Eval("ImageIdentifier") %>'
                                    width="60" border="0" /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EMP" HeaderText="EMP" SortExpression="EMP" HtmlEncode="False"
                        HtmlEncodeFormatString="False" ReadOnly="True">
                        <ItemStyle  />
                    </asp:BoundField>--%>
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP">
                            <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Success" SortExpression="LoginSuccess">
                            <ItemTemplate>
                                <%# Eval("LoginSuccess").ToString() == "True" ? "<img src='Images/tick.png' width='16' height='16'>" : ""%>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cookie" SortExpression="UsingCookie">
                            <ItemTemplate>
                                <%# Eval("UsingCookie").ToString() == "True" ? "<img src='Images/tick.png' width='16' height='16'>" : "" %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Browser" HeaderText="Browser" SortExpression="Browser">
                        <ItemStyle Font-Size="X-Small" />
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Left" CssClass="PagerStyle" />
                    <EmptyDataTemplate>
                        No Log Found.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_LoginLog" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                    SelectCommand="s_Emp_Login_Log_Browse" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource_LoginLog_Selected">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="id" ConvertEmptyStringToNull="true" Name="EmpID"
                            Type="String" />
                        <asp:ControlParameter ControlID="txtIPAddress" ConvertEmptyStringToNull="False" Name="IP"
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter PropertyName="SelectedValue" Type="Int32" Name="AppID" ControlID="cboApplications"
                            DefaultValue="-9999" ConvertEmptyStringToNull="true" />
                        <asp:ControlParameter ControlID="txtDateFrom" Name="DateFrom" PropertyName="Text"
                            Type="DateTime" ConvertEmptyStringToNull="true" DefaultValue="01/01/1900" />
                        <asp:ControlParameter ControlID="txtDateTo" Name="DateTo" PropertyName="Text" Type="DateTime"
                            ConvertEmptyStringToNull="true" DefaultValue="01/01/1900" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </asp:Panel>
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
