using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

public partial class EmpSign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.QueryString["EMPID"]))
        {
            try
            {
                HttpCachePolicy cachePolicy = Response.Cache;
                cachePolicy.SetCacheability(HttpCacheability.ServerAndPrivate);
                cachePolicy.VaryByParams["EMPID"] = true;
                cachePolicy.VaryByParams["W"] = true;
                cachePolicy.VaryByParams["H"] = true;
                cachePolicy.VaryByParams["FileKey"] = true;
                cachePolicy.SetOmitVaryStar(true);
                cachePolicy.SetExpires(DateTime.Now + TimeSpan.FromMinutes(10));
                cachePolicy.SetValidUntilExpires(true);
                
                //cachePolicy.SetLastModified(new DateTime(2012, 01, 01, 12, 0, 0));
                
                
                string EmpID = Request.QueryString["EMPID"];
                string TableName = "EMP_Sign";
                string FieldName = Request.QueryString["field"];
                string FileKey = Request.QueryString["FileKey"];

                int Width = 0; 
                int Height = 0;

               
                

                try
                {
                    Width = int.Parse(Request.QueryString["W"].ToString());
                }
                catch (Exception) { }
                try
                {
                    Height = int.Parse(Request.QueryString["H"].ToString());
                }
                catch (Exception) { }

                string Query = "SELECT TOP 1 [" + FieldName + "] FROM TblUserDB.dbo." + TableName;
                Query += " WHERE EMPID='" + EmpID + "' AND FileKey = '" + FileKey + "'";
                byte[] logo = (byte[])fetchScalar(Query, Width, Height);
                Response.ContentType = "Image/JPEG";
                Response.BinaryWrite(logo);                
            }
            catch (Exception)
            {                
                Response.ContentType = "Image/JPEG";
                try
                {
                    Response.BinaryWrite(new byte[] { });
                }
                catch (Exception)
                {
                    try
                    {
                        string NoImageFile = ConfigurationManager.AppSettings["NoSign"].ToString();
                        byte[] noimage = File.ReadAllBytes(NoImageFile);
                        Response.BinaryWrite(noimage);
                    }
                    catch (Exception) { }
                }
            }
        }
    }

    object fetchScalar(string query, int Width, int Height)
    {
        try
        {
            // connect to data source
            SqlConnection myConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString);

            // initialize command object with query
            SqlCommand myCmd = new SqlCommand(query, myConn);

            // open connection
            if (myConn.State == ConnectionState.Closed)
                myConn.Open();

            // get scalar
            object scalar = myCmd.ExecuteScalar();

            // close connection
            myConn.Close();

            Bitmap b = (Bitmap)Bitmap.FromStream(new MemoryStream((byte[])scalar)); 

            Bitmap output;
            if (Width == 0 && Height == 0)
                output = b;
            else if (Height == 0)
            {
                double newHeight = ((double)Width * (double)b.Height / (double)b.Width);
                output = new Bitmap(b, new Size(Width, (int)newHeight));
            }
            else if (Width == 0)
            {
                double newWidth = ((double)Height * (double)b.Width / (double)b.Height);
                output = new Bitmap(b, new Size((int)newWidth, Height));
            }
            else
                output = new Bitmap(b, new Size(Width, Height));

            MemoryStream ms = new MemoryStream();
            output.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms.ToArray();
        }
        catch (Exception)
        {
            return null;
        }        
    }
}