<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewMemorial.aspx.vb" Inherits="NewStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
    <title>CH Kitty Club - We're Sorry To Hear Of Your Loss</title>
    <style type="text/css">
        .style1
        {
            width: 82px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>We're Very Sorry To Hear That</h2>
            <h2>You've Lost Your Special Kitty</h2>
            <p>Thank you for letting us include him/her in our Memorial page</p>
            <table>
                <tr>
                    <td class="style1">Username:</td>
                    <td><asp:TextBox ID="TextBoxUsername" runat="server" ReadOnly="True"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="style1">Kitty's name:</td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSourceKitty" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            
                            SelectCommand="SELECT [CatName] FROM [CHKC_Members] WHERE (([Deceased] IS NULL) AND ([Approved] = @Approved) AND ([MemberName] = @MemberName))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                                <asp:ControlParameter ControlID="TextBoxUsername" Name="MemberName" 
                                    PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownListCats" runat="server" 
                            DataSourceID="SqlDataSourceKitty" DataTextField="CatName" 
                            DataValueField="CatName" Width="128px">
                        </asp:DropDownList>
                        <br />
                        </td>
                </tr>
                <tr>
                    <td class="style1">Email:</td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1" valign="top">Anything you&#39;d like to say:</td>
                    <td>
                        <asp:TextBox ID="TextBoxToSay" runat="server" TextMode="MultiLine" 
                            MaxLength="1024" Rows="6"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style1">&nbsp;</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/CAPTCHAImage.aspx" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">&nbsp;</td>
                    <td>
                        <asp:TextBox ID="TextBoxValidate" runat="server"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ControlToValidate="TextBoxValidate" ErrorMessage="Validation error">*</asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" 
                            ControlToValidate="TextBoxValidate" ErrorMessage="The field is required">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="ButtonRegister" runat="server" 
                            Text="Sumbit" />                        <br />
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

