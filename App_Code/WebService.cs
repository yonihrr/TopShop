using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Data;
/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public int SignUser(string FirstName, string LastName, string Email, string Password)
    {

        string conStr = @"Data Source=DESKTOP-L3OV7JP\SQLEXPRESS;Initial Catalog=TopShop;Integrated Security=True";
        SqlConnection con = new SqlConnection(conStr);
        SqlCommand com = new SqlCommand("INSERT INTO Users (FirstName,LastName,Email,Password) VALUES('" + FirstName + "','" + LastName + "','" + Email + "','" + Password + "')", con);
        com.Connection.Open();
        int rows = com.ExecuteNonQuery();
        com.Connection.Close();
        return rows;
    }


    [WebMethod]

    public string UploadFile()
    {
        string lreturn = "success";
        try
        {
            HttpPostedFile file = HttpContext.Current.Request.Files["file"];
            string saveFile = "C:\\Users\\ohad.DESKTOP-L3OV7JP\\Downloads\\" + file.FileName;
            file.SaveAs(saveFile);
        }
        catch (Exception ex)
        {
            lreturn = "fail. " + ex.Message;
        }
        return lreturn;
    }

  //  [WebMethod]
    /*
    public string GetAllUsers()
    {
        List<User> l = new List<global::User>();


        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-Q4MIT7O\SQLEXPRESS;Initial Catalog=TopShop;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False");
        SqlCommand com = new SqlCommand("SELECT * FROM UsersDB ", con);
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            l.Add(new User((int)reader["Id"], reader[1].ToString()));
        }
        reader.Close();
        com.Connection.Close();

        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }
    */



    [WebMethod]
    public string GetAllProducts(string Cat)
    {
        List<Yad1Product> l = new List<global::Yad1Product>();

        //string Category2 = "Arsenal";
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-Q4MIT7O\SQLEXPRESS;Initial Catalog=TopShop;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False");
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        SqlCommand com = new SqlCommand("SELECT * FROM Yad1 WHERE Category='" + Cat + "';", con);

        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            // l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), "", "", 444));
            l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), reader[2].ToString(), reader[3].ToString(), (int)reader[4]));
        }
        reader.Close();
        com.Connection.Close();

        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }


    [WebMethod]
    public string GetTopics()
    {
        List<Yad1Product> l = new List<global::Yad1Product>();


        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-Q4MIT7O\SQLEXPRESS;Initial Catalog=TopShop;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False");
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        SqlCommand com = new SqlCommand("SELECT MIN(id) AS id, Category FROM Yad1 GROUP BY Category", con);
        
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), "", "", 444));
            //l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), reader[2].ToString(), reader[3].ToString(), (int)reader[4]));
        }
        reader.Close();
        com.Connection.Close();

        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }


    [WebMethod]
    public string AddToCart(string Add)
    {
        List<Yad1Product> l = new List<global::Yad1Product>();


        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-Q4MIT7O\SQLEXPRESS;Initial Catalog=TopShop;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False");
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 WHERE Name='"+Add+"';", con);
        SqlCommand com = new SqlCommand("INSERT Cart SELECT * FROM Yad1 WHERE Name='"+Add+"';", con);      
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();    
        reader.Close();
        com.Connection.Close();
        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }

    [WebMethod]
    public string GetCart()
    {
        List<Yad1Product> l = new List<global::Yad1Product>();


        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-Q4MIT7O\SQLEXPRESS;Initial Catalog=TopShop;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False");
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 WHERE Name='"+Add+"';", con);
        SqlCommand com = new SqlCommand("SELECT * FROM Cart", con);
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            // l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), "", "", 444));
            l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), reader[2].ToString(), reader[3].ToString(), (int)reader[4]));
        }
        reader.Close();
        com.Connection.Close();
        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }

    [WebMethod]
    public string ClearCart()
    {
        List<Yad1Product> l = new List<global::Yad1Product>();


        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-Q4MIT7O\SQLEXPRESS;Initial Catalog=TopShop;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False");
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 WHERE Name='"+Add+"';", con);
        SqlCommand com = new SqlCommand("DELETE FROM Cart;", con);
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
       
        reader.Close();
        com.Connection.Close();
        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }



}
