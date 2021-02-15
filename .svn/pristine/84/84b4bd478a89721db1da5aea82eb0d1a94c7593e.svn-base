<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Group.aspx.cs" Inherits="Group" %>

<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
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
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" ShowHeader="false"
                CellPadding="0" ForeColor="#333333" CssClass="Grid" OnDataBound="DetailsView1_DataBound"
                AutoGenerateColumns="false">
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" VerticalAlign="Middle" />
                <Columns>
                    <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <img src="Images/NoGroupFace.png" width="70px" height="70px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-BackColor="#8FAA4A" ItemStyle-ForeColor="White"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <div style="font-size: 18pt; font-weight: bold; padding: 2px 8px 2px 8px">
                                Group
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:HiddenField ID="hidGroupName" runat="server" Value='<%# Eval("GroupName") %>' />
                            <div style="padding: 2px 6px 2px 6px">
                                <div style="float: right; padding-left: 50px">
                                    <a href='msg/New.aspx?to=<%# Eval("GroupID") %>' target="_blank" title="Send Message">
                                        <img src="Images/msg_20.png" width="20" height="20" border="0" /></a></div>
                                <span style="font-size: large; font-weight: bold">
                                    <%# Eval("GroupName") %></span><br />
                                <%# Eval("GroupDescription")%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
            <br />
            <table style="border: solid 1px #8FAA4A; border-collapse: collapse">
                <tr>
                    <td style="background: #8FAA4A; padding: 2px; color: White">
                        <asp:Label ID="lblTitle1" runat="server" Text="Group Members"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 3px">
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal"
                            GridLines="None" RepeatColumns="3" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <a href='Profile.aspx?id=<%# Eval("EMPID") %>' class="Nounderline" target="_blank">
                                    <div class="ProfileDiv ui-corner-all">
                                        <table width="100%">
                                            <tr>
                                                <td valign="top" style="width: 60px">
                                                    <img alt='<%# Eval("EMPID") %>' title='<%# Eval("EMPID") %>' src='<%# ConfigurationManager.AppSettings["Prefix"] %>EmpImage.aspx?empid=<%# Eval("EMPID") %>&imgid=<%# Eval("Imageidentifier") %>&W=100'
                                                        width="50px" class="ProfilePic" />
                                                </td>
                                                <td valign="top" style="color: Black; text-decoration: none;width:100%">
                                                    <span title='<%# Eval("EMPID")%>'>
                                                        <%# Eval("EMP")%>
                                                    </span>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="SELECT * FROM [v_Groups] with (nolock) WHERE ([GroupID] = @GroupID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="GroupID" QueryStringField="id" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="sp_getGroups" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource2_Selected">
                <SelectParameters>
                    <asp:QueryStringParameter Name="GroupID" QueryStringField="ID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
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
