using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class ProfilePage : System.Web.UI.Page
{
    string ID;
    string LoginID;
    TrustControl TrustControl1;
    string FileKey_EmpSign;
    int isPublishJob = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");
        

        LoginID = string.Format("{0}", Session["EMPID"]);       

        ID = string.Format("{0}", Request.QueryString["ID"]);
        
        this.Title = string.Format("{0}", ID);

        if (string.IsNullOrEmpty(ID))
            if (!string.IsNullOrEmpty(LoginID))
                Response.Redirect("Profile.aspx?ID=" + LoginID, true);
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
            HideDeptGridColumn();

            hidEmpID.Value = ID;
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
            
            EmpSignImage.ImageUrl = string.Format("EmpSign.aspx?EMPID={0}&W=300&FileKey={1}&field=Sign1", ID, FileKey_EmpSign);
            hypEmpSignImageChange.NavigateUrl = string.Format("EmpSign_Upload.aspx?ID={0}", ID);
            hypEmpSign.NavigateUrl = string.Format("EmpSign.aspx?EMPID={0}&FileKey={1}&field=Sign1", ID, FileKey_EmpSign);

            

            //isPublishJob = PublishJob();
            //if (isPublishJob == 1)
            //    DetailsView2.Visible = true;
        }
    }

    private void HideDeptGridColumn()
    {
            //if (TrustControl1.isRole("ADMIN", "PROFILE_EDITOR"))
            //{
            //     GridView2.Columns[2].Visible = true;
            //     GridView2.Columns[3].Visible = true;
            //     GridView2.Columns[4].Visible = true;
            //     GridView2.Columns[5].Visible = true;

            //     GridView2.Columns[6].Visible = true;

            //     GridView2.Columns[7].Visible = true;
            //     GridView2.Columns[8].Visible = true;
            //     DetailsView2.Visible = true;
            //}

           
       
    }

    public bool getIsEditable()
    {
        return true;
    }

    private void LoadProfile(string ID)
    {
        //DataView DV = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        //if (DV.Table.Rows.Count > 0)
        //{
        //    lblEmpName.Text = string.Format("{0}", DV.Table.Rows[0]["EmpName"]);
        //    //litEmpOnlineStatus.Text = string.Format("- {0}", StatusParse(DV.Table.Rows[0]["LastOnline"]));
        //    this.Title = string.Format("{0}. {1}", ID, lblEmpName.Text);            
        //}
        //else
        //{
        //    lblEmpName.Text = "";            
        //}
    }

    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        if (DetailsView1.CurrentMode == DetailsViewMode.ReadOnly)
        {
            string imgid = string.Format("{0}", DataBinder.Eval(DetailsView1.DataItem, "ImageIdentifier"));
            imgEmp.ImageUrl = string.Format("EmpImage.aspx?EMPID={0}&imgid={1}&W=300", ID, imgid);
            hypImg.NavigateUrl = string.Format("EmpImage.aspx?EMPID={0}&imgid={1}", ID, imgid);

            try
            {
                ((System.Web.UI.HtmlControls.HtmlGenericControl)this.Page.Master.FindControl("FavLogo")).Attributes["href"]
                    = string.Format("EmpImage.aspx?EMPID={0}&imgid={1}&W=100", ID, imgid);
            }
            catch (Exception) { }


            lblEmpName.Text = string.Format("{0}", DataBinder.Eval(DetailsView1.DataItem, "EmpName"));
            //litEmpOnlineStatus.Text = string.Format("- {0}", StatusParse(DV.Table.Rows[0]["LastOnline"]));
            this.Title = string.Format("{0}. {1}", ID, lblEmpName.Text);
            lblFunctionalDesignation.Text = string.Format("<div style='font-size:120%;font-family:Verdana;font-weight:bold'>{0}</div>", DataBinder.Eval(DetailsView1.DataItem, "FunctionalDesignation"));
            //hidMobileNo.Value = string.Format("{0}", DataBinder.Eval(DetailsView1.DataItem, "mobile"));

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
            if (TrustControl1.isRole("ADMIN", "PROFILE_EDITOR"))
            {
                for (int i = 1; i < DetailsView1.Fields.Count; i++)
                {
                    try
                    {
                        BoundField BF = (BoundField)DetailsView1.Fields[i];

                        switch (BF.DataField.ToLower())
                        {
                            case "email":
                            case "mobile":
                            case "mobile2":
                            case "ip_phone":
                                BF.ReadOnly = false;
                                break;
                            default:
                                break;
                        }
                    }
                    catch (Exception) { }
                }
                //((BoundField)DetailsView1.Fields[7]).ReadOnly = false;  //TBL Email
                //((BoundField)DetailsView1.Fields[7]).ReadOnly = false;
            }
            else
            {
                for (int i = 1; i < DetailsView1.Fields.Count; i++)
                {
                    try
                    {
                        BoundField BF = (BoundField)DetailsView1.Fields[i];
                        switch (BF.DataField.ToLower())
                        {                            
                            case "mobile":
                                if (DataBinder.Eval(DetailsView1.DataItem, "mobile").ToString().Trim() == "")
                                    BF.ReadOnly = false;
                                break;
                            case "mobile2":
                                if (DataBinder.Eval(DetailsView1.DataItem, "mobile2").ToString().Trim() == "")
                                    BF.ReadOnly = false;
                                break;
                            default:
                                break;
                        }
                    }
                    catch (Exception) { }
                }
            }
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
                    if(DetailsView1.Rows.Count>1)
                        DetailsView1.Rows[DetailsView1.Rows.Count - 1].Visible = false;
                    tabHistory.Visible = false;
                    tabPayslip.Visible = false;
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
                        tabHistory.Visible = true;
                    }
                    catch (Exception) { }
                }
                else
                {

                }
                if (TrustControl1.isRole("PA_UPLOAD"))
                    hypEmpSignImageChange.Visible = true;
            }
        }
        //catch (Exception) { }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
    }

    protected void DetailsViewAboutMe_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (TrustControl1.isRole("ADMIN")
            || (ID == LoginID && ID.Trim().Length > 0))
            {
                ((Button)(DetailsViewAboutMe.FindControl("cmdAboutMe"))).Visible = true;
                tabHistory.Visible = true;
            }
            else
            {
                ((Button)(DetailsViewAboutMe.FindControl("cmdAboutMe"))).Visible = false;
                tabHistory.Visible = false;
            }            
        }
        catch (Exception) { }        
    }

    protected void DetailsViewEmpStatus_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (ID == LoginID && ID.Trim().Length > 0)
            {
                ((LinkButton)(DetailsViewEmpStatus.FindControl("cmdEmpStatus"))).Visible = true;
                tabHistory.Visible = true;
            }
            else
            {
                ((LinkButton)(DetailsViewEmpStatus.FindControl("cmdEmpStatus"))).Visible = false;
                tabHistory.Visible = false;
            }
        }
        catch (Exception) { }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //Label1.Text = CKEditor1.Text;
    }

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
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Button2.Text = DateTime.Now.ToString();
    }
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
                GridViewPasswordHistory.Columns[GridViewPasswordHistory.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception) { }
    }
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            tabHistory.Visible = false;
        }
    }

    //public string ToStatusDate(DateTime input)
    //{
    //    TimeSpan difference = (DateTime.Now - input);
    //    double millisecondsDifference = difference.TotalMilliseconds;

    //    double seconds = millisecondsDifference / 1000;
    //    double minutes = seconds / 60;
    //    double hours = minutes / 60;
    //    double days = hours / 24;
    //    double years = days / 365;

    //    string relativeDate = string.Empty;

    //    if ((seconds < 45))
    //    {
    //        relativeDate = "now";
    //    }
    //    else if ((seconds < 120))
    //    {
    //        relativeDate = "1 min";
    //    }
    //    else if ((minutes < 60))
    //    {
    //        relativeDate = string.Format("{0} mins", Math.Round(minutes));
    //    }
    //    else if ((minutes < 65))
    //    {
    //        relativeDate = "1 hour";
    //    }
    //    else if ((hours < 24))
    //    {
    //        relativeDate = string.Format("{0} hour", Math.Round(hours));
    //        if (Math.Round(hours) > 1)
    //            relativeDate += "s";

    //        int mins = (int)Math.Round(minutes) % (int)Math.Round(hours);
    //        if (mins == 1)
    //            relativeDate += string.Format(" {0} min", mins);
    //        else if (mins > 1)
    //            relativeDate += string.Format(" {0} mins", mins);
    //    }
    //    else if ((hours < 48))
    //    {
    //        relativeDate = "1 day";
    //    }
    //    else if ((days < 30))
    //    {
    //        relativeDate = string.Format("{0} days", Math.Floor(days));
    //    }
    //    else if ((days < 60))
    //    {
    //        relativeDate = "1 month";
    //    }
    //    else if ((days < 365))
    //    {
    //        relativeDate = string.Format("{0} months", Math.Floor(days / 30));
    //    }
    //    else if ((years < 2))
    //    {
    //        relativeDate = "1 year";
    //    }
    //    else
    //    {
    //        relativeDate = string.Format("{0} years", Math.Floor(years));
    //    }
    //    return relativeDate;
    //}

    //protected string StatusParse(object LastOnline)
    //{
    //    DateTime dt = (DateTime)LastOnline;
    //    if (dt.AddSeconds(60) < DateTime.Now)
    //        return "<span style='color:gray' title='Offline'>Offline " + ToStatusDate(dt) + "</span>";
    //    else
    //        return "<span style='color:green' title='Available in intra Message'>Available</span>";
    //}

    protected string getAge(object DOB)
    {
        return getAge(DOB, DateTime.Now.Date);
    }

    protected string getAge(object FromDate, object ToDate)
    {
        try
        {
            //DateTime dateOfBirth = (DateTime)FromDate;
            //DateTime currentDate = (DateTime)ToDate;

            int ageInYears = 0;
            int ageInMonths = 0;
            int ageInDays = 0;
            string dayText = "day";
            string monthText = "month";
            string yearText = "year";

            DateTime Bday = (DateTime)FromDate;
            DateTime Cday = DateTime.Today;

            if ((Cday.Year - Bday.Year) > 0 ||
                (((Cday.Year - Bday.Year) == 0) && ((Bday.Month < Cday.Month) ||
                ((Bday.Month == Cday.Month) && (Bday.Day <= Cday.Day)))))
            {
                int DaysInBdayMonth = DateTime.DaysInMonth(Bday.Year, Bday.Month);
                int DaysRemain = Cday.Day + (DaysInBdayMonth - Bday.Day);

                if (Cday.Month > Bday.Month)
                {
                    ageInYears = Cday.Year - Bday.Year;
                    ageInMonths = Cday.Month - (Bday.Month + 1) + Math.Abs(DaysRemain / DaysInBdayMonth);
                    ageInDays = (DaysRemain % DaysInBdayMonth + DaysInBdayMonth) % DaysInBdayMonth;
                }
                else if (Cday.Month == Bday.Month)
                {
                    if (Cday.Day >= Bday.Day)
                    {
                        ageInYears = Cday.Year - Bday.Year;
                        ageInMonths = 0;
                        ageInDays = Cday.Day - Bday.Day;
                    }
                    else
                    {
                        ageInYears = (Cday.Year - 1) - Bday.Year;
                        ageInMonths = 11;
                        ageInDays = DateTime.DaysInMonth(Bday.Year, Bday.Month) - (Bday.Day - Cday.Day);
                    }
                }
                else
                {
                    ageInYears = (Cday.Year - 1) - Bday.Year;
                    ageInMonths = Cday.Month + (11 - Bday.Month) + Math.Abs(DaysRemain / DaysInBdayMonth);
                    ageInDays = (DaysRemain % DaysInBdayMonth + DaysInBdayMonth) % DaysInBdayMonth;
                }
            }

            if (ageInYears == 0) yearText = "";
            else if (ageInYears == 1) yearText = ", " + ageInYears + " year";
            else yearText = ", " + ageInYears + " years";

            if (ageInMonths == 0) monthText = "";
            else if (ageInMonths == 1) monthText = ", " + ageInMonths + " month";
            else monthText = ", " + ageInMonths + " months";

            if (ageInDays == 0) dayText = "";
            else if (ageInDays == 1) dayText = ", " + ageInDays + " day";
            else dayText = ", " + ageInDays + " days";


            string Retval = string.Format("{0}{1}{2}", yearText, monthText, dayText);
            if (Retval.StartsWith(", ")) Retval = Retval.Substring(2);
            if (Retval.StartsWith(", ")) Retval = Retval.Substring(2);
            if (Retval.StartsWith(", ")) Retval = Retval.Substring(2);

            return Retval;
        }
        catch (Exception)
        { return ""; }
    }

    protected void SqlDataSource2_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        //int BrandID = (int)e.Command.Parameters["@ID"].Value;
        //string Name = (string)e.Command.Parameters["@Name"].Value;
        GridView2.DataBind();
        GridView2.SelectedIndex = -1;
      
    }
    protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        //int BrandID = (int)e.Command.Parameters["@ID"].Value;
        //string Name = (string)e.Command.Parameters["@Name"].Value;
        //GridView2.DataBind();
        TrustControl1.ClientMsg(string.Format("{0}", Msg));
      
            GridView2.DataBind();
            GridView2.SelectedIndex = -1;

      
        
    }

    
    protected void SqlDataSourceTagDept_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblTotal.Text = string.Format("Total: <b>{0}</b>", e.AffectedRows);

    }
    protected void SqlDataSourceTagDept_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            TrustControl1.ClientMsg(string.Format("{0}", "Delete Successfully."));
        }
        else
        {
            TrustControl1.ClientMsg(string.Format("{0}", "Not Deleted."));
        }

    }
    protected void SqlDataSourceTagDept_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            TrustControl1.ClientMsg(string.Format("{0}", "Publish Successfully."));
        }
        else
        {
            TrustControl1.ClientMsg(string.Format("{0}", "Not Published."));
        }

    }


    protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //DetailsView2.ChangeMode(DetailsViewMode.Edit);
    }
    protected void DetailsView2_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
            GridView2.SelectedIndex = -1;
    }
   
    protected void GridView2_DataBound(object sender, EventArgs e)
    {
        //bool isSelf = (Session["EMPID"].ToString() == Request.QueryString["ID"].ToString());

        //if (TrustControl1.isRole("ADMIN", "PROFILE_EDITOR") || isPublishJob == 1)
        //{
        //    GridView2.Columns[2].Visible = true;
        //    GridView2.Columns[3].Visible = true;
        //    GridView2.Columns[4].Visible = true;
        //    GridView2.Columns[5].Visible = true;
        //    //GridView2.Columns[6].Visible = true;
        //    //GridView2.Columns[8].Visible = true;  
        //    //GridView2.Columns[7].Visible = true;
            

        //    //DetailsView2.Visible = true;
        //}

        //if (isSelf)
        //{
        //    GridView2.Columns[2].Visible = true;
        //    GridView2.Columns[3].Visible = true;
        //    GridView2.Columns[4].Visible = true;
        //    GridView2.Columns[5].Visible = true;
        //    //GridView2.Columns[7].Visible = true;

        //    //DetailsView2.Visible = true;
        //}
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           //Label lblId = e.Row.FindControl("lb_publish") as Label;
           //string b = lblId.Text;

            bool isPublished = (bool)(DataBinder.Eval(e.Row.DataItem, "IsPublished"));
            bool isSelf = false;

            try
            {
                isSelf = (Session["EMPID"].ToString() == Request.QueryString["ID"].ToString());
            }
            catch (Exception) { }

            if (isPublishJob == 1 || TrustControl1.isRole("ADMIN", "PROFILE_EDITOR"))    //Manager or Admin
            {
                //Delete Btn show
                //((LinkButton)e.Row.FindControl("lblDelete")).Visible = true;

                if(isPublished)
                {
                    //GridView2.Columns[6].Visible = tr;
                }
                else
                {
                    //Publish Btn show
                    try
                    {
                        ((LinkButton)e.Row.FindControl("lblPublish")).Visible = true;
                    }
                    catch (Exception) { }
                    try
                    {
                        ((LinkButton)e.Row.FindControl("lblSelect")).Visible = true;
                    }
                    catch (Exception) { }
                    try
                    {
                        ((LinkButton)e.Row.FindControl("lblDelete")).Visible = true;
                    }
                    catch (Exception) { }
                    
                }                
            }
            else if (isSelf)
            {               

                if (isPublished)
                {
                    
                }
                else
                {
                    //Delete Btn show
                    ((LinkButton)e.Row.FindControl("lblDelete")).Visible = true;

                }
            }
            else    //For Public
            {
                if (!isPublished)
                {
                    //hide row
                    e.Row.Visible = false;
                }
            }



      


        }



    }

    //private int PublishJob()
    //{
    //    int quantity;
    //    SqlDataAdapter da = new SqlDataAdapter();

    //    using (SqlConnection conn = new SqlConnection())
    //    {
    //        conn.ConnectionString = System.Configuration.ConfigurationManager
    //                        .ConnectionStrings["TblUserDBConnectionString0"].ConnectionString;

    //        using (SqlCommand cmd = new SqlCommand("SELECT dbo.[fn_isEmpManager](@EmpID,@ManagerEmpID)", conn))
    //        {
    //            //cmd.CommandType = System.Data.CommandType.StoredProcedure;
    //            cmd.Parameters.Add("@EmpID", System.Data.SqlDbType.VarChar).Value = Request.QueryString["ID"];
    //            cmd.Parameters.Add("@ManagerEmpID", System.Data.SqlDbType.VarChar).Value = Session["EMPID"].ToString();
              
    //            cmd.Connection = conn;
    //            conn.Open();
    //            quantity = (int)cmd.ExecuteScalar();


    //        }

    //    }

    //    return quantity;
    //}

    protected void SqlDataSourceDuplicateMobile_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
            lblDuplicateMobile.Text = "Same Mobile Number found in...";
    }
}