<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Contact Us</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="contents">
        <div class="post">
            <div class="entry">
            <p>For more information about life with CH kitties, <a href="Join.aspx">join</a> the CH Kitty Club on Yahoo Groups.</p>
            <p>Please use the following form to contact the webmaster.</p>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <table cellpadding="5px" cellspacing="5px">
                <tr>
                    <td>Name:</td>
                    <td><asp:TextBox ID="TextBoxName" runat="server" Width="355px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBoxName" Display="Dynamic" 
                            ErrorMessage="Name is required." ToolTip="Name is required.">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><asp:TextBox ID="TextBoxEmail" runat="server" Width="355px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBoxEmail" Display="Dynamic" 
                            ErrorMessage="Email is required." ToolTip="Email is required.">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBoxEmail" Display="Dynamic" 
                            ErrorMessage="Please enter a valid email address." 
                            ToolTip="Please enter a valid email address." 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Subject:</td>
                    <td><asp:TextBox ID="TextBoxSubject" runat="server" Width="355px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBoxSubject" ErrorMessage="Subject is required." 
                            ToolTip="Subject is required.">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top">Message:</td>
                    <td><asp:TextBox ID="TextBoxMessage" runat="server" TextMode="MultiLine" Rows="8" 
                            Width="355px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="TextBoxMessage" Display="Dynamic" 
                            ErrorMessage="Message is required." ToolTip="Message is required.">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center"><asp:Image ID="Image1" runat="server" ImageUrl="~/CAPTCHAImage.aspx" /></td>
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
                    <td align="center">
                        <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" /> 
                        <asp:Button ID="ButtonReset" runat="server" Text="Reset" />
                    </td>
                </tr>
            </table>
            </div>
        </div>
    </div>
</asp:Content>

