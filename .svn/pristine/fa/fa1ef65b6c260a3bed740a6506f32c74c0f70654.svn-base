using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BEFTN_List_Show : System.Web.UI.Page
{
    TrustControl TrustControl1;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "Routing Numbers";
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");


        if (TabContainer1.ActiveTabIndex == 0)
        {
            //cboBank.DataBind();
            string focusScript = "document.getElementById('" + txtFilter.ClientID + "').focus();";
            TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",200);");
            TabContainer1.Width = new Unit(1100, UnitType.Pixel);
        }
        else if (TabContainer1.ActiveTabIndex == 1)
        {
            string focusScript = "document.getElementById('" + txtBankFilter.ClientID + "').focus();";
            TrustControl1.ClientScriptStartup("setTimeout(\"" + focusScript + ";\",200);");
            TabContainer1.Width = new Unit(700, UnitType.Pixel);
        }

    }
    //protected void cmdFilter_Click(object sender, EventArgs e)
    //{
    //    GridView1.DataBind();
    //}
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatus.Text = string.Format("Total: <b>{0:N0}</b>", e.AffectedRows);
    }

    protected void SqlDataSource2_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblStatusBank.Text = string.Format("Total: <b>{0}</b>", e.AffectedRows);
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        try
        {
            if (TrustControl1.isRole("ADMIN", "EDITOR", "BEFTN_EDIT"))
            {
                GridView1.Columns[GridView1.Columns.Count - 1].Visible = true;
            }
        }
        catch (Exception) { }
    }
    protected void dboDivision2_DataBound(object sender, EventArgs e)
    {

    }
    protected void dboDivision2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownList dboDistrict2 = ((DropDownList)DetailsView1.FindControl("dboDistrict2"));
        dboDistrict2.Items.Clear();
        dboDistrict2.DataBind();

        modal.Show();
    }

    protected void dboDistrict2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dboThana2 = ((DropDownList)DetailsView1.FindControl("dboThana2"));
        dboThana2.Items.Clear();
        dboThana2.DataBind();

        String Thana = ((HiddenField)(DetailsView1.FindControl("hidThana"))).Value;

        try
        {
            foreach (ListItem LI in dboThana2.Items)
                if (LI.Value == Thana)
                    LI.Selected = true;
                else
                    LI.Selected = false;
        }
        catch (Exception) { }
        modal.Show();
    }
    protected void dboDistrict2_DataBound(object sender, EventArgs e)
    {
        DropDownList dboDistrict2 = ((DropDownList)DetailsView1.FindControl("dboDistrict2"));
        String District = ((HiddenField)(DetailsView1.FindControl("hidDistrict"))).Value;

        try
        {
            foreach (ListItem LI in dboDistrict2.Items)
                if (LI.Value == District)
                    LI.Selected = true;
                else
                    LI.Selected = false;
        }
        catch (Exception) { }

        DropDownList dboThana2 = ((DropDownList)DetailsView1.FindControl("dboThana2"));
        dboThana2.Items.Clear();
        dboThana2.DataBind();
    }
    protected void dboThana2_DataBound(object sender, EventArgs e)
    {
        DropDownList dbo = (DropDownList)sender;
        String Thana2 = ((HiddenField)(DetailsView1.FindControl("hidThana"))).Value;

        try
        {
            foreach (ListItem LI in dbo.Items)
                if (LI.Value == Thana2)
                    LI.Selected = true;
                else
                    LI.Selected = false;
        }
        catch (Exception)
        {
            //dbo.Items[0].Value = Thana;
        }
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        //GridView1.DataBind();
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
    }
    protected void DetailsView1_ModeChanged(object sender, EventArgs e)
    {
        modal.Show();
    }
    protected void SqlDataSourceModal_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@Dist_Code"].Value = ((DropDownList)DetailsView1.FindControl("dboDistrict2")).SelectedItem.Value;
        e.Command.Parameters["@Thana_Code"].Value = ((DropDownList)DetailsView1.FindControl("dboThana2")).SelectedItem.Value;

        
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        modal.Show();
    }
    protected void SqlDataSourceModal_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        string Msg = string.Format("{0}", e.Command.Parameters["@Msg"].Value);
        bool Done = (bool)e.Command.Parameters["@Done"].Value;
        //GridView1.DataBind();
        if (!Done)
            TrustControl1.ClientMsg(string.Format("{0}", Msg));
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            hidID.Value = string.Format("{0}", e.CommandArgument);
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            modal.Show();
        }
    }
    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        GridView1.SelectedIndex = -1;
    }
    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "New")
            hidID.Value = "";
    }
    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        GridView1.SelectedIndex = -1;
        hidID.Value = e.Values["Routing_Number"].ToString();
    }
}
