<%@ WebService Language="C#" CodeBehind="~/App_Code/WebService.cs" Class="WebService" %>


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
    public int SignUser(int PhoneNumber, string Name, string UserName, string Password, string Email)
    {

        var conString = System.Configuration.
                 ConfigurationManager.ConnectionStrings["DefaultConnection"];
        string strConnString = conString.ConnectionString;
        //string Category2 = "Arsenal";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand com = new SqlCommand("INSERT INTO Users (Name,PhoneNumber,UserName,Password,Email) VALUES('" + Name + "','" + PhoneNumber + "','" + UserName + "','" + Password + "','" + Email + "')", con);
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

    [WebMethod]
    public string VerifyUser(string UserName, string Password)
    {
        List<User> l = new List<global::User>();

        var conString = System.Configuration.
                ConfigurationManager.ConnectionStrings["DefaultConnection"];
        string strConnString = conString.ConnectionString;
        //string Category2 = "Arsenal";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand com = new SqlCommand("SELECT * FROM Users WHERE UserName='" + UserName + "' AND Password='" + Password + "';", con);
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();

        if (reader.HasRows)
        {         
            while (reader.Read())
            {
                // l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), "", "", 444));
                l.Add(new User((int)reader[0], reader[1].ToString(), (int)reader[2], reader[3].ToString(), reader[4].ToString(),reader[5].ToString()));
            }
              reader.Close();
             com.Connection.Close();

             JavaScriptSerializer js = new JavaScriptSerializer();
              return js.Serialize(l);
        }
        else
        {
            l.Add(new User(-1, "-1",-1, "-1", "-1", "-1"));
             reader.Close();
             com.Connection.Close();

             JavaScriptSerializer js = new JavaScriptSerializer();
              return js.Serialize(l);
        }
      }
       

       
    
  

    [WebMethod]
    public string GetAllProducts(string Cat,int Yad)
    {
        List<Yad1Product> l = new List<global::Yad1Product>();

        var conString = System.Configuration.
                ConfigurationManager.ConnectionStrings["DefaultConnection"];
        string strConnString = conString.ConnectionString;
        //string Category2 = "Arsenal";
        SqlConnection con = new SqlConnection(strConnString);
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        SqlCommand com = new SqlCommand("SELECT * FROM Yad"+Yad+" WHERE Category='" + Cat + "';", con);

        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
        if (Yad == 1)
        {
            while (reader.Read())
            {
                // l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), "", "", 444));
                l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), reader[2].ToString(), reader[3].ToString(), (int)reader[4],reader[5].ToString()));
            }
        }
        if(Yad==2)
        {
            while (reader.Read())
            {
                // l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), "", "", 444));
                l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), reader[2].ToString(), reader[3].ToString(), (int)reader[4], reader[5].ToString()));
            }
        }
        reader.Close();
        com.Connection.Close();

        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }


    [WebMethod]
    public string GetTopics(int Yad)
    {
        List<Yad1Product> l = new List<global::Yad1Product>();


        var conString = System.Configuration.
                        ConfigurationManager.ConnectionStrings["DefaultConnection"];
        string strConnString = conString.ConnectionString;
        //string Category2 = "Arsenal";
        SqlConnection con = new SqlConnection(strConnString);        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
       
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad" + Yad + ";", con);
        SqlCommand com = new SqlCommand("SELECT MIN(id) AS id, Category FROM Yad"+Yad+" GROUP BY Category", con);

        
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), "", "", -1,""));
           // l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), reader[2].ToString(), reader[3].ToString(), (int)reader[4]));
        }
        reader.Close();
        com.Connection.Close();

        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }


    [WebMethod]
    public string AddToCart(string Add,int Yad,int UserId)
    {
        List<Yad1Product> l = new List<global::Yad1Product>();
        
        var conString = System.Configuration.
                        ConfigurationManager.ConnectionStrings["DefaultConnection"];
        string strConnString = conString.ConnectionString;
        //string Category2 = "Arsenal";
        SqlConnection con = new SqlConnection(strConnString);        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 WHERE Name='"+Add+"';", con);
      
        SqlCommand com = new SqlCommand("INSERT INTO Cart(id,Category,Name,Description,Price,ImagePath,UserId) SELECT id,Category,Name,Description,Price,ImagePath," + "'" + UserId + "'" + " FROM Yad" + Yad + " WHERE id='" + Add + "';", con);      
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();    
        reader.Close();
        com.Connection.Close();
        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }

    [WebMethod]
    public string GetTable(string UserId,string TableName)
    {
        List<Yad1Product> l = new List<global::Yad1Product>();


        var conString = System.Configuration.
                        ConfigurationManager.ConnectionStrings["DefaultConnection"];
        string strConnString = conString.ConnectionString;
        //string Category2 = "Arsenal";
        SqlConnection con = new SqlConnection(strConnString);        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 WHERE Name='"+Add+"';", con);
        SqlCommand com = new SqlCommand("SELECT * FROM " + TableName + " WHERE UserId='" + UserId + "';", con);
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
        
        while (reader.Read())
        {
            // l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), "", "", 444));
            l.Add(new Yad1Product((int)reader[0], reader[1].ToString(), reader[2].ToString(), reader[3].ToString(), (int)reader[4],reader[5].ToString()));
        }
        reader.Close();
        com.Connection.Close();
        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }

    [WebMethod]
    public string ClearCart(string UserId)
    {
        List<Yad1Product> l = new List<global::Yad1Product>();


        var conString = System.Configuration.
                        ConfigurationManager.ConnectionStrings["DefaultConnection"];
        string strConnString = conString.ConnectionString;
        //string Category2 = "Arsenal";
        SqlConnection con = new SqlConnection(strConnString);        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 ", con);
        //SqlCommand com = new SqlCommand("SELECT * FROM Yad1 WHERE Name='"+Add+"';", con);
        var userid = "-1";
        if (UserId != string.Empty)
        {
            userid = UserId;
        }
        SqlCommand com = new SqlCommand("DELETE FROM Cart WHERE UserId='" + userid + "';", con);
        com.Connection.Open();
        SqlDataReader reader = com.ExecuteReader();
       
        reader.Close();
        com.Connection.Close();
        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(l);
    }

     [WebMethod]
    public int Yad2Upload(int id,String Category,String Name,String Description,int Price,String ImagePath)
    {
       
            var conString = System.Configuration.
                                   ConfigurationManager.ConnectionStrings["DefaultConnection"];
            string strConnString = conString.ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand com = new SqlCommand("INSERT INTO Yad2 (id,Category,Name,Description,Price,ImagePath) VALUES('" + id + "','" + Category + "','" + Name + "','"+ Description + "','" + Price + "','" + ImagePath + "');", con);
            com.Connection.Open();
            int rows = com.ExecuteNonQuery();
            com.Connection.Close();
        
         
            return rows;

    }

    [WebMethod]
     public void MakeOrder(string UserId,int CreditNumber,int ExpireDate)
     {

         var conString = System.Configuration.
                                   ConfigurationManager.ConnectionStrings["DefaultConnection"];
         string strConnString = conString.ConnectionString;
         SqlConnection con = new SqlConnection(strConnString);
         SqlCommand com = new SqlCommand("INSERT INTO orders(id,Category,Name,Description,Price,ImagePath,UserId,CreditNumber,ExpireDate) SELECT id,Category,Name,Description,Price,ImagePath," + "'" + UserId + "'" + "," + "'" + CreditNumber + "'" + "," + "'" + ExpireDate + "'" + " FROM Cart  WHERE UserId='" + UserId + "';", con);               
         SqlCommand com2 = new SqlCommand("DELETE w FROM Yad2 w INNER JOIN orders e ON w.id=e.id AND w.ImagePath=e.ImagePath ;", con);
         com.Connection.Open();
         SqlDataReader reader = com.ExecuteReader();
         reader.Close();
         com.Connection.Close();
       
        
        com2.Connection.Open();
         SqlDataReader reader2 = com2.ExecuteReader();

         reader2.Close();
         com2.Connection.Close();
         ClearCart(UserId);
        

     }

    
     



}

/// <summary>
/// Summary description for Yad1Poduct
/// </summary>
public class Yad1Product
{
    
	
          public int Id { get; set; }
          public string Category { get; set; }
          public string Name { get; set; }
          public string Description { get; set; }
          public int Price { get; set; }
          public string ImagePath { get; set; }         
          public Yad1Product(int i, string cat, string name, string des, int price, string imagePath) { Id = i; Category = cat; Name = name; Description = des; Price = price; ImagePath = imagePath; }


   	
    //
		// TODO: Add constructor logic here
		//
	
}


/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public string Email { get; set; }
    public int PhoneNumber { get; set; }
    public User(int id, string name, int phonenumber, string username, string password, string email)
    { Id = id; Name = name; PhoneNumber = phonenumber; UserName = username; Password = password; Email = email; }


}











