<%@ WebHandler Language="C#" Class="EmpImageHandler" %>

using System;
using System.Web;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

public class EmpImageHandler : IHttpAsyncHandler
{

    private HttpContext _context;
    private string EmpID = "";
    private string NoImageFile = "Images/NoFace.jpg";
    private string ID = "";
    private int Width = 0;
    private int Height = 0;

    public void ProcessRequest (HttpContext context)
    {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");        

        
    }

    public bool IsReusable {
        get {
            return true;
        }
    }

    public IAsyncResult BeginProcessRequest(HttpContext context, AsyncCallback cb, object state)
    {
        _context = context;

        HttpCachePolicy cachePolicy = context.Response.Cache;
        cachePolicy.SetCacheability(HttpCacheability.ServerAndPrivate);
        cachePolicy.VaryByParams["EMPID"] = true;
        cachePolicy.VaryByParams["W"] = true;
        cachePolicy.VaryByParams["H"] = true;
        cachePolicy.VaryByParams["ID"] = true;
        cachePolicy.VaryByParams["imgid"] = true;
        cachePolicy.SetOmitVaryStar(true);
        cachePolicy.SetExpires(DateTime.Now + TimeSpan.FromHours(12));
        cachePolicy.SetValidUntilExpires(true);

        // Get the employee ID from the query string
        EmpID = string.Format("{0}", context.Request["EMPID"]);
        if (EmpID.ToUpper().StartsWith("G")) NoImageFile = "Images/NoGroupFace.png";

        if (String.IsNullOrEmpty(EmpID))
        {
            _context.Response.Redirect(NoImageFile, true);
            _context.Response.End();
            return null;
        }

        //int id = 0;
        //bool ok = int.TryParse(_id, out id);
        //if (!ok) return null;

        try
        {
            Width = int.Parse(_context.Request.QueryString["W"].ToString());
        }
        catch (Exception) { }
        try
        {
            Height = int.Parse(_context.Request.QueryString["H"].ToString());
        }
        catch (Exception) { }
        try
        {
            ID = string.Format("{0}", _context.Request.QueryString["ID"]);
            if (ID == "0") ID = "";
        }
        catch (Exception) { }

        string conn = WebConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;
        // Select the image from the database
        SqlConnection _connection = new SqlConnection(conn);
        _connection.Open();
        string Query = "SELECT top 1 Picture FROM Emp_Pic with (nolock) WHERE EMPID=@EMPID";

        if (ID.Length > 0)
        {
            Query = "SELECT TOP 1 Picture FROM Tbl_Attachment.dbo.Emp_Pictures WHERE EMPID=@EmpID AND ID=@ID";
        }

        SqlCommand _command = new SqlCommand(Query, _connection);
        _command.Parameters.AddWithValue("@EMPID", EmpID);
        if (ID.Length > 0)
            _command.Parameters.AddWithValue("@ID", ID);

        return _command.BeginExecuteReader(cb, _command);
    }


    public void EndProcessRequest(IAsyncResult ar)
    {
        SqlCommand _command = (SqlCommand)ar.AsyncState;
        byte[] image = null;

        try
        {
            SqlDataReader reader = _command.EndExecuteReader(ar);
            if (reader != null && reader.HasRows)
            {
                // Get the image returned in the query
                reader.Read();
                try
                {
                    image = (byte[])reader[0];
                    // WRite the image into the HTTP response output stream
                    _context.Response.ContentType = "image/jpeg";
                    // strip off the 78 byte Ole header (a relic from old MS Access databases)

                    //Image Resize
                    Bitmap b = (Bitmap)Bitmap.FromStream(new MemoryStream(image));

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



                    _context.Response.BinaryWrite(ms.ToArray());
                }
                catch
                {
                    _context.Response.BinaryWrite(image);
                }
            }
            else
            {
                _context.Response.Redirect(NoImageFile, true);
                _context.Response.End();
            }
        }
        finally
        {
            if (_command.Connection != null)
                _command.Connection.Close();
        }
    }

}