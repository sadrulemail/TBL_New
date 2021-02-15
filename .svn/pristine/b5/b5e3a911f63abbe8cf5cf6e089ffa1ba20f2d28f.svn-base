using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using System.IO;
using System.Data;
using System.Text;

public partial class Branches : System.Web.UI.Page
{
    TrustControl TrustControl1; 

    protected void Page_Load(object sender, EventArgs e)
    {        
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        //if (!IsPostBack)
        {
            string focusScript = "document.getElementById('" + txtSearch.ClientID + "').focus();";
            TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",200);");
        }

        this.Title = "Branch List";
        if (IsPostBack)
        {
            StringBuilder BranchTypeIDs = new StringBuilder();
            StringBuilder ClusterIDs = new StringBuilder();

            foreach (ListItem LS in cboClusters.Items)
                if (LS.Selected) ClusterIDs.Append(string.Format("{0}", LS.Value + ","));

            foreach (ListItem LS in cboType.Items)
                if (LS.Selected) BranchTypeIDs.Append(string.Format("{0}", LS.Value + ","));            

            SqlDataSource1.SelectParameters["ClusterIDs"].DefaultValue = ClusterIDs.ToString();
            SqlDataSource1.SelectParameters["BranchTypeIDs"].DefaultValue = BranchTypeIDs.ToString();            

            GridView1.DataBind();

        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void cboType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cboType.SelectedIndex == 0)
            cboType.BackColor = System.Drawing.Color.Transparent;
        else
            cboType.BackColor = System.Drawing.Color.Yellow;

