<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="AppVersion.aspx.cs" Inherits="AppVersion" Title="App Version" EnableViewState="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Src="EMP.ascx" TagName="EMP" TagPrefix="uc2" %>
<asp:Content ID="Content4" ContentPlaceHolderID="head" runat="Server">
    <style>
        ul {
            margin: 0;
            padding-left: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" CssClass="Panel1" ShowHeader="false"
                BorderStyle="None" BorderWidth="0" CellPadding="10" AutoGenerateColumns="False"
                DataKeyNames="ID" DataSourceID="SqlDataSourceApps" EnableViewState="false" 
                Style="font-size: small" OnRowDataBound="GridView1_RowDataBound">
                <RowStyle VerticalAlign="Top" />
                <Columns>
                    <asp:TemplateField ItemStyle-BackColor="White">
                        <ItemTemplate>
                            <a href='<%# Eval("ApplicationPath") %>' target="_blank">
                                <img src='<%# Eval("Logo") %>' border="0" style="max-width: 100px;max-height:100px" />
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Application Info" SortExpression="ApplicationName">
                        <ItemTemplate>
                            <div style="font-size: x-large; font-weight: 700">
                                <%# Eval("ApplicationName") %></div>
                            <%# Eval("Version","<div class='version'>Version: {0}</div>") %>
                            <%# Eval("AppDescription","<div style='margin-top:10px'>{0}</div>") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    Application Not Found.
                </EmptyDataTemplate>
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <AlternatingRowStyle BackColor="#F7F7F7" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceApps" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="sp_Application_Info" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="AppID" QueryStringField="APPID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="group" style="width: 900px; margin-top: 20px">
                <h4>
                    Release Notes</h4>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="Grid" EnableViewState="false" 
                    Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                    Font-Names="Courier" CellPadding="4" DataKeyNames="AppID,Version_First,Version_Mid,Version_Last"
                    DataSourceID="SqlDataSourceReleases" ForeColor="Black" GridLines="Vertical">
                    <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                    <Columns>
                        <asp:BoundField DataField="Version" HeaderText="Version" ReadOnly="True" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Font-Bold="true" SortExpression="Version">
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Released on" SortExpression="ReleaseDT">
                            <ItemTemplate>
                                <span title='<%# Common.ToRelativeDate(Eval("ReleaseDT"))%>'>
                                    <%# Eval("ReleaseDT", "{0:dd/MM/yyyy}")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Release Notes">
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ID") %>' />
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceReleaseNotes" EnableViewState="false">
                                    <ItemTemplate>
                                        <li>
                                            <%# Eval("ReleasesNotes") %>
                                        </li>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                    </EmptyDataTemplate>
                                    <LayoutTemplate>
                                        <ul>
                                            <li id="itemPlaceholder" runat="server" />
                                        </ul>
                                    </LayoutTemplate>
                                    <ItemSeparatorTemplate>
                                    </ItemSeparatorTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSourceReleaseNotes" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                    SelectCommand="SELECT [ReleasesNotes] FROM [App_ReleaseNotes] with (nolock) WHERE ([ID] = @ID) order by SL">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="HiddenField1" Name="ID" PropertyName="Value" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceReleases" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                    SelectCommand="sp_App_Releases" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="AppID" QueryStringField="APPID" Type="Int32" />
                        <asp:Parameter Name="Published" Type="Boolean" DefaultValue="true" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
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
