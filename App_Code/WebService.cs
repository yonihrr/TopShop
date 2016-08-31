using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

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
    
}
