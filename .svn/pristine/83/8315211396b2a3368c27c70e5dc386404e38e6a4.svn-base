using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class userServices : System.Web.Services.WebService
{
    [WebMethod]
    public string getUserInfo(string contextKey)
    {
        string Retval = "";
        string oConnString = System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;
        SqlConnection oConn = new SqlConnection(oConnString);
        if (oConn.State == ConnectionState.Closed)
            oConn.Open();
        SqlCommand oCommand = new SqlCommand("usp_getEmpInfo", oConn);
        oCommand.CommandType = CommandType.StoredProcedure;
        oCommand.Parameters.Add("@param_EmpID", SqlDbType.VarChar).Value = contextKey;

        if (oConn.State == ConnectionState.Closed)
            oConn.Open();

        SqlDataReader oReader = oCommand.ExecuteReader();

        string Role = string.Empty;
        while (oReader.Read())
        {
            string EMP = oReader["Emp"].ToString();
            if (oReader["ServiceStatus"].ToString() != "1")
                EMP = string.Format("<div style='font-style:italic;color:Gray;' title='{1}'>{0}</div>", EMP, oReader["ServiceStatusDetails"]);

            Retval = string.Format("<table>");
            Retval = string.Format("{0}<tr><td><a href='Profile.aspx?ID={2}' title='view profile' target='_blank'><img src='EmpImage.aspx?EMPID={2}&W=60&H=60' width='60'></a></td><td nowrap=nowrap>{1}</td></tr>", Retval, EMP, contextKey);
            Retval = string.Format("{0}</tr></table></a>", Retval);
        }
        return Retval;
    }
}