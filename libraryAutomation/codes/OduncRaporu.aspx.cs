using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkınSoft
{
   
    public partial class OduncRaporu : System.Web.UI.Page
    {

        //Connection String from web.config File  
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowDataAll();
                RbHepsi.Checked = true;
            }
        }

        //ShowData method for Displaying Data in Gridview  
        protected void ShowDataAll()
        {
            GridViewAll.Visible = true;
            GridView1.Visible = false;

            dt = new DataTable();
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            adapt = new SqlDataAdapter("Select StudentNum,StudentName,BookISBN,BookName ,GivenDate,DeadLine,IsTakenBack from Borrow", con);

            adapt.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridViewAll.DataSource = dt;
                GridViewAll.DataBind();
            }
            con.Close();

        }

        protected void ShowDataTakenBack()
        {
            GridViewAll.Visible = true;
            GridView1.Visible = false;

            dt = new DataTable();
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            adapt = new SqlDataAdapter("Select StudentNum,StudentName,BookISBN,BookName ,GivenDate,DeadLine, IsTakenBack from Borrow where IsTakenBack='Evet'", con);

            adapt.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridViewAll.DataSource = dt;
                GridViewAll.DataBind();
            }
            con.Close();

        }

        protected void ShowDataNotTakenBack()
        {

            GridViewAll.Visible = false;
            GridView1.Visible = true;
                
            dt = new DataTable();
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            adapt = new SqlDataAdapter("Select StudentNum,StudentName,BookISBN,BookName ,GivenDate,DeadLine, IsTakenBack from Borrow where IsTakenBack='Hayır'", con);

            adapt.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();


        }
        

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //New Edit Index property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ShowDataNotTakenBack();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_StudentNum") as Label;
            DropDownList arrangement = GridView1.Rows[e.RowIndex].FindControl("DDTakeBack") as DropDownList;

            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Borrow set IsTakenBack='Evet' where StudentNum='" + id.Text + "'", con);

            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowDataNotTakenBack();
        }


        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowDataNotTakenBack();
        }
        
        public void RadioButton_CheckedChanged(object sender, System.EventArgs e)
        {
            if (RbHepsi.Checked == true)
            {
                ShowDataAll();

            }
            else if (RbTeslimEdilen.Checked == true)
            {
                ShowDataTakenBack();
            }
            else if(RbTeslimEdilmeyen.Checked==true)
            {
                ShowDataNotTakenBack();

            }

        } //end RadioButton_Checked













    } //end class
}  //end namespace




