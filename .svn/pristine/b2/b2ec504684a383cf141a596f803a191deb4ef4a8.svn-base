using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class GoogleMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {           
            string branchID = string.Format("{0}", Request.QueryString["branch"]);
            string atmID = string.Format("{0}", Request.QueryString["atm"]);
            
            if (branchID == "") branchID = "0";
            if (atmID == "") atmID = "0";

            DataTable dt = this.GetData("EXEC GoogleMap " + branchID + "," + atmID);// where BranchID=" + branchID + "");
            rptMarkers.DataSource = dt;
            rptMarkers.DataBind();
        }
    }

    private DataTable GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;

                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    return dt;
                }
            }
        }
    }

    protected string getDetails(object val)
    {
        string RetVal = string.Format("{0}", val);
        string[] SS = RetVal.Split('\n');

        RetVal = "";
        foreach (string S in SS)
        {
            if (S.Trim().EndsWith(","))
                RetVal += S.Trim() + " ";
            else
                RetVal += S.Trim() + ", ";
        }

        if (RetVal.EndsWith(", "))
            RetVal = RetVal.Substring(0, RetVal.Length - 2);
        return RetVal;
    }
}
