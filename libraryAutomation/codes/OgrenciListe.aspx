<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OgrenciListe.aspx.cs" Inherits="AkınSoft.OgrenciListe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Design/Admin/Css/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="card">
        <div class="header">
          <h2>
            Öğrenci Listesi
           </h2>
         </div>
         <div class="body">
          <div class="form">
              <div class="card">
              <div class="row clearfix">
               <div class="col-md-6">
                <div class="field-wrap">
                     <asp:DropDownList style="height:30px" Font-Names="Verdana" runat="server" id="FacultyFilterBox"
                          AppendDataBoundItems ="True"
                          DataSourceID="FacultySqlDataSource" 
                          DataTextField="FacultyName" AutoPostBack="true" DataValueField="FacultyName" >
                        <asp:ListItem Selected="True" Value="" >(Show All)</asp:ListItem>
                      </asp:DropDownList>
                  </div>
                 </div>
                 <div class="col-md-6">
                        <div class="field-wrap">
                         <asp:TextBox ID="txtSearchStudent" CssClass="form-control" placeholder="İsim" runat="server"/>
                        </div> 
                </div>     
               </div><!--row clearfix-->
               <div class="row">
                <asp:Button ID="btnStudentSearch"   CssClass="btn-info col-md-6 col-md-offset-3" runat="server" Text="Ara" />
              </div>
           </div><!--card-->
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
                 
                <asp:TemplateField HeaderText="Öğrenci Numarası">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentNum" CssClass="form-control" runat="server" Text='<%#Eval("StudentNum") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                  
                <asp:TemplateField HeaderText="Adı Soyadı">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentName" CssClass="form-control" runat="server" Text='<%#Eval("StudentName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_StudentName" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("StudentName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="Fakülte">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentFaculty" CssClass="form-control" runat="server" Text='<%#Eval("StudentFaculty") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_StudentFaculty" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("StudentFaculty") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                 <asp:TemplateField HeaderText="Bölüm">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentDepartmant" CssClass="form-control" runat="server" Text='<%#Eval("StudentDepartmant") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_StudentDepartmant" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("StudentDepartmant") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Adres">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentAdress" CssClass="form-control" runat="server" Text='<%#Eval("StudentAdress") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_StudentAdress" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("StudentAdress") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 

                <asp:TemplateField HeaderText="Telefon Numarası">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentPhone" CssClass="form-control" runat="server" Text='<%#Eval("StudentPhoneNum") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_StudentPhone" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("StudentPhoneNum") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 


                 <asp:TemplateField HeaderText="Kayıt Tarihi">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_StudentRegDate" CssClass="form-control" runat="server" Text='<%#Eval("StudentRegistDate") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_StudentRegDate" CssClass="form-control" style="border:double 1px blue" autocomplete="off" runat="server" Text='<%#Eval("StudentRegistDate") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField> 
            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>   

            </div>
         




         <asp:SqlDataSource ID="FacultySqlDataSource" 
          SelectCommand="select FacultyName from Faculty"
          EnableCaching="True"
          CacheDuration="60"
          ConnectionString="<%$ ConnectionStrings:AkinSoftConnect %>"
          RunAt="server"/>

                <!-- body form -->
                       </div>
                      </div>
          <!-- container card col-lg  -->
                     </div>
                     </div>
                    </div>
    
</asp:Content>
