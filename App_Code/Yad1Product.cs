using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
          public Yad1Product(int i, string cat, string name, string des, int price) { Id = i; Category = cat; Name = name; Description = des; Price = price; }
   		//
		// TODO: Add constructor logic here
		//
	
}