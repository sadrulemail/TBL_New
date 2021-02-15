using System;
using System.Web.UI.WebControls;

public partial class LifeEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Employee Life Events";
        txtEmpID.Focus();
    }

    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        Literal1.Text = string.Format("Total: <b>{0}</b>", e.AffectedRows);
    }
}