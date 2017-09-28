<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs"  Inherits="AkınSoft.intro" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Giriş</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
 <link href="Design/Login/Css/style.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
         <div class="form">
      
      <ul class="tab-group">
        
      </ul>
      <div>
        <div id="login">   
          <h1>Oturum Aç</h1>
            <div class="field-wrap">
              <label>
               Mail Adresi<span class="req">*</span>
              </label>
              <asp:TextBox ID="txtEmailLogin" type="email" required="required" autocomplete="off" runat="server"></asp:TextBox>
            
           </div><!--fiel wrap-->

           <div class="field-wrap">
             <label>
             Şifre<span class="req">*</span>
             </label>
               <asp:TextBox ID="txtPasswordLogin" type="password" required="required" autocomplete="off" runat="server"></asp:TextBox>
          </div><!--fiel wrap-->
          
          <p class="forgot"><a href="forgot-password.aspx">Şifremi Unuttum?</a></p>
          <asp:Button ID="BtnOturumAc" class="button button-block" runat="server" Text="Oturum Aç" OnClick="BtnOturumAc_Click"/> 
          
             
          
        </div>  <!--END DİV LOGİN-->
        
      </div><!-- tab-content -->
      
</div> <!-- form -->

     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="Design/Login/Js/index.js"></script>
     
   </form>
 
</body>
</html>
