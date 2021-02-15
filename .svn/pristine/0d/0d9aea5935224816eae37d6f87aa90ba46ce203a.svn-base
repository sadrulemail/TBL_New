<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" 
    AutoEventWireup="true" CodeFile="GoodbyeMsg.aspx.cs" Inherits="GoodbyeMsg" EnableViewState="false" %>

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
            <td>Goodbye Messages
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphMain" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
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
            <table>
                <tr>
                    <td valign="top">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                            CssClass="Grid" PageSize="10" PagerSettings-Mode="NumericFirstLast"
                            PagerSettings-Position="TopAndBottom"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE"
                            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID"
                            DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnDataBound="GridView1_DataBound">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:LinkButton runat="server" ID="lnkShow" CommandArgument='<%# Eval("MGID") %>' CommandName="Select">
                                <img alt="Open" src="Images/view.png" width="20px" height="20px" style="padding: 3px" />
                                        </asp:LinkButton>

                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='../Profile.aspx?id=<%# Eval("EmpID") %>' target="_blank">
                                            <img src='<%# ConfigurationManager.AppSettings["Prefix"] %><%# "EmpImage.aspx?EMPID=" + Eval("EMPID") %>&W=100&&H=100&imgid=<%# Eval("ImageIdentifier") %>' height="50px" width="50px" style="border: 1px solid gray; padding: 1px" />
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="EMP" HeaderText="Sent by Emp" ReadOnly="True"
                                    SortExpression="EmpID" HtmlEncode="false">
                                    <ItemStyle Font-Size="90%" Width="150px"/>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Sent on" SortExpression="SentDT">
                                    <ItemTemplate>
                                        <%# Eval("SentDT","<div>{0:dd MMM, yyyy}</div>") %>
                                        <%# "<span class='time-small'>" + Common.ToRelativeDate(Eval("SentDT")) + "</span>" %>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Font-Size="90%" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Joined/Resigned" SortExpression="Resigned">
                                    <ItemTemplate>
                                        <%# Eval("JoinDate","<div>Joined:<br>{0:dd MMM, yyyy}</div>") %>
                                        <%# Eval("ResignDate","<div style='margin-top:5px'>Resigned:<br>{0:dd MMM, yyyy}</div>") %>
                                    </ItemTemplate>
                                    <ItemStyle Font-Size="90%" Wrap="false" />
                                </asp:TemplateField>




                            </Columns>
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
                            SelectCommand="s_GoodByeMsg_Browse" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtEmpID" PropertyName="Text" Name="EmpID" Type="String" DefaultValue="*" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td valign="top" style="padding:10px">
                        <div style="border:3px dashed gray;padding:10px;border-radius:18px;max-width:750px;background-color:#fff">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="MGID" DataSourceID="SqlDataSource2" BorderStyle="None" GridLines="None" OnDataBound="DetailsView1_DataBound" >
                            <Fields>                                
                                <asp:TemplateField ShowHeader="False" >
                                    
                                    <ItemTemplate>
                                        <img src='<%# ConfigurationManager.AppSettings["Prefix"] %>EmpImage.aspx?empid=<%# Eval("GoodByeEmpID") %>' width="150px" height="150px" style="float:right;margin:0 0 10px 10px;border:2px solid silver;padding:3px;background-color:white"  />
                                        <div style="font-weight:bold;font-size:200%;border-bottom:2px solid silver"><%# Eval("Subject") %></div>
                                        <div>
                                       <%# Eval("Body") %>
                                            </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Subject" ShowHeader="False" SortExpression="Subject">
                                    
                                    <ItemTemplate>
                                        <div style="border-top:1px dashed Gray">
                                            <%# Eval("SentDT","Sent on: {0:dd MMM, yyyy}") %>
                                        <%# "<span class='time-small'>" + Common.ToRelativeDate(Eval("SentDT")) + "</span>" %>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>" 
                            SelectCommand="SELECT M.Subject,
       B.Body,
       G.MGID,
       M.SentDT,
       G.GoodByeEmpID
FROM dbo.GoodByeMsg AS G WITH (NOLOCK)
    INNER JOIN Msg.dbo.Msg M WITH (NOLOCK)
        ON G.MGID = M.MGID
    INNER JOIN Msg.dbo.Msg_Body AS B WITH (NOLOCK)
        ON B.MGID = M.MGID
           AND B.RevID = M.RevID
WHERE G.ID = @ID
ORDER BY M.RevID DESC;">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            </div>
                        <asp:Literal runat="server" ID="litComment"></asp:Literal>
                        
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
        UseAnimation="false" VerticalSide="Middle">
    </asp:AlwaysVisibleControlExtender>
</asp:Content>

