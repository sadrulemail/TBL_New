<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/jquery.autocomplete.css" rel="stylesheet" type="text/css" />

    <script src="scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

    <script src="scripts/jquery.autocomplete.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            jQueryInit();
        });

        function pageLoad() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(jQueryInit);
        }

        function jQueryInit() {
            $(document).ready(function() {
                $("#<%=txtSearch.ClientID%>").autocomplete("Search_CS.ashx", {
                    width: 300,
                    minChars: 1,
                    cacheLength: 10,
                    scrollHeight: 300,
                    delay: 400,
                    scroll: true,
                    formatItem: function(data, i, n, value) {
                        return "<table><tr><td valign='top'><img src='"
            + value.split(",")[1] + "'/></td><td>" + value.split(",")[0] + "</td></tr></table>";
                    },
                    formatResult: function(data, value) {
                        return value.split(",")[2];
                    }
                });
            });
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="update1" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtSearch" EnableViewState="false" runat="server" Width="400px"
                    AutoPostBack="true"></asp:TextBox>
                <asp:Label ID="lbl1" runat="server"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
