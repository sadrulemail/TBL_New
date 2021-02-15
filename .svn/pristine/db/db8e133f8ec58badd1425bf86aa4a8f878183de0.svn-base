using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Status : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Employee Status";
    }

    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatus.Text = string.Format("Total: <b>{0:N0}</b>", e.AffectedRows);
    }

    protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatus1.Text = string.Format("Total: <b>{0:N0}</b>", e.AffectedRows);
    }
}