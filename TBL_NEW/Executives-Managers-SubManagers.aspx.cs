using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using System.IO;
using System.Data;

public partial class Executives_Managers_SubManagers : System.Web.UI.Page
{
    
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        

        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        RefreshTitle();
        string focusScript = "document.getElementById('" + txtSearch.ClientID + "').focus();";
        TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",200);");

        cmdExport.Visible = true;        
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

                    if (DV.Table.Rows[r]["email"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 8].Value = DV.Table.Rows[r]["email"].ToString();
                        worksheet.Cells[R, 8].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["phone"] != DBNull.Value)
                        worksheet.Cells[R, 9].Value = DV.Table.Rows[r]["phone"].ToString();

                    if (DV.Table.Rows[r]["mobile"] != DBNull.Value)
                        worksheet.Cells[R, 10].Value = DV.Table.Rows[r]["mobile"].ToString();
                        worksheet.Cells[R, 10].Style.WrapText = true;

                    if (DV.Table.Rows[r]["Email1"] != DBNull.Value)
                        worksheet.Cells[R, 11].Value = DV.Table.Rows[r]["Email1"].ToString() + ", " + DV.Table.Rows[r]["Email2"].ToString();
                        worksheet.Cells[R, 11].Style.WrapText = true;


                }

                worksheet.Cells["A1:G1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
                worksheet.Cells["A1:A"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["C1:C"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["E1:E"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
                worksheet.Cells["F1:F"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                //worksheet.Cells["G1:G"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                //worksheet.Cells["H1:H"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["A1:K"].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Top;
                //
                worksheet.Cells["A1:K1"].Style.Font.Bold = true;



                //Adding Properties
                xlPackage.Workbook.Properties.Title = "Executives-Manager-Sub Manager List";
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
            Response.AddHeader("Content-Disposition", "attachment;filename=" + "Executives-Managers-SubManagers.xlsx");
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
        lblTitle.Text = string.Format("{0} {1} {2}",
            (chkExecutives.Checked ? chkExecutives.Text + "," : ""),
            (chkManagers.Checked ? chkManagers.Text + "," : ""),
            (chkSubManagers.Checked ? chkSubManagers.Text + "," : "")
            ).Trim();
        if (lblTitle.Text.Trim().EndsWith(","))
            lblTitle.Text = lblTitle.Text.Substring(0, lblTitle.Text.Length - 1);

        if(chkExecutives.Checked && chkManagers.Checked && chkSubManagers.Checked)
            lblTitle.Text = "Executives, Managers, Sub Managers";     
        this.Title = "Executives, Managers, Sub Managers";        
    }
}