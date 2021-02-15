using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using SD = System.Drawing;
using System.Drawing.Drawing2D;

public partial class EmpSign_Upload : System.Web.UI.Page
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
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        if (!TrustControl1.isRole("PA_UPLOAD"))
        {
            Response.Write("You have no permission to access this page.");
            Response.End();
        }

        LoginID = string.Format("{0}", Request.QueryString["ID"]);

        if (LoginID.Length > 0)
            LoadProfile(LoginID);
        else
        {
            Panel1.Visible = false;            
        }

        try
        {
            if (!Directory.Exists(Server.MapPath("Upload/"))) Directory.CreateDirectory(Server.MapPath("Upload/"));
            if (!IsPostBack)
                HidSessionID.Value = DateTime.Now.ToOADate().ToString().Replace(".", "");
            ImageName = HidSessionID.Value.ToString()
                + "_EmpSign1.jpg";
            UploadTempFile = Server.MapPath("Upload/" + ImageName);
            UploadCropFile = Server.MapPath("Upload/crop_" + ImageName);
            UploadPath = Server.MapPath("Upload/");
            //Response.Write(UploadTempFile);
        }
        catch (Exception) { }
        if (!IsPostBack)
        {
            Session["FILENAME"] = "";
        }
    }

    private void LoadProfile(string ID)
    {
        DataView DV = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (DV != null &&DV.Table.Rows.Count > 0)
        {
            lblEmpName.Text = string.Format("{0}", DV.Table.Rows[0]["EmpName"]);
            lblEmpID.Text = "EMP ID: " + ID;
            hypBack.NavigateUrl = string.Format("Profile.aspx?ID={0}", ID);
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
        string EmpID = string.Format("{0}",Request.QueryString["ID"]);

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

                    InsertData(ReadFile(UploadCropFile), true, FileName, Extension, EmpID);
                    
                    File.Delete(UploadCropFile);
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

    private void InsertData(byte[] content, bool IsInsertNew, string FileName, string Extension, string EmpID)
    {
        if (content.Length > 300 * 1024)
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
            objCom = new SqlCommand("sp_EMP_Sign_Insert", objConn);
            objCom.CommandType = CommandType.StoredProcedure;

            objCom.Parameters.Add("@InsertBy", SqlDbType.VarChar).Value = Session["EMPID"].ToString();
            objCom.Parameters.Add("@EMPID", SqlDbType.VarChar).Value = EmpID;
            objCom.Parameters.Add("@Sign1", SqlDbType.Image).Value = content;
            objCom.Parameters.Add("@IP", SqlDbType.VarChar).Value = TrustControl1.getIPAddress();            

            if (objConn.State == ConnectionState.Closed)
                objConn.Open();
            int i = objCom.ExecuteNonQuery();
            //AID = (int)objCom.Parameters["@RETURN_VALUE"].Value;
            objConn.Close();
            Panel1.Visible = false;
            pnlCropped.Visible = false;
            lblUploadStatus.Text = "Picture has been Changed.";
            HttpResponse.RemoveOutputCacheItem(string.Format("/EmpSign.aspx?EMPID={0}", EmpID));
            HttpResponse.RemoveOutputCacheItem(string.Format("/EmpSign.aspx?EMPID={0}&W=300", EmpID));

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
                CroppedImage.Save(SaveTo, CroppedImage.RawFormat);
                pnlCrop.Visible = false;
                pnlCropped.Visible = true;
                imgCropped.ImageUrl = imgCrop.ImageUrl = "Upload/crop_" + ImageName;
            }            
        }
        cmdSave.Visible = true;
        File.Delete(UploadTempFile);
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
            ClientMsg("You have to ensure this is picture is correct.");
            return;
        }

        SaveInDB();
    }
    public void ClientMsg(string MsgTxt)
    {
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "clientScript", "alert('" + MsgTxt + "')", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Delete();
        TrustControl1.ClientMsg("SIgnature Deleted.");
    }
}