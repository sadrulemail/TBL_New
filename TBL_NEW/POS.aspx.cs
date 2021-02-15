using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using System.IO;
using System.Data;

public partial class POS : System.Web.UI.Page
{
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "POS Merchant";

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
            if (TrustControl1.isRole("ADMIN") || TrustControl1.isRole("EDITOR"))
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
   
}