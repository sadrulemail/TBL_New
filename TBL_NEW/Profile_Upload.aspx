<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="Profile_Upload.aspx.cs" Inherits="Profile_Upload" %>

<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
    <script src="script/jquery.Jcrop.js" type="text/javascript"></script>
	
    <script type="text/javascript">
        $(document).ready(function() {
            $('#cphMain_imgCrop').Jcrop({
                onSelect: storeCoords,
                allowSelect: false,
                setSelect: [200, 200, 0, 0],
                bgOpacity: .3,

                aspectRatio: 1,
                keySupport: false,
                minSize: [50, 50],
                boxHeight: 400
            });
        });
        
            function storeCoords(c) {
                $('#cphMain_X').val(c.x);
                $('#cphMain_Y').val(c.y);
                $('#cphMain_W').val(c.w);
                $('#cphMain_H').val(c.h);
            };

            function getReadableFileSizeString(fileSizeInBytes) {
                var i = -1;
                var byteUnits = [' KB', ' MB', ' GB', ' TB', 'PB', 'EB', 'ZB', 'YB'];
                do {
                    fileSizeInBytes = fileSizeInBytes / 1024;
                    i++;
                } while (fileSizeInBytes > 1024);
                return Math.max(fileSizeInBytes, 0.1).toFixed(2) + byteUnits[i];
            }
        
        
 
    </script>

    <script type="text/javascript">
       
        function AsyncFileUpload1_StartUpload(sender, args) {
            var filename = args.get_fileName();
            var ext = filename.substring(filename.lastIndexOf(".") + 1);            
            if (ext.toLowerCase() == 'jpg') {            
                $('#cphMain_lblUploadStatus').html("<b>" + args.get_fileName() + "</b> is uploading...");
            }
            else{
                $('#UploadBtn').hide('Slow');
                $('#cphMain_lblUploadStatus').html("Only JPG files can be uploaded.");
                throw { 
                    name:        "Invalid File Type", 
                    level:       "Error", 
                    message:     "Only <b>JPG</b> files can be uploaded. ",
                    htmlMessage: "Only JPG files can be uploaded. " 
                }                
                return false;
            }            
        }
         
        
        function UploadError(sender, args) {
            $('#cphMain_lblUploadStatus').html(args.get_errorMessage() + "File Uploading Error. Please try again.");
            $('#UploadBtn').hide('Slow');
        }
        function UploadComplete(sender, args) {
            var filename = args.get_fileName();
            var TryAgain = '<br /><br /><a href="Profile_Upload.aspx" class="Button">Try Again</a>';
            var contentType = args.get_contentType();
            var text = "Size of " + filename + " is " + args.get_length() + " bytes";
            if (contentType.length > 0) {
                text += " and content type is '" + contentType + "'.";
            }
            if (contentType != 'image/jpeg') {
                $('#UploadBtn').hide();
                $('#cphMain_lblUploadStatus').html('Only JPG files are allowed to upload.' + TryAgain);
            }
            else if (args.get_length() > (1024 * 1024 * 2)) {
                $('#UploadBtn').hide();
                $('#cphMain_lblUploadStatus').html('File size must be less than 2 MB.' + TryAgain);
            }
            else {
                $('#UploadBtn').show('Slow');
                $('#cphMain_lblUploadStatus').html('<b>' + filename + '</b> is successfully uploaded. (' + getReadableFileSizeString(args.get_length()) + ')<br>');
            }
        }
    </script>
    <style>.AsyncFileUploadField input{width:98%!important;}</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    <asp:Label ID="lblEmpName" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <asp:HiddenField ID="hidTime" Value="" runat="server" />
            <div id="dialogue" style="display: none">
                Please wait</div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="usp_getEmpInfo" SelectCommandType="StoredProcedure" UpdateCommand="sp_EmpProfileUpdate"
                UpdateCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter SessionField="EMPID" Name="param_EMPID" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="EmpName" Type="String" />
                    <asp:Parameter Name="EmpID" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="mobile" Type="String" />
                    <asp:Parameter Name="dskphone" Type="String" />
                    <asp:Parameter Name="ext" Type="String" />
                    <asp:Parameter Name="Email1" Type="String" />
                    <asp:Parameter Name="Email2" Type="String" />
                    <asp:Parameter Name="Website" Type="String" />
                    <asp:Parameter Name="UpdateBY" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="Panel1 ui-corner-all" runat="server" id="UploadDiv" style="width: 600px;
                padding: 20px;">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="Panel1 ui-corner-all ui-dialog-title ui-widget" style="padding: 10px;
                        margin-bottom: 50px; font-weight: bold">
                        Please read the <a href="#" class="pictireterms">instructions</a> before uploading
                        your profile picture.</div>
                    <div>
                        <b>Select JPG File (max 2 MB):</b></div>
                    <asp:AsyncFileUpload ID="FileUpload1" runat="server" UploadingBackColor="Yellow"
                        CssClass="AsyncFileUploadField" ThrobberID="myThrobber" Width="300" 
                        OnUploadedComplete="FileUpload1_UploadedComplete"
                        OnClientUploadComplete="UploadComplete" 
                        OnClientUploadError="UploadError" 
                        OnUploadedFileError="FileUpload1_UploadedFileError"                        
                        OnClientUploadStarted="AsyncFileUpload1_StartUpload"
                        UploaderStyle="Traditional"  />
                    <asp:Image ImageUrl="Images/ajax-loader.gif" ID="myThrobber" runat="server" /><br />
                </asp:Panel>
                <asp:Panel ID="pnlCrop" runat="server" Visible="false">
                    <div style="font-weight: bold; padding: 10px; margin-bottom: 30px" class="Panel1 ui-corner-all">
                        Please select the area to crop the image.</div>
                    <asp:Image ID="imgCrop" runat="server" />
                    <br />
                    <asp:HiddenField ID="X" runat="server" />
                    <asp:HiddenField ID="Y" runat="server" />
                    <asp:HiddenField ID="W" runat="server" />
                    <asp:HiddenField ID="H" runat="server" />
                    <asp:Button ID="btnCrop" Width="100px" Height="30px" runat="server" Text="Crop" Font-Bold="true"
                        OnClick="btnCrop_Click" />
                </asp:Panel>
                <asp:Panel ID="pnlCropped" runat="server" Visible="false">
                    <asp:Image ID="imgCropped" runat="server" CssClass="image" BorderWidth="1px" Width="200px" />
                    <div style="margin-bottom: 10px; margin-top: 20px">
                        <asp:CheckBox ID="ckhAgree" Font-Bold="true" runat="server" Text=" I am ensuring this is my picture and this picture complies with the " /><b><a
                            target="_blank" class="pictireterms" href="#">instructions</a>.</b>
                    </div>
                    <asp:Button ID="cmdSave" Width="100px" Height="30px" runat="server" Font-Bold="true"
                        Text="Save" OnClick="cmdSave_Click" />
                    <asp:ConfirmButtonExtender ID="cmdSave_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                        Enabled="True" TargetControlID="cmdSave">
                    </asp:ConfirmButtonExtender>
                </asp:Panel>
                <asp:Label ID="lblUploadStatus" runat="server" Text="" Style="font-size: small;"></asp:Label>
                <span style="display: none; padding-top: 10px" id="UploadBtn">
                    <br />
                    <asp:Button ID="cmdUpload" runat="server" CausesValidation="false" Font-Bold="true"
                        Text="Show" Width="100px" OnClick="cmdUpload_Click" Height="30px" /></span>
            </div>
            <br />
            <asp:HyperLink NavigateUrl="~/Profile.aspx" ID="hypBack" runat="server" CssClass="Button"
                Font-Size="Small">« Back to Profile</asp:HyperLink>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="cmdUpload" />
            <asp:PostBackTrigger ControlID="btnCrop" />
        </Triggers>
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
