using System;
using System.Web.UI;

public partial class GoodbyeMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Goodbye Messages";
        txtEmpID.Focus();
    }

    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            string MGID = DataBinder.Eval(DetailsView1.DataItem, "MGID").ToString();

            if (MGID.Length > 0)
                litComment.Text = string.Format("<iframe width='100%' height='520px' style='border:none;' src='//intraweb.tblbd.com/Chat/Comment.aspx?pageid=GOODBYE_{0}'></iframe>", MGID);
        }
        catch (Exception)
        {
            litComment.Text = "";
        }
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (GridView1.Rows.Count > 2)
                GridView1.SelectedIndex = 0;
    }

    protected void SqlDataSource1_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
    {
        lblStatus.Text = string.Format("Total: <b>{0:N0}</b>", e.AffectedRows);
    }
}