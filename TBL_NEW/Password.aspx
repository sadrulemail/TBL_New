<%@ Page Title="" Language="C#" MasterPageFile="~/TblMasterPage.master" AutoEventWireup="true"
    CodeFile="Password.aspx.cs" Inherits="Password" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    intraweb Password Recovery
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <div style="padding-top: 0">
        <asp:ScriptManager ID="TrustScriptManager" runat="server" ScriptMode="Release"
            EnablePartialRendering="true" AsyncPostBackTimeout="360000">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="up1" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td valign="top">
                            <img src="Images/keys.png" width="256" height="256" border="0" />
                        </td>
                        <td valign="top">
                            <asp:Panel ID="Panel1" runat="server">
                                <table style="min-width: 450px; font-size: small;" class="Panel1 ui-corner-all shadow">
                                    <tr>
                                        <td colspan="4" >
                                            <div style="font-size: 120%; padding: 10px 10px 20px 20px;font-weight:bold;color:Green;text-shadow:1px 1px silver;width:450px">
                                            <asp:Label ID="lblStatus" runat="server" Style="line-height: 1.5" Text="To recover or unlock your password please enter the following information. An email will be sent to your email address with a Url."></asp:Label>
                                            </div>
                                                <div style="text-align:center">
                                                <asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td nowrap="nowrap" style="text-align: right;padding-top:9px" valign="top">
                                            <b>Login ID:</b>
                                        </td>
                                        <td>
                                            <asp:TextBox placeholder="emp id" ID="txtID" runat="server" MaxLength="20" Style="font-weight: 700" Width="150px" AutoPostBack="true" OnTextChanged="txtID_TextChanged"></asp:TextBox>
                                            <asp:Label ID="lblEmpName" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="text-align: right">
                                            <b>Email:</b>
                                        </td>
                                        <td style="font-weight:bold;white-space:nowrap">
                                            <asp:TextBox placeholder="email/domain id" ID="txtEmail" runat="server" MaxLength="50" Style="font-weight: 700"
                                                Width="150px"></asp:TextBox>@<asp:DropDownList ID="dboDomain" runat="server" style="font-weight:bold">                                                    
                                                    <asp:ListItem Text="tblbd.com" Value="tblbd.com"></asp:ListItem>
													<asp:ListItem Text="trustbanklimited.com" Value="trustbanklimited.com"></asp:ListItem>
                                                </asp:DropDownList>
                                                </b>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Button ID="cmdUnlock" runat="server" Text="Unlock User" Width="130px" OnClick="cmdUnlock_Click" />
                                            <asp:Button ID="cmdReset" runat="server" Text="Reset Password" Width="130px" OnClick="cmdReset_Click" />
                                            
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Visible="false">
                                <table style="width: 450px; font-size: small;" class="Panel1 ui-corner-all shadow">
                                    <tr>
                                        <td colspan="4" style="font-size: small; padding: 10px 10px 20px 20px;">
                                            <asp:Label ID="Label1" runat="server" Text="" Style="color: #000000; font-size: medium;
                                                line-height: 1.5"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <div align="center" style="margin-top: 30px">
                                <a href="Default.aspx" title="Home">
                                    <img alt="" src="Images/Home.png" border="0" width="48" height="48" /></a>
                            </div>
                        </td>
						<td valign="top" style="padding-left:20px">
                            <a target="_blank" href="//intraweb.tblbd.com/blog/3934" style="font-size:120%;font-weight:bold"><img src="Images/info2.png" width="48" />How to recover intraweb password?</a>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
