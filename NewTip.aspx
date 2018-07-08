<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewTip.aspx.vb" Inherits="NewStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Share A Tip You've Learned From Life With Your Special Kitty</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>Share A Tip You've Learned From<br />Life With Your Special Kitty</h2>
            <table>
                <tr>
                    <td>Username:</td>
                    <td><asp:TextBox ID="TextBoxUsername" runat="server" ReadOnly="True"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Kitty's name:</td>
                    <td><asp:TextBox ID="TextBoxKittyName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Category:</td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            SelectCommand="SELECT DISTINCT [Category] FROM [CHKC_Tips] ORDER BY [Category]"></asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownListCategories" runat="server" 
                            DataSourceID="SqlDataSourceCategories" DataTextField="Category" 
                            DataValueField="Category" AppendDataBoundItems="True" Width="226px" 
                            AutoPostBack="True">
                            <asp:ListItem Selected="True">(Enter my own category)</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:TextBox ID="TextBoxCategory" runat="server" Width="226px"></asp:TextBox>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">Your Tip:</td>
                    <td>
                        <asp:TextBox ID="TextBoxTip" runat="server" TextMode="MultiLine" 
                            Height="190px" Width="489px" MaxLength="8192"></asp:TextBox>
                        <br />
                        <br />

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/CAPTCHAImage.aspx" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="TextBoxValidate" runat="server"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ControlToValidate="TextBoxValidate" ErrorMessage="Validation error">*</asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" 
                            ControlToValidate="TextBoxValidate" ErrorMessage="The field is required">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="ButtonUpload" runat="server" 
                            Text="Share Your Tip" />                        <br />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            DisplayMode="List" HeaderText="Errors on form validation:" 
                            ShowMessageBox="True" ShowSummary="False" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

