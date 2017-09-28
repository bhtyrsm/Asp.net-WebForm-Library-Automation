<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OduncRaporu.aspx.cs" Inherits="AkınSoft.OduncRaporu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Design/Admin/Css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
       <div class="card">
        <div class="header">
          <h2>
            Ödünç Raporu
           </h2>
         </div><!--Header-->
         <div class="body">
          <div class="form">
              <div class="row clearfix">
                 <div class="col-md-4">
                   <asp:RadioButton ID="RbHepsi" runat="server"  OnCheckedChanged="RadioButton_CheckedChanged"  ForeColor="Black" Font-Bold="true" Text="Hepsi" GroupName="Books" AutoPostBack="true"/>
                </div>
                <div class="col-md-4">
                   <asp:RadioButton ID="RbTeslimEdilen" runat="server"  OnCheckedChanged="RadioButton_CheckedChanged" ForeColor="Black" Font-Bold="true"  Text="Teslim Edilenler" GroupName="Books" AutoPostBack="true"/>
                </div>
                <div class="col-md-4">
                   <asp:RadioButton ID="RbTeslimEdilmeyen" runat="server" OnCheckedChanged="RadioButton_CheckedChanged" ForeColor="Black" Font-Bold="true" Text="Teslim Edilmeyenler" GroupName="Books" AutoPostBack="true"/>
               </div>
           </div><!--row clearfix-->
            <div class="row clearfix">
                  <asp:GridView ID="GridViewAll" style="width:100%"  RowStyle-Font-Size="Medium" RowStyle-Width="100%" RowStyle-BorderWidth="3px" BorderColor="Black" RowStyle-ForeColor="Black" RowStyle-CssClass="margin-0:3px" EditRowStyle-BackColor="White" RowStyle-BackColor="White" runat="server" AutoGenerateColumns="false" CellPadding="6" AllowPaging="true" Font-Size="Medium">
                <Columns>  

                <asp:TemplateField HeaderText="Öğrenci Numarası">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentNum"  CssClass="form-control" runat="server" Text='<%#Eval("StudentNum") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                  
                <asp:TemplateField HeaderText="Adı Soyadı">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentName"  CssClass="form-control" runat="server" Text='<%#Eval("StudentName") %>'></asp:Label>  
                    </ItemTemplate>    
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="ISBN">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_BookISBN"  CssClass="form-control" runat="server" Text='<%#Eval("BookISBN") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 

                 <asp:TemplateField HeaderText="Kitap Adı">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_BookName"  CssClass="form-control" runat="server" Text='<%#Eval("BookName") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Verilen Tarih">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_GivenDate"  CssClass="form-control" runat="server" Text='<%#Eval("GivenDate") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Teslim Tarihi">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_DeadLine"  CssClass="form-control" runat="server" Text='<%#Eval("DeadLine") %>'></asp:Label>  
                    </ItemTemplate>    
                </asp:TemplateField> 


                 <asp:TemplateField HeaderText="Teslim Edildi Mi?">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_IsTakenBack"  CssClass="form-control" runat="server" Text='<%#Eval("IsTakenBack") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 

            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>   
              </div><!-- End Row-->

              <div class="row clearfix">

                   <asp:GridView ID="GridView1"  style="width:100%"  RowStyle-Font-Size="Medium" RowStyle-Width="100%" RowStyle-BorderWidth="3px" BorderColor="Black" RowStyle-ForeColor="Black" RowStyle-CssClass="margin-0:3px" EditRowStyle-BackColor="White" RowStyle-BackColor="White" runat="server" AutoGenerateColumns="false" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"   OnRowEditing="GridView1_RowEditing"  OnRowUpdating="GridView1_RowUpdating" AllowPaging="true" Font-Size="Medium">
                <Columns>  

                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit"  CssClass="btn-info" style="width:100%" runat="server" Text="Düzenle" CommandName="Edit" />  
                    </ItemTemplate>
                      
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update"  CssClass="btn-success" style="width:100%" runat="server" Text="Teslim Al" CommandName="Update"/>
                        <div style="padding-top:4px"></div>  
                        <asp:Button ID="btn_Cancel"  CssClass="btn-danger" style="width:100%" runat="server" Text="İptal" CommandName="Cancel"/>  
                    </EditItemTemplate>  

                </asp:TemplateField> 
                 
                <asp:TemplateField HeaderText="Öğrenci Numarası"> 
                     
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentNum"  CssClass="form-control" runat="server" Text='<%#Eval("StudentNum") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                  
                <asp:TemplateField HeaderText="Adı Soyadı"> 
                     
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentName"  CssClass="form-control" runat="server" Text='<%#Eval("StudentName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                   <asp:Label ID="lbl_StudentName" CssClass="form-control" runat="server" Text='<%#Eval("StudentName") %>'></asp:Label>  
                    </EditItemTemplate> 
                     
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="ISBN">  

                    <ItemTemplate>  
                        <asp:Label ID="lbl_BookISBN"  CssClass="form-control" runat="server" Text='<%#Eval("BookISBN") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                     <asp:Label ID="lbl_BookISBN"  CssClass="form-control" runat="server" Text='<%#Eval("BookISBN") %>'></asp:Label>   
                    </EditItemTemplate>  

                </asp:TemplateField> 

                 <asp:TemplateField HeaderText="Kitap Adı">
                       
                    <ItemTemplate>  
                        <asp:Label ID="lbl_BookName"  CssClass="form-control" runat="server" Text='<%#Eval("BookName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Label ID="lbl_BookName"  CssClass="form-control" runat="server" Text='<%#Eval("BookName") %>'></asp:Label>  
                    </EditItemTemplate> 
                      
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Verilen Tarih">  

                    <ItemTemplate>  
                        <asp:Label ID="lbl_GivenDate"  CssClass="form-control" runat="server" Text='<%#Eval("GivenDate") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                         <asp:Label ID="lbl_GivenDate"  CssClass="form-control" runat="server" Text='<%#Eval("GivenDate") %>'></asp:Label>  
                    </EditItemTemplate>  

                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Teslim Tarihi"> 
                     
                    <ItemTemplate>  

                        <asp:Label ID="lbl_DeadLine"  CssClass="form-control" runat="server" Text='<%#Eval("DeadLine") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                       <asp:Label ID="lbl_DeadLine"  CssClass="form-control" runat="server" Text='<%#Eval("DeadLine") %>'></asp:Label>  
                    </EditItemTemplate>  

                </asp:TemplateField> 


                 <asp:TemplateField HeaderText="Teslim Edildi Mi?">
                       
                    <ItemTemplate>  
                        <asp:Label ID="lbl_IsTakenBack"  CssClass="form-control" runat="server" Text='<%#Eval("IsTakenBack") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Label ID="lbl_IsTakenBack"  CssClass="form-control" runat="server" Text='<%#Eval("IsTakenBack") %>'></asp:Label> 
                    </EditItemTemplate>  

                </asp:TemplateField> 

            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>   

              </div>
            
              </div><!-- form-->
             </div><!--body-->
           </div><!-- card-->
          </div><!-- col-lg-->
         </div><!-- container fluid-->


</asp:Content>
