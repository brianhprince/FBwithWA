<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<FBwithWA.ViewModels.SelectStoreViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Select You Favorite Store
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Please choose your favorite nearby store:</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <ul class="block-radio">
        <% foreach (var store in Model.NearbyStores) { %>
            <li>
            <%: Html.RadioButtonFor(model =>model.StoreNumber, store.PartitionKey)%>
            <label>
                <strong><%:HttpUtility.HtmlEncode(store.Name) %></strong><br />
                <%:store.City %>,&nbsp;<%:store.State %>&nbsp;<%:store.Zip %>
            </label>
            </li>
        <%} %>
        </ul>
                                
        <p>
            <input type="submit" value="Next" />
        </p>
        <%: Html.HiddenFor(model => model.State.FBSignedRequest) %>
        <%: Html.HiddenFor(model => model.State.FBUserId) %>
    <% } %>

</asp:Content>
