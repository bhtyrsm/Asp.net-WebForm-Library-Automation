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
    public partial class OgrenciKayit : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            /* Response.Write("<script>alert('Sepetten ürün silme işlemi başarılı')</script>");
            s
                  int a = commandOfPayment.ExecuteNonQuery();
            
            */



        }
       
        protected void BtnStudentRecord_Click(object sender, EventArgs e)
        {
            

          con = new SqlConnection(
          WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            if (con.State == System.Data.ConnectionState.Open)
            {

                try
                {
                    //sql command to insert

                SqlCommand myCommand = new SqlCommand("INSERT INTO Student (StudentNum,StudentName,StudentFaculty,StudentDepartmant,StudentAdress,StudentVillAdress,StudentPhoneNum,StudentRegistDate) VALUES ('"+txtStudentNum.Text+"','"+txtStudentName.Text+"','" +DDFaculty.SelectedItem.Text + "','"+DDDepartman.SelectedItem.Text+"','"+txtStudentAdress.Text+"','"+txtStudentCountryAdress.Text+"','"+txtStudentPhoneNumber.Text+ "','"+txtRegDate.Text+"');", con);

                    int st = myCommand.ExecuteNonQuery();

                    if (st > 0) 
                    {
                        LblState.ForeColor =Color.Green;
                        LblState.Text = "Öğrenci Ekleme İşlemi Başarılı";
                    } //end if
                    else
                    {
                        LblState.ForeColor = Color.Red;
                        LblState.Text = "Öğrenci Ekleme İşlemi Başarısız";
                    }



                } //end try
                catch
                {
                    LblState.ForeColor = Color.Red;
                    LblState.Text = "Öğrenci Ekleme işlemi Başarısız";

                } //end catch
             

            } //end if connection control
            else
            {
                LblState.ForeColor = Color.Red;
                LblState.Text = "Bağlantı Durumu : Kapalı";

            } //end else conntection control

            con.Close();

         

        }  //end BtnStudenRecord_Clik


    }  //end class
}