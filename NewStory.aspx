<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewStory.aspx.vb" Inherits="NewStory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Share A New Story About Your Special Kitty</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div id="content">
        <div class="post">
            <h2>Share A New Story About Your Special Kitty</h2>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <table>
                <tr>
                    <td>Username:</td>
                    <td><asp:TextBox ID="TextBoxUsername" runat="server" ReadOnly="True"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" runat="server" MaxLength="128"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Kitty's name:</td>
                    <td><asp:TextBox ID="TextBoxKittyName" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBoxKittyName" Display="Dynamic" 
                            ErrorMessage="Your kitty's name is required." 
                            ToolTip="Your kitty's name is required.">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Kitty&#39;s birthday:</td>
                    <td>
                        <asp:TextBox ID="TextBoxBirthday" runat="server" MaxLength="10"></asp:TextBox>&nbsp; <asp:ImageButton
                            ID="ButtonBirthday" runat="server" Text="..." CausesValidation="False" ImageUrl="images/tinyCalendar.png" />
                        <asp:CalendarExtender ID="CalendarExtenderBirthday" runat="server" TodaysDateFormat="MM/dd/yyyy" TargetControlID="TextBoxBirthday" PopupButtonID="ButtonBirthday">
                        </asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBoxBirthday" Display="Dynamic" 
                            ErrorMessage="Your kitty's birthday is required." 
                            ToolTip="Your kitty's birthday is required.">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToValidate="TextBoxBirthday" 
                            ErrorMessage="Kitty's birthday must be a date" Operator="DataTypeCheck" 
                            ToolTip="Kitty's birthday must be a date" Type="Date">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:RadioButton ID="RadioButtonHasCH" runat="server" Text="Kitty has CH" 
                            GroupName="HasCHOrNot" Checked="True" />
&nbsp;
                        <asp:RadioButton ID="RadioButtonHasDisability" runat="server" 
                            Text="Kitty has some other handicap" GroupName="HasCHOrNot" />
                    </td>
                </tr>
                <tr>
                    <td valign="top">Kitty's story:</td>
                    <td>
                        <asp:TextBox ID="TextBoxStory" runat="server" TextMode="MultiLine" 
                            Height="190px" Width="489px" MaxLength="8192"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="Your kitty's story is required." ControlToValidate="TextBoxStory" Display="Dynamic" Text="*" ToolTip="Your kitty's story is required."></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">You can upload up to six (6) photos of your kitty.<br />
                        <br />
                        If an error occurs, please wait until we approve the rest of your<br />
                        showcase submission, then come back and upload the photos individually.</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption1" runat="server" Width="209px" MaxLength="128"></asp:TextBox>
                        <br />
                        <asp:FileUpload ID="FileUpload2" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption2" runat="server" Width="209px" MaxLength="128"></asp:TextBox>
                        &nbsp;<br />
                        <asp:FileUpload ID="FileUpload3" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption3" runat="server" Width="209px" MaxLength="128"></asp:TextBox>
                        &nbsp;<br />
                        <asp:FileUpload ID="FileUpload4" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption4" runat="server" Width="209px" MaxLength="128"></asp:TextBox>
                        &nbsp;<br />
                        <asp:FileUpload ID="FileUpload5" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption5" runat="server" Width="209px" MaxLength="128"></asp:TextBox>
                        &nbsp;<br />
                        <asp:FileUpload ID="FileUpload6" runat="server" />&nbsp; Caption:&nbsp;<asp:TextBox 
                            ID="TextBoxCaption6" runat="server" 
                            Width="209px" MaxLength="128"></asp:TextBox>
                        &nbsp;<br />
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
                            Text="Submit Story &amp; Upload Photos" />
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

