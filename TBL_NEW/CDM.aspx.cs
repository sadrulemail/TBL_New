using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using System.IO;
using System.Data;

public partial class CDM : System.Web.UI.Page
{
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "T-Lobby & CDMs";

        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        string focusScript = "document.getElementById('" + txtSearch.ClientID + "').focus();";
        TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",200);");
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (TrustControl1.isRole("ADMIN") || TrustControl1.isRole("EDITOR") || TrustControl1.isRole("ATM_EDIT"))
            {
                GridView1.Columns[GridView1.Columns.Count - 1].Visible = true;
            }
        }
        catch (Exception) { }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.Rows[e.NewEditIndex].Focus();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.Rows[e.RowIndex].Focus();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridView1.Rows[e.RowIndex].Focus();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        modal.Show();
    }
    protected void DetailsView1_ModeChanged(object sender, EventArgs e)
    {
        modal.Show();
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
                ExcelWorksheet worksheet = xlPackage.Workbook.Worksheets.Add("ATM");
                int StartRow = 1;

                //Adding Title Row
                worksheet.Cells[StartRow, 1].Value = "ID";
                worksheet.Cells[StartRow, 2].Value = "Name";
                worksheet.Cells[StartRow, 3].Value = "Address";
                worksheet.Cells[StartRow, 4].Value = "Maintaining Branch";
                worksheet.Cells[StartRow, 5].Value = "Branch ID";
                worksheet.Cells[StartRow, 6].Value = "Link Vendor 1";
                worksheet.Cells[StartRow, 7].Value = "Link Vendor 2";

                worksheet.Column(1).Width = 8;
                worksheet.Column(2).Width = 35;
                worksheet.Column(3).Width = 35;
                worksheet.Column(4).Width = 25;
                worksheet.Column(5).Width = 10;
                worksheet.Column(6).Width = 20;
                worksheet.Column(7).Width = 20;


                worksheet.Cells[1, 4].Style.WrapText = true;

                DataView DV = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                for (int r = 0; r < DV.Table.Rows.Count; r++)
                {
                    int R = StartRow + r + 1;

                    if (DV.Table.Rows[r]["ID"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 1].Value = DV.Table.Rows[r]["ID"].ToString();
                        //worksheet.Cells[R, 1].Style.Numberformat.Format = "MM/dd/yyyy";
                    }


                    if (DV.Table.Rows[r]["Name"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 2].Value = DV.Table.Rows[r]["Name"].ToString();
                        worksheet.Cells[R, 2].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["Address"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 3].Value = DV.Table.Rows[r]["Address"];
                        worksheet.Cells[R, 3].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["FeedingBranchName"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 4].Value = DV.Table.Rows[r]["FeedingBranchName"].ToString();
                        worksheet.Cells[R, 5].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["FeedingBranch"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 5].Value = DV.Table.Rows[r]["FeedingBranch"].ToString();

                    }

                    if (DV.Table.Rows[r]["LinkVendor1Name"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 6].Value = DV.Table.Rows[r]["LinkVendor1Name"].ToString();
                        worksheet.Cells[R, 6].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["LinkVendor2Name"] != DBNull.Value)
                        worksheet.Cells[R, 7].Value = DV.Table.Rows[r]["LinkVendor2Name"].ToString();


                }

                worksheet.Cells["A1:G1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["A1:A"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                //worksheet.Cells["C1:C"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["E1:E"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                //worksheet.Cells["G1:G"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                //worksheet.Cells["H1:H"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["A1:G"].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Top;
                //
                worksheet.Cells["A1:G1"].Style.Font.Bold = true;



                //Adding Properties
                xlPackage.Workbook.Properties.Title = "Trust Bank CDM List";
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
            Response.AddHeader("Content-Disposition", "attachment;filename=" + "CDM_List.xlsx");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(content);
            Response.End();
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }
    protected string getBranchAddress(object val)
    {
        string RetVal = string.Format("{0}", val);
        string[] SS = RetVal.Split('\n');

        RetVal = "";
        foreach (string S in SS)
        {
            if (S.Trim().EndsWith(","))
                RetVal += S.Trim() + " ";
            else
                RetVal += S.Trim() + ", ";
        }

        if (RetVal.EndsWith(", "))
            RetVal = RetVal.Substring(0, RetVal.Length - 2);
        return RetVal;
    }
    protected void dboDivision_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownList dboDistrict = ((DropDownList)DetailsView1.FindControl("dboDistrict"));
        dboDistrict.Items.Clear();
        dboDistrict.DataBind();

        modal.Show();
    }
    protected void dboDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dboThana = ((DropDownList)DetailsView1.FindControl("dboThana"));
        dboThana.Items.Clear();
        dboThana.DataBind();

        String Thana = ((HiddenField)(DetailsView1.FindControl("hidThana"))).Value;

        try
        {
            foreach (ListItem LI in dboThana.Items)
                if (LI.Value == Thana)
                    LI.Selected = true;
                else
                    LI.Selected = false;
        }
        catch (Exception) { }
        modal.Show();
    }
    protected void dboDistrict_DataBound(object sender, EventArgs e)
    {
        DropDownList dboDistrict = ((DropDownList)DetailsView1.FindControl("dboDistrict"));
        String District = ((HiddenField)(DetailsView1.FindControl("hidDistrict"))).Value;

        try
        {
            foreach (ListItem LI in dboDistrict.Items)
                if (LI.Value == District)
                    LI.Selected = true;
                else
                    LI.Selected = false;
        }
        catch (Exception) { }

        DropDownList dboThana = ((DropDownList)DetailsView1.FindControl("dboThana"));
        dboThana.Items.Clear();
        dboThana.DataBind();
    }
    protected void dboThana_DataBound(object sender, EventArgs e)
    {
        DropDownList dbo = (DropDownList)sender;
        String Thana = ((HiddenField)(DetailsView1.FindControl("hidThana"))).Value;

        try
        {
            foreach (ListItem LI in dbo.Items)
                if (LI.Value == Thana)
                    LI.Selected = true;
                else
                    LI.Selected = false;
        }
        catch (Exception)
        {
            //dbo.Items[0].Value = Thana;
        }
    }
    protected void SqlDataSource2_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@Dist_Code"].Value = ((DropDownList)DetailsView1.FindControl("dboDistrict")).SelectedItem.Value;
        e.Command.Parameters["@Thana_Code"].Value = ((DropDownList)DetailsView1.FindControl("dboThana")).SelectedItem.Value;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            if (drv["IsActive"].ToString().Equals("False"))
            {
                e.Row.ForeColor = System.Drawing.Color.Silver;
                e.Row.ToolTip = "Not Active";
                e.Row.Style.Add("cursor", "no-drop");
            }
            else
            {
                //e.Row.BackColor = System.Drawing.Color.Green;
            }
        }
    }
}