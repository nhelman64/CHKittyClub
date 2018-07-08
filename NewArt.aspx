<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewArt.aspx.vb" Inherits="NewArt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Share Your Own Artistic Contribution</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="contents">
        <div class="post">
            <div class="entry">
                <h2>Share Your Own Artistic Contribution</h2>
                <p>Contributions may only be submitted by registered users of this site.</p>
                <table cellpadding="5px" cellspacing="5px">
                    <tr>
                        <td>Username:</td>
                        <td><asp:TextBox ID="TextBoxUsername" runat="server" ReadOnly="True" Width="400px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><asp:TextBox ID="TextBoxEmail" runat="server" ReadOnly="True" Width="400px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td valign="top">Your Contribution:</td>
                        <td><asp:TextBox ID="TextBoxContribution" runat="server" TextMode="MultiLine" 
                                Rows="15" Width="400px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Attachment or photo:</td>
                        <td><asp:FileUpload ID="FileUploadAttachment" runat="server" /></td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/CAPTCHAImage.aspx" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">
                            <asp:TextBox ID="TextBoxValidate" runat="server"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                ControlToValidate="TextBoxValidate" ErrorMessage="Validation error">*</asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" 
                                ControlToValidate="TextBoxValidate" ErrorMessage="The field is required">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center"><asp:Button ID="ButtonShare" runat="server" Text="Share Your Art With Us" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

