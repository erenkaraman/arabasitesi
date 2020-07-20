<%@ Page Language="C#" AutoEventWireup="true" CodeFile="panel.aspx.cs" Inherits="panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <title>Araba Sitesi | Eren Karaman</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
        <script src="https://kit.fontawesome.com/52f1d88f70.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
          <div class="stcontainer">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.aspx">Araba Sitesi</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a href="#" class="nav-item nav-link active" style="position: absolute;right: 40px;bottom: 10px;font-size:18px">
          <asp:Label ID="lbladsoyad" runat="server" Text=""></asp:Label>  <asp:LinkButton ID="linkcikis" OnClick="linkcikis_Click" class="linkbtn" runat="server"><i style="margin-left:10px;" class="fa fa-sign-out" aria-hidden="true"></i></asp:LinkButton> <span class="sr-only">(current)</span></a></div> 
  </div>
</nav>
            <br>
              <div style="width:90%;margin-left:auto;margin-right:auto;">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong3">
  Araç Ekle
</button>
                  <br />
                  <br />
<div class="modal fade" id="exampleModalLong3" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog" id="exampleModalScrollablemodal3" runat="server" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLongTitle3">Kategori Ekle</h4>
                                <button type="button" class="close" runat="server" onserverclick="btneditkapat_Click" data-dismiss="modal" aria-label="Close">
                                    <i class="fa fa-close"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                               <asp:TextBox ID="txtekleresim" placeholder="Resim Url" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtekleadi" placeholder="Adı" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtekleyakittipi" placeholder="Yakıt Tipi" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtekeleyil" placeholder="Yıl" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txteklefiyat" placeholder="Fiyat" CssClass="form-control" runat="server"></asp:TextBox><br />
                                </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" onserverclick="btneditkapat_Click" runat="server" data-dismiss="modal"><i class="fa fa-close"></i></button>
                                <button type="button" class="btn btn-primary" id="Button1" onserverclick="btnekle1_Click" runat="server" data-dismiss="modal"><i class="fa fa-save"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                  <!----->
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="modal fade" id="exampleModalScrollable" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable" id="exampleModalScrollablemodal" runat="server" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalScrollableTitle">Araç Güncelle</h4>
                                <button type="button" class="close" runat="server" onserverclick="btneditkapat_Click" data-dismiss="modal" aria-label="Close">
                                    <i class="fa fa-close"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <asp:TextBox ID="txtupresim" placeholder="Resim Url" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtupadi" placeholder="Adı" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtupyakittip" placeholder="Yakıt Tipi" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtupyil" placeholder="Yıl" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <asp:TextBox ID="txtupfiyat" placeholder="Fiyat" CssClass="form-control" runat="server"></asp:TextBox><br />
                                </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" runat="server" onserverclick="btneditkapat_Click" data-dismiss="modal"><i class="fa fa-close"></i></button>
                                <button type="button" class="btn btn-primary" runat="server" onserverclick="btnediturungun_Click" data-dismiss="modal"><i class="fa fa-save"></i></button>

                            </div>
                        </div>
                    </div>
                </div>
                     </ContentTemplate>
        </asp:UpdatePanel>

                  <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">İşlemler</th>
      <th scope="col">ID</th>
      <th scope="col">Resim</th>
      <th scope="col">Adı</th>
      <th scope="col">Yakıt Tipi</th>
      <th scope="col">Yıl</th>
      <th scope="col">Fiyat</th>
    </tr>
  </thead>
  <tbody>
      <asp:Repeater ID="reparaclistele" runat="server">
          <ItemTemplate>
    <tr>
      <th scope="row">  <asp:LinkButton ID="btndeletearac" Style="color: red; font-size: 18px;" runat="server" OnClientClick="return checkDelete()" CommandArgument='<%# Eval("id") %>' OnCommand="btndeletearac_Click" CssClass="greenButton"><i class='fa fa-close'></i></asp:LinkButton>&nbsp;
                      <asp:LinkButton ID="btneditac" Style="color: #72AFD2; font-size: 18px;" runat="server" CommandArgument='<%# Eval("id") %>' OnCommand="btneditgit_Click" CssClass="greenButton"><i class='fa fa-pencil'></i></asp:LinkButton>&nbsp;</th>
      <td><%#Eval("id") %></td>
      <td><%#Eval("resim") %></td>
      <td><%#Eval("adi") %></td>
      <td><%#Eval("yakittipi") %></td>
      <td><%#Eval("yil") %></td>
      <td><%#Eval("fiyat") %></td>
    </tr>
              </ItemTemplate>
          </asp:Repeater>
  </tbody>
</table>

                  </div>
            <br>
            <div style="clear:both"></div>         


	<div class="footaciklama"><div>Eren Karaman | Tüm Hakları Saklıdır.</div>
        </div>
        </div>
        
    </form>
</body>
      <script type="text/javascript">
        function checkDelete() {
            if (confirm('Silmek İstediğine Eminmisin ?')) {
                return true;
            }
            else {
                return false;
            }
        }
      </script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</html>
