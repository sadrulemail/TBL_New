using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmpBranch : System.Web.UI.Page
{
    TrustControl TrustControl1;
    string BranchName = "";
    string DepartmentName = "";
    string BranchID = "";
    string DeptID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        TrustControl1 = (TrustControl)Master.FindControl("TrustControl1");

        BranchID = string.Format("{0}", Request.QueryString["branch"]);
        DeptID = string.Format("{0}", Request.QueryString["dept"]);

        if (BranchID.Length < 1)
        {
            Response.Redirect("~/Branches.aspx", true);
        }
        else
        {
            if (BranchID == "1")
            {
                if (DeptID.Length == 0)
                {
                    lblTitle.Text = "Divisions of Head Office";
                    PanelDeptList.Visible = true;
                    PanelEmp.Visible = false;
                    PanelBranch.Visible = true;
                }
                else
                {
                    GridViewDeptName.Visible = true;
                    GridViewPanelBranch.Visible = false;
                    PanelDeptName.Visible = true;                    
                }
            }
            else
            {
                PanelBranch.Visible = true;
            }            
        }        
    }
    protected void SqlDataSourceExecutives_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblExecutives.Text = string.Format("Executives <b>({0})</b>", e.AffectedRows);
        PanelEmpExecutives.Visible = e.AffectedRows > 0;
    }
    protected void SqlDataSourceOfficers_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblOfficers.Text = string.Format("Officers <b>({0})</b>", e.AffectedRows);
    }
    protected void SqlDataSourceSalesOff_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblSales.Text = string.Format("Sales & Marketing <b>({0})</b>", e.AffectedRows);

        PanelSales.Visible = (e.AffectedRows > 0);
    }
    protected void GridViewDept_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (TrustControl1.isRole("ADMIN") || TrustControl1.isRole("EDITOR"))
            {
                GridViewDept.Columns[GridViewDept.Columns.Count - 1].Visible = true;
            }
        }
        catch (Exception) { }

        
    }

    protected void GridViewPanelBranch_DataBound(object sender, EventArgs e)
    {
        try
        {
            BranchName = ((HiddenField)GridViewPanelBranch.Rows[0].FindControl("hidBranchName")).Value;
            this.Title = string.Format("{0}. {1}", BranchID, BranchName);
        }
        catch (Exception) { }
    }

    protected void GridViewDeptName_DataBound(object sender, EventArgs e)
    {
        if (DeptID != "")
        {
            try
            {
                DepartmentName = ((HiddenField)GridViewDeptName.Rows[0].FindControl("hidDepartment")).Value;
                this.Title = DepartmentName;
            }
            catch (Exception) { }
        }
    }
    protected void SqlDataSourceTeams_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblTeams.Text = string.Format("Departments/Teams/Groups <b>({0})</b>", e.AffectedRows);
        
        if (e.AffectedRows < 1)
            PanelTeam.Visible = false;                   
    }


    protected void cmdDept_DataBound(object sender, EventArgs e)
    {
        string DeptID = string.Format("{0}", Request.QueryString["dept"]);
        foreach (ListItem LI in cmdDept.Items)
            LI.Selected = false;

        foreach (ListItem LI in cmdDept.Items)
            if (LI.Value == DeptID)
                LI.Selected = true;
    }        

    protected void cmdDept_SelectedIndexChanged(object sender, EventArgs e)
    {        string DeptID = string.Format("{0}", cmdDept.SelectedItem.Value);

        if (DeptID == "-1")
            Response.Redirect(string.Format("EmpBranch.aspx?branch={0}", Request.QueryString["branch"]), true);
        else
            Response.Redirect(string.Format("EmpBranch.aspx?branch={0}&dept={1}", Request.QueryString["branch"], cmdDept.SelectedItem.Value), true);
    }
}