using System;
using System.Web.UI;

public partial class TblMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {        
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        // This is necessary because Safari and Chrome browsers don't display the Menu control correctly.
        // All webpages displaying an ASP.NET menu control must inherit this class.
        if (Request.ServerVariables["http_user_agent"].IndexOf("Safari", StringComparison.CurrentCultureIgnoreCase) != -1)
            Page.ClientTarget = "uplevel";
    }

    protected override void AddedControl(Control control, int index)
    {
        // This is necessary because Safari and Chrome browsers don't display the Menu control correctly.
        // Add this to the code in your master page.
        if (Request.ServerVariables["http_user_agent"].IndexOf("Safari", StringComparison.CurrentCultureIgnoreCase) != -1)
            this.Page.ClientTarget = "uplevel";
        base.AddedControl(control, index);
    }
}
