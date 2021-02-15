<%@ Page Title="" Language="C#" MasterPageFile="~/TblMasterPage.master" AutoEventWireup="true"
    CodeFile="Password_Reset.aspx.cs" Inherits="Password_Reset" EnableSessionState="False" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    intraweb Password Recovery
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" runat="Server">
    <table>
        <tr>
            <td>
                <img src="Images/keys.png" width="256" height="256" border="0" />
            </td>
            <td>
                <table class="Panel1 ui-corner-all shadow">
                    <tr>
                        <td style="padding: 20px; color: Red">
                            <asp:Label ID="lblStatus" runat="server" Text="" Style="color: #000000; font-size: medium;
                                line-height: 1.5"></asp:Label>
                        </td>
                    </tr>
                </table>
                <div align="center" style="margin-top: 30px">
                    <a href="Default.aspx" title="Home">
                        <img alt="" src="Images/Home.png" border="0" width="48" height="48" /></a>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
