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

public partial class AppVersion : System.Web.UI.Page
{
    TrustControl TrustControl1;


    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Application Version";

        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        //string focusScript = "document.getElementById('" + txtSearch.ClientID + "').focus();";
        //TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",200);");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            this.Title = string.Format("{0}", DataBinder.Eval(e.Row.DataItem, "ApplicationName"));
            string Version = string.Format("{0}", DataBinder.Eval(e.Row.DataItem, "Version"));
            if (Version != "")
                this.Title += " " + Version;
        }
    }
}
