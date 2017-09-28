<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="KitapListe.aspx.cs" Inherits="AkınSoft.KitapListe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Design/Admin/Css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="card">
        <div class="header">
          <h2>
            Kitap Listesi
           </h2>
         </div> <!--header-->
         <div class="body">
          <div class="form">
           <div class="row clearfix">
              <asp:GridView ID="GridView1" style="width:100%"  RowStyle-Font-Size="Medium" RowStyle-Width="100%" RowStyle-BorderWidth="3px" BorderColor="Black" RowStyle-ForeColor="Black" RowStyle-CssClass="margin-0:3px" EditRowStyle-BackColor="White" RowStyle-BackColor="White" runat="server" AutoGenerateColumns="false" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"   OnRowEditing="GridView1_RowEditing"  OnRowUpdating="GridView1_RowUpdating" AllowPaging="true" Font-Size="Medium">
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit"  CssClass="btn-info" style="width:100%" runat="server" Text="Düzenle" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update"  CssClass="btn-info" style="width:100%" runat="server" Text="Güncelle" CommandName="Update"/> 
                        <div style="padding-top:4px"></div>
                        <asp:Button ID="btn_Cancel"  CssClass="btn-danger" style="width:100%" runat="server" Text=" İptal" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                 

                <asp:TemplateField HeaderText="Kitap ISBN">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bookIsbn"  CssClass="form-control" runat="server" Text='<%#Eval("BookISBN") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                  
                <asp:TemplateField HeaderText="Kitap Adı">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bookName"  CssClass="form-control" runat="server" Text='<%#Eval("BookName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_bookName" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("BookName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="Kategori">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bookCategory"  CssClass="form-control" runat="server" Text='<%#Eval("BookCategory") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_bookCategory" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("BookCategory") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                 <asp:TemplateField HeaderText="Yazar">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bookAuthor"  CssClass="form-control" runat="server" Text='<%#Eval("BookAuthor") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_bookAuthor" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("BookAuthor") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Yayın Yılı">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bookRelYear"  CssClass="form-control" runat="server" Text='<%#Eval("BookRelYear") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_bookRelYear" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("BookRelYear") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Sayfa Sayısı">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bookPageNum"  CssClass="form-control" runat="server" Text='<%#Eval("BookPageNum") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_bookPageNum" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("BookPageNum") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 


                 <asp:TemplateField HeaderText="Anahtar Kelimeler">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_bookKeys"  CssClass="form-control" runat="server" Text='<%#Eval("BookKeys") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_bookKeys" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("BookKeys") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
                  
            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>   

            </div>
   
                <!-- body form -->
                       </div>
                      </div>
          <!-- container card col-lg  -->
                     </div>
                     </div>
                    </div>
</asp:Content>
