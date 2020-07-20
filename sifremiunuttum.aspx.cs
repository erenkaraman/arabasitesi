using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

public partial class sifremiunuttum : System.Web.UI.Page
{
    private string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsifirla_Click(object sender, EventArgs e)
    {
        SqlConnection bag = new SqlConnection(strcon);
        bag.Open();
        SqlCommand komut = new SqlCommand("SELECT * FROM kullanici where email=@a", bag);
        komut.Parameters.AddWithValue("a", txtemail.Text);
        SqlDataReader oku = komut.ExecuteReader();
        if (oku.Read())
        {
            CLmail clmail = new CLmail();
            MailMessage mail = new MailMessage();
            mail.IsBodyHtml = true;
            mail.To.Add(txtemail.Text);

            mail.From = new MailAddress(clmail.mailAdresi, clmail.nasilGozuksun, System.Text.Encoding.UTF8);
            mail.Subject = "Şifre";

            mail.Body = "Sayın Üyemiz " + txtemail.Text + ",<br><br><br>Şifreniz : <B>" + oku["sifre"] + "</B>";
            mail.IsBodyHtml = true;
            SmtpClient smp = new SmtpClient();

            smp.Credentials = new NetworkCredential(clmail.mailAdresi, clmail.mailSifresi);
            smp.Port = clmail.port;
            smp.Host = clmail.host;
            smp.EnableSsl = clmail.ssl;
            smp.Send(mail);
        }

        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Hatalı Kullanıcı Adı Veya Şifre');", true);
        }
        bag.Close();
    }
}