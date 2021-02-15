using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Password Recovery";

        //((Panel)(Master.FindControl("PanelBeforeLogin"))).Visible = false;
    }
    protected void cmdReset_Click(object sender, EventArgs e)
    {
        Reset("R");
    }

    protected void cmdUnlock_Click(object sender, EventArgs e)
    {
        Reset("U");
    }

    private void Reset(string ResetType)
    {
        if (txtID.Text.Trim() == string.Empty)
        {
            lblStatus.Text = "Please enter Login ID.";
            return;
        }
        if (txtEmail.Text.Trim() == string.Empty)
        {
            lblStatus.Text = "Please enter your Email Address.";
            return;
        }

        string oConnString = System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;
        //string Q = "SELECT count(*) as ItemFound FROM ViewEMP WHERE EMPID = '" + txtID.Text.Trim() + "' AND Email = '" + txtEmail.Text.Trim() + "'";        
        SqlConnection oConn = new SqlConnection(oConnString);
        //int ItemFound = 0;
        //try
        //{
        //    if (oConn.State == ConnectionState.Closed)
        //        oConn.Open();
        //    SqlCommand oCom = new SqlCommand(Q, oConn);
        //    SqlDataReader oR = oCom.ExecuteReader();

        //    while (oR.Read())
        //    {
        //        ItemFound = (int)oR["ItemFound"];
        //    }
        //    oR.Close();
        //}
        //catch (Exception)
        //{ }
        //if (ItemFound > 0)
        //{
        string Msg = "";
        bool Done = false;


        SqlCommand oCommHashSet = new SqlCommand();
        oCommHashSet.CommandType = CommandType.StoredProcedure;
        oCommHashSet.Connection = oConn;
        oCommHashSet.CommandText = "ChangePassword_HashSet";
        oCommHashSet.Parameters.AddWithValue("@param_EmpID", txtID.Text.Trim());
        oCommHashSet.Parameters.AddWithValue("@param_Email", txtEmail.Text.Trim() + "@" + dboDomain.SelectedItem.Value);
        oCommHashSet.Parameters.AddWithValue("@ResetType", ResetType);

        SqlParameter s_Msg = new SqlParameter("@Msg", SqlDbType.VarChar, 1000);
        s_Msg.Direction = ParameterDirection.InputOutput;
        s_Msg.Value = Msg;
        oCommHashSet.Parameters.Add(s_Msg);

        SqlParameter s_Done = new SqlParameter("@Done", SqlDbType.Bit);
        s_Done.Direction = ParameterDirection.InputOutput;
        s_Done.Value = Done;
        oCommHashSet.Parameters.Add(s_Done);


        try
        {
            if (oConn.State == ConnectionState.Closed)
                oConn.Open();
            oCommHashSet.ExecuteNonQuery();

            Msg = string.Format("{0}", s_Msg.Value);
            Done = (bool)s_Done.Value;

            if (Done)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                Label1.Text = Msg;
                txtEmail.Text = "";
                txtID.Text = "";
            }
            else
            {
                lblStatus.Text = Msg;
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Error: " + ex.Message;
        }
        //    Panel1.Visible = false;
        //    Panel2.Visible = true;
        //    Label1.Text = "The password reset link has sent to <b>" + txtEmail.Text.Trim() + "@" + dboDomain.SelectedItem.Value + "</b><br>Please check your email.";
        //    txtEmail.Text = "";
        //    txtID.Text = "";
        //}
        //else
        //{
        //    lblStatus.Text = "Sorry, information not matched.";
        //}
    }

    protected void txtID_TextChanged(object sender, EventArgs e)
    {
        string ImageIdentifier = "";
        string EmpName = "";

        try
        {
            string oConnString = System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;

            SqlConnection oConn = new SqlConnection(oConnString);
            if (oConn.State == ConnectionState.Closed) oConn.Open();
            SqlCommand oCommand = new SqlCommand("SELECT ImageIdentifier, EmpName FROM dbo.EmployeeList with (nolock) WHERE EmpID = @EmpID;", oConn);
            oCommand.CommandType = CommandType.Text;
            oCommand.Parameters.Add("@EmpID", SqlDbType.VarChar).Value = txtID.Text;

            if (oConn.State == ConnectionState.Closed)
                oConn.Open();

            SqlDataReader oReader = oCommand.ExecuteReader();

            string Role = string.Empty;
            while (oReader.Read())
            {
                ImageIdentifier = string.Format("{0}", oReader["ImageIdentifier"]);
                EmpName = string.Format("{0}", oReader["EmpName"]);
            }

            oConn.Close();
        }
        catch (Exception)
        { }

        Literal1.Text = string.Format("<img src='{2}EmpImage.aspx?EMPID={0}&imgid={1}&W=200' width='100' height='100' style='border:1px solid gray;padding:2px;border-radius:50px'></img>", txtID.Text, ImageIdentifier, getValueOfKey("Prefix"));
        lblEmpName.Text =  EmpName;
        txtEmail.Focus();
    }

    public string getValueOfKey(string KeyName)
    {
        try
        {
            return System.Configuration.ConfigurationSettings.AppSettings[KeyName].ToString();
        }
        catch (Exception) { return string.Empty; }
    }
}
