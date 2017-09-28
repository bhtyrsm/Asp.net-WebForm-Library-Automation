<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"  CodeBehind="OgrenciKayit.aspx.cs"   Inherits="AkınSoft.OgrenciKayit"    %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
    
    <link href="Design/calendar/Css/dcalendar.css" rel="stylesheet" />
    <script src="Design/calendar/Js/jquery-3.1.0.js"></script>
     <script type='text/javascript'>

      $(document).ready(function () {
          $(function () {
              //calendar call function
              $('.datepicker').dcalendar();
              $('.datepicker').dcalendarpicker();

          });
      });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container-fluid">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="card">
        <div class="header">
          <h2>
           Öğrenci Kayıt
          </h2>
         </div>
         <div class="body">
           <div class="form">
               <div class="row clearfix">
                   <div class="col-md-6">
                     <div class="form-group">
                         <h3>Fakülte</h3>
                         <div class="form-inline">
                         <asp:DropDownList ID="DDFaculty" DataSourceID="sqlData2" AutoPostBack="true" DataTextField="FacultyName"  AppendDataBoundItems="true" Font-Names="Verdana" runat="server">
                           <asp:ListItem Value="Fakülte Seçiniz.."></asp:ListItem>       
                          </asp:DropDownList>
                             
                         <asp:SqlDataSource ID="sqlData2" runat="server" ConnectionString="<%$ ConnectionStrings:AkinSoftConnect %>"
                          SelectCommand="select FacultyName from Faculty">
                           </asp:SqlDataSource>
                         </div><!--form line-->
                        </div><!--form group-->
                       </div><!--col md-6-->
                       <div class="col-md-6">
                        <div class="form-group">
                          <h3>Bölüm</h3>
                            <div class="form-inline">
                            <asp:DropDownList ID="DDDepartman"  AutoPostBack="false" Font-Names="Verdana" runat="server">
                             <asp:ListItem Value="Bölüm Seçiniz.."></asp:ListItem>
                              <asp:ListItem Value="Bilgisayar Mühendisliği"></asp:ListItem>  
                              <asp:ListItem Value="İktisat"></asp:ListItem>
                              <asp:ListItem Value="Türkçe Öğretmeliği"></asp:ListItem>  
                              <asp:ListItem Value="Kimya"></asp:ListItem>  
                              <asp:ListItem Value="Turizm"></asp:ListItem>
                             </asp:DropDownList>
                            </div>
                          </div>
                         </div>
                    </div>

             <div class="row clearfix">
               <div class="col-md-6">
                 <div class="form-group">
                  <div class="form-line">
                    <asp:TextBox ID="txtStudentNum" CssClass="form-control" autocomplete="off" required="required" placeholder="Öğrenci Numarası" runat="server"></asp:TextBox>
                   </div>
                  </div>
                 </div>
                   <div class="col-md-6">
                     <div class="form-group">
                       <div class="form-line">
                      <asp:TextBox ID="txtStudentName" CssClass="form-control" autocomplete="off" required="required"  placeholder="Öğrenci Adı Soyadı" runat="server"></asp:TextBox>
                     </div>
                     </div>
                    </div>
                  </div><!--row clearfix-->
                   <div class="row clearfix">
                     <div class="col-md-6">
                        <div class="form-group">
                          <div class="form-line">
                          <asp:TextBox ID="txtStudentAdress" CssClass="form-control" autocomplete="off" required="required"  placeholder="Adres" runat="server"></asp:TextBox>
                         </div>   
                        </div>
                       </div>
                     <div class="col-md-6">
                       <div class="form-group">
                           <div class="form-line">
                         <asp:TextBox ID="txtStudentCountryAdress" CssClass="form-control" autocomplete="off" required="required"  placeholder="Memleket Adresi" runat="server"></asp:TextBox> 
                        </div>
                        </div>
                     </div>
                   </div><!--row clearfix-->
                   <div class="row clearfix">

                     <div class="col-md-6">
                      <div class="form-group">
                       <div class="form-line" >
                        <asp:TextBox ID="txtStudentPhoneNumber"  CssClass="form-control" required="required" autocomplete="off"   placeholder="Telefon Numarası" runat="server"></asp:TextBox>
                      </div>
                     </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-group">
                          <div class="form-line">
                        <asp:TextBox ID="txtRegDate" CssClass="form-control input-sm datepicker" required="required" placeholder="Kayıt Tarihi" autocomplete="off" runat="server"></asp:TextBox>       
                       </div>
                      </div>
                     </div>

                   </div>

                 <asp:Label ID="LblState" style="font-size:large" runat="server" Text=""></asp:Label>
                   <br /><br />
                   <a class="waves-effect btn-block" style="text-decoration:none">
                     <asp:Button ID="BtnStudentRecord"  CssClass="btn-success m-t-15 btn btn-block waves-effec"  runat="server" OnClick="BtnStudentRecord_Click" Text="KAYIT" /></a>
        
             <!--div form-->                
           </div>
           <!--body-->
           </div>
          </div>
         </div>


      
         </div>

    
</asp:Content>
