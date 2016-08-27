<%@ Page Title="" Language="C#" MasterPageFile="~/PreLogin.master" AutoEventWireup="true" CodeFile="sign-up.aspx.cs" Inherits="sign_up" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleMaster" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headMaster" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyMaster" runat="Server">
    <div role="main" class="ui-content">
        <h3>Sign Up</h3>
        <label for="txt-first-name">First Name</label>
        <input type="text" name="txt-first-name" id="txt-first-name" value="">
        <label for="txt-last-name">Last Name</label>
        <input type="text" name="txt-last-name" id="txt-last-name" value="">
        <label for="txt-email">Email Address</label>
        <input type="text" name="txt-email" id="txt-email" value="">
        <label for="txt-password">Password</label>
        <input type="password" name="txt-password" id="txt-password" value="">
        <label for="txt-password-confirm">Confirm Password</label>
        <input type="password" name="txt-password-confirm" id="txt-password-confirm" value="">
        <a href="#dlg-sign-up-sent" data-rel="popup" data-transition="pop" data-position-to="window" id="btn-submit" class="ui-btn ui-btn-b ui-corner-all mc-top-margin-1-5">Submit</a>
        <div data-role="popup" id="dlg-sign-up-sent" data-dismissible="false" style="max-width: 400px;">
            <div data-role="header">
                <h1>Almost done...</h1>
            </div>
            <div role="main" class="ui-content">
                <h3>Confirm Your Email Address</h3>
                <p>We sent you an email with instructions on how to confirm your email address. Please check your inbox and follow the instructions in the email.</p>
                <div class="mc-text-center"><a href="sign-in.html" class="ui-btn ui-corner-all ui-shadow ui-btn-b mc-top-margin-1-5">OK</a></div>
            </div>
        </div>
    </div>
    <!-- /content -->

</asp:Content>

