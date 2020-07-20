<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kayit.aspx.cs" Inherits="kayit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>Araba Sitesi | Eren Karaman</title> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Patua+One&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/52f1d88f70.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <link rel="stylesheet" href="style.css">    
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="~/style.css">
       <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</head>
<body>
    <form id="form1" runat="server">
          <div>
            <div style="width:100vw;height:100vh;background-color:#F9F9F9;">
                <div style="position:absolute;top:50%;margin-top:-250px;left:50%;margin-left:-175px;width:350px;height:500px;background-color:#fff;padding:25px;border-radius:5px;-webkit-box-shadow: 0px 0px 10px 0px rgba(0,0,0,1);-moz-box-shadow: 0px 0px 10px 0px rgba(0,0,0,1);box-shadow: 0px 0px 10px 0px rgba(0,0,0,1);">
                        <div style="text-align:center;font-size:24px;line-height:24px;margin-top:15px;font-weight:bold;">Araba Sitesi</div>
                    <div style="width:100%;margin-top:40px;margin-bottom:40px;">
                        <asp:TextBox CssClass="form-control" BackColor="#E5EBEB" PlaceHolder="Adı *" ID="txtad" runat="server"></asp:TextBox><br />
                        <asp:TextBox CssClass="form-control" BackColor="#E5EBEB" PlaceHolder="Soyadı *" ID="txtsoyad" runat="server"></asp:TextBox><br />
                        <asp:TextBox CssClass="form-control" BackColor="#E5EBEB" PlaceHolder="E-Posta *" ID="txtemail" runat="server"></asp:TextBox><br />
                        <asp:TextBox CssClass="form-control" ID="txtsifre" BackColor="#E5EBEB"  PlaceHolder="Şifre *" runat="server" TextMode="Password"></asp:TextBox><br />
                        <asp:TextBox CssClass="form-control" ID="txtsifre2" BackColor="#E5EBEB"  PlaceHolder="Şifre-Tekrar *" runat="server" TextMode="Password"></asp:TextBox><br />
                         <asp:TextBox CssClass="form-control" BackColor="#E5EBEB" PlaceHolder="Onay Kodu *" ID="txtonaykodu" runat="server"></asp:TextBox>
                        <input id="btnkoddogrula" onserverclick="btnkoddogrula_Click" runat="server" style="width:100%;margin-top:15px;text-transform:none" class="btn btn-success" type="button" value="Doğrula" />
                        <input id="btngiris" onserverclick="btngiris_Click" runat="server" style="width:100%;margin-top:15px;text-transform:none" class="btn btn-success" type="button" value="Kayıt Ol" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
