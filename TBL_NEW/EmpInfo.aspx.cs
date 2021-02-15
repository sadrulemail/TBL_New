using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class EmpInfo : System.Web.UI.Page
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

        ID = string.Format("{0}", Request.QueryString["ID"]);
        this.Title = string.Format("{0}", ID);

        if (string.IsNullOrEmpty(ID))
            if (!string.IsNullOrEmpty(LoginID))
                Response.Redirect("EmpInfo.aspx?ID=" + LoginID, true);
            else
                Response.End();


        if (ID.ToUpper().Trim().StartsWith("G"))
            Response.Redirect("Group.aspx?ID=" + ID.Trim(), true);

        //if (LoginID.Length > 0)
        LoadProfile(ID);

        try
        {
            if (!Directory.Exists(Server.MapPath("Upload/"))) Directory.CreateDirectory(Server.MapPath("Upload/"));
            //Response.Write(UploadTempFile);
        }
        catch (Exception) { }

        if (!IsPostBack)
        {
            Session["FILENAME"] = "";
            //Button1.Visible = ID == "951";
            try
            {
                TabContainer1.ActiveTabIndex = (int)Session["ProfileTab"];
            }
            catch (Exception) { }

            try
            {
                DataView DV = (DataView)SqlDataSourceEmp_Sign_Key.Select(DataSourceSelectArguments.Empty);
                if (DV != null)
                {
                    FileKey_EmpSign = (string)DV.Table.Rows[0][0];
                }
            }
            catch (Exception) { }

            //EmpSignImage.ImageUrl = string.Format("EmpSign.aspx?EMPID={0}&W=300&FileKey={1}&field=Sign1", ID, FileKey_EmpSign);
            //hypEmpSignImageChange.NavigateUrl = string.Format("EmpSign_Upload.aspx?ID={0}", ID);
            //hypEmpSign.NavigateUrl = string.Format("EmpSign.aspx?EMPID={0}&FileKey={1}&field=Sign1", ID, FileKey_EmpSign);
        }
    }

    private void LoadProfile(string ID)
    {
        DataView DV = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (DV.Table.Rows.Count > 0)
        {
            lblEmpName.Text = string.Format("{0}", DV.Table.Rows[0]["EmpName"]);
            this.Title = string.Format("{0}. {1}", ID, lblEmpName.Text);
        }
        else
        {
            lblEmpName.Text = "";
        }
    }

    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        if (DetailsView1.CurrentMode == DetailsViewMode.ReadOnly)
        {
            string imgid = string.Format("{0}", DataBinder.Eval(DetailsView1.DataItem, "ImageIdentifier"));
            imgEmp.ImageUrl = string.Format("EmpImage.aspx?EMPID={0}&imgid={1}&W=300", ID, imgid);
            hypImg.NavigateUrl = string.Format("EmpImage.aspx?EMPID={0}&imgid={1}", ID, imgid);

            string ServiceStatus = "";
            try
            {
                ServiceStatus = DataBinder.Eval(DetailsView1.DataItem, "ServiceStatus").ToString();

                if (ServiceStatus == "1")
                {
                    byline.Visible = false;
                    lblServiceStatus.Text = "";
                }
                else
                {
                    //Not in service
                    DetailsView1.Font.Italic = true;
                    DetailsView1.ForeColor = System.Drawing.Color.Gray;
                    //DetailsView1.Font.Strikeout = true;
                    TabContainer1.Font.Italic = true;
                    byline.Visible = true;
                    try
                    {
                        lblServiceStatus.Text = DataBinder.Eval(DetailsView1.DataItem, "ServiceStatusDetails").ToString();
                    }
                    catch (Exception) { }
                }
            }
            catch (Exception) { }


            for (int i = 1; i < DetailsView1.Rows.Count; i++)
            {
                if (DetailsView1.Rows[i].Cells.Count == 2)
                {
                    string value = DetailsView1.Rows[i].Cells[1].Text.Trim().Replace("&nbsp;", "");

                    try
                    {
                        if (DetailsView1.Rows[i].Cells[1].HasControls())
                            value = ((DataBoundLiteralControl)DetailsView1.Rows[i].Cells[1].Controls[0]).Text.Trim().Replace("&nbsp;", "");
                    }
                    catch (Exception) { }
                    if (value == string.Empty)
                        DetailsView1.Rows[i].Visible = false;
                }
            }
        }
        else if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
        {
            //for (int i = 0; i < DetailsView1.Rows.Count; i++)
            //{
            //    string TIN = DataBinder.Eval(DetailsView1.DataItem, "TIN").ToString();
            //    try
            //    {
            //        ((TextBox)DetailsView1.FindControl("TextTIN")).Text = TIN.Split('-')[0];
            //        ((TextBox)DetailsView1.FindControl("TextTIN2")).Text = TIN.Split('-')[1];
            //        ((TextBox)DetailsView1.FindControl("TextTIN3")).Text = TIN.Split('-')[2];
            //    }
            //    catch (Exception) { }
            //}
        }
        //try
        {
            ID = string.Format("{0}", Request.QueryString["ID"]);
            LoginID = string.Format("{0}", Session["EMPID"]);
            TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

            if (ID != LoginID || string.IsNullOrEmpty(LoginID))
            {
                //Different User
                try
                {
                    if (DetailsView1.Rows.Count > 1)
                        DetailsView1.Rows[DetailsView1.Rows.Count - 1].Visible = false;
                    //tabHistory.Visible = false;
                    //tabPayslip.Visible = false;
                }
                catch (Exception) { }
                cmdChangeProPic.Visible = false;
            }
            if (LoginID.Trim().Length != 0)
            {
                if (TrustControl1.isRole("ADMIN"))
                {
                    try
                    {
                        DetailsView1.Rows[DetailsView1.Rows.Count - 1].Visible = true;
                        //tabHistory.Visible = true;
                    }
                    catch (Exception) { }
                }
                else
                {

                }
                //if (TrustControl1.isRole("PA_UPLOAD"))
                    //hypEmpSignImageChange.Visible = true;
            }
        }
        //catch (Exception) { }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
    }

    protected void DetailsViewContact_DataBound(object sender, EventArgs e)
    {
        //try
        //{
        //    if (TrustControl1.isRole("ADMIN")
        //    || (ID == LoginID && ID.Trim().Length > 0))
        //    {
        //        ((Button)(DetailsViewContact.FindControl("cmdAboutMe"))).Visible = true;
        //        tabHistory.Visible = true;
        //    }
        //    else
        //    {
        //        ((Button)(DetailsViewContact.FindControl("cmdAboutMe"))).Visible = false;
        //        tabHistory.Visible = false;
        //    }
        //}
        //catch (Exception) { }


    }

    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    //Label1.Text = CKEditor1.Text;
    //}

    public string ToRelativeDate(DateTime input)
    {
        string suffix = "ago";
        TimeSpan difference = (DateTime.Now - input);
        double millisecondsDifference = difference.TotalMilliseconds;

        if ((millisecondsDifference < 0))
        {
            suffix = "from now";
            millisecondsDifference = Math.Abs(millisecondsDifference);
        }

        double seconds = millisecondsDifference / 1000;
        double minutes = seconds / 60;
        double hours = minutes / 60;
        double days = hours / 24;
        double years = days / 365;

        string relativeDate = string.Empty;

        if ((seconds < 45))
        {
            relativeDate = "less than a minute";
        }
        else if ((seconds < 90))
        {
            relativeDate = "about a minute";
        }
        else if ((minutes < 45))
        {
            relativeDate = string.Format("{0} minutes", Math.Round(minutes));
        }
        else if ((minutes < 90))
        {
            relativeDate = "about an hour";
        }
        else if ((hours < 24))
        {
            relativeDate = string.Format("about {0} hours", Math.Round(hours));
        }
        else if ((hours < 48))
        {
            relativeDate = "a day";
        }
        else if ((days < 30))
        {
            relativeDate = string.Format("{0} days", Math.Floor(days));
        }
        else if ((days < 60))
        {
            relativeDate = "about a month";
        }
        else if ((days < 365))
        {
            relativeDate = string.Format("{0} months", Math.Floor(days / 30));
        }
        else if ((years < 2))
        {
            relativeDate = "about a year";
        }
        else
        {
            relativeDate = string.Format("{0} years", Math.Floor(years));
        }
        return relativeDate + " " + suffix;
    }
    protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
    {
        //DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        Session["ProfileTab"] = TabContainer1.ActiveTabIndex;

        //if (TabContainer1.ActiveTab == tabHistory)
        {
            //GridViewPasswordHistory.DataBind();
            //TrustControl1.ClientMsg(TabContainer1.ActiveTab.ID);
            //SqlDSChangePassword_Log_Show.DataBind();
        }


    }
    //protected void Button2_Click1(object sender, EventArgs e)
    //{
    //    Button2.Text = DateTime.Now.ToString();
    //}
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //e.NewValues["TIN"] = string.Format("{0}-{1}-{2}",
        //            ((TextBox)DetailsView1.FindControl("TextTIN")).Text,
        //            ((TextBox)DetailsView1.FindControl("TextTIN2")).Text,
        //            ((TextBox)DetailsView1.FindControl("TextTIN3")).Text);
    }
    protected void GridViewPasswordHistory_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (!TrustControl1.isRole("ADMIN"))
            {
                //GridViewPasswordHistory.Columns[GridViewPasswordHistory.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception) { }
    }
    protected void SqlDataSourceRef_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            //tabHistory.Visible = false;
        }
    }
    protected void SqlDataSourceRef_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridView2.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewRef.ChangeMode(DetailsViewMode.ReadOnly);  

    }
    protected void SqlDataSourceRef_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridView2.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewRef.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void SqlDataSourceRelatives_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        //if (!Done)
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewRelatives.DataBind();
        DetailsViewRelatives.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void SqlDataSourceRelatives_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewRelatives.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewRelatives.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void GridViewEducation_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsViewEducation.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsViewRef.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void GridViewRelatives_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsViewRelatives.ChangeMode(DetailsViewMode.ReadOnly);
    }
    
    protected void GridViewTraining_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsViewTraining.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void GridViewInterest_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsViewPersonalInterest.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void GridViewMemberAssociation_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsViewMembership.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void GridViewExperience_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsViewExperience.ChangeMode(DetailsViewMode.ReadOnly);
    }
    
    protected void SqlDataSourceTraining_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewTraining.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewTraining.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void SqlDataSourceTraining_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewTraining.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewTraining.ChangeMode(DetailsViewMode.ReadOnly);  

    }

    protected void SqlDataSourceInterest_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewInterest.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewPersonalInterest.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void SqlDataSourceInterest_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewInterest.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewPersonalInterest.ChangeMode(DetailsViewMode.ReadOnly);  
    }
    protected void SqlDataSourceMembership_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewMemberAssociation.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewMembership.ChangeMode(DetailsViewMode.ReadOnly); 
    }

    protected void SqlDataSourceMembership_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewMemberAssociation.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewMembership.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void SqlDataSourceExperience_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewExperience.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewExperience.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void SqlDataSourceExperience_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewExperience.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewExperience.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void SqlDataSourceEducation_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewEducation.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewEducation.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void SqlDataSourceEducation_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        int ID = (int)e.Command.Parameters["@ID"].Value;
        GridViewEducation.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
        DetailsViewEducation.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void cboSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DropDownList cboSubject = ((DropDownList)DetailsViewEducation.FindControl("cboSubject"));
        //TextBox txtSubject = ((TextBox)DetailsViewEducation.FindControl("txtSubject"));
        //if (cboSubject.SelectedItem.Value  == "Others")
        //    txtSubject.Visible=true;
        //else
        //    txtSubject.Visible = false;
    }
}