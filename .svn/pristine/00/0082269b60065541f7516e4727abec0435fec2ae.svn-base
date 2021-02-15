<%@ WebHandler Language="C#" Class="EmpOnlineStatus" %>

using System;
using System.Web;

public class EmpOnlineStatus : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string Empid = string.Format("{0}", context.Request.QueryString["empid"]);
        string output = "";
        DateTime dt = DateTime.Now;

        System.Configuration.AppSettingsReader oAppRead = new System.Configuration.AppSettingsReader();
        string oConnString = System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;

        using(System.Data.SqlClient.SqlConnection oConn = new System.Data.SqlClient.SqlConnection(oConnString))
        {
            if (oConn.State == System.Data.ConnectionState.Closed) oConn.Open();

            using(System.Data.SqlClient.SqlCommand oCommand = new System.Data.SqlClient.SqlCommand("SELECT [LastOnline] FROM [dbo].[Emp_Online_Status] with (nolock) WHERE EmpID = @EmpID", oConn))
            {
                oCommand.Parameters.AddWithValue("@EmpID", Empid.Replace(";", ""));

                if (oConn.State == System.Data.ConnectionState.Closed) oConn.Open();

                using(System.Data.SqlClient.SqlDataReader oReader = oCommand.ExecuteReader())
                {
                    while (oReader.Read())
                    {
                        dt = (DateTime)oReader["LastOnline"];
                    }

                    if (!oReader.HasRows)
                    {
                        oConn.Close();
                        output = "<span style='color:red' title=''>Never logged in</span>";
                        goto LabelOutPut;
                    }
                }
            }
            oConn.Close();
        }

        if (dt.AddSeconds(60) < DateTime.Now)
            output = "<span style='color:gray' title='intra Message last logged in at " + Common.ToRecentDateTime(dt) + "'>Offline " + ToStatusDate(dt) + "</span>";
        else
            output = "<span style='color:green' title='Available in intra Message'>Available</span>";

    LabelOutPut:
        context.Response.Write(output);
    }

    private string ToStatusDate(DateTime input)
    {
        TimeSpan difference = (DateTime.Now - input);
        double millisecondsDifference = difference.TotalMilliseconds;

        double seconds = millisecondsDifference / 1000;
        double minutes = seconds / 60;
        double hours = minutes / 60;
        double days = hours / 24;
        double years = days / 365;

        string relativeDate = string.Empty;

        if ((seconds < 45))
        {
            relativeDate = "now";
        }
        else if ((seconds < 120))
        {
            relativeDate = "1 min";
        }
        else if ((minutes < 60))
        {
            relativeDate = string.Format("{0} mins", Math.Round(minutes));
        }
        else if ((minutes < 65))
        {
            relativeDate = "1 hour";
        }
        else if ((hours < 24))
        {
            relativeDate = string.Format("{0} hour", Math.Round(hours));
            if (Math.Round(hours) > 1)
                relativeDate += "s";
            
            int mins = (int)Math.Round(minutes) % (int)Math.Round(hours);
            if (mins == 1)
                relativeDate += string.Format(" {0} min", mins);
            else if (mins > 1)
                relativeDate += string.Format(" {0} mins", mins);
        }
        else if ((hours < 48))
        {
            relativeDate = "1 day";
        }
        else if ((days < 30))
        {
            relativeDate = string.Format("{0} days", Math.Floor(days));
        }
        else if ((days < 60))
        {
            relativeDate = "1 month";
        }
        else if ((days < 365))
        {
            relativeDate = string.Format("{0} months", Math.Floor(days / 30));
        }
        else if ((years < 2))
        {
            relativeDate = "1 year";
        }
        else
        {
            relativeDate = string.Format("{0} years", Math.Floor(years));
        }
        return relativeDate;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}