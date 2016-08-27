<%@ Page Title="" Language="C#" MasterPageFile="~/PreLogin.master" AutoEventWireup="true" CodeFile="sign-in.aspx.cs" Inherits="sign_in" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleMaster" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headMaster" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyMaster" runat="Server">
    <div role="main" class="ui-content">
        <h3>Sign In</h3>
        <label for="txt-email">Email Address</label>
        <asp:TextBox runat="server" name="txt-email" ID="txtemail" value=""> </asp:TextBox>
        <label for="txt-password">Password</label>
        <asp:TextBox runat="server" name="txt-password" ID="txtpassword" value=""> </asp:TextBox>
     
      

            <fieldset data-role="controlgroup">
                <input type="checkbox" name="chck-rememberme" id="chck-rememberme" checked="" />
                <label for="chck-rememberme">Remember me</label>
            </fieldset>


        <a href="#dlg-invalid-credentials" data-rel="popup" data-transition="pop" data-position-to="window" id="btn-submit" class="ui-btn ui-btn-b ui-corner-all mc-top-margin-1-5">Submit</a>
        <p class="mc-top-margin-1-5"><a href="begin-password-reset.html">Can't access your account?</a></p>
        <p class="mc-top-margin-1-5"><a href="home.aspx">Enter as guest</a></p>
        <div data-role="popup" id="dlg-invalid-credentials" data-dismissible="false" style="max-width: 400px;">
            <div role="main" class="ui-content">
                <h3 class="mc-text-danger">Login Failed</h3>
                <p>Did you enter the right credentials?</p>
                <div class="mc-text-center"><a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-b mc-top-margin-1-5">OK</a></div>
            </div>
        </div>
    </div>
    <!-- /content -->
</asp:Content>

