<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BEFTN.ascx.cs" Inherits="BEFTN" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<link href="CSS/BEFTN.css" rel="stylesheet" type="text/css" />
<asp:Literal ID="lblBEFTN_Pre" runat="server"></asp:Literal>
<asp:Label ID="lblBEFTN" runat="server" Text="" CssClass="BEFTNLabel"></asp:Label>
<asp:Literal ID="lblBEFTN_Post" runat="server"></asp:Literal>
<asp:HoverMenuExtender runat="server" ID="HoverMenuExtenderlblBEFTN" DynamicControlID="BEFTNInfo"
    DynamicServiceMethod="getBEFTNInfo" DynamicServicePath="BEFTNService.asmx" TargetControlID="lblBEFTN"
    PopupControlID="BEFTNInfo" CacheDynamicResults="true" HoverDelay="500">
</asp:HoverMenuExtender>
<asp:Panel runat="server" ID="BEFTNInfo" CssClass="BEFTNName">
</asp:Panel>
