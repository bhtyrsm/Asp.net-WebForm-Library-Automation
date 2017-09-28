<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="KitapKayıt.aspx.cs" Inherits="AkınSoft.KitapKayıt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="card">
        <div class="header">
          <h2>
            Kitap Kayıt
           </h2>
         </div>
         <div class="body">
          <div class="form">

            <div class="row clearfix">
              <div class="col-md-6">
                <div class="form-group">
                  <div class="form-line">
                     <asp:TextBox ID="txtBookCode" CssClass="form-control"  required="required" placeholder="Kitap Kodu" runat="server"></asp:TextBox>
                    </div>
                   </div>
                  </div><!-- col-md-6-->
      
                  <div class="col-md-6">
                   <div class="form-group">
                    <div class="form-line">
                        <asp:TextBox ID="txtBookIsbnCode" CssClass="form-control"  required="required" placeholder="ISBN Numarası" runat="server"></asp:TextBox>
                      </div>
                     </div>
                    </div><!-- col-md-6-->
                   </div><!-- row clearfix-->

                   <div class="row clearfix">
                     <div class="col-md-6">
                       <div class="form-group">
                          <div class="form-line">
                            <asp:TextBox ID="txtBookName" CssClass="form-control"  required="required" placeholder="Kitap Adı" runat="server"></asp:TextBox>
                          </div>
                         </div>
                       </div>
                       <div class="col-md-6">
                        <div class="form-group">
                         <div class="form-line">
                             <asp:TextBox ID="txtBookCategory" CssClass="form-control"  required="required" placeholder="Kitap Kategorisi" runat="server"></asp:TextBox>        
                         </div>
                        </div>
                       </div><!-- col-md-6-->
                   </div><!-- row clearfix-->


                   <div class="row clearfix">
                    <div class="col-md-6">
                     <div class="form-group">
                      <div class="form-line">
                          <asp:TextBox ID="txtBookAuthor" CssClass="form-control"  required="required" placeholder="Kitap Yazarı" runat="server"></asp:TextBox>
                     </div>
                    </div>
                    </div><!--col-md-6-->
                    <div class="col-md-6">
                     <div class="form-group">
                      <div class="form-line">
                         <asp:TextBox ID="txtBookYear" CssClass="form-control"  required="required" placeholder="Kitap Yayın Yılı" runat="server"></asp:TextBox>
                       </div>
                      </div>
                     </div><!--col-md-6-->
                 </div><!--row clearfix-->
             
                   <div class="row clearfix">
                    <div class="col-md-6">
                     <div class="form-group">
                       <div class="form-line">
                           <asp:TextBox ID="txtPageNumber" CssClass="form-control"  required="required" placeholder="Kitap Sayfa Sayısı" runat="server"></asp:TextBox>
                        </div>
                       </div>
                      </div><!--col-md-6-->

                      <div class="col-md-6">
                        <div class="form-group">
                         <div class="form-line">
                             <asp:TextBox ID="txtBookKeys" CssClass="form-control"  required="required" placeholder="Anahtar Kelimeler" runat="server"></asp:TextBox>
                          </div>
                         </div>
                        </div><!--col-md-6-->
                       </div><!--row clearfix-->

                     <asp:Label ID="LblState" style="font-size:large" runat="server"></asp:Label>
                      <br/><br />
                       <a class="waves-effect btn-block"><asp:Button ID="BtnBookRecord"  class="btn btn-success m-t-15 btn btn-block" OnClick="BtnBookRecord_Click" runat="server" Text="KAYIT" /></a>      
                       </div> <!--form-->
                      </div><!--body->
          <!-- container card col-lg  -->
                     </div>
                     </div>
                    </div>
     
</asp:Content>
