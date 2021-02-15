<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Executives-Managers-SubManagers.aspx.cs" Inherits="Executives_Managers_SubManagers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width: 40px" valign="middle">
                        <a href="Default.aspx" class="button1">
                            <img src="Images/Previous.gif" alt="Back" border="0" width="32" height="32" /></a>
                    </td>
                    <td  valign="middle">
                        <asp:Label ID="lblTitle" runat="server" Text="" CssClass="cphTitle"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <div class="Panel1 ui-corner-all">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" CausesValidation="True"
                                onfocus="this.select()" CssClass="Watermark" Watermark="enter information to filter"
                                Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            Branch:
                        </td>
                        <td>
                            <asp:DropDownList ID="cboBranch" runat="server" AppendDataBoundItems="true" AutoPostBack="true"
                                DataSourceID="SqlDataSourceBranch" DataTextField="BranchName" DataValueField="BranchID">
                                <asp:ListItem Text="All" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Head Office" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceBranch" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                                SelectCommand="SELECT [BranchID], [BranchName] FROM [ViewBranchOnly] ORDER BY [BranchName]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:Button ID="cmdSearch" runat="server" Text="Filter" Width="80px" Style="font-weight: 700" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:CheckBox ID="chkExecutives" Text="Executives" Checked="true" runat="server"
                                AutoPostBack="True" CausesValidation="True" OnCheckedChanged="chkExecutives_CheckedChanged" />
                            <asp:CheckBox ID="chkManagers" Text="Managers/Chief Manager" Checked="true" runat="server"
                                AutoPostBack="True" CausesValidation="True" OnCheckedChanged="chkManagers_CheckedChanged" />
                            <asp:CheckBox ID="chkSubManagers" Text="Sub Managers/Manager Operations/Manager Credit & Foreign Trade"
                                Checked="true" runat="server" AutoPostBack="True" CausesValidation="True" OnCheckedChanged="chkSubManagers_CheckedChanged" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" PagerSettings-PageButtonCount="30"
                CssClass="Grid" PageSize="20" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                BorderStyle="Solid" AllowPaging="True" PagerSettings-Position="TopAndBottom"
                BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black"
                PagerSettings-Mode="NumericFirstLast" Style="font-size: small">
                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="BranchID" HeaderText="BranchID" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false" SortExpression="BranchID" Visible="false">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="EmpID" SortExpression="EmpID">
                        <ItemTemplate>
                            <a href='Profile.aspx?ID=<%# Eval("EmpID") %>' target="_blank">
                                <%# Eval("EmpID") %></a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Large" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href='Profile.aspx?ID=<%# Eval("EmpID") %>' target="_blank">
                                <img class="wait" height="50" width="50" src='EmpImage.aspx?EMPID=<%# Eval("EmpID") %>&imgid=<%# Eval("Imageidentifier") %>&W=100' /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Information" SortExpression="EmpName">
                        <ItemTemplate>
                            <b>
                                <%# Eval("EmpName")%></b>
                            <%# Eval("DesigFullName","<br>{0}")%>
                            <%# Eval("Department", "<br>{0}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Designation" SortExpression="DesigName">
                        <ItemTemplate>
                            <span title='<%# Eval("DesigFullName") %>'>
                                <%# Eval("DesigName")%></span>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Branch Name" SortExpression="BranchName">
                        <ItemTemplate>
                            <a title='<%# Eval("BranchID") %>' href='<%# Eval("BranchID","EmpBranch.aspx?branch={0}") %>'
                                target="_blank">
                                <%# Eval("BranchName")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email ID" SortExpression="Email">
                        <ItemTemplate>
                            <span title='<%# Eval("Email","{0}@trustbanklimited.com") %>'>
                                <%# Eval("Email")%></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="mobile" HeaderText="Mobile No." SortExpression="mobile" />
                    <asp:TemplateField HeaderText="Contact No." SortExpression="Phone">
                        <ItemTemplate>
                            <%# Eval("phone", "{0}, ")%>
                            <%# Eval("dskphone", "{0}, ")%>
                            <%# Eval("ext", "Ext-{0}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Other Emails" SortExpression="Email1">
                        <ItemTemplate>
                            <%# Eval("Email1") %>
                            <%# Eval("Email2","<br>{0}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="30" Position="TopAndBottom" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                <EmptyDataTemplate>
                    <span class="style3">No March Found </span>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#FFA200" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Wrap="false" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Button ID="cmdExport" runat="server" Text="Download as xlsx" Width="150px" Height="30px"
                Visible="true" Font-Bold="true" OnClick="cmdExport_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommandType="StoredProcedure" SelectCommand="sp_Executives_Managers_SubManagers"
                ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                OnSelected="SqlDataSource1_Selected">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="Filter" PropertyName="Text" DefaultValue=""
                        Type="String" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:ControlParameter ControlID="cboBranch" Name="BranchID" PropertyName="SelectedValue"
                        Type="Int32" />
                    <asp:ControlParameter ControlID="chkExecutives" Name="Executives" PropertyName="Checked"
                        Type="Boolean" />
                    <asp:ControlParameter ControlID="chkManagers" Name="Managers" PropertyName="Checked"
                        Type="Boolean" />
                    <asp:ControlParameter ControlID="chkSubManagers" Name="SubManagers" PropertyName="Checked"
                        Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="cmdExport" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender2" runat="server"
        TargetControlID="UpdatePanel1">
        <Animations>
    <OnUpdating>
        <Sequence>                       
            <Parallel duration="0">                            
                <EnableAction AnimationTarget="UpdatePanel1" Enabled="false" /> 
                 <FadeOut minimumOpacity=".4" />                                           
            </Parallel>
        </Sequence>
    </OnUpdating>
    <OnUpdated>
        <Sequence>
            <Parallel duration="0">
            <FadeIn minimumOpacity=".4" />
                <EnableAction AnimationTarget="UpdatePanel1" Enabled="true" />
            </Parallel>                            
        </Sequence>
    </OnUpdated> 
        </Animations>
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
