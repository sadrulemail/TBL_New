<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Attachment_Browse.aspx.cs" Inherits="Attachment_Browse" Title="Untitled Page" %>

<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="EMP.ascx" TagName="EMP" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    <asp:Label ID="lblTitle" runat="server" Text="Attachment Browse"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <table class="Panel1">
                <tr>
                    <td>
                        Emp ID:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmpID" runat="server" Width="60px" watermark="Emp ID"></asp:TextBox>
                    </td>
                    <td>
                        Batch ID:
                    </td>
                    <td>
                        <asp:TextBox ID="txtBatch" runat="server" Width="70px" watermark="YYYYMM"></asp:TextBox>
                    </td>
                    <td>
                        Type:
                    </td>
                    <td>
                         <asp:DropDownList ID="dboType" runat="server" AutoPostback="true">
                                        <asp:ListItem Text="Pay Slips" Value="PAYSLIP"></asp:ListItem>
                                        <asp:ListItem Text="Tax Certificates" Value="TAX_CERTIFICATE"></asp:ListItem>
                                        <asp:ListItem Text="PF Statements" Value="PF_STATEMENT"></asp:ListItem>
										<asp:ListItem Text="Trainings" Value="TRAINING"></asp:ListItem>
                                    </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="txtFilter" runat="server" Text="Filter" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                CssClass="Grid" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                DataKeyNames="AID" DataSourceID="SqlDataSource1" ForeColor="Black" PagerSettings-Mode="NumericFirstLast"
                PagerSettings-Position="TopAndBottom" PagerSettings-PageButtonCount="30" GridLines="Vertical"
                AllowPaging="True" AllowSorting="True">
                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="AID" HeaderText="AID" InsertVisible="False" ReadOnly="True"
                        SortExpression="AID" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:TemplateField HeaderText="EMPID" SortExpression="EMPID">
                        <ItemTemplate>
                            <uc2:EMP ID="EMP2" runat="server" Username='<%# Eval("EMPID") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="File" SortExpression="FileName">
                        <ItemTemplate>
                            <img src='<%# Common.getExtensionImage(Eval("FileName")) %>' width="16px" />
                            <a target="_blank" href='Attachment.ashx?aid=<%# Eval("AID") %>&key=<%# Eval("FileKey") %>' title='<%# Common.FileSize(Eval("FileSize")) %>'>
                                <%# Eval("FileName")%></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FileSize" SortExpression="FileSize">
                        <ItemTemplate>
                            <%# Common.FileSize(Eval("FileSize"))%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Added on" SortExpression="InsertDT">
                        <ItemTemplate>
                            <div title='<%# Eval("InsertDT","{0:dddd \ndd MMMM, yyyy \nh:mm tt}") %>'>
                                <%# Common.ToRecentDateTime(Eval("InsertDT"))%><br />
                                <span class="time-small">
                                    <%# Common.ToRelativeDate(Eval("InsertDT"))%></span></div>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Added By" SortExpression="InsertBy">
                        <ItemTemplate>
                            <uc2:EMP ID="EMP1" runat="server" Username='<%# Eval("InsertBy") %>' />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="DownloadCount" HeaderText="Download" SortExpression="DownloadCount"
                        ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Batch" HeaderText="Batch" SortExpression="Batch" ItemStyle-HorizontalAlign="Center">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete">
                        <img src="Images/delete.png" width="16" height="16" alt="Delete" title="Delete" />
                            </asp:LinkButton>
                            <asp:ConfirmButtonExtender runat="server" ID="ConfirmButtonExtenderlnkDelete" TargetControlID="lnkDelete"
                                ConfirmText="Do you want to Delete?">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle1" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="sp_Attachments_Browse" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected"
                DeleteCommand="sp_Attachments_Delete" DeleteCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmpID" Name="EmpID" PropertyName="Text" Type="String"
                        DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter ControlID="txtBatch" Name="Batch" PropertyName="Text" Type="Int32"
                        DefaultValue="-1" />
                    <asp:ControlParameter ControlID="dboType" Name="Type" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="AID" DbType="Int64" />
                </DeleteParameters>
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
