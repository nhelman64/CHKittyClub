<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewPhotos.aspx.vb" Inherits="NewStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Share Your Special Kitty's Photos</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>Share Your Special Kitty's Photos</h2>
            <table>
                <tr>
                    <td>Username:</td>
                    <td><asp:TextBox ID="TextBoxUsername" runat="server" ReadOnly="True"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Kitty's name:</td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSourceKitty" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            SelectCommand="SELECT DISTINCT [CatName] FROM [CHKC_Members] WHERE ([MemberName] = @MemberName)">
                            <SelectParameters>
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
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <br />
                        You can upload up to six (6) photos of your kitty<br />
                        <br />
                        If an error occurs, please try again, uploading one or two photos at a time.</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption1" runat="server" MaxLength="128" Width="209px"></asp:TextBox>
                        <br />
                        <asp:FileUpload ID="FileUpload2" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption2" runat="server" MaxLength="128" Width="209px"></asp:TextBox>
                        <br />
                        <asp:FileUpload ID="FileUpload3" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption3" runat="server" MaxLength="128" Width="209px"></asp:TextBox>
                        <br />
                        <asp:FileUpload ID="FileUpload4" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption4" runat="server" MaxLength="128" Width="209px"></asp:TextBox>
                        <br />
                        <asp:FileUpload ID="FileUpload5" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption5" runat="server" MaxLength="128" Width="209px"></asp:TextBox>
                        <br />
                        <asp:FileUpload ID="FileUpload6" runat="server" />
                        &nbsp; Caption:&nbsp;<asp:TextBox ID="TextBoxCaption6" runat="server" MaxLength="128" 
                            Width="209px"></asp:TextBox>
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
                            Text="Submit Photos" />                        <br />
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

