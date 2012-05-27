<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<FBwithWA.ViewModels.ContactInfoViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Register for a coupon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Register to Win!</h2>
<div>Please provide the following information. All fields are required.</div>
<% using (Html.BeginForm())
   {%>
    <%: Html.ValidationSummary(true)%>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.contact.FirstName)%>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.contact.FirstName)%>
        <%: Html.ValidationMessageFor(model => model.contact.FirstName)%>
    </div>
            
    <div class="editor-label">
        <%: Html.LabelFor(model => model.contact.LastName)%>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.contact.LastName)%>
        <%: Html.ValidationMessageFor(model => model.contact.LastName)%>
    </div>
            
    <div class="editor-label">
        <%: Html.LabelFor(model => model.contact.Email)%>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.contact.Email)%>
        <%: Html.ValidationMessageFor(model => model.contact.Email)%>
    </div>
            
    <div class="editor-label">
        <%: Html.LabelFor(model => model.contact.DateOfBirth)%>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.contact.DateOfBirth)%> 
        <%: Html.ValidationMessageFor(model => model.contact.DateOfBirth)%>
    </div>
    <div>You must be 18 or older to participate.</div>
            
    <div class="editor-label">
        <%: Html.LabelFor(model => model.contact.Zip)%>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.contact.Zip)%>
        <%: Html.ValidationMessageFor(model => model.contact.Zip)%>
    </div>
    <%: Html.HiddenFor(model => model.state.FBSignedRequest) %>
    <%: Html.HiddenFor(model => model.state.FBUserId) %>
    <p>
        <input type="submit" value="Next" />
    </p>
  <%} %>
</asp:Content>
