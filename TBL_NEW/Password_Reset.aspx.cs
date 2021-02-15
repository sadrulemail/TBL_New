using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Password_Reset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Password Recovery";

        //((Panel)(this.Page.Master.FindControl("PanelBeforeLogin"))).Visible = false;

        if (String.IsNullOrEmpty((Request.QueryString["id"])) || String.IsNullOrEmpty((Request.QueryString["hash"])) || String.IsNullOrEmpty((Request.QueryString["email"])))
        {
            Response.Redirect("~/Password.aspx", true);
            return;
        }
        
        try
        {
            string oConnString = System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;
            SqlConnection oConn = new SqlConnection(oConnString);
            SqlCommand oComm = new SqlCommand("ChangePassword_Hash", oConn);
            oComm.CommandType = CommandType.StoredProcedure;
            if (oConn.State == ConnectionState.Closed)
                oConn.Open();
            oComm.Parameters.Add("@param_EmpID", SqlDbType.VarChar).Value = Request.QueryString["ID"].ToString();
            oComm.Parameters.Add("@param_ResetHash", SqlDbType.VarChar).Value = Request.QueryString["HASH"].ToString();
            oComm.Parameters.Add("@Email", SqlDbType.VarChar).Value = Request.QueryString["email"].ToString();
            oComm.Parameters.Add("@IP", SqlDbType.VarChar).Value = getIPAddress();
			oComm.Parameters.Add("@ResetType", SqlDbType.VarChar).Value = string.Format("{0}", Request.QueryString["resettype"]);

            SqlDataReader oR = oComm.ExecuteReader();
            while (oR.Read())
            {
                lblStatus.Text = oR["OutMsg"].ToString();
            }               
            
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }        
    }

    public string getIPAddress()
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
}
