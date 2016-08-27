<%@ Page Title="" Language="C#" MasterPageFile="~/PreLogin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyMaster" Runat="Server">
     <!-- /header -->
    <div role="main" class="ui-content">
        <h2 class="mc-text-center">Welcome!</h2>
        <p class="mc-top-margin-1-5"><b>Existing Users</b></p>
        <a href="sign-in.aspx" class="ui-btn ui-btn-b ui-corner-all">Sign In</a>
        <p class="mc-top-margin-1-5"><b>Don't have an account?</b></p>
        <a href="sign-up.aspx" class="ui-btn ui-btn-b ui-corner-all">Sign Up</a>
        <p class="mc-top-margin-1-5"><a href="home.aspx">Enter as guest</a></p>
        <p></p>
    </div>
    <!-- /content -->
</asp:Content>

   


