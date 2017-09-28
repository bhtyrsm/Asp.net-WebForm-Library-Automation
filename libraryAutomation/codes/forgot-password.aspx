 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="AkınSoft.forgot_password" %>

<html>
<head>
    
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Şifremi Unuttum</title>
    <!-- Favicon--> 
    <link rel="icon" href="../../favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    <link href="Design/Shared/Css/bootstrap.css" rel="stylesheet" />
    <link href="Design/Shared/Css/waves.css" rel="stylesheet" />
    <link href="Design/Shared/Css/animate.css" rel="stylesheet" />
    <link href="Design/Shared/Css/style.css" rel="stylesheet" />
</head>

<body class="fp-page">
  <form runat="server">
    <div class="fp-box">
        <div class="logo">
        </div>
        <div class="card">
          <div class="body">
            <div id="forgot_password">
              <div class="msg">
                 Lütfen Kayıt sırasında kullandığınız Email adresini giriniz. Mail Adresinize şifrenizi sıfırlamak için bir link gönderilecektir.
                 </div>
                 <div class="input-group">
                   <span class="input-group-addon">
                     <i class="material-icons">email</i>
                    </span>
                    <div class="form-line">
                            <asp:TextBox ID="txtForgotMail" type="email" class="form-control" name="email" placeholder="Email" required ="required " autofocus="autofocus" runat="server"></asp:TextBox> 
                    </div> <!--form line-->
                   </div><!--input group-->

                    <button class="btn btn-block btn-lg bg-pink waves-effect" type="submit">Şifreyi Sıfırla</button>

                    <div class="row m-t-20 m-b--5 align-center">
                        <a href="Login.aspx">Oturum Aç</a>
                    </div>
                </div><!--forgot pasword-->
            </div><!--body-->
        </div><!--card-->
    </div><!--fp-box-->

      <script src="Design/Shared/Js/jquery.min.js"></script>
      <script src="Design/Shared/Js/bootstrap.js"></script>
      <script src="Design/Shared/Js/waves.js"></script>
      <script src="Design/Shared/Js/jquery.validate.js"></script>
      <script src="Design/Shared/Js/admin.js"></script>
      <script src="Design/Shared/Js/forgot-password.js"></script>
        </form>
</body>

</html>
