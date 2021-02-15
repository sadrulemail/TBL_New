using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;

public partial class MasterPage : System.Web.UI.MasterPage
{
    string UrlPrefix = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string LoginID = string.Format("{0}", Session["EMPID"]);
        LoginCheck(LoginID);
        HitCounterUp();
        //System.Web.HttpBrowserCapabilities browser = Request.Browser;
        //lblBrowserInfo.Text = Request.Browser.Browsers.;
        lblIPAddress.Text = TrustControl1.getIPAddress();

        UrlPrefix = Request.Url.OriginalString.Replace(Request.Url.PathAndQuery, "");
        UrlPrefix += Request.Url.Segments[0];
        
    }

    private void LoginCheck(string LoginID)
    {
        PanelAfterLogin.Visible = !string.IsNullOrEmpty(LoginID);
        PanelBeforeLogin.Visible = string.IsNullOrEmpty(LoginID);
        int ApplicationID = int.Parse(System.Configuration.ConfigurationManager.AppSettings["ApplicationID"].ToString().Trim());

        if (PanelAfterLogin.Visible)
        {
            hypImgProfile.ImageUrl = string.Format("EmpImage.aspx?EMPID={0}&H=100&imgid={1}", LoginID, Session["EMPIMGID"]);
            hypImgProfile.ToolTip = string.Format("Login ID: {0}", LoginID);
            TrustControl1.LoadEmpToSession(false);
            lblEmpName.Text = Session["EMPNAME"].ToString();
            lblEmpName.NavigateUrl = string.Format("Profile.aspx?ID={0}", LoginID);
            hypImgProfile.NavigateUrl = string.Format("Profile.aspx?ID={0}", LoginID);

            lblRoles.Text = string.Format("{0}", TrustControl1.getUserRoles(false));

            //string focusScript = "try{document.getElementById('" + txtSearch.ClientID + "').focus();}catch(err){}";
            //TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",300);");
        }
        else
        {
            txtUsername.Focus();
            //string focusScript = "try{document.getElementById('" + txtUsername.ClientID + "').focus();}catch(err){}";
            //TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",100);");
        }

        //string PageTitle = System.Configuration.ConfigurationSettings.AppSettings["AppTitle"].ToString();
        //string InnerTitle = string.Format("{0}", this.Page.Title);
        //if (InnerTitle.Length > 0) InnerTitle += " - ";
        //try
        //{
        //    this.Page.Title = string.Format("{0}{1}", InnerTitle, PageTitle);
        //}
        //catch (Exception) { }  
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
    protected void MainMenu_MenuItemDataBound(object sender, MenuEventArgs e)
    {
        string[] Roles = lblRoles.Text.Split(',');
        SiteMapNode node = e.Item.DataItem as SiteMapNode;

        if (e.Item.Text == "")
        {
            RemoveMenuNode(e);
            return;
        }

        if (!string.IsNullOrEmpty(node["target"]))
            e.Item.Target = node["target"];

        //Check Branch
        if (!string.IsNullOrEmpty(node["branch"]))
        {
            string[] branches = node["branch"].ToString().Split(',');
            for (int i = 0; i < branches.Length; i++)
                if (branches[i] == Session["BRANCHID"].ToString()
                    || branches[i] == "*") return;
            RemoveMenuNode(e);
            return;
        }



        //Check Role
        for (int i = 0; i < node.Roles.Count; i++)
            foreach (string Role in Roles)
                if (node.Roles[i].ToString() == Role
                    || node.Roles[0].ToString() == "*"
                    )
                    return;
        RemoveMenuNode(e); 
    }

    private void RemoveMenuNode(MenuEventArgs e)
    {
        try
        {
            if (e.Item.Parent == null)
                MainMenu.Items.Remove(e.Item);
            else
                e.Item.Parent.ChildItems.Remove(e.Item);
        }
        catch (Exception) { }
    }

    protected void TreeView1_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
    {
        //string[] Roles = Session["ROLES"].ToString().Split(',');

        ////System.Web.UI.WebControls.TreeView tree = (System.Web.UI.WebControls.TreeView)sender;
        //SiteMapNode mapNode = (SiteMapNode)e.Node.DataItem;

        //if (mapNode.Roles.Count > 0)
        //{
        //    if (mapNode.Title == "Site Admin")
        //    { }
        //    for (int i = 0; i < mapNode.Roles.Count; i++)
        //        foreach (string Role in Roles)
        //            if (mapNode.Roles[i].ToString() == Role
        //                || mapNode.Roles[0].ToString() == "*")
        //                return;
        //    RemoveTreeNode(e);
        //}
        //else
        //    RemoveTreeNode(e);   
    }

    private static void RemoveTreeNode(TreeNodeEventArgs e)
    {
        System.Web.UI.WebControls.TreeNode parent = e.Node.Parent;
        if (parent != null)
        {
            parent.ChildNodes.Remove(e.Node);
        }
    }

    protected void cmdLogin_Click(object sender, EventArgs e)
    {
        Session["EMPID"] = null;
        Session["DESIGID"] = null;
        Session["DEPTID"] = null;
        Session["BRANCHID"] = null;

        Session["APPID_ROLE"] = string.Empty;

        LoginTo(txtUsername.Text.Trim(), txtPassword.Text, false);
    }

    private bool LoginTo(string EmpID, string Password, bool UsingCookie)
    {
        int ApplicationID = int.Parse(System.Configuration.ConfigurationManager.AppSettings["ApplicationID"].ToString().Trim());

        bool LoginSuccess = false;
        if (EmpID == "" || Password == "")
        {
            Response.Redirect(UrlPrefix + "Login.aspx?Prev=" + Request.Url.ToString(), true);
        }
        else
        {
            try
            {
                SqlConnection oConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString);
                SqlCommand oCommand = new SqlCommand("execute [usp_getEmp] '" + EmpID + "', NULL", oConn);

                if (oConn.State == ConnectionState.Closed)
                    oConn.Open();

                SqlDataReader oReader = oCommand.ExecuteReader();

                string Role = string.Empty;
                while (oReader.Read())
                {
                    string PassHex = BitConverter.ToString(((byte[])(oReader["PassHex"])));
                    if (PassHex == EncodePassword(Password) || PassHex == Password)
                    {                        
                        if (oReader["ServiceStatus"].ToString() != "1")
                        {
                            ClientMsg("Employee is not in service.");
                            return false;
                        }
                        Session["EMPID"] = oReader["EMPID"].ToString();
                        LoginSuccess = true;
                    }
                }
                oConn.Close();

            }
            catch (Exception ex)
            {
                ClientMsg(ex.Message);
            }
            if (LoginSuccess)
            {
                try
                {
                    SqlConnection oConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString);
                    SqlCommand oCommandLoginLog = new SqlCommand("usp_LoginLog_Insert", oConn);
                    oCommandLoginLog.CommandType = CommandType.StoredProcedure;
                    oCommandLoginLog.Parameters.Add("@param_EmpID", SqlDbType.VarChar).Value = EmpID;
                    oCommandLoginLog.Parameters.Add("@param_AppID", SqlDbType.Int).Value = ApplicationID;
                    string Client_IP_Address = getIPAddress();
                    oCommandLoginLog.Parameters.Add("@param_IP", SqlDbType.Text).Value = Client_IP_Address;
                    oCommandLoginLog.Parameters.Add("@Browser", SqlDbType.VarChar).Value = Request.UserAgent.ToString();
                    oCommandLoginLog.Parameters.Add("@UsingCookie", SqlDbType.Bit).Value = UsingCookie;

                    if (oConn.State == ConnectionState.Closed)
                        oConn.Open();
                    oCommandLoginLog.ExecuteNonQuery();

                    if (Request.QueryString["Prev"] != null)
                        Response.Redirect(Request.QueryString["Prev"], true);
                    else
                    {
                        TrustControl1.getUserRoles(false);
                        LoginCheck(EmpID);
                        //return true;
                        Response.Redirect(Request.RawUrl, true);
                        //Response.Redirect("Default.aspx", true);
                    }
                }
                catch (Exception ex)
                {
                    ClientMsg("Error2: " + ex.Message);
                }
            }
        }
        Response.Redirect(UrlPrefix + "Login.aspx?Prev=" + Request.Url.ToString(), true);
        return false;
    }

    private string getIPAddress()
    {
        string Client_IP_Address = string.Empty;
        try
        {
            Client_IP_Address = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        catch (Exception)
        {
            try
            {
                Client_IP_Address = HttpContext.Current.Request.UserHostAddress;
            }
            catch (Exception)
            {
                Client_IP_Address = Request.ServerVariables["LOCAL_ADDR"].ToString();
            }
        }
        return Client_IP_Address;
    }

    private void ClientMsg(string MsgTxt)
    {
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "clientScript", "jAlert('" + MsgTxt + "')", true);
    }

    public string EncodePassword(string OriginalPassword)
    {
        Byte[] originalBytes;
        Byte[] encodedBytes;
        MD5 md5;
        md5 = new MD5CryptoServiceProvider();
        originalBytes = ASCIIEncoding.Default.GetBytes(OriginalPassword);
        encodedBytes = md5.ComputeHash(originalBytes);
        return BitConverter.ToString(encodedBytes);
    }

    private void HitCounterUp()
    {
        try
        {
            int ApplicationID = int.Parse(System.Configuration.ConfigurationManager.AppSettings["ApplicationID"].ToString().Trim());
            string oConnString = System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;
            System.Data.SqlClient.SqlConnection oConn = new System.Data.SqlClient.SqlConnection(oConnString);
            System.Data.SqlClient.SqlCommand oComm = new System.Data.SqlClient.SqlCommand("usp_Hit", oConn);
            oComm.CommandType = System.Data.CommandType.StoredProcedure;

            oComm.Parameters.Add("@AppID", System.Data.SqlDbType.Int).Value = ApplicationID;
            if (oConn.State == System.Data.ConnectionState.Closed)
                oConn.Open();
            oComm.ExecuteNonQuery();
        }
        catch (Exception) { }
    }
}