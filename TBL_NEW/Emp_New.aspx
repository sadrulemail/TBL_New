<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Emp_New.aspx.cs" Inherits="Emp_New" %>


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
            <td>New Employees
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td valign="top">
                        <table class="Panel1">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtEmpID" runat="server" CssClass="emp-add-control-all" Width="80px" placeholder="empid"></asp:TextBox>
                                </td>
                                <td style="padding-left: 10px">
                                    <asp:Button ID="cmdShow" runat="server" Text="Show" Width="80px" />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                            CssClass="Grid" PageSize="10" PagerSettings-Mode="NumericFirstLast"
                            PagerSettings-Position="TopAndBottom"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="EmpID"
                            DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnDataBound="GridView1_DataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lnkShow" CommandArgument='<%# Eval("EMPID") %>' CommandName="Select">
                                            <img alt="Open" src="Images/view.png" width="20px" height="20px" style="padding: 3px" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='../Profile.aspx?id=<%# Eval("EmpID") %>' target="_blank">
                                            <img alt="" src='<%# ConfigurationManager.AppSettings["Prefix"] %><%# "EmpImage.aspx?EMPID=" + Eval("EMPID") %>&W=100&&H=100&imgid=<%# Eval("ImageIdentifier") %>' height="50px" width="50px" style="border: 1px solid gray; padding: 1px" />
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="EMP" HeaderText="Sent by Emp" ReadOnly="True"
                                    SortExpression="EmpID" HtmlEncode="false">
                                    <ItemStyle Font-Size="90%" Width="150px" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Joined" SortExpression="Resigned">
                                    <ItemTemplate>
                                        <%# Eval("JoinDate","<div>{0:dd MMM, yyyy}</div>") %>
                                        <%# "<span class='time-small'>" + Common.ToRelativeDate(Eval("JoinDate")) + "</span>" %>
                                    </ItemTemplate>
                                    <ItemStyle Font-Size="90%" Wrap="false" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>No Data Found.</EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                            <SelectedRowStyle BackColor="Orange" />

                        </asp:GridView>
                        <br />
                        <asp:Literal runat="server" ID="lblStatus"></asp:Literal>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="s_Emp_New" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtEmpID" PropertyName="Text" Name="EmpID" Type="String" DefaultValue="*" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td valign="top" style="padding: 10px 40px">
                        <div style="font-weight: bold; font-size: 200%; text-align: center">Welcome to Trust Bank</div>
                        <br />
                        <div style="border: 3px solid gray; padding: 10px; border-radius: 18px; max-width: 750px; background-color: #FFFF80; width: 800px">
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                                DataKeyNames="EMPID" DataSourceID="SqlDataSource2" BorderStyle="None" GridLines="None" OnDataBound="DetailsView1_DataBound">
                                <Fields>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <a href='../Profile.aspx?id=<%# Eval("EmpID") %>' target="_blank">
                                                            <img src='<%# ConfigurationManager.AppSettings["Prefix"] %>EmpImage.aspx?empid=<%# Eval("EmpID") %>&imgid=<%# Eval("ImageIdentifier") %>&W=200&H=200' width="100px" height="100px" style="margin: 0 0 10px 10px; border: 2px solid silver; padding: 3px; background-color: white" alt="" />
                                                        </a>
                                                    </td>
                                                    <td style="padding-left: 20px">
                                                        <div style="font-size: 150%"><%# Eval("EMP") %></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <div style="padding-left: 20px">
                                                            <%# Eval("JoinDate","Joined on: <b>{0:dd MMM, yyyy}</b>") %>
                                                            <%# "<span class='time-small'>" + Common.ToRelativeDate(Eval("JoinDate")) + "</span>" %>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="SELECT top 1 * FROM dbo.ViewEMP with (nolock) WHERE EmpID = @EmpID">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="EmpID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <asp:Literal runat="server" ID="litComment" Text=""></asp:Literal>
                    </td>
                </tr>
            </table>
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
        UseAnimation="false" VerticalSide="Middle"></asp:AlwaysVisibleControlExtender>
</asp:Content>


