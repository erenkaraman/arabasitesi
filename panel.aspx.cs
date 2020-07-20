using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class panel : System.Web.UI.Page
{
    private string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sesemail"] == null)
        {
            Response.Redirect("giris.aspx");
        }
        lbladsoyad.Text = Session["sesemail"].ToString();
        SqlConnection bag = new SqlConnection(strcon);
        bag.Open();
        SqlCommand komut = new SqlCommand("SELECT * from arac order by id desc", bag);
        reparaclistele.DataSource = komut.ExecuteReader();
        reparaclistele.DataBind();
        bag.Close();
    }
    protected void linkcikis_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("giris.aspx");
    }
    protected void btneditkapat_Click(object sender, EventArgs e)
    {
        exampleModalScrollable.Style["display"] = "none";
        exampleModalScrollable.Style["opacity"] = "0";
    }
    protected void btndeletearac_Click(object sender, CommandEventArgs e)
    {
        SqlConnection con2 = new SqlConnection(strcon);
        con2.Open();
        SqlCommand cmdgorevgun = new SqlCommand("delete from arac where id=" + e.CommandArgument.ToString() + "", con2);
        cmdgorevgun.ExecuteNonQuery();
        con2.Close();
        Page.Response.Redirect(Page.Request.Url.ToString());
    }
    protected void btneditgit_Click(object sender, CommandEventArgs e)
    {
        Session["seshesapidclick"] = e.CommandArgument.ToString();

        exampleModalScrollable.Style["display"] = "block";
        exampleModalScrollable.Style["opacity"] = "1";
        exampleModalScrollable.Style["overflow-x"] = "hidden";
        exampleModalScrollable.Style["overflow-y"] = "hidden";
        exampleModalScrollable.Style["position"] = "absolute";
        exampleModalScrollablemodal.Style["top"] = "100px";

        SqlConnection conurunupdate = new SqlConnection(strcon);
        conurunupdate.Open();
        SqlCommand cmdurunupdate = new SqlCommand("select * from arac where id=" + e.CommandArgument.ToString() + "", conurunupdate);
        SqlDataReader okurungun = cmdurunupdate.ExecuteReader();
        if (okurungun.Read())
        {
            txtupresim.Text = okurungun["resim"].ToString();
            txtupadi.Text = okurungun["adi"].ToString();
            txtupyakittip.Text = okurungun["yakittipi"].ToString();
            txtupyil.Text = okurungun["yil"].ToString();
            txtupfiyat.Text = okurungun["fiyat"].ToString();
        }
        conurunupdate.Close();
    }
    protected void btnediturungun_Click(object sender, EventArgs e)
    {
        SqlConnection conupr = new SqlConnection(strcon);
        conupr.Open();
        SqlCommand cmdupr = new SqlCommand("update arac set resim=@a,adi=@b,yakittipi=@c,yil=@d,fiyat=@e where id=@id", conupr);
        cmdupr.Parameters.AddWithValue("a", txtupresim.Text);
        cmdupr.Parameters.AddWithValue("b", txtupadi.Text);
        cmdupr.Parameters.AddWithValue("c", txtupyakittip.Text);
        cmdupr.Parameters.AddWithValue("d", txtupyil.Text);
        cmdupr.Parameters.AddWithValue("e", txtupfiyat.Text);
        cmdupr.Parameters.AddWithValue("id", Session["seshesapidclick"]);
        cmdupr.ExecuteNonQuery();
        conupr.Close();
    }
    protected void btnekle1_Click(object sender, EventArgs e)
    {
        SqlConnection conupr = new SqlConnection(strcon);
        conupr.Open();
        SqlCommand cmdupr = new SqlCommand("insert into arac (resim,adi,yakittipi,yil,fiyat) values(@a,@b,@c,@d,@e)", conupr);
        cmdupr.Parameters.AddWithValue("a", txtekleresim.Text);
        cmdupr.Parameters.AddWithValue("b", txtekleadi.Text);
        cmdupr.Parameters.AddWithValue("c", txtekleyakittipi.Text);
        cmdupr.Parameters.AddWithValue("d", txtekeleyil.Text);
        cmdupr.Parameters.AddWithValue("e", txteklefiyat.Text);
        cmdupr.ExecuteNonQuery();
        conupr.Close();
        Page.Response.Redirect(Page.Request.Url.ToString());
    }
}