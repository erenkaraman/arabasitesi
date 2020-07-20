using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class aracdetay : System.Web.UI.Page
{
    private string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection bag = new SqlConnection(strcon);
        bag.Open();
        SqlCommand komut = new SqlCommand("SELECT * from arac where id=@a", bag);
        komut.Parameters.AddWithValue("a", Request.QueryString["arac"]);
        reparabagetir.DataSource = komut.ExecuteReader();
        reparabagetir.DataBind();
        bag.Close();
    }
}