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
    public partial class KitapKayıt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnBookRecord_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["AkinSoftConnect"].ConnectionString);

            con.Open();

            if (con.State == System.Data.ConnectionState.Open)
            {

                try
                {
                    //sql command to insert

                    SqlCommand myCommand = new SqlCommand("INSERT INTO Book (BookCode,BookISBN,BookName,BookCategory,BookAuthor,BookRelYear,BookPageNum,BookKeys) VALUES ('" + txtBookCode.Text + "','" + txtBookIsbnCode.Text + "','" + txtBookName.Text + "','" + txtBookCategory.Text + "','" + txtBookAuthor.Text + "','" +txtBookYear.Text + "','" + Int32.Parse(txtPageNumber.Text) + "','" +txtBookKeys.Text + "');", con);

                    //control that command is worked ?

                    int st = myCommand.ExecuteNonQuery();

                    if (st > 0)
                    {
                        LblState.ForeColor = Color.Green;
                        LblState.Text = "Kitap Ekleme İşlemi Başarılı";
                    } //end if
                    else
                    {
                        LblState.ForeColor = Color.Red;
                        LblState.Text = "Kitap Ekleme İşlemi Başarısız";
                    }
                } //end try
                catch
                {
                    LblState.ForeColor = Color.Red;
                    LblState.Text = "Kitap Ekleme işlemi Başarısız";

                } //end catch


            } //end if connection control
            else
            {
                LblState.ForeColor = Color.Red;
                LblState.Text = "Kitap Durumu : Kapalı";

            } //end else conntection control

            con.Close();

        } //end BtnBookRecord_Click

    } //end class
}