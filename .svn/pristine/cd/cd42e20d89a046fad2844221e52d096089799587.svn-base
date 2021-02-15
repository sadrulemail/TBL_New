using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Attachment_Add : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            txtDescription.Text = string.Format("{0}", Session["Description"]);
            txtBatch.Text = string.Format("{0}", Session["Batch"]);

            foreach (ListItem li in dboType.Items)
                if (li.Value == string.Format("{0}", Session["Type"]))
                    li.Selected = true;
            
        }
        Page.Title = "Attachment Add";
    }

    protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        InsertData(e.GetContents(), e.FileName, e.ContentType, e.FileSize, e.FileId);
    }

    public void InsertData(byte[] content, string FileName, string ContentType, int fileSize, string FileId)
    {
        content = Common.Compress(content);

        SqlConnection objConn = null;
        SqlCommand objCom = null;
        try
        {
            objConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TblUserDBConnectionString0"].ConnectionString);
            objCom = new SqlCommand("sp_Attachments_Add", objConn);
            objCom.CommandType = CommandType.StoredProcedure;


            //objCom.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            objCom.Parameters.Add("@InsertBy", SqlDbType.VarChar).Value = Session["EMPID"].ToString();
            objCom.Parameters.Add("@Attachment", SqlDbType.Image).Value = content;
            objCom.Parameters.Add("@FileName", SqlDbType.VarChar).Value = FileName;
            objCom.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = ContentType;
            objCom.Parameters.Add("@FileSize", SqlDbType.Int).Value = fileSize;
            objCom.Parameters.Add("@FileId", SqlDbType.VarChar).Value = FileId;
            objCom.Parameters.Add("@Type", SqlDbType.VarChar).Value = Session["Type"].ToString();
            objCom.Parameters.Add("@Description", SqlDbType.VarChar).Value = Session["Description"].ToString();
            objCom.Parameters.Add("@EmpID", SqlDbType.VarChar).Value = Common.getEmpID(FileName);
            objCom.Parameters.Add("@Batch", SqlDbType.Int).Value = Session["Batch"].ToString();

            objConn.Open();
            int i = objCom.ExecuteNonQuery();
            objConn.Close();

            //lblUploadStatus.Text = "File Uploadted and Saved as: <a href=\"Attachment.aspx?a="+ i.ToString() +"\">" + i.ToString() + "." + Extension + "</a>";
        }
        catch (Exception ex)
        {
            TrustControl1.ClientMsg("Error: " + ex.Message);
        }
        //finally
        //{
        //    //objConn.Close();
        //}
    }
    protected void cmdNext_Click(object sender, EventArgs e)
    {
        Session["Description"] = txtDescription.Text.Trim();
        Session["Type"] = dboType.SelectedItem.Value;
        Session["Batch"] = txtBatch.Text.Trim();

        dboType.Enabled = false;
        txtDescription.Enabled = false;
        txtBatch.Enabled = false;
        AjaxFileUpload1.Visible = true;
    }
}