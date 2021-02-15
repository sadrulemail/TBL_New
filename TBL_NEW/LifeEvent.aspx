<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="LifeEvent.aspx.cs" Inherits="LifeEvent" %>

<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="EMP.ascx" TagName="EMP" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    <table>
        <tr>
            <td style="width: 40px">
                <a href="LifeEvents.aspx" class="button1">
                    <img src="Images/Previous.gif" alt="Back" border="0" /></a>
            </td>
            <td>
                Life Event
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                <td valign="top">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White"
                            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="EventID"
                            DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" CssClass="Grid"
                            OnDataBound="DetailsView1_DataBound" style="max-width:500px">
                            <AlternatingRowStyle BackColor="White" />
                            <Fields>
                                <asp:TemplateField HeaderText="Event Type" ShowHeader="false">
                                    <ItemTemplate>
                                        <table class="noborder">
                                            <tr>
                                                <td style="font-size: 300%">
                                                    <%# Eval("EventType","{0}") %>
                                                </td>
                                                <td style="padding-left: 20px">
                                                    <img src='Images/<%# Eval("EventType") %>.png' width="64" height="64" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="true" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="On">
                                    <ItemTemplate>
                                        
                                        <%# Eval("EventDT","<div>{0:dd MMM, yyyy}</div>") %>
                                        <%# Eval("EventTypeID").ToString() == "2" ? "<span class='time-small'>" + Common.ToRelativeDate(Eval("EventDT")) + "</span>" : ""%>
                                                
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <%# Eval("PersonName") %>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="false" />
                                    <ItemStyle Font-Bold="true" Font-Size="Medium" />
                                </asp:TemplateField>
                                
                               
                                <asp:TemplateField HeaderText="Age">
                                    <ItemTemplate>
                                        <%# Eval("EventTypeID").ToString() != "2" ? Common.getAge(Eval("EventDT")) : Eval("Age") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <%# Eval("Description").ToString().Replace("\n","<br") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField ShowHeader="false">
                                    <ItemTemplate>
                                    Added by: <uc2:EMP ID="EMP1" runat="server" Username='<%# Eval("InsertBy")%>' Position="Left" />                                    
                                        On: <%# Eval("InsertDT") %>
                                        <span class="silver">
                                            (<%# Common.ToRelativeDate(Eval("InsertDT")) %>)</span>
                                    </ItemTemplate>
                                    <ItemStyle ForeColor="Silver" Font-Size="80%" />
                                </asp:TemplateField>
                            </Fields>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="s_EmpInfo_LifeEvents_Browse" SelectCommandType="StoredProcedure"
                            OnSelected="SqlDataSource2_Selected">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="eventid" Name="ID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="EventID" Type="Int32" />
                                <asp:Parameter Name="EventTypeID" Type="Int32" />
                                <asp:Parameter Name="PersonName" Type="String" />
                                <asp:Parameter Name="EventDT" Type="DateTime" DefaultValue="01/01/1900" />
                                <asp:Parameter Name="Age" Type="String" Size="100" />
                                <asp:Parameter Name="DESCRIPTION" Type="String" Size="-1" />
                                <asp:SessionParameter Name="InsertBy" SessionField="EMPID" />
                                <asp:Parameter Direction="InputOutput" Name="Msg" Type="String" DefaultValue=" "
                                    Size="255" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceEvantType" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT [EventTypeID], [EventType] FROM [EmpInfo_LifeEvent_Types] ORDER BY [EventType]">
                        </asp:SqlDataSource>
                    </td>
                    <td valign="top" style="padding-left:20px">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="SL"
                            ShowHeader="False" DataSourceID="SqlDataSourceChild" GridLines="Vertical" BorderStyle="None"
                            CssClass="Grid noborder" CellPadding="4" AllowSorting="True" BackColor="White"
                            BorderColor="#DEDFDE" BorderWidth="1px" ForeColor="Black">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <%# Eval("RelationshipName","<div>{0} of</div>") %>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="true" Font-Size="Large" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href='../Profile.aspx?id=<%# Eval("EmpID") %>' target="_blank">
                                            <img src='<%# ConfigurationManager.AppSettings["Prefix"] %><%# "EmpImage.aspx?EMPID=" + Eval("EMPID") %>&W=100&H=100&imgid=<%# Eval("ImageIdentifier") %>' style="width: 80px;
                                                height: 80px; border: 1px gray solid; padding: 1px" />
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Emp" HeaderText="Emp" ReadOnly="True" SortExpression="Emp"
                                    HtmlEncode="false" ItemStyle-Wrap="false">
                                    <ItemStyle />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle VerticalAlign="top" BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceChild" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>"
                            SelectCommand="s_EmpInfo_LifeEvents_Details" SelectCommandType="StoredProcedure"
                            DeleteCommand="s_EmpInfo_LifeEvents_Details_Delete" DeleteCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="eventid" Name="EventID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:HiddenField ID="hidSex" runat="server" />
                    </td>
                    
                </tr>
            </table>
            <div style="border-top: 1px green dashed; margin: 30px 10px 0px 10px;padding-top:5px; font-size: 120%; font-weight: bold;color:Green">
                Comments:</div>
            <asp:Literal ID="litCommentBox" runat="server"></asp:Literal>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
