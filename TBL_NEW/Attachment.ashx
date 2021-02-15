<%@ WebHandler Language="C#" Class="Attachment" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Web.SessionState;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Data;
using System.Web.UI;


public class Attachment : IHttpHandler, IReadOnlySessionState
{
    public void ProcessRequest(HttpContext context)
    {
        string AID = "";
        string KEY = "";
        string EMPID = "";

        try
        {
            AID = string.Format("{0}", context.Request.QueryString["aid"]);
            KEY = string.Format("{0}", context.Request.QueryString["key"]);
            EMPID = context.Session["EMPID"].ToString();



            //TimeSpan refresh = new TimeSpan(0, 0, 60);
            //HttpContext.Current.Response.Cache.SetExpires(DateTime.Now.Add(refresh));
            //HttpContext.Current.Response.Cache.SetMaxAge(refresh);
            //HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.Server);
            //HttpContext.Current.Response.Cache.SetValidUntilExpires(true);
            //HttpContext.Current.Response.Cache.VaryByParams["aid"] = true;
            //HttpContext.Current.Response.Cache.VaryByParams["key"] = true;



            DataRow DR = (DataRow)context.Cache[AID + "_" + KEY];
            if (DR == null)
            {
                DataTable Files;
                SqlConnection.ClearAllPools();
                using (SqlConnection conn = new SqlConnection())
                {
                    string Query = "";
                    Query = string.Format(string.Format("EXEC sp_Attachments_Download '{0}', '{1}', '{2}', '{3}'"
                            , AID, KEY, EMPID, getIPAddress()
                        ));

                    conn.ConnectionString = ConfigurationManager
                            .ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;
                    if (conn.State == ConnectionState.Closed) conn.Open();

                    using (SqlCommand cmd = new SqlCommand(Query, conn))
                    {
                        SqlDataAdapter ad = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        ad.Fill(ds);

                        Files = ds.Tables[0];
                    }
                }

                if (Files.Rows.Count > 0)
                {
                    DR = Files.Rows[0];
                    int CacheTime = 300;
                    try
                    {
                        CacheTime = 300; //int.Parse(Common.getValueOfKey("AttachmentDownloadCacheSecond"));
                    }
                    catch (Exception) { }
                    context.Cache.Add(AID + "_" + KEY
                        , DR
                        , null
                        , DateTime.Now.AddSeconds(CacheTime)
                        , System.Web.Caching.Cache.NoSlidingExpiration
                        , System.Web.Caching.CacheItemPriority.NotRemovable
                        , null);
                    WriteRow(context, DR);

                    //context.Response.Flush();
                    //context.Response.End();

                    //OutputCachedPage page = new OutputCachedPage(new OutputCacheParameters
                    //{
                    //    Duration = 60,
                    //    Location = OutputCacheLocation.Server,
                    //    VaryByParam = "aid;key"
                    //});
                    //page.ProcessRequest(HttpContext.Current);
                    //context.Response.Write(DateTime.Now);
                }
                else
                {
                    //WriteToContex(context, "Not Found.");
                    throw new HttpException(404, "Not Found");
                }
            }
            else
            {
                Update_Attachments_Log(AID, EMPID);
                WriteRow(context, DR);
                return;
            }
        }
        catch (Exception)
        {
            //context.Response.StatusCode = 404;
            throw new HttpException(404, "Not Found");
        } 
    }

    private void WriteRow(HttpContext context, DataRow DR)
    {        
        byte[] output = (byte[])(DR["Attachment"]);
        string FileName = string.Format("{0}", DR["FileNameToSave"]);

        //if ((bool)DR["Compressed"])
            output = Common.Decompress(output);

        context.Response.AddHeader("Content-Disposition", "inline;filename=\"" + FileName + "\"");
        context.Response.AddHeader("Content-Length", output.Length.ToString());
        context.Response.ContentType = DR["ContentType"].ToString();
        context.Response.BinaryWrite(output);
    }
 
    public bool IsReusable 
    {
        get 
        {
            return false;
        }
    }

    protected void WriteToContex(HttpContext context, string text)
    {
        context.Response.Clear();
        context.Response.Write(text);
        context.Response.End();
    }
    
    protected void Update_Attachments_Log(string AID, string EMPID)
    {
        //using (SqlConnection conn = new SqlConnection())
        //{
        //    string Query = "";
        //    Query = string.Format(string.Format("EXEC sp_Attachments_Log_Insert '{0}', '{1}', '{2}', '{3}'"
        //            , AID, EMPID, "true", getIPAddress()
        //        ));

        //    conn.ConnectionString = ConfigurationManager
        //            .ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;
        //    if (conn.State == ConnectionState.Closed) conn.Open();

        //    using (SqlCommand cmd = new SqlCommand(Query, conn))
        //    {
        //        cmd.ExecuteNonQuery();
        //    }
        //}
    }

    //private sealed class OutputCachedPage : Page
    //{
    //    private OutputCacheParameters _cacheSettings;

    //    public OutputCachedPage(OutputCacheParameters cacheSettings)
    //    {
    //        // Tracing requires Page IDs to be unique.
    //        ID = Guid.NewGuid().ToString();
    //        _cacheSettings = cacheSettings;
    //    }

    //    protected override void FrameworkInitialize()
    //    {
    //        File.AppendAllText("C:\\T.text", "s");
    //        base.FrameworkInitialize();
    //        InitOutputCache(_cacheSettings);
    //    }
    //}

    private string getIPAddress()
    {
        string Client_IP_Address = string.Empty;
        try
        {
            Client_IP_Address = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        catch (Exception)
        {
            try
            {
                Client_IP_Address = HttpContext.Current.Request.UserHostAddress;
            }
            catch (Exception)
            {
                Client_IP_Address = HttpContext.Current.Request.ServerVariables["LOCAL_ADDR"].ToString();
            }
        }
        return Client_IP_Address.Trim();
    }
}