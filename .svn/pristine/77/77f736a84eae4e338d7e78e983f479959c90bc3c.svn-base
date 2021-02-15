<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeFile="EmpSign_Upload.aspx.cs" Inherits="EmpSign_Upload" %>

<%@ Register Src="TrustControl.ascx" TagName="TrustControl" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />

    <script src="script/jquery-1.7.1.min.js" type="text/javascript"></script>

    <script src="script/jquery.Jcrop.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function() {
            $('#ctl00_cphMain_imgCrop').Jcrop({
                onSelect: storeCoords,
                allowSelect: false,
                setSelect: [300, 200, 0, 0],
                bgOpacity: .3,

                aspectRatio: 1.5,
                keySupport: false,
                minSize: [30, 20],
                boxHeight: 400
            });
        });

        function storeCoords(c) {
            $('#ctl00_cphMain_X').val(c.x);
            $('#ctl00_cphMain_Y').val(c.y);
            $('#ctl00_cphMain_W').val(c.w);
            $('#ctl00_cphMain_H').val(c.h);
        };        
 
    </script>

    <script type="text/javascript">
        function AsyncFileUpload1_UploadError(sender, args) {
            document.getElementById('ctl00_cphMain_lblUploadStatus').innerText = "Sorry, file is:'" + args.get_fileName() + "'Error：" + args.get_errorMessage();
        }
        function AsyncFileUpload1_StartUpload(sender, args) {
            document.getElementById('ctl00_cphMain_lblUploadStatus').innerText = "File'" + args.get_fileName() + "'Uploading...";
        }
        function AsyncFileUpload1_UploadComplete(sender, args) {
            document.getElementById('ctl00_cphMain_lblUploadStatus').innerText = "File'" + args.get_fileName() + "'Finished, Size：" + args.get_length() + " bytes";
        }
        function UploadError() {
            document.getElementById('ctl00_cphMain_lblUploadStatus').innerHTML = "File Uploading Error. Please try again.";
        }
        function UploadComplete(sender, args) {
            var filename = args.get_fileName();
            var contentType = args.get_contentType();
            var text = "Size of " + filename + " is " + args.get_length() + " bytes";
            if (contentType.length > 0) {
                text += " and content type is '" + contentType + "'.";
            }
            document.getElementById('UploadBtn').style.visibility = "visible";
            document.getElementById('ctl00_cphMain_lblUploadStatus').innerHTML = filename + " is successfully uploaded.<br>";
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitle" runat="Server">
    <asp:Label ID="lblEmpName" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="lblEmpID" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <asp:HiddenField ID="HidSessionID" Value="" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TblUserDBConnectionString0 %>"
                SelectCommand="usp_getEmpInfo" SelectCommandType="StoredProcedure" 
                DeleteCommand="DELETE EMP_Sign WHERE EMPID = @EMPID">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="ID" Name="param_EMPID" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:QueryStringParameter QueryStringField="ID" Name="EMPID" Type="String" />
                </DeleteParameters>
            </asp:SqlDataSource>
            
           
            <div class="ui-corner-all Panel1" runat="server" id="UploadDiv" style="width: 600px;
                padding: 20px">                
                <asp:Panel ID="Panel1" runat="server">
                <div style="text-align:right"><asp:Button ID="Button1" runat="server" 
                        Text="Delete Current Signature" Width="200px " onclick="Button1_Click" />
                    <asp:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" 
                        ConfirmText="Do you want to Delete?" Enabled="True" TargetControlID="Button1">
                    </asp:ConfirmButtonExtender>
                    </div>
                    <b>Select JPG File (max 300 KB):</b>
                    <asp:AsyncFileUpload ID="FileUpload1" runat="server" ThrobberID="myThrobber" Width="300"
                        OnUploadedComplete="FileUpload1_UploadedComplete" OnClientUploadComplete="UploadComplete"
                        OnClientUploadError="UploadError" OnUploadedFileError="FileUpload1_UploadedFileError"
                        UploaderStyle="Modern" OnClientUploadStarted="AsyncFileUpload1_StartUpload" />
                    <asp:Image ImageUrl="Images/ajax-loader.gif" ID="myThrobber" runat="server" /><br />
                </asp:Panel>
                <asp:Panel ID="pnlCrop" runat="server" Visible="false">
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
                    <asp:Image ID="imgCropped" runat="server" CssClass="image" BorderWidth="1px" Width="200px" /><br />
                    <br />
                    <asp:CheckBox ID="ckhAgree" runat="server" Text="I am ensuring that, the signature is correct." />
                    <br />
                    <asp:Button ID="cmdSave" Width="100px" Height="30px" runat="server" Font-Bold="true"
                        Text="Save" OnClick="cmdSave_Click" />
                    <asp:ConfirmButtonExtender ID="cmdSave_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Update?"
                        Enabled="True" TargetControlID="cmdSave">
                    </asp:ConfirmButtonExtender>
                </asp:Panel>
                <asp:Label ID="lblUploadStatus" runat="server" Text="" Style="font-size: small; font-weight: 700"></asp:Label>
                <span style="visibility: hidden; padding-top: 10px" id="UploadBtn">
                    <br />
                    <asp:Button ID="cmdUpload" runat="server" CausesValidation="false" Font-Bold="true"
                        Text="Show" Width="100px" OnClick="cmdUpload_Click" /></span>
            </div>
            <br />
            <asp:HyperLink NavigateUrl="" ID="hypBack" runat="server" CssClass="Button" Font-Size="Small">« Back</asp:HyperLink>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="cmdUpload" />
            <asp:PostBackTrigger ControlID="btnCrop" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender2" runat="server"
        TargetControlID="UpdatePanel1">
        <Animations>
    <OnUpdating>
        <Sequence>                       
            <Parallel duration="0">                            
                <EnableAction AnimationTarget="UpdatePanel1" Enabled="false" />                            
            </Parallel>
        </Sequence>
    </OnUpdating>
    <OnUpdated>
        <Sequence>
            <Parallel duration="0">
                <EnableAction AnimationTarget="UpdatePanel1" Enabled="true" />
            </Parallel>                            
        </Sequence>
    </OnUpdated> 
        </Animations>
    </asp:UpdatePanelAnimationExtender>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false" AssociatedUpdatePanelID="UpdatePanel1"
        DisplayAfter="200">
        <ProgressTemplate>
            <img alt="" src="Images/processing.gif" style="width: 214px; height: 138px" class="LoadingImage" /></ProgressTemplate>
    </asp:UpdateProgress>
    <asp:AlwaysVisibleControlExtender ID="UpdateProgress1_AlwaysVisibleControlExtender"
        runat="server" Enabled="True" HorizontalSide="Center" TargetControlID="UpdateProgress1"
        UseAnimation="True" VerticalSide="Middle">
    </asp:AlwaysVisibleControlExtender>
</asp:Content>
