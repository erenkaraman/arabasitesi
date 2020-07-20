using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class giris : System.Web.UI.Page
{
    private string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sesemail"]!=null)
        {
            Response.Redirect("panel.aspx");
        }
    }
    protected void btngiris_Click(object sender, EventArgs e)
    {
            SqlConnection bag = new SqlConnection(strcon);
            bag.Open();
            SqlCommand komut = new SqlCommand("SELECT * FROM kullanici where email=@a and sifre=@b", bag);
            komut.Parameters.AddWithValue("a", txtemail.Text);
            komut.Parameters.AddWithValue("b", txtsifre.Text);
            SqlDataReader oku = komut.ExecuteReader();
            if (oku.Read())
            {
                Session["oturumidpancek"] = oku["id"];
                Session["sesemail"] = oku["email"];
                Session["sesadi"] = oku["adi"];
                Session["sessoyadi"] = oku["soyadi"];
                Response.Redirect("panel.aspx");
            }
   
            else
            {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Hatalı Kullanıcı Adı Veya Şifre');", true);
        }
            bag.Close();
    }
}