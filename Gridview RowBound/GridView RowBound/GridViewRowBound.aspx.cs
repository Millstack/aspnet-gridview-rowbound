using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GridView_RowBound_GridViewRowBound : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["Ginie"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGridViewWithBoqDetails();
        }
    }

    private void FillGridViewWithBoqDetails()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string sql = "SELECT * FROM BoQ_Upload";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();

            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            Session["BoQDT"] = dt;
            con.Close();

            gridDynamicBOQ.DataSource = dt;
            gridDynamicBOQ.DataBind();
        }
    }

    protected void GridDyanmic_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
        {
            // Set the row in edit mode
            e.Row.RowState = e.Row.RowState ^ DataControlRowState.Edit;
        }
    }

    protected void btnBasicAmount_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["BoQDT"];

        int basicAmount = 0;

        if (dt != null)
        {
            // Iterate through each row in the GridView
            foreach (GridViewRow row in gridDynamicBOQ.Rows)
            {
                TextBox boqQty = row.FindControl("QtyMeasure") as TextBox;

                if (boqQty.Text.ToString() != "")
                {
                    if (Convert.ToInt32(boqQty.Text) != 0)
                    {
                        int qtyMeasuredValue = Convert.ToInt32(boqQty.Text.ToString());

                        int rowIndex = row.RowIndex;
                        int boqUnitRate = Convert.ToInt32(dt.Rows[rowIndex]["BoqRate"]);

                        if (qtyMeasuredValue != 0 && boqUnitRate != 0)
                        {
                            int prod = (qtyMeasuredValue * boqUnitRate);

                            // Perform operations with the value
                            basicAmount = basicAmount + prod;
                        }
                    }
                }
                    
                // You can break the loop if you only need the value from the first row
                //break;
            }

            string basicAmountStr = basicAmount.ToString("N0");

            txtBasicAmt.CssClass = "form-control fw-normal border border-2";
            txtBasicAmt.Text = basicAmountStr;
        }
    }
}