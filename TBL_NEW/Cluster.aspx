<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Cluster.aspx.cs" Inherits="Cluster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content4" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .emptable td
        {
            border: none !important;
            vertical-align: top !important;
            color: Black !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitle" runat="Server">
    <table>
        <tr>
            <td style="width: 40px">
                <a href="Default.aspx" class="button1">
                    <img src="Images/Previous.gif" alt="Back" border="0" /></a>
            </td>
            <td>
                Cluster wise Branch List
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ClusterID"
                DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" CssClass="Grid"
                AllowSorting="True">
                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="ClusterID" HeaderText="Cluster #" ReadOnly="True" SortExpression="ClusterID"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ClusterName" HeaderText="Cluster Name" SortExpression="ClusterName"
                        ItemStyle-Font-Bold="true">
                        <ItemStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Cluster Head" SortExpression="EMP">
                        <ItemTemplate>
                            <a href='Profile.aspx?ID=<%# Eval("ClusterHead") %>' target="_blank">
                                <table class="emptable">
                                    <tr>
                                        <td>
                                            <img width="60" height="60" src='EmpImage.aspx?EMPID=<%# Eval("ClusterHead") %>&W=100&imgid=<%# Eval("ImageIdentifier") %>'
                                                class="wait" style="border:1px gray solid;padding:1px" title='<%# Eval("ClusterHead") %>' />
                                        </td>
                                        <td>
                                            <%# Eval("Emp") %>
                                        </td>
                                    </tr>
                                </table>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Branch Names">
                        <ItemTemplate>
                            <asp:HiddenField ID="hidClusterID" runat="server" Value='<%# Eval("ClusterID") %>' />
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                                Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Branch Name" SortExpression="BranchName">
                                        <ItemTemplate>
                                           
                                                <%# Eval("BranchName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID" SortExpression="BranchID">
                                        <ItemTemplate>
                                            <a target="_blank" href='EmpBranch.aspx?branch=<%# Eval("BranchID") %>'>
                                                <%# Eval("BranchID") %></a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" ForeColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="SELECT [BranchID], [BranchName], [ClusterID] FROM [Branch] WHERE (([RevID] = 9999 AND [ClusterID] = @ClusterID)) order by BranchName">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hidClusterID" Name="ClusterID" PropertyName="Value"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Groups">
                        <ItemTemplate>
                            <a target="_blank" title="View" href='Group.aspx?id=GCM<%# Eval("ClusterID") %>'>Managers,
                                Cluster
                                <%# Eval("ClusterID") %></a><br />
                            <a target="_blank" title="View" href='Group.aspx?id=GCS<%# Eval("ClusterID") %>'>Sub-Managers,
                                Cluster
                                <%# Eval("ClusterID") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="SELECT * FROM v_Cluster">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
        <Triggers>
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
