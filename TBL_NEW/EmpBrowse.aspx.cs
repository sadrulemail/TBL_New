using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using System.IO;
using System.Text;
using System.Drawing;

public partial class EmpBrowse : System.Web.UI.Page
{
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        RefreshTitle();
        string focusScript = "document.getElementById('" + txtSearch.ClientID + "').focus();";
        TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",200);");

        cmdExport.Visible = true;

        if (IsPostBack)
        {
            StringBuilder BranchIDs = new StringBuilder();
            StringBuilder DepartmentIDs = new StringBuilder();
            StringBuilder DeignationIDs = new StringBuilder();

            foreach (ListItem LS in cboDepartments.Items)
                if (LS.Selected) DepartmentIDs.Append(string.Format("{0}", LS.Value + ","));

            foreach (ListItem LS in cboBranches.Items)
                if (LS.Selected) BranchIDs.Append(string.Format("{0}", LS.Value + ","));

            foreach (ListItem LS in cboDesignation.Items)
                if (LS.Selected) DeignationIDs.Append(string.Format("{0}", LS.Value + ","));

            SqlDataSource1.SelectParameters["BranchIDs"].DefaultValue = BranchIDs.ToString();
            SqlDataSource1.SelectParameters["DepartmentIDs"].DefaultValue = DepartmentIDs.ToString();
            SqlDataSource1.SelectParameters["DeignationIDs"].DefaultValue = DeignationIDs.ToString();

            SqlDataSource_Download.SelectParameters["BranchIDs"].DefaultValue = BranchIDs.ToString();
            SqlDataSource_Download.SelectParameters["DepartmentIDs"].DefaultValue = DepartmentIDs.ToString();
            SqlDataSource_Download.SelectParameters["DeignationIDs"].DefaultValue = DeignationIDs.ToString();

            GridView1.DataBind();
            ListView1.DataBind();

        }
    }
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatus.Text = string.Format("Total: <b>{0}</b>", e.AffectedRows);
    }
    protected void cmdExport_Click(object sender, EventArgs e)
    {
        try
        {
            string FileName = Path.GetTempFileName();
            if (File.Exists(FileName)) File.Delete(FileName);
            FileInfo FI = new FileInfo(FileName);
            using (ExcelPackage xlPackage = new ExcelPackage(FI))
            {
                ExcelWorksheet worksheet = xlPackage.Workbook.Worksheets.Add("Executives-Managers-SubManagers");
                int StartRow = 1;

                //Adding Title Row
                worksheet.Cells[StartRow, 1].Value = "Emp ID";
                worksheet.Cells[StartRow, 2].Value = "Employee Name";
                worksheet.Cells[StartRow, 3].Value = "Desig";
                worksheet.Cells[StartRow, 4].Value = "Designation";

                worksheet.Cells[StartRow, 5].Value = "Department";
                worksheet.Cells[StartRow, 6].Value = "Branch ID";
                worksheet.Cells[StartRow, 7].Value = "Branch Name";
                worksheet.Cells[StartRow, 8].Value = "Email ID";
                worksheet.Cells[StartRow, 9].Value = "Mobile No.";
                worksheet.Cells[StartRow, 10].Value = "Contact No.";
                worksheet.Cells[StartRow, 11].Value = "Others Emails";
                worksheet.Cells[StartRow, 12].Value = "TIN";

                worksheet.Column(1).Width = 8;
                worksheet.Column(2).Width = 45;
                worksheet.Column(3).Width = 8;
                worksheet.Column(4).Width = 35;
                worksheet.Column(5).Width = 30;
                worksheet.Column(6).Width = 12;
                worksheet.Column(7).Width = 20;
                worksheet.Column(8).Width = 20;
                worksheet.Column(9).Width = 25;
                worksheet.Column(10).Width = 25;
                worksheet.Column(11).Width = 25;
                worksheet.Column(12).Width = 20;

                worksheet.Cells[1, 4].Style.WrapText = true;

                DataView DV = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                for (int r = 0; r < DV.Table.Rows.Count; r++)
                {
                    int R = StartRow + r + 1;

                    if (DV.Table.Rows[r]["EmpID"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 1].Value = DV.Table.Rows[r]["EmpID"].ToString();
                        //worksheet.Cells[R, 1].Style.Numberformat.Format = "MM/dd/yyyy";
                    }


                    if (DV.Table.Rows[r]["EmpName"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 2].Value = DV.Table.Rows[r]["EmpName"].ToString();
                        worksheet.Cells[R, 2].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["DesigName"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 3].Value = DV.Table.Rows[r]["DesigName"];
                        worksheet.Cells[R, 3].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["DesigFullName"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 4].Value = DV.Table.Rows[r]["DesigFullName"];
                        worksheet.Cells[R, 4].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["Department"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 5].Value = DV.Table.Rows[r]["Department"].ToString();
                        worksheet.Cells[R, 6].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["BranchID"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 6].Value = DV.Table.Rows[r]["BranchID"].ToString();

                    }

                    if (DV.Table.Rows[r]["BranchName"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 7].Value = DV.Table.Rows[r]["BranchName"].ToString();

                    }

                    if (DV.Table.Rows[r]["Email_TBLBD"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 8].Value = DV.Table.Rows[r]["Email_TBLBD"].ToString();
                        worksheet.Cells[R, 8].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["mobile"] != DBNull.Value)
                        worksheet.Cells[R, 9].Value = DV.Table.Rows[r]["mobile"].ToString();

                    string Phone = "";
                    if (DV.Table.Rows[r]["mobile2"] != DBNull.Value)
                        Phone = DV.Table.Rows[r]["mobile2"].ToString() + ", ";

                    if (DV.Table.Rows[r]["phone"] != DBNull.Value)
                        Phone += DV.Table.Rows[r]["phone"].ToString() + ", ";

                    worksheet.Cells[R, 10].Value = Phone;
                    worksheet.Cells[R, 10].Style.WrapText = true;

                    string Email1 = "";
                    if (DV.Table.Rows[r]["Email1"] != DBNull.Value)
                        Email1 = DV.Table.Rows[r]["Email1"].ToString() + ", ";

                    if (DV.Table.Rows[r]["Email2"] != DBNull.Value)
                        Email1 += DV.Table.Rows[r]["Email2"].ToString() + ", ";

                    if (DV.Table.Rows[r]["Email_TBLBD"] != DBNull.Value)
                        Email1 += DV.Table.Rows[r]["Email_TBLBD"].ToString() + ", ";

                    worksheet.Cells[R, 11].Value = Email1;
                    worksheet.Cells[R, 11].Style.WrapText = true;

                    if (DV.Table.Rows[r]["TIN"] != DBNull.Value)
                        worksheet.Cells[R, 12].Value = DV.Table.Rows[r]["TIN"].ToString();
                    worksheet.Cells[R, 12].Style.WrapText = true;

                    


                }

                worksheet.Cells["A1:H1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
                worksheet.Cells["A1:A"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["C1:C"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["E1:E"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
                worksheet.Cells["F1:F"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                //worksheet.Cells["G1:G"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                //worksheet.Cells["H1:H"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["A1:L"].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Top;
                //
                worksheet.Cells["A1:L1"].Style.Font.Bold = true;



                //Adding Properties
                xlPackage.Workbook.Properties.Title = "TBL Employee";
                xlPackage.Workbook.Properties.Author = "Administrator";
                xlPackage.Workbook.Properties.Company = "Trust Bank Limited";
                //xlPackage.Workbook.Properties.LastModifiedBy = string.Format("{0}", Session["EMPNAME"]);

                xlPackage.Save();
            }


            //Reading File Content
            byte[] content = File.ReadAllBytes(FileName);
            File.Delete(FileName);

            //Downloading File
            Response.Clear();
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/xlsx";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + "TBL-Employee.xlsx");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(content);
            Response.End();
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }
    protected void chkExecutives_CheckedChanged(object sender, EventArgs e)
    {
        RefreshTitle();
    }
    protected void chkManagers_CheckedChanged(object sender, EventArgs e)
    {
        RefreshTitle();
    }
    protected void chkSubManagers_CheckedChanged(object sender, EventArgs e)
    {
        RefreshTitle();
    }

    private void RefreshTitle()
    {
        this.Title = "Employee Information";

        //lblTitle.Text = string.Format("{0} {1} {2}",
        //    (chkExecutives.Checked ? chkExecutives.Text + "," : ""),
        //    (chkManagers.Checked ? chkManagers.Text + "," : ""),
        //    (chkSubManagers.Checked ? chkSubManagers.Text + "," : "")
        //    ).Trim();
        //if (lblTitle.Text.Trim().EndsWith(","))
        //    lblTitle.Text = lblTitle.Text.Substring(0, lblTitle.Text.Length - 1);

        //if (chkExecutives.Checked && chkManagers.Checked && chkSubManagers.Checked)
        //    lblTitle.Text = "Executives, Managers, Sub Managers";
        //this.Title = "Executives, Managers, Sub Managers";
    }
    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        
    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void cmdExportVCF_Click(object sender, EventArgs e)
    {
        DataView DV = (DataView)SqlDataSource_Download.Select(DataSourceSelectArguments.Empty);

        var builder = new StringBuilder();

        for (int r = 0; r < DV.Table.Rows.Count; r++)
        {
            
            builder.AppendLine("BEGIN:VCARD");
            builder.AppendLine("VERSION:2.1");
            // Name
            string name = DV.Table.Rows[r]["EmpName"].ToString();
            if (name.ToUpper().StartsWith("MD. ")) name = name.Substring(4);
            if (name.ToUpper().StartsWith("MS. ")) name = name.Substring(4);
            if (name.ToUpper().StartsWith("MR. ")) name = name.Substring(4);
            if (name.ToUpper().StartsWith("MRS. ")) name = name.Substring(5);
            builder.AppendLine("N:" + name);
            // Full name
            //builder.AppendLine("FN:" + FirstName + " " + LastName);
            // Address
            //builder.Append("ADR;HOME;PREF:;;");
            //builder.Append(StreetAddress + ";");
            //builder.Append(City + ";;");
            //builder.Append(Zip + ";");
            //builder.AppendLine(CountryName);
            // Other data
            builder.AppendLine("ORG:" + DV.Table.Rows[r]["BranchName"].ToString());
            builder.AppendLine("TITLE:" + DV.Table.Rows[r]["DesigName"]);
            builder.AppendLine("NOTE:Emp ID:" + DV.Table.Rows[r]["EmpID"] + "\\n");
            
            if (DV.Table.Rows[r]["mobile"].ToString().Trim().Length > 0)
                builder.AppendLine("TEL;TYPE=CELL:" + DV.Table.Rows[r]["mobile"].ToString());
            //builder.AppendLine("URL;" + HomePage);

            if (DV.Table.Rows[r]["mobile2"].ToString().Trim().Length > 0)
                builder.AppendLine("TEL;OTHER;VOICE:" + DV.Table.Rows[r]["mobile2"].ToString());

            if (DV.Table.Rows[r]["phone"].ToString().Trim().Length > 0)
                builder.AppendLine("TEL;HOME;VOICE:" + DV.Table.Rows[r]["phone"].ToString());

            if (DV.Table.Rows[r]["Email_TBLBD"].ToString().Trim().Length > 0)
                builder.AppendLine("TEL;TYPE=WORK:" + DV.Table.Rows[r]["Email_TBLBD"].ToString());

            if (DV.Table.Rows[r]["Email1"].ToString().Trim().Length > 0)
                builder.AppendLine("EMAIL;PREF;Home:" + DV.Table.Rows[r]["Email1"].ToString());

            if (DV.Table.Rows[r]["Email2"].ToString().Trim().Length > 0)
                builder.AppendLine("EMAIL;PREF;Other:" + DV.Table.Rows[r]["Email2"].ToString());

            if (DV.Table.Rows[r]["Picture"].ToString().Trim().Length > 0)
            {
                
                Bitmap b = (Bitmap)Bitmap.FromStream(new MemoryStream((byte[])DV.Table.Rows[r]["Picture"]));
                Bitmap output = new Bitmap(b, new Size(50, 50));
                byte[] imagebyte;
                
                MemoryStream ms = new MemoryStream();

                output.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                //return ms.ToArray();

                imagebyte = ms.ToArray();
                

                //Encoding utf8 = new UTF8Encoding();
                //Encoding win1252 = Encoding.GetEncoding(1252);
                //imagebyte = Encoding.Convert(utf8, win1252, imagebyte);
                
                //byte [] image = (byte [])DV.Table.Rows[r]["Picture"];
                //builder.AppendLine("PHOTO;ENCODING=BASE64;TYPE=JPEG:");
                builder.AppendLine("PHOTO;ENCODING=B;ENCODING=BASE64;TYPE=JPEG:");
                builder.AppendLine(" " + Convert.ToBase64String(imagebyte,Base64FormattingOptions.InsertLineBreaks).Replace(Environment.NewLine, Environment.NewLine + " "));
                builder.AppendLine(string.Empty);
            }

            builder.AppendLine("END:VCARD");

            builder.AppendLine(string.Empty);
            //return builder.ToString();
        }

        Response.Clear();
        Response.ClearContent();
        Response.ClearHeaders();
        Response.ContentType = "text/x-vcard";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + "TBL-Employee.vcf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Write(builder.ToString());
        Response.End();
    }
    protected void cmdSearch_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
     
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblId = e.Row.FindControl("lb_status_id") as Label;
              if (lblId.Text != "1")
            {
                e.Row.ForeColor = System.Drawing.Color.Gray;
                e.Row.Font.Italic = true;
               
            }
        }
    }
    protected void lnkToggle_Click(object sender, ImageClickEventArgs e)
    {
        if (GridView1.Visible)
        {
            GridView1.Visible = false;
            ListView1.Visible = true;
            lnkToggle.ImageUrl = "~/Images/List-icon.png";
            lnkToggle.ToolTip = "List View";
        }
        else
        {
            ListView1.Visible = false;
            GridView1.Visible = true;
            lnkToggle.ImageUrl = "~/Images/Grid-icon.png";
            lnkToggle.ToolTip = "Grid View";
        }
    }
}