using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkınSoft
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
                        if(Session["UserName"]!=null& Session["UserMail"] != null)
                        {
                            lblUserName.Text = Session["UserName"].ToString();
                            lblUserMail.Text = Session["UserMail"].ToString();
                        }
                        else
                        {
                            Response.Redirect("Login.aspx");
                        }

                */

            lblUserName.Text = "Bahtiyar Sime";
            lblUserMail.Text = "bahtiyarsime@gmail.com";

        }

        protected void BtnLogOut_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Response.Redirect("Login.aspx");

        } //end BtnLogOut

        protected void BtnAddFaculty_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            if (con.State == System.Data.ConnectionState.Open)
            {
                try
                {
                    //sql command to insert

                    SqlCommand myCommand = new SqlCommand("INSERT INTO Faculty (FacultyName) VALUES ('" + txtNewFaculty.Text + "');", con);
                    int st = myCommand.ExecuteNonQuery();

                    if (st > 0)
                    {
                       Response.Write("<script>alert('Fakülte Ekleme İşlemi Başarılı')</script>");

                    } //end if
                    else
                    {
                        Response.Write("<script>alert('Fakülte Ekleme İşlemi Başarısız')</script>");

                    }

                } //end try
                catch
                {
                    Response.Write("<script>alert('Fakülte Ekleme İşlemi Başarısız')</script>");

                } //end catch


            } //end if connection control
            else
            {
                Response.Write("<script>alert('Veritabanı Bağlantı Durumu:Kapalı')</script>");

            } //end else conntection control

            con.Close();

        } //end btnAddFaculty

        protected void BtnAddDeparmant_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            if (con.State == System.Data.ConnectionState.Open)
            {
                try
                {
                    //sql command to insert

                    SqlCommand myCommand = new SqlCommand("INSERT INTO Departman (FacultyName,DepartmanName) VALUES ('" +DDFaculty.SelectedItem.Text + "','"+txtNewDepartmant.Text+"');", con);

                    int st = myCommand.ExecuteNonQuery();

                    if (st > 0)
                    {
                        Response.Write("<script>alert('Bölüm Ekleme İşlemi Başarılı')</script>");

                    } //end if
                    else
                    {
                        Response.Write("<script>alert('Bölüm Ekleme İşlemi Başarısız')</script>");

                    }

                } //end try
                catch
                {
                    Response.Write("<script>alert('Bölüm Ekleme İşlemi Başarısız')</script>");

                } //end catch


            } //end if connection control
            else
            {
                Response.Write("<script>alert('Veritabanı Bağlantı Durumu:Kapalı')</script>");

            } //end else conntection control

            con.Close();
        } //end  BtnAddDepartmant_click



    } //end class
}