<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default1.aspx.cs" Inherits="Default1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainArea" runat="Server">
    <div align="left">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceApplicationType"
            OnItemDataBound="Repeater1_ItemDataBound">
            <HeaderTemplate>
                <table cellspacing="0">
                    <tr>
            </HeaderTemplate>
            <ItemTemplate>
                <td valign="top">
                    <table cellspacing="0">
                        <tr>
                            <td runat="server" id="MenuTD">
                                <asp:HyperLink ID="Link" NavigateUrl='<%# "?type=" + Eval("ID") %>' runat="server"><%# Eval("ApplicationType") %></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </td>
            </ItemTemplate>
            <FooterTemplate>
                </tr></table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <asp:GridView runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None"
        ShowHeader="False" DataSourceID="SqlDataSource_Applications0" ForeColor="#333333"
        Width="450px" ID="grdApplications0" BorderColor="#ccebd6" BorderStyle="Solid"
        BorderWidth="3px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Logo") %>' Width="30px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" Width="70px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <div id="trust">
                        <a href='<%# Eval("ApplicationPath") %>' style="font-size: 11pt;" title='<%# " - " + Eval("AppDescription") %>'>
                            <%# Eval("ApplicationName") %></a>
                    </div>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999"></EditRowStyle>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>
        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceApplicationType" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
        SelectCommand="SELECT [ID], [ApplicationType] FROM [ApplicationType] WHERE TabVisible = 'Y' ORDER BY [OrderCol]"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
        SelectCommand="SELECT ID, ApplicationName, ApplicationPath, AppDescription, Logo FROM Applications WHERE (ShowIn = @Type) ORDER BY ApplicationName"
        ID="SqlDataSource_Applications0">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="Type" QueryStringField="type" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1" >
    <div ID="Div1" runat="server" visible="false">
    <br /><br /><br />
    <a href="Notice.aspx" title="View Details">
        <div style="text-align: center; background-color: Green; background-image: url('Images/bg1.gif');
            color: White; font-weight: bold">
            what's new</div>
    </a>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" AutoGenerateColumns="false"
        BorderColor="Green" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" Width="100%" 
        DataSourceID="SqlDataSourceNotice" ForeColor="Black" GridLines="Vertical" Style="font-size: small"
        ShowHeader="False" >
        <Columns>
            <asp:TemplateField HeaderText="Added on" SortExpression="PublishedDT" ItemStyle-Width="60px"
                ItemStyle-Font-Size="8pt" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("PublishedDT","{0:dd MMM yyyy<br>hh:mm tt}")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <a href='<%# Eval("Url") %>' title='<%# Eval("Tooltips") %>' style="font-size: 10pt;"
                        target="_blank">
                        <%# Eval("Title") %></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle BackColor="#F7F7DE" />
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <div style="text-align:right;">
    <a style="font-size:small" href="Notice.aspx">show all >></a></div>
    <asp:SqlDataSource ID="SqlDataSourceNotice" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
        SelectCommand="SELECT top 5 * FROM [Notice] WHERE ([Active] = 1) ORDER BY [PublishedDT] DESC">
    </asp:SqlDataSource>
    </div>
</asp:Content>