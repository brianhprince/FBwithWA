<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Landing Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script>
    var oauth_url = 'https://www.facebook.com/dialog/oauth/';
    oauth_url += '?client_id=<%=ConfigurationManager.AppSettings["facebook_appid"].ToString() %>';
    oauth_url += '&redirect_uri=' + encodeURIComponent('http://apps.facebook.com/dosocoupon/');
    oauth_url += '&scope=email,user_birthday'

    window.top.location = oauth_url;
</script>

    <h2>Register for our Sweepstakes!</h2>
<p>Login to Facebook, pick your favorite store, and register for our sweepstakes.</p>
<p>This is a sample web site to show you how to run a Facebook application with <a href="http://www.windowsazure.com">Windows Azure</a>.</p>
</asp:Content>
