using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Attachment_Browse : System.Web.UI.Page
{
    string ID;
    string LoginID;
    TrustControl TrustControl1;
    string FileKey_EmpSign;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        LoginID = string.Format("{0}", Session["EMPID"]);

        if (!TrustControl1.isRole("PAYSLIP"))
            Response.End();
        
        Page.Title = "Attachment Browse";
    }
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatus.Text = string.Format("Total: <b>{0:N0}</b>", e.AffectedRows);
    }
}