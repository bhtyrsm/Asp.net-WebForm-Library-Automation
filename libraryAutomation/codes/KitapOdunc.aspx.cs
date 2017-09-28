using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkınSoft
{
    public partial class KitapOdunc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClTeslimTarih.Enabled = false;
            ClVerilenTarih.SelectedDate = DateTime.Today;
            ClTeslimTarih.SelectedDate = ClVerilenTarih.SelectedDate.AddDays(15);

            lblVerilenTarih.Text = ClVerilenTarih.SelectedDate.ToShortDateString();
            lblTeslimTarih.Text = ClVerilenTarih.SelectedDate.AddDays(15).ToShortDateString();


        }

        protected void ClVerilenTarih_SelectionChanged(object sender, EventArgs e)
        {
             lblVerilenTarih.Text = ClVerilenTarih.SelectedDate.ToShortDateString();
             lblTeslimTarih.Text = ClVerilenTarih.SelectedDate.AddDays(15).ToShortDateString();
             ClTeslimTarih.SelectedDate = ClVerilenTarih.SelectedDate.AddDays(15);

        }
       

        protected void BtnSearchStudent_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(
       WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            lblStudentsBook.Text = "";

            if (con.State == System.Data.ConnectionState.Open)
            {

                SqlCommand mycommand = new SqlCommand();
                mycommand.Connection = con;
                mycommand.CommandText = "Select BookName from Borrow where StudentNum like '" + txtStudentNum.Text+ "' and IsTakenBack like 'Hayır'";

                SqlDataReader myReader = mycommand.ExecuteReader();
                while (myReader.Read())
                {
                    

                    lblStudentsBook.Text += myReader["BookName"].ToString() + " ,";
                }
                myReader.Close();
                con.Close();




            }//end if con open
        } //end buton click

        protected void BtnBorrow_Click(object sender, EventArgs e)
        {
            String Sname = null;
            String Bname = null;

            try
            {
                SqlConnection con = new SqlConnection(
         WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

                con.Open();

                if (con.State == System.Data.ConnectionState.Open)
                {
                    SqlCommand mycommand = new SqlCommand();
                    mycommand.Connection = con;
                    mycommand.CommandText = "Select StudentName ,BookName from Student,Book where StudentNum like '"+txtStudentNum.Text+"' and BookISBN like '"+txtBookISBN.Text+"'";

                    SqlDataReader myReader = mycommand.ExecuteReader();
                    while (myReader.Read())
                    {

                         Sname= myReader["StudentName"].ToString();
                         Bname= myReader["BookName"].ToString();
                    }
                    myReader.Close();
                    con.Close();


                    con.Open();
                    SqlCommand NewCommand = new SqlCommand("INSERT INTO Borrow (StudentNum,StudentName,BookISBN,BookName,GivenDate,DeadLine,IsTakenBack) VALUES ('"+txtStudentNum.Text+"','"+Sname+"','" +txtBookISBN.Text+ "','"+Bname+"','" +ClVerilenTarih.SelectedDate.ToShortDateString()+ "','" +ClTeslimTarih.SelectedDate.ToShortDateString()+ "','Hayır');", con);

                    int st = NewCommand.ExecuteNonQuery();

                    if (st > 0)
                    {
                        lblState.ForeColor = System.Drawing.Color.Green;
                        lblState.Text = "işlem Başarılı ";

                    }
                    else
                    {
                        lblState.ForeColor = System.Drawing.Color.Green;
                        lblState.Text = "işlem başarısız ";

                    }




                } //end if
                else
                {
                    lblState.ForeColor = System.Drawing.Color.Red;
                    lblState.Text = "Veritabanı Bağlantısı Kapalı!";

                }
                } //end try
            catch
            {
                lblState.ForeColor = System.Drawing.Color.Red;
                lblState.Text = "İşlem Başarısız! Bilgileri kontrol ediniz!";
            } //end catch
        } //end btnborrow click
    }
}