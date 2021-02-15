using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;

public partial class LoginLog : System.Web.UI.Page
{
    string LoginID;
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");


        LoginID = string.Format("{0}", Session["EMPID"]);

        ID = string.Format("{0}", Request.QueryString["ID"]);

        this.Title = string.Format("{0}", ID);

        if (string.IsNullOrEmpty(ID))
            if (!string.IsNullOrEmpty(LoginID))
                Response.Redirect("LoginLog.aspx?ID=" + LoginID, true);
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
            //HideDeptGridColumn();

            hidEmpID.Value = ID;
            Session["FILENAME"] = "";
            //Button1.Visible = ID == "951";

            txtDateFrom.Text = txtDateTo.Text = string.Format("{0:dd/MM/yyy}", DateTime.Now.Date);
           
        }
    }

    public bool getIsEditable()
    {
        return true;
    }

    private void LoadProfile(string ID)
    {
        DataView DV = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (DV.Table.Rows.Count > 0)
        {
            string s = string.Format("{0}", DV.Table.Rows[0]["EmpName"]);
            //string s = string.Format("- {0}", StatusParse(DV.Table.Rows[0]["LastOnline"]));
            this.Title = string.Format("{0}. {1}", ID, s);
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
            //string imgid = string.Format("{0}", DataBinder.Eval(DetailsView1.DataItem, "ImageIdentifier"));
            //imgEmp.ImageUrl = string.Format("EmpImage.aspx?EMPID={0}&imgid={1}&W=300", ID, imgid);
            //hypImg.NavigateUrl = string.Format("EmpImage.aspx?EMPID={0}&imgid={1}", ID, imgid);

            string ServiceStatus = "";
            try
            {
                ServiceStatus = DataBinder.Eval(DetailsView1.DataItem, "ServiceStatus").ToString();

                if (ServiceStatus == "1")
                {
                    //byline.Visible = false;
                    //lblServiceStatus.Text = "";
                }
                else
                {
                    //Not in service
                    DetailsView1.Font.Italic = true;
                    DetailsView1.ForeColor = System.Drawing.Color.Gray;
                    //DetailsView1.Font.Strikeout = true;
                    //TabContainer1.Font.Italic = true;
                    //byline.Visible = true;
                    try
                    {
                        //lblServiceStatus.Text = DataBinder.Eval(DetailsView1.DataItem, "ServiceStatusDetails").ToString();
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
        
        //try
        {
            ID = string.Format("{0}", Request.QueryString["ID"]);
            LoginID = string.Format("{0}", Session["EMPID"]);
            TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

            if (ID == LoginID || TrustControl1.isRole("ADMIN"))
                Panel1.Visible = true;
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
                //((Button)(DetailsViewAboutMe.FindControl("cmdAboutMe"))).Visible = true;
                //tabHistory.Visible = true;
            }
            else
            {
                //((Button)(DetailsViewAboutMe.FindControl("cmdAboutMe"))).Visible = false;
                //tabHistory.Visible = false;
            }
        }
        catch (Exception) { }
    }

    protected void cmdPreviousDay_Click(object sender, EventArgs e)
    {
        DateTime DT = DateTime.Parse(txtDateFrom.Text);
        txtDateFrom.Text = string.Format("{0:dd/MM/yyyy}", DT.AddDays(-1));
        txtDateTo.Text = string.Format("{0:dd/MM/yyyy}", DT.AddDays(-1));
    }
    protected void cmdNextDay_Click(object sender, EventArgs e)
    {
        DateTime DT = DateTime.Parse(txtDateFrom.Text);
        txtDateFrom.Text = string.Format("{0:dd/MM/yyyy}", DT.AddDays(1));
        txtDateTo.Text = string.Format("{0:dd/MM/yyyy}", DT.AddDays(1));
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



    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            //tabHistory.Visible = false;
        }
    }


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

    protected void SqlDataSource_LoginLog_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatus.Text = string.Format("Total: <b>{0:N0}</b>", e.AffectedRows);
    }

}