using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Threading.Tasks;

public partial class EmpImage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        // RegisterAsyncTask(new PageAsyncTask(PageLoadAsync));
        Response.Redirect("EmpImage.ashx" + Request.Url.Query, false);
        Response.End();


        if (!String.IsNullOrEmpty(Request.QueryString["EMPID"]))
        {
            string EmpID = "";
            string NoImageFile = "Images/NoFace.jpg";
            string ID = "";

            try
            {
                HttpCachePolicy cachePolicy = Response.Cache;
                cachePolicy.SetCacheability(HttpCacheability.ServerAndPrivate);
                cachePolicy.VaryByParams["EMPID"] = true;
                cachePolicy.VaryByParams["W"] = true;
                cachePolicy.VaryByParams["H"] = true;
                cachePolicy.VaryByParams["ID"] = true;
                cachePolicy.VaryByParams["imgid"] = true;
                cachePolicy.SetOmitVaryStar(true);
                cachePolicy.SetExpires(DateTime.Now + TimeSpan.FromHours(12));
                cachePolicy.SetValidUntilExpires(true);

                //cachePolicy.SetLastModified(new DateTime(2012, 01, 01, 12, 0, 0));

                


                EmpID = string.Format("{0}", Request.QueryString["EMPID"]);
                if (EmpID == "")
                {
                    Response.Redirect(NoImageFile, true);
                    Response.End();
                    return;
                }


                string TableName = "Emp_Pic";

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
                try
                {
                    ID = string.Format("{0}", Request.QueryString["ID"]);
                }
                catch (Exception) { }

                string Query = "SELECT TOP 1 Picture FROM TblUserDB.dbo." + TableName;
                Query += " WHERE EMPID='" + EmpID + "'";

                if (ID.Length > 0) Query = "SELECT TOP 1 Picture FROM Tbl_Attachment.dbo.Emp_Pictures WHERE EMPID='" + EmpID + "' AND ID='" + ID + "'";

                byte[] logo = (byte[])fetchScalar(Query, Width, Height);
                Response.ContentType = "Image/JPEG";
                Response.BinaryWrite(logo);                
            }
            catch (Exception)
            {                
                Response.ContentType = "Image/JPEG";
                
                //string NoImageFile = ConfigurationManager.AppSettings["NoImageFile"].ToString();
                //byte[] noimage = File.ReadAllBytes(NoImageFile);
                //Response.BinaryWrite(noimage);

                //Response.ContentType = "Image/JPEG";
                        
                        
                if (EmpID.ToUpper().StartsWith("G"))
                {
                    NoImageFile = "Images/NoGroupFace.png";
                }
                Response.Redirect(NoImageFile, true);
                    
                
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