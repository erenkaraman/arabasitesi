using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class kayit : System.Web.UI.Page
{
    private string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        txtad.Visible = true;
        txtsoyad.Visible = true;
        txtemail.Visible = true;
        txtsifre.Visible = true;
        txtsifre2.Visible = true;
        txtonaykodu.Visible = false;
        btnkoddogrula.Visible = false;
    }
    protected void btngiris_Click(object sender, EventArgs e)
    {
        SqlConnection bag = new SqlConnection(strcon);
        bag.Open();
        SqlCommand komut = new SqlCommand("SELECT * FROM kullanici where email=@a", bag);
        komut.Parameters.AddWithValue("a", txtemail.Text);
        SqlDataReader oku = komut.ExecuteReader();
        if (!oku.Read())
        {
            if (!string.IsNullOrEmpty(txtad.Text) && !string.IsNullOrEmpty(txtsoyad.Text) && !string.IsNullOrEmpty(txtemail.Text) && !string.IsNullOrEmpty(txtsifre.Text))
            {
                if (txtsifre.Text==txtsifre2.Text)
                {
                txtad.Visible = false;
                txtsoyad.Visible = false;
                txtemail.Visible = false;
                txtsifre.Visible = false;
                txtsifre2.Visible = false;
                btngiris.Visible = false;
                txtonaykodu.Visible = true;
                btnkoddogrula.Visible = true;
                Session["password"] = txtsifre.Text;

                Random random1 = new Random();
                Session["sessayirandom1"] = random1.Next(100000, 999999);

                CLmail clmail = new CLmail();
                MailMessage mail = new MailMessage();
                mail.IsBodyHtml = true;
                mail.To.Add(txtemail.Text);

                mail.From = new MailAddress(clmail.mailAdresi, clmail.nasilGozuksun, System.Text.Encoding.UTF8);
                mail.Subject = "Mail Onayı";

                mail.Body = "Sayın Üyemiz " + txtemail.Text + ",<br><br>Alttaki Onay Kodunu Girerek İşleme Devam Edebilirsiniz.<br><br><br>Onay Kodu : <B>" + Session["sessayirandom1"] + "</B>";
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
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Şifreler Eşleşmiyor');", true);
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Yıldızlı Alanlar Boş Bırakılamaz');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Bu Kullanıcı Zaten Kayıtlı');", true);
        }
        bag.Close();
    }
    protected void btnkoddogrula_Click(object sender, EventArgs e)
    {
        if (Session["sessayirandom1"].ToString() == txtonaykodu.Text)
        {
            SqlConnection bag2= new SqlConnection(strcon);
            bag2.Open();
            SqlCommand komut2 = new SqlCommand("insert into kullanici (adi,soyadi,email,sifre,hesaponay) values(@a,@b,@c,@d,@e)", bag2);
            komut2.Parameters.AddWithValue("a", txtad.Text);
            komut2.Parameters.AddWithValue("b", txtsoyad.Text);
            komut2.Parameters.AddWithValue("c", txtemail.Text);
            komut2.Parameters.AddWithValue("d", Session["password"]);
            komut2.Parameters.AddWithValue("e", 1);
            komut2.ExecuteNonQuery();
            Response.Redirect("panel.aspx");
            bag2.Close();
            Session.Remove("password");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Hatalı Onay Kodu');", true);
        }
    }
}