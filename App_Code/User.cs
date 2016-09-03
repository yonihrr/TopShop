using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
    public User(int i, string n) { Name = n; Id = i; }
}