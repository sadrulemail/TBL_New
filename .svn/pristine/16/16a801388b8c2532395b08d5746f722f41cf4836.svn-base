<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="LifeEvents.aspx.cs" Inherits="LifeEvents" %>

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
            <td>
               Employee Life Events
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
                        <asp:TextBox ID="txtEmpID" runat="server" CssClass="emp-add-control-all" Width="80px" placeholder="empid"></asp:TextBox></td>
                    <td style="padding-left: 10px">Type</td>
                    <td>
                        <asp:DropDownList ID="dboT" runat="server" AppendDataBoundItems="true"
                            DataSourceID="SqlDataSourceEvantType" DataTextField="EventType" AutoPostBack="true"
                            DataValueField="EventTypeID">
                            <asp:ListItem Value="-1" Text="All"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceEvantType" runat="server"
                            ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                            SelectCommand="SELECT [EventTypeID], [EventType] FROM [EmpInfo_LifeEvent_Types] where EventTypeID in (1,2) ORDER BY [EventType]"></asp:SqlDataSource>

                    </td>
                    <td style="padding-left: 10px">Relationship</td>
                    <td>
                        <asp:DropDownList ID="dboR" runat="server" AppendDataBoundItems="true" AutoPostBack="true"
                            DataSourceID="SqlDataSourceRelationship" DataTextField="RelationshipName"
                            DataValueField="ID">
                            <asp:ListItem Value="-1" Text="All"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceRelationship" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>" 
                            SelectCommand="SELECT [ID], [RelationshipName] FROM [EmpInfo_Relationship] with (nolock) ORDER BY [RelationshipName]"></asp:SqlDataSource>
                    </td>
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
                BorderStyle="None" BorderWidth="1px" PagerSettings-PageButtonCount="30"
                CellPadding="4" DataKeyNames="EventID" DataSourceID="SqlDataSource1" 
                ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <a target="_blank" href='LifeEvent.aspx?eventid=<%# Eval("EventID") %>' title="Details">
                                <img alt="Open" src="Images/view.png" width="20px" height="20px" style="padding: 3px" />
                            </a>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="PersonName">
                        <ItemTemplate>
                            <%# Eval("PersonName","<b>{0}</b>") %>
                            <%# Eval("Gender","<div style='font-size:80%'>({0})</div>") %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Type" SortExpression="EventType">
                        <ItemTemplate>
                            <%# Eval("EventType","<div>{0}</div>") %>
                            <img src='Images/<%# Eval("EventType") %>.png' width="42" height="42" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="On" SortExpression="EventDT">
                        <ItemTemplate>
                            <%# Eval("EventDT","<div>{0:dd MMM, yyyy}</div>") %>
                            <%# Eval("EventTypeID").ToString() == "2" ? "<span class='time-small'>" + Common.ToRelativeDate(Eval("EventDT")) + "</span>" : ""%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Age" SortExpression="Age">
                        <ItemTemplate>
                            <%# Eval("EventTypeID").ToString() != "2" ? Common.getAge(Eval("EventDT")) : Eval("Age")%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("EventID") %>' />
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="SL" ShowHeader="False" DataSourceID="SqlDataSourceChild"
                                GridLines="None" BorderStyle="None" CssClass="noborder" CellPadding="3">
                                <AlternatingRowStyle />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Eval("RelationshipName","<div style='width:80px'>{0} of</div>") %>
                                        </ItemTemplate>
                                        <ItemStyle Font-Bold="true" Wrap="true" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='../Profile.aspx?id=<%# Eval("EmpID") %>' target="_blank">
                                                <img src='<%# ConfigurationManager.AppSettings["Prefix"] %><%# "EmpImage.aspx?EMPID=" + Eval("EMPID") %>&W=100&H=100&imgid=<%# Eval("ImageIdentifier") %>' height="50px" width="50px" style="border:1px solid gray;padding:1px" />
                                            </a>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Emp" HeaderText="Emp" ReadOnly="True"
                                        SortExpression="Emp" HtmlEncode="false" ItemStyle-Wrap="false">
                                        <ItemStyle Font-Size="85%" />
                                    </asp:BoundField>


                                </Columns>
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle VerticalAlign="top" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceChild" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>" ProviderName="<%$ ConnectionStrings:TblUserDBConnectionString0.ProviderName %>" SelectCommand="s_EmpInfo_LifeEvents_Details" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="HiddenField1" Name="EventID" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Left" CssClass="PagerStyle" />
                <RowStyle BackColor="#F7F7DE" VerticalAlign="Top" />
                <SelectedRowStyle BackColor="Orange" />
               
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>" SelectCommand="s_EmpInfo_LifeEvents_Browse" SelectCommandType="StoredProcedure" OnSelected="SqlDataSource1_Selected">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmpID" PropertyName="Text" Name="EmpID" Type="String" DefaultValue="*" />
                    <asp:ControlParameter ControlID="dboT" PropertyName="SelectedValue" Name="EventTypeID" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter ControlID="dboR" PropertyName="SelectedValue" Name="RelationshipID" Type="Int32" DefaultValue="-1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
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
