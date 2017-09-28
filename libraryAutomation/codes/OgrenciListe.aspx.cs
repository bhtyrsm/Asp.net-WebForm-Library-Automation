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
    public partial class OgrenciListe : System.Web.UI.Page
    {

        //Connection String from web.config File  
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
        }

        //ShowData method for Displaying Data in Gridview  
   protected void ShowData()
   {

   dt = new DataTable();
   con = new SqlConnection( WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            adapt = new SqlDataAdapter("Select StudentNum,StudentName,StudentFaculty,StudentDepartmant ,StudentAdress,StudentPhoneNum,StudentRegistDate from Student", con);

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
            ShowData();
        }

   protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_StudentNum") as Label;
            TextBox Sname = GridView1.Rows[e.RowIndex].FindControl("txt_StudentName") as TextBox;
            TextBox Sfaculty = GridView1.Rows[e.RowIndex].FindControl("txt_StudentFaculty") as TextBox;
            TextBox Sdepartmant = GridView1.Rows[e.RowIndex].FindControl("txt_StudentDepartmant") as TextBox;
            TextBox Sadress = GridView1.Rows[e.RowIndex].FindControl("txt_StudentAdress") as TextBox;
            TextBox SphoneNum = GridView1.Rows[e.RowIndex].FindControl("txt_StudentPhone") as TextBox;
            TextBox SregDate = GridView1.Rows[e.RowIndex].FindControl("txt_StudentRegDate") as TextBox;


            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            
           
            


            //updating the record  
            SqlCommand cmd = new SqlCommand("Update Student set StudentName='" + Sname.Text + "',StudentFaculty='" + Sfaculty.Text+ "',StudentDepartmant='"+Sdepartmant.Text+ "',StudentAdress='"+Sadress.Text+ "',StudentPhoneNum='"+SphoneNum.Text+ "' where StudentNum= + '"+id.Text+"'", con);

            cmd.ExecuteNonQuery();
            con.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            //Call ShowData method for displaying updated data  
            ShowData();
        }


   protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ShowData();
        }


    }
}