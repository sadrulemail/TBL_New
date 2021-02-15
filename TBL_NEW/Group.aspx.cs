using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Group : System.Web.UI.Page
{
    string GroupID;
    string LoginID;
    TrustControl TrustControl1;
    string FileKey_EmpSign;
    string GroupName;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        LoginID = string.Format("{0}", Session["EMPID"]);
        GroupID = string.Format("{0}", Request.QueryString["ID"]);

        if (string.IsNullOrEmpty(GroupID))
            Response.Redirect("Profile.aspx?ID=" + LoginID, true);


        if (LoginID.Length > 0)
        {
            //LoadProfile(ID);
            //lblGroupName.Text = "Group ID: " + GroupID;
        }

        try
        {
            if (!Directory.Exists(Server.MapPath("Upload/"))) Directory.CreateDirectory(Server.MapPath("Upload/"));
            //Response.Write(UploadTempFile);
        }
        catch (Exception) { }

        if (!IsPostBack)
        {
            //Session["FILENAME"] = "";
            ////Button1.Visible = ID == "951";
            //try
            //{
            //    TabContainer1.ActiveTabIndex = (int)Session["ProfileTab"];
            //}
            //catch (Exception) { }

            //try
            //{
            //    DataView DV = (DataView)SqlDataSourceEmp_Sign_Key.Select(DataSourceSelectArguments.Empty);
            //    if (DV != null)
            //    {
            //        FileKey_EmpSign = (string)DV.Table.Rows[0][0];
            //    }
            //}
            //catch (Exception) { }

            //imgEmp.ImageUrl = string.Format("EmpImage.aspx?EMPID={0}&W=200", ID);
            //EmpSignImage.ImageUrl = string.Format("EmpSign.aspx?EMPID={0}&W=300&FileKey={1}&field=Sign1", ID, FileKey_EmpSign);
            //hypEmpSignImageChange.NavigateUrl = string.Format("EmpSign_Upload.aspx?ID={0}", ID);
            //hypEmpSign.NavigateUrl = string.Format("EmpSign.aspx?EMPID={0}&FileKey={1}&field=Sign1", ID, FileKey_EmpSign);
        }
    }
    protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblTitle1.Text = string.Format("Group Members <b>({0})</b>", e.AffectedRows);
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            GroupName = ((HiddenField)GridView1.Rows[0].FindControl("hidGroupName")).Value;
            this.Title = string.Format("{0} (Group)", GroupName);
        }
        catch (Exception) { }
    }
}