<%@ Page Title="" Language="VB" MasterPageFile="~/SubMasterPage.master" AutoEventWireup="false" CodeFile="UsernameEmails.aspx.vb" Inherits="utility_UsernameEmails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="contents">
        <div class="post">
            <h2>Website Usernames & Email Addresses</h2>
            <div class="entry">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    SelectCommand="SELECT * FROM [UsernameEmails] ORDER BY [UserName]">
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

