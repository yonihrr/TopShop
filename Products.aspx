<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleMaster" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headMaster" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyMaster" Runat="Server">

     <div data-role="main" class="ui-content">
        <h2>Product Catagories</h2>
        <ul data-role="listview" data-inset="false">
            <li>
                <a href="ProductDiscription.aspx">
                    <img src="Pics/products/beer-generic.jpg" />
                    <h2>Product 1</h2>
                    <p>This is Product 1 Description</p>
                </a>
            </li>
            <li>
                <a href="ProductDiscription.aspx">
                    <img src="Pics/products/cola.jpg" />
                    <h2>Product 2</h2>
                    <p>This is Product 2 Description</p>
                </a>
            </li>
            <li>
                <a href="ProductDiscription.aspx">
                    <img src="Pics/products/water.jpg" />
                    <h2>Product 3</h2>
                    <p>This is Product 3 Description</p>
                </a>
            </li>
            <li>
                <a href="ProductDiscription.aspx">
                    <img src="Pics/products/wine.jpg" />
                    <h2>Product 4</h2>
                    <p>This is Product 4 Description</p>
                </a>
            </li>
        </ul>
    </div>
</asp:Content>

