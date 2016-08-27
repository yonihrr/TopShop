<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleMaster" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headMaster" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyMaster" runat="Server">
    <div data-role="main" class="ui-content">
        <h2>Product Catagories</h2>
        <ul data-role="listview" data-inset="false">
            <li>
                <a href="Products.aspx">
                    <img src="Pics/catagories/Clean.jpg" />
                    <h2>Topic 1</h2>
                    <p>This is Topic 1 Description</p>
                </a>
            </li>
            <li>
                <a href="Products.aspx">
                    <img src="Pics/catagories/gen.jpg" />
                    <h2>Topic 2</h2>
                    <p>This is Topic 2 Description</p>
                </a>
            </li>
            <li>
                <a href="Products.aspx">
                    <img src="Pics/catagories/Generic-products.jpg" />
                    <h2>Topic 2</h2>
                    <p>This is Topic 2 Description</p>
                </a>
            </li>
            <li>
                <a href="Products.aspx">
                    <img src="Pics/catagories/generic-tp.jpg" />
                    <h2>Topic 2</h2>
                    <p>This is Topic 2 Description</p>
                </a>
            </li>
        </ul>
    </div>
</asp:Content>

