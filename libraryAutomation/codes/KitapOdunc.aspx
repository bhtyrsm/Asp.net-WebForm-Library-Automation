<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="KitapOdunc.aspx.cs" Inherits="AkınSoft.KitapOdunc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href="Design/Admin/Css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="card">
        <div class="header">
          <h2>
            Kitap Ödünç Verme
           </h2>
         </div><!--Header-->

         <div class="body">
          <div class="form">
            <div class="row clearfix">   
             <div class="col-md-4">
             <div class="field-wrap">
              <div class="input-group form-control">
              <asp:TextBox ID="txtStudentNum" CssClass="form-control" placeholder="Öğrenci Numarası" runat="server"></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="BtnSearchStudent" OnClick="BtnSearchStudent_Click" CssClass="btn btn-primary"  runat="server" Text="Ara" />
                </span>
               </div>
             </div>
            </div><!--col-md-4-->
            <div class="col-md-8">
              <asp:GridView ID="GridView1" DataSourceID="StudentSqlDataSource" style="width:100%"  RowStyle-Font-Size="Medium" RowStyle-Width="100%" RowStyle-BorderWidth="3px" BorderColor="Black" RowStyle-ForeColor="Black" RowStyle-CssClass="margin-0:3px" RowStyle-BackColor="White" runat="server" AutoGenerateColumns="false" CellPadding="6" AllowPaging="true" PageSize="3" Font-Size="Medium">
            <Columns>  
                 <asp:BoundField HeaderText="Öğrenci Numarası" DataField="StudentNum" />
                  <asp:BoundField HeaderText="Adı Soyadı"  DataField="StudentName" />
                 <asp:BoundField HeaderText="Fakülte" DataField="StudentFaculty" />
                <asp:BoundField HeaderText="Bölüm" DataField="StudentDepartmant" />  
            </Columns>  

            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
          </asp:GridView>   
            </div><!-- col-md-8-->
	       </div><!-- row clear fix-->

            <div class="row clearfix">   
             <div class="col-md-4">
             <div class="field-wrap">
              <div class="input-group form-control">
              <asp:TextBox ID="txtBookISBN" CssClass="form-control" placeholder="Kitap ISBN" runat="server"></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="BtnSearcBookIsbn" CssClass="btn btn-primary"  runat="server" Text="Ara" />
                </span>
               </div>
             </div>
            </div>

            <div class="col-md-8">

                 <asp:GridView ID="GridView2" DataSourceID="BookSqlDataSource" style="width:100%"  RowStyle-Font-Size="Medium" RowStyle-Width="100%" RowStyle-BorderWidth="3px" BorderColor="Black" RowStyle-ForeColor="Black" RowStyle-CssClass="margin-0:3px" RowStyle-BackColor="White" runat="server" AutoGenerateColumns="false" CellPadding="6" AllowPaging="true" PageSize="3" Font-Size="Medium">
            <Columns>  
                 <asp:BoundField HeaderText="Kitap ISBN"  DataField="BookISBN" />
                  <asp:BoundField HeaderText="Kitap Adı"  DataField="BookName" />
                 <asp:BoundField HeaderText="Kitap Kategori" DataField="BookCategory" />
                <asp:BoundField HeaderText="Kitap Yazarı" DataField="BookAuthor" />

            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>   


            </div><!-- col-md-8-->
	       </div><!-- row clear fix-->

            <div class="row clearfix">
                <div class="col-md-8 col-md-offset-2">
                    <div class="card" style="border-color:black">
                        <h4 style="color:red">Öğrencinin Elinde Bulunan Kitaplar</h4>

                     <asp:Label ID="lblStudentsBook"  Font-Size="Medium" runat="server" Text="Kitaplar :"></asp:Label>
                    </div>
                </div>
            </div>

             <br /><br />
              <div class="row clearfix">
                  <div class="col-md-6">
                      <h4>Ödünç Verilen Tarih</h4>
                      <div class="card">
                          <asp:Calendar ID="ClVerilenTarih"  style="margin:auto" OnSelectionChanged="ClVerilenTarih_SelectionChanged" runat="server"></asp:Calendar>
                          <asp:Label ID="lblVerilenTarih" runat="server" style="float:left ;font-size:medium;margin-left:20px" Text=""></asp:Label>
                      </div>
                  </div>
                  <div class="col-md-6">
                      <h4>Teslim Tarihi</h4>
                    <div class="card">
                        <asp:Calendar ID="ClTeslimTarih"  style="margin:auto"  runat="server"></asp:Calendar>
                       <asp:Label ID="lblTeslimTarih" runat="server" style="float:right;font-size:medium;margin-right:20px"  Text=""></asp:Label>
                    </div>
                  </div>
              </div><!-- row clear fix-->

         <asp:Label ID="lblState" Font-Size="Medium" runat="server" Text=""></asp:Label>
              <br /><br />
              <div class="row clearfix">

                 <asp:Button ID="BtnBorrow" CssClass="btn btn-block btn-success" OnClick="BtnBorrow_Click" runat="server" Text="Ödünç Ver" />

              </div>
             
             
            

               <asp:SqlDataSource
                id="StudentSqlDataSource"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:AkinSoftConnect %>"
                SelectCommand="select StudentNum, StudentName, StudentFaculty, StudentDepartmant from Student"
                FilterExpression="StudentNum='{0}'">
                <FilterParameters>
                    <asp:ControlParameter ControlId="txtStudentNum" PropertyName="Text"/>

                </FilterParameters>
            </asp:SqlDataSource>

              <asp:SqlDataSource
                id="BookSqlDataSource"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:AkinSoftConnect %>"
                SelectCommand="select BookISBN, BookName, BookCategory, BookAuthor from Book"
                FilterExpression="BookISBN='{0}'">
                <FilterParameters>
                    <asp:ControlParameter ControlId="txtBookISBN" PropertyName="Text"/>
                </FilterParameters>
            </asp:SqlDataSource>
              
            </div> <!--Form-->
           </div> <!--body-->
          </div> <!--card-->
         </div> <!--col-lg-->
    </div> <!--container fluid-->

</asp:Content>

