<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aracdetay.aspx.cs" Inherits="aracdetay" %>

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
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a href="giris.aspx" class="nav-item nav-link active" style="position: absolute;right: 20px;bottom: 10px" href="#">Giriş Yap / Kayıt Ol <span class="sr-only">(current)</span></a>    </div>
  </div>
</nav>
           <br />

   <div style="width: 90%;margin-left: auto;margin-right: auto">
       <asp:Repeater ID="reparabagetir" runat="server">
           <ItemTemplate>
                 <h3><%#Eval ("adi") %></h3>
  <div class="card">
    <img class="card-img-top" style="padding: 5px;" src='<%#Eval ("resim") %>' alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title"> <%#Eval ("adi") %></h5>
        <ul class="list-group list-group-flush">
    <li class="list-group-item"> <%#Eval ("yil") %></li>
    <li class="list-group-item"> <%#Eval ("yakittipi") %></li>
    <li class="list-group-item"> <%#Eval ("fiyat") %> TL</li>
  </ul>
    </div>
  </div>
 
    
               </ItemTemplate>
           </asp:Repeater>
            </div>
            <br />


             

	<div class="footaciklama"><div>Eren Karaman | Tüm Hakları Saklıdır.</div>
            </div>
            </div>
    </form>
</body>
</html>
