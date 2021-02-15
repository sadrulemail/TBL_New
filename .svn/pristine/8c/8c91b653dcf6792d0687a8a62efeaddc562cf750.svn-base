using System;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class LifeEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "Life Event";

        if (!IsPostBack)
        {
            string EventID = string.Format("{0}", Request.QueryString["eventid"]);
            if (EventID.Length == 0)
            {
                DetailsView1.ChangeMode(DetailsViewMode.Insert);
                //Panel1.Visible = false;
            }
        }
    }


    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        if (DetailsView1.CurrentMode == DetailsViewMode.ReadOnly)
        {
            hidSex.Value = string.Format("{0}", DataBinder.Eval(DetailsView1.DataItem, "Gender"));
            string EventID = string.Format("{0}", DataBinder.Eval(DetailsView1.DataItem, "EventID"));
            if (EventID.Length > 0)
                litCommentBox.Text = string.Format("<iframe width='100%' height='520px' style='border:none;' src='//intraweb.tblbd.com/Chat/Comment.aspx?pageid=EVENT_{0}'></iframe>", EventID);
        }
    }

    protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //litCommentBox.Visible = e.AffectedRows == 1;
    }

    protected void cmdSave_Click(object sender, EventArgs e)
    {
       

    }
}