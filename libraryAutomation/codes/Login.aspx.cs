using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkınSoft
{
    public partial class intro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Gönderilen görev de , yeni kullanıcı ekleme istenmediğinden , kullanıcı adı ve şifre bu şekilde manuel olarak kullanılmıştır.
        // kişi ekleme istenildiği takdirde  ,giriş için kontrolu için  veritabanı ve session kullanmak gerekirdi 

        protected void BtnOturumAc_Click(object sender, EventArgs e)
        {
            if (txtEmailLogin.Text == "bahtiyar@gmail.com" & txtPasswordLogin.Text== "123456")
            {
                Session.Add("UserName", "Bahtiyar Sime");
                Session.Add("UserMail", "bahtiyarsime@gmail.com");
                Response.Redirect("default.aspx");
            }
            

        }


     


    }
}