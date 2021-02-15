using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = new HttpCookie("MainMenuType");
        if (!String.IsNullOrEmpty(Request.QueryString["type"]))
        {
            cookie.Value = Request.QueryString["type"].ToString();
            cookie.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(cookie);
        }
        else
        {
            if (Request.Cookies["MainMenuType"] != null)
            {
                HttpCookie cookie1 = Request.Cookies.Get("MainMenuType");
                Response.Redirect("?type=" + cookie1.Value);
            }
        }     
    }
    private string SetMenu(string Item)
    {
        string RV = "MenuStyle";

        if (Request.QueryString["type"] == null)
            RV = "MenuStyle";

        return RV;
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if (Request.QueryString["type"] == null || Request.QueryString["type"].Trim() == string.Empty)
            {
                if (DataBinder.Eval(e.Item.DataItem, "ID").ToString() == "1")
                {
                    ((HyperLink)(e.Item.FindControl("Link"))).CssClass = "MenuStyleSelected";
                }
                else
                {
                    ((HyperLink)(e.Item.FindControl("Link"))).CssClass = "MenuStyle";
                }
            }
            else if (DataBinder.Eval(e.Item.DataItem, "ID").ToString() == Request.QueryString["type"].ToString())
            {
                ((HyperLink)(e.Item.FindControl("Link"))).CssClass = "MenuStyleSelected";
            }
            else
            {
                ((HyperLink)(e.Item.FindControl("Link"))).CssClass = "MenuStyle";
            }
            //if (DataBinder.Eval(e.Item.DataItem, "ID").ToString() == "1")
            //{
            //    ((HyperLink)(e.Item.FindControl("Link"))).NavigateUrl = "~";
            //}
        }
    }

    
}
