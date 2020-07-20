<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

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
      <div class="banner">
         <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/sli1.jpg" alt="First slide">
    </div>
 
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    </div>
            <br>
   <div style="width: 90%;margin-left: auto;margin-right: auto">
       <asp:Repeater ID="reparabagetir" runat="server">
           <ItemTemplate>
  <div class="card stcard">
    <img class="card-img-top" style="padding: 5px;" src='<%#Eval ("resim") %>' alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title"> <%#Eval ("adi") %></h5>
        <ul class="list-group list-group-flush">
    <li class="list-group-item"> <%#Eval ("yil") %></li>
    <li class="list-group-item"> <%#Eval ("yakittipi") %></li>
    <li class="list-group-item"> <%#Eval ("fiyat") %> TL</li>
  </ul>
  <div class="card-body">
     <a href='<%# "aracdetay.aspx?arac="+Eval("id") %>' class="card-link">Aracı İncele</a>
  </div>
    </div>
  </div>
 
    
               </ItemTemplate>
           </asp:Repeater>
            </div>
            <br>
            <div style="clear:both"></div>         


	<div class="footaciklama"><div>Eren Karaman | Tüm Hakları Saklıdır.</div>
        </div>
        </div>
        
    </form>
</body>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</html>