        GridView1.DataBind();
    }
    //protected void cboClusters_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    GridView1.DataBind();
    //}
    
    protected void GridView1_DataBound(object sender, EventArgs e)
    {        
        //try
        //{
        //    if (TrustControl1.isRole("ADMIN") || TrustControl1.isRole("EDITOR"))
        //    {
        //        //GridView1.Columns[GridView1.Columns.Count-1].Visible = true;
        //    }
        //}
        //catch (Exception) { }
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
        if (DetailsView1.CurrentMode == DetailsViewMode.ReadOnly)
            DetailsView1.CellPadding = 4;
        else
            DetailsView1.CellPadding = 2;
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
                ExcelWorksheet worksheet = xlPackage.Workbook.Worksheets.Add("Branches");
                int StartRow = 1;

                //Adding Title Row
                worksheet.Cells[StartRow, 1].Value = "ID";
                worksheet.Cells[StartRow, 2].Value = "Branch Name";
                worksheet.Cells[StartRow, 3].Value = "Branch Address";
                worksheet.Cells[StartRow, 4].Value = "Prefix";
                worksheet.Cells[StartRow, 5].Value = "Phone";
                worksheet.Cells[StartRow, 6].Value = "Fax";
                worksheet.Cells[StartRow, 7].Value = "BEFTN";
                worksheet.Cells[StartRow, 8].Value = "TYPE";
                worksheet.Cells[StartRow, 9].Value = "Division";
                worksheet.Cells[StartRow, 10].Value = "District";
                worksheet.Cells[StartRow, 11].Value = "Thana";

                worksheet.Column(1).Width = 8;
                worksheet.Column(2).Width = 35;
                worksheet.Column(3).Width = 35;
                worksheet.Column(4).Width = 8;
                worksheet.Column(5).Width = 25;
                worksheet.Column(6).Width = 20;
                worksheet.Column(7).Width = 12;
                worksheet.Column(8).Width = 20;
                worksheet.Column(9).Width = 12;
                worksheet.Column(10).Width = 12;
                worksheet.Column(11).Width = 12;


                DataView DV = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                for (int r = 0; r < DV.Table.Rows.Count; r++)
                {
                    int R = StartRow + r + 1;

                    if (DV.Table.Rows[r]["BranchID"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 1].Value = DV.Table.Rows[r]["BranchID"].ToString();
                        //worksheet.Cells[R, 1].Style.Numberformat.Format = "MM/dd/yyyy";
                    }


                    if (DV.Table.Rows[r]["BranchName"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 2].Value = DV.Table.Rows[r]["BranchName"].ToString();
                        worksheet.Cells[R, 2].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["BranchAddress"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 3].Value = DV.Table.Rows[r]["BranchAddress"];
                        worksheet.Cells[R, 3].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["BranchPrefix"] != DBNull.Value)
                        worksheet.Cells[R, 4].Value = DV.Table.Rows[r]["BranchPrefix"].ToString();

                    if (DV.Table.Rows[r]["phoneno"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 5].Value = DV.Table.Rows[r]["phoneno"].ToString();
                        worksheet.Cells[R, 5].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["faxno"] != DBNull.Value)
                    {
                        worksheet.Cells[R, 6].Value = DV.Table.Rows[r]["faxno"].ToString();
                        worksheet.Cells[R, 6].Style.WrapText = true;
                    }

                    if (DV.Table.Rows[r]["BEFTN_Code"] != DBNull.Value)
                        worksheet.Cells[R, 7].Value = DV.Table.Rows[r]["BEFTN_Code"].ToString();

                    if (DV.Table.Rows[r]["Type"] != DBNull.Value)
                        worksheet.Cells[R, 8].Value = DV.Table.Rows[r]["Type"].ToString();

                    if (DV.Table.Rows[r]["DIV_NAME"] != DBNull.Value)
                        worksheet.Cells[R, 9].Value = DV.Table.Rows[r]["DIV_NAME"].ToString();

                    if (DV.Table.Rows[r]["DIST_NAME"] != DBNull.Value)
                        worksheet.Cells[R, 10].Value = DV.Table.Rows[r]["DIST_NAME"].ToString();

                    if (DV.Table.Rows[r]["THANA_NAME"] != DBNull.Value)
                        worksheet.Cells[R, 11].Value = DV.Table.Rows[r]["THANA_NAME"].ToString();

                }

                worksheet.Cells["A1:K1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["A1:A"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;               
                worksheet.Cells["D1:D"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["G1:G"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["H1:H"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells["A1:H"].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Top;
                //
                worksheet.Cells["A1:H1"].Style.Font.Bold = true;



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
            Response.AddHeader("Content-Disposition", "attachment;filename=" + "Branches.xlsx");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(content);
            Response.End();
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
    }
    protected void dboDivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DropDownList dboDistrict = (DropDownList)DetailsView1.FindControl("dboDistrict");

        //if (dboDistrict != null)
        //{
        //    dboDistrict.Items.Clear();
        //    string val = ((HiddenField)(DetailsView1.FindControl("hid_Dist_Code"))).Value;
        //    dboDistrict.Items.Add(new ListItem("Select District", val));
        //    dboDistrict.DataBind();            
        //}
        //modal.Show();
    }
    
    protected void SqlDataSourceDistrict_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //DropDownList ddlCategory = (DropDownList)DetailsView1.FindControl("ddlCategory");

        //if (ddlCategory != null)
        //{
        //    e.Command.Parameters["@Category"].Value = ddlCategory.SelectedValue;
        //}
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

    protected void dboDivision_DataBound(object sender, EventArgs e)
    {

    }
    protected void dboDivision_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownList dboDistrict = ((DropDownList)DetailsView1.FindControl("dboDistrict"));
        dboDistrict.Items.Clear();
        dboDistrict.DataBind();       

        modal.Show();
    }
    protected void SqlDataSource2_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {        
        e.Command.Parameters["@Dist_Code"].Value = ((DropDownList)DetailsView1.FindControl("dboDistrict")).SelectedItem.Value;
        e.Command.Parameters["@Thana_Code"].Value = ((DropDownList)DetailsView1.FindControl("dboThana")).SelectedItem.Value;
    }
    protected void DetailsView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (TrustControl1.isRole("ADMIN") || TrustControl1.isRole("EDITOR"))
            {
                DetailsView1.Fields[DetailsView1.Fields.Count - 1].Visible = true;
                DetailsView1.Fields[DetailsView1.Fields.Count - 2].Visible = true;
            }
        }
        catch (Exception) { }
    }
}