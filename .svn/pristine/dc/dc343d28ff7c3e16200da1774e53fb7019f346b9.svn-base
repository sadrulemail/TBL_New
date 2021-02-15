using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using SD = System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;

public partial class Profile_Upload : System.Web.UI.Page
{
    string ID;
    string LoginID;
    string UploadTempFile;
    string ImageName;
    string UploadPath;
    string UploadCropFile;
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Upload Profile Picture";
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        LoginID = string.Format("{0}", Session["EMPID"]);

        if (!IsPostBack)
        {
            Session["FILENAME"] = "";
            Random R = new Random(DateTime.Now.Millisecond +
                            DateTime.Now.Second * 1000 +
                            DateTime.Now.Minute * 60000 +
                            DateTime.Now.Hour * 3600000);
            hidTime.Value = string.Format("{0}", R.Next());

        }

        if (LoginID.Length > 0)
            LoadProfile(LoginID);
        else
        {
            Panel1.Visible = false;            
        }

        try
        {
            if (!Directory.Exists(Server.MapPath("Upload/"))) Directory.CreateDirectory(Server.MapPath("Upload/"));
            ImageName = string.Format("{0}_{1}_{2}.jpg", Session["EMPID"], Session.SessionID, hidTime.Value);
            UploadTempFile = Server.MapPath("Upload/" + ImageName);
            UploadCropFile = Server.MapPath("Upload/crop_" + ImageName);
            UploadPath = Server.MapPath("Upload/");
            //Response.Write(UploadTempFile);
        }
        catch (Exception) { }
        
    }

    private void LoadProfile(string ID)
    {
        DataView DV = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (DV != null &&DV.Table.Rows.Count > 0)
        {
            lblEmpName.Text = string.Format("{0}", DV.Table.Rows[0]["EmpName"]);
        }
        else
        {
            lblEmpName.Text = "Not Found.";
        }
    }

    public void FileUpload1_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        try
        {
            Session["FILENAME"] = FileUpload1.FileName.Trim();
            if (FileUpload1.FileBytes.Length > (1024 * 1024 * 2))
            {
                throw new Exception("Invalid File Size");
            }
            FileUpload1.SaveAs(UploadTempFile);
            FileInfo FI = new FileInfo(UploadTempFile);
            FI.CreationTime = DateTime.Now;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void FileUpload1_UploadedFileError(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {

    }

    protected void cmdUpload_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        pnlCrop.Visible = true;
        imgCrop.ImageUrl = "Upload/" + ImageName;
    }

    private void SaveInDB()
    {
        lblUploadStatus.Text = "";

        try
        {
            //bool test = File.Exists(UploadTempFile);
            lblUploadStatus.Text = Session["FILENAME"].ToString();
            //return;
        }
        catch (Exception ex)
        {
            lblUploadStatus.Text = "E: " + ex.Message;
            return;
        }

        try
        {
            string FileName = Session["FILENAME"].ToString();
            //FileInfo FI = new FileInfo(FileName);
            //string Extension = FileName.Substring(FileName.Trim().Length - 4, 4).ToUpper().Replace(".", "");
            string Extension = (Path.GetExtension(FileName)).Replace(".", "").ToUpper();
            switch (Extension)
            {
                case "JPEG":
                case "JPG":

                    InsertData(ReadFile(UploadCropFile), true, FileName, Extension);
                    
                    File.Delete(UploadCropFile);
                    DeleteOldUploadedFiles();
                    cmdSave.Visible = false;
                    break;
                default:
                    lblUploadStatus.Text = "Only JPG files can be uploaded.";
                    //lblUploadStatus.Text = "Only ZIP files can be Uploaded.";
                    //ClientScript.RegisterClientScriptBlock(GetType(), "alertMsg", "<script>alert('File type error.');</script>"); break;
                    break;
            }
        }
        catch (Exception ex)
        {
            lblUploadStatus.Text = ex.Message;
        }

        try
        {
            File.Delete(UploadTempFile);
        }
        catch (Exception) { }
    }

    private void InsertData(byte[] content, bool IsInsertNew, string FileName, string Extension)
    {
        if (content.Length > 2 * 1024 * 1024)
        {
            lblUploadStatus.Text = "Size exceed.";
            return;
        }

        SqlConnection objConn = null;
        SqlCommand objCom = null;
        try
        {
            int AID = 0;
            objConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString);
            objCom = new SqlCommand("usp_EMP_Pic_Insert", objConn);
            objCom.CommandType = CommandType.StoredProcedure;

            objCom.Parameters.Add("@EMPID", SqlDbType.VarChar).Value = Session["EMPID"].ToString();
            objCom.Parameters.Add("@Picture", SqlDbType.Image).Value = content;
            //objCom.Parameters.Add("@FileName", SqlDbType.VarChar).Value = FileName;
            //objCom.Parameters.Add("@Extension", SqlDbType.VarChar).Value = Extension;
            //objCom.Parameters.Add("@FileSize", SqlDbType.Int).Value = content.Length;
            //objCom.Parameters.Add("@Type", SqlDbType.VarChar).Value = "";
            //objCom.Parameters.Add("@SessionID", SqlDbType.VarChar).Value = Session.SessionID;
            //objCom.Parameters.Add("@RETURN_VALUE", SqlDbType.Int).Value = AID;
            //objCom.Parameters["@RETURN_VALUE"].Direction = ParameterDirection.ReturnValue;

            if (objConn.State == ConnectionState.Closed)
                objConn.Open();
            int i = objCom.ExecuteNonQuery();
            //AID = (int)objCom.Parameters["@RETURN_VALUE"].Value;
            objConn.Close();
            Panel1.Visible = false;
            pnlCropped.Visible = false;
            lblUploadStatus.Text = "Picture has been changed.<br>(Some applications will take 3 hours to update the picture.)";
            HttpResponse.RemoveOutputCacheItem(string.Format("/EmpImage.aspx?EMPID={0}", Session["EMPID"]));
            HttpResponse.RemoveOutputCacheItem(string.Format("/EmpImage.aspx?EMPID={0}&W=200", Session["EMPID"]));

        }
        catch (Exception ex)
        {
            lblUploadStatus.Text = "Error: " + ex.Message;
        }
    }

    protected byte[] ReadFile(string filePath)
    {
        byte[] buffer;
        FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.Read);
        try
        {
            int length = (int)fileStream.Length;  // get file length
            buffer = new byte[length];            // create buffer
            int count;                            // actual number of bytes read
            int sum = 0;                          // total number of bytes read

            // read until Read method returns 0 (end of the stream has been reached)
            while ((count = fileStream.Read(buffer, sum, length - sum)) > 0)
                sum += count;  // sum is a buffer offset for next reading
        }
        finally
        {
            fileStream.Close();
        }
        return buffer;
    }

    protected void cmdChangeProPic_Click(object sender, EventArgs e)
    {
        UploadDiv.Visible = true;
        Panel1.Visible = true;
        pnlCrop.Visible = false;
        pnlCropped.Visible = false;
        lblUploadStatus.Text = "";
        DeleteOldUploadedFiles();
    }
    

    protected void cmdChangeProPicCancel_Click(object sender, EventArgs e)
    {
        UploadDiv.Visible = false;
    }

    protected void btnCrop_Click(object sender, EventArgs e)
    {
        int w = 200;
        int h = 200;
        int x = 0;
        int y = 0;

        try
        {
             w = Convert.ToInt32(W.Value);
             h = Convert.ToInt32(H.Value);
             x = Convert.ToInt32(X.Value);
             y = Convert.ToInt32(Y.Value);
        }
        catch (Exception)
        {
        }
        byte[] CropImage = Crop(UploadPath + ImageName, w, h, x, y);
        using (MemoryStream ms = new MemoryStream(CropImage, 0, CropImage.Length))
        {
            ms.Write(CropImage, 0, CropImage.Length);
            using (SD.Image CroppedImage = SD.Image.FromStream(ms, true))
            {
                string SaveTo = UploadPath + "crop_" + ImageName;
				
                if(CroppedImage.Width > 800)
                    ResizeImage((System.Drawing.Bitmap)CroppedImage, 800, 800, 90, SaveTo);
                else
                    CroppedImage.Save(SaveTo, CroppedImage.RawFormat);
					
                pnlCrop.Visible = false;
                pnlCropped.Visible = true;
                imgCropped.ImageUrl = imgCrop.ImageUrl = "Upload/crop_" + ImageName;
            }            
        }
        cmdSave.Visible = true;
        File.Delete(UploadTempFile);
        //DeleteOldUploadedFiles();
    }

    private void DeleteOldUploadedFiles()
    {
        try
        {
            string[] Files = Directory.GetFiles(Server.MapPath("Upload/"));
            foreach (string FileName in Files)
                if (File.GetCreationTime(FileName) < DateTime.Now.AddHours(-3) || FileName.Contains(Session.SessionID))
                    File.Delete(FileName);
        }
        catch (Exception) { }
    }

    static byte[] Crop(string Img, int Width, int Height, int X, int Y)
    {
        try
        {
            using (SD.Image OriginalImage = SD.Image.FromFile(Img))
            {
                using (SD.Bitmap bmp = new SD.Bitmap(Width, Height))
                {
                    bmp.SetResolution(OriginalImage.HorizontalResolution, OriginalImage.VerticalResolution);
                    using (SD.Graphics Graphic = SD.Graphics.FromImage(bmp))
                    {
                        Graphic.SmoothingMode = SmoothingMode.AntiAlias;
                        Graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        Graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        Graphic.DrawImage(OriginalImage, new SD.Rectangle(0, 0, Width, Height), X, Y, Width, Height, SD.GraphicsUnit.Pixel);
                        MemoryStream ms = new MemoryStream();
                        bmp.Save(ms, OriginalImage.RawFormat);
                        return ms.GetBuffer();
                    }
                }
            }
        }
        catch (Exception Ex)
        {
            throw (Ex);
        }
    }
    protected void cmdSave_Click(object sender, EventArgs e)
    {
        if (!ckhAgree.Checked)
        {
            ClientMsg("You have to ensure this is your picture.");
            return;
        }

        SaveInDB();
    }
    public void ClientMsg(string MsgTxt)
    {
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "clientScript", "alert('" + MsgTxt + "')", true);
    }

    private static ImageCodecInfo GetEncoderInfo(String mimeType)
    {
        int j;
        ImageCodecInfo[] encoders;
        encoders = ImageCodecInfo.GetImageEncoders();
        for (j = 0; j < encoders.Length; ++j)
        {
            if (encoders[j].MimeType == mimeType)
                return encoders[j];
        }
        return null;
    }

    public void ResizeImage(Bitmap image, int maxWidth, int maxHeight, int quality, string filePath)
    {
        // Get the image's original width and height
        int originalWidth = image.Width;
        int originalHeight = image.Height;

        // To preserve the aspect ratio
        float ratioX = (float)maxWidth / (float)originalWidth;
        float ratioY = (float)maxHeight / (float)originalHeight;
        float ratio = Math.Min(ratioX, ratioY);

        // New width and height based on aspect ratio
        int newWidth = (int)(originalWidth * ratio);
        int newHeight = (int)(originalHeight * ratio);

        // Convert other formats (including CMYK) to RGB.
        Bitmap newImage = new Bitmap(newWidth, newHeight, PixelFormat.Format24bppRgb);

        // Draws the image in the specified size with quality mode set to HighQuality
        using (Graphics graphics = Graphics.FromImage(newImage))
        {
            graphics.CompositingQuality = CompositingQuality.HighQuality;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.SmoothingMode = SmoothingMode.HighQuality;
            graphics.DrawImage(image, 0, 0, newWidth, newHeight);
        }

        // Get an ImageCodecInfo object that represents the JPEG codec.
        ImageCodecInfo imageCodecInfo = GetEncoderInfo("image/jpeg");

        // Create an Encoder object for the Quality parameter.
        Encoder encoder = Encoder.Quality;

        // Create an EncoderParameters object. 
        EncoderParameters encoderParameters = new EncoderParameters(1);

        // Save the image as a JPEG file with quality level.
        EncoderParameter encoderParameter = new EncoderParameter(encoder, quality);
        encoderParameters.Param[0] = encoderParameter;
        newImage.Save(filePath, imageCodecInfo, encoderParameters);
    }
    public byte[] ResizeImage(Bitmap image, int maxWidth, int maxHeight, int quality)
    {
        // Get the image's original width and height
        int originalWidth = image.Width;
        int originalHeight = image.Height;

        // To preserve the aspect ratio
        float ratioX = (float)maxWidth / (float)originalWidth;
        float ratioY = (float)maxHeight / (float)originalHeight;
        float ratio = Math.Min(ratioX, ratioY);

        // New width and height based on aspect ratio
        int newWidth = (int)(originalWidth * ratio);
        int newHeight = (int)(originalHeight * ratio);

        // Convert other formats (including CMYK) to RGB.
        Bitmap newImage = new Bitmap(newWidth, newHeight, PixelFormat.Format24bppRgb);

        // Draws the image in the specified size with quality mode set to HighQuality
        using (Graphics graphics = Graphics.FromImage(newImage))
        {
            graphics.CompositingQuality = CompositingQuality.HighQuality;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.SmoothingMode = SmoothingMode.HighQuality;
            graphics.DrawImage(image, 0, 0, newWidth, newHeight);
        }

        // Get an ImageCodecInfo object that represents the JPEG codec.
        ImageCodecInfo imageCodecInfo = GetEncoderInfo("image/jpeg");

        // Create an Encoder object for the Quality parameter.
        Encoder encoder = Encoder.Quality;

        // Create an EncoderParameters object. 
        EncoderParameters encoderParameters = new EncoderParameters(1);

        // Save the image as a JPEG file with quality level.
        EncoderParameter encoderParameter = new EncoderParameter(encoder, quality);
        encoderParameters.Param[0] = encoderParameter;
        MemoryStream ms = new MemoryStream();
        newImage.Save(ms, imageCodecInfo, encoderParameters);

        return ms.ToArray();
    }
}