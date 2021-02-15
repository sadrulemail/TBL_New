using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Notice : System.Web.UI.Page
{
    TrustControl TrustControl1;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Culture = "en-NZ";
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        if (!(TrustControl1.isRole("ADMIN") || TrustControl1.isRole("NOTICE")))
        {
            Response.Write("No Permission");
            Response.End();
        }

        GridView1.DataBind();

        this.Title = "Notice Board";
    }
    protected void txtFilter_TextChanged(object sender, EventArgs e)
    {
         
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        GridView1.DataBind();
    }
    protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        GridView1.DataBind();
    }
}
