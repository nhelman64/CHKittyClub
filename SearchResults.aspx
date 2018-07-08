<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SearchResults.aspx.vb" Inherits="SearchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="cse-search-results"></div>
    <script type="text/javascript">
      var googleSearchIframeName = "cse-search-results";
      var googleSearchFormName = "cse-search-box";
      var googleSearchFrameWidth = 795;
      var googleSearchDomain = "www.google.com";
      var googleSearchPath = "/cse";
    </script>
    <script type="text/javascript" src="http://www.google.com/afsonline/show_afs_search.js"></script>
</asp:Content>

