using System;
using System.Web.UI;

public partial class Emp_New : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "New Employees";
    }

    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            string EMPID = DataBinder.Eval(DetailsView1.DataItem, "EMPID").ToString();

            if (EMPID.Length > 0)
                litComment.Text = string.Format("<iframe width='100%' height='520px' style='border:none;' src='//intraweb.tblbd.com/Chat/Comment.aspx?pageid=WELCOME_{0}'></iframe>", EMPID);
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
            {
                GridView1.SelectedIndex = 0;
                string EMPID = GridView1.SelectedValue.ToString();
                //LoadComment(EMPID);
            }
    }

    protected void SqlDataSource1_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
    {
        lblStatus.Text = string.Format("Total: <b>{0:N0}</b>", e.AffectedRows);
    }
   
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        litComment.Text = "";

    }
}