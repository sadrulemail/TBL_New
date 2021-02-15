using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostalCode : System.Web.UI.Page
{
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Postal Codes";
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        string focusScript = "document.getElementById('" + txtFilter.ClientID + "').focus();";
        TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",200);");
    }
    protected void cmdFilter_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
}
