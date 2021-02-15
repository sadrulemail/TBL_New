using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor : System.Web.UI.Page
{
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (TrustControl1.isRole("ADMIN") || TrustControl1.isRole("EDITOR"))
            {
                DetailsView1.Rows[DetailsView1.Rows.Count - 1].Visible = true;
                //TrustControl1.ClientMsg(Session["ROLES"].ToString());
                return;
            }
        }
        catch (Exception) { }
    }
}