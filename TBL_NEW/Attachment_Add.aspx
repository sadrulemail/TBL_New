<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Attachment_Add.aspx.cs" Inherits="Attachment_Add" Title="Untitled Page" %>

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

    <script type="text/javascript">
        function onClientUploadComplete(sender, e) {
            var id = e.get_fileId();
            var fileSize = getReadableFileSizeString(e.get_fileSize());
            var fileName = e.get_fileName();
            var ss = "<li><input id='chkfilelist' type='checkbox' value='" + id + "' checked filename='" + fileName + "' > <b>" + fileName + "</b> (" + fileSize + ")</li>";
            $('#attachmentFileList').append(ss);
            $('#attachmentFileList').show("Slow");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    <asp:Label ID="lblTitle" runat="server" Text="Attachment Add"></asp:Label>
    <span style="font-size:small;margin-left:10px">(<a href="Attachment_Browse.aspx" target="_blank" >Browse All</a>)</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <table>
        <tr>
            <td valign="top">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <table class="Panel1">
                            <tr>
                                <td>
                                    Type:
                                </td>
                                <td>
                                     <asp:DropDownList ID="dboType" runat="server">
                                        <asp:ListItem Value="" Text=""></asp:ListItem>
                                        <asp:ListItem Text="Pay Slips" Value="PAYSLIP"></asp:ListItem>
                                        <asp:ListItem Text="Tax Certificates" Value="TAX_CERTIFICATE"></asp:ListItem>
                                        <asp:ListItem Text="PF Statements" Value="PF_STATEMENT"></asp:ListItem>
										<asp:ListItem Text="Trainings" Value="TRAINING"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Description:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDescription" runat="server" Width="400px" MaxLength="255"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    YYYYMM:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBatch" runat="server" Width="60px" MaxLength="6"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="cmdNext" runat="server" Text="Next >>" OnClick="cmdNext_Click" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <div id="attachmentFileList" class="Panel1">
                </div>
            </td>
            <td valign="top">
                <div id="uploadDialog">
                    <asp:AjaxFileUpload ID="AjaxFileUpload1" runat="server" OnUploadComplete="AjaxFileUpload1_UploadComplete"
                        OnClientUploadComplete="onClientUploadComplete" MaximumNumberOfFiles="2000" EnableViewState="true"
                         Width="500px" />
                </div>
            </td>
        </tr>
    </table>
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
