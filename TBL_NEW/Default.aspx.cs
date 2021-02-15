using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Apps : System.Web.UI.Page
{
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "intraweb";        

        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        //HttpCookie cookie = new HttpCookie("MainMenuType");
        //if (!String.IsNullOrEmpty(Request.QueryString["type"]))
        //{
        //    cookie.Value = Request.QueryString["type"].ToString();
        //    cookie.Expires = DateTime.Now.AddYears(1);
        //    Response.Cookies.Add(cookie);
        //}
        //else
        //{
        //    if (Request.Cookies["MainMenuType"] != null)
        //    {
        //        HttpCookie cookie1 = Request.Cookies.Get("MainMenuType");
        //        Response.Redirect("?type=" + cookie1.Value);
        //    }
        //}


        hypNoticeEdit.Visible = TrustControl1.isRole("ADMIN") || TrustControl1.isRole("NOTICE");
        if (Session["EMPID"] != null)
        {
            PanelLoggedin.Visible = true;
            Login1.Text = "<a href='Logout.aspx'>Log Out</a>";
        }  


    }
    private string SetMenu(string Item)
    {
        string RV = "MenuStyle";

        if (Request.QueryString["type"] == null)
            RV = "MenuStyle";

        return RV;
    }

    public string ToRelativeDate(DateTime DT)
    {
        return TrustControl1.ToRelativeDate(DT);
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    if (Request.QueryString["type"] == null || Request.QueryString["type"].Trim() == string.Empty)
        //    {
        //        if (DataBinder.Eval(e.Item.DataItem, "ID").ToString() == "1")
        //        {
        //            ((HyperLink)(e.Item.FindControl("Link"))).CssClass = "MenuStyleSelected";
        //        }
        //        else
        //        {
        //            ((HyperLink)(e.Item.FindControl("Link"))).CssClass = "MenuStyle";
        //        }
        //    }
        //    else if (DataBinder.Eval(e.Item.DataItem, "ID").ToString() == Request.QueryString["type"].ToString())
        //    {
        //        //((HyperLink)(e.Item.FindControl("Link"))).CssClass = "MenuStyleSelected";
        //    }
        //    else
        //    {
        //        //((HyperLink)(e.Item.FindControl("Link"))).CssClass = "MenuStyle";
        //    }
            //if (DataBinder.Eval(e.Item.DataItem, "ID").ToString() == "1")
            //{
            //    ((HyperLink)(e.Item.FindControl("Link"))).NavigateUrl = "~";
            //}
            
        //}
    }
    
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        GridViewNotice.DataBind();
    }
    protected void SqlDataSourceNotice_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        PanelNotice.Visible = e.AffectedRows > 0;
    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            SqlDataSource s = (SqlDataSource)e.Item.FindControl("SqlDataSource_Applications0");
            s.SelectParameters["Type"].DefaultValue = DataBinder.Eval(e.Item.DataItem, "ID").ToString();
        }
    }
}
