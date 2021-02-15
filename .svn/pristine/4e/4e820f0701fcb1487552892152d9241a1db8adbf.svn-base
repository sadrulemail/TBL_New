using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using OfficeOpenXml;
using System.Data;

public partial class NewPics : System.Web.UI.Page
{ 
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        //try
        //{
        //    if (!TrustControl1.isRole("ADMIN"))
        //    {
        //        GridView1.Visible = false;
        //    }
        //}
        //catch (Exception) { }

        this.Title = "New Profile Pictues";
    }

    public string ToRecentDateTime(object input)
    {
        return TrustControl1.ToRecentDateTime(input);
    }

    public string ToRelativeDate(object input)
    {
        return TrustControl1.ToRelativeDate(input);
    }
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatus.Text = string.Format("Total Pictures: <b>{0:N0}</b>", e.AffectedRows);
    }
    protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatus1.Text = string.Format("Total: <b>{0:N0}</b>", e.AffectedRows);
    }
    protected void cmdExport_Click(object sender, EventArgs e)
    {
        try
        {
            string FileName = Path.GetTempFileName();
            if (File.Exists(FileName)) File.Delete(FileName);
            FileInfo FI = new FileInfo(FileName);

            int LastRow = 0;

            using (ExcelPackage xlPackage = new ExcelPackage(FI))
            {
                ExcelWorksheet worksheet = xlPackage.Workbook.Worksheets.Add("NoImageEmp");
                int StartRow = 1;

                //Adding Title Row
                worksheet.Cells[StartRow, 1].Value = "EmpID";
                worksheet.Cells[StartRow, 2].Value = "Name";
                worksheet.Cells[StartRow, 3].Value = "Designation";
                worksheet.Cells[StartRow, 4].Value = "Department";
                worksheet.Cells[StartRow, 5].Value = "Branch";


                DataView DV = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                for (int r = 0; r < DV.Table.Rows.Count; r++)
                {
                    int R = StartRow + r + 1;
                    LastRow++;

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

                    if (DV.Table.Rows[r]["Department"] != DBNull.Value)
                        worksheet.Cells[R, 4].Value = DV.Table.Rows[r]["Department"].ToString();

                    if (DV.Table.Rows[r]["BranchName"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 5].Value = DV.Table.Rows[r]["BranchName"].ToString();
                        worksheet.Cells[R, 5].Style.WrapText = true;
                    }

                   

                }

                worksheet.Cells["A1:E1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;                //
                worksheet.Cells["A1:E1"].Style.Font.Bold = true;
                worksheet.Cells["A1:E" + LastRow].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Top;
                //worksheet.Cells.AutoFitColumns();


                //Adding Properties
                xlPackage.Workbook.Properties.Title = "Trust Bank Branches";
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
            Response.AddHeader("Content-Disposition", "attachment;filename=" + "No_Image_Emp.xlsx");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(content);
            Response.End();
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }
    protected void TabContainer1_ActiveTabChanged(object sender, EventArgs e)
    {
        if (TabContainer1.ActiveTab == tab2)
            cmdExport.Visible = true;
        else
            cmdExport.Visible = false;
    }
}
