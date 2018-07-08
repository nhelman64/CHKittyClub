<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewAdoptee.aspx.vb" Inherits="NewAdoptee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - New Adoptee</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div id="contents">
        <div class="post">
            <div class="entry">
                We expect that you will let us know when a kitty you have listed for adoption 
                has actually been adopted so we can take down the listing.&nbsp;
                <br />
                <br />
                Adoption listings older than 90 days will no longer be displayed.&nbsp; If you 
                wish to display a listing longer than that, you will need to let us know after 
                the listing has &quot;aged out&quot; so we can put it back into rotation for display 
                again.&nbsp;
                <br />
                <br />
                Thanks for working with us on this.&nbsp;&nbsp;                 <br />
                <br />
                <table cellpadding="3px" cellspacing="3px">
                    <tr>
                        <td>Username:</td>
                        <td><asp:TextBox ID="TextBoxUsername" runat="server" ReadOnly="True" Width="400px"></asp:TextBox></td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td colspan="2">Kitty's Information</td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><asp:TextBox ID="TextBoxKittyName" runat="server" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBoxKittyName" Display="Dynamic" 
                                ErrorMessage="Kitty's name is required" ToolTip="Kitty's name is required.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td><asp:DropDownList ID="DropDownListGender" runat="server" Height="17px" 
                                Width="128px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="DropDownListGender" Display="Dynamic" 
                                ErrorMessage="Kitty's gender is required" ToolTip="Kitty's gender is required">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Birthday:</td>
                        <td><asp:TextBox ID="TextBoxBirthday" runat="server"></asp:TextBox>&nbsp; <asp:ImageButton
                            ID="ButtonBirthday" runat="server" Text="..." CausesValidation="False" 
                                ImageUrl="~/images/tinyCalendar.png" />
                        <asp:CalendarExtender ID="CalendarExtenderBirthday" runat="server" TodaysDateFormat="MM/dd/yyyy" TargetControlID="TextBoxBirthday" PopupButtonID="ButtonBirthday">
                        </asp:CalendarExtender>
                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBoxBirthday" Display="Dynamic" 
                                ErrorMessage="Kitty's birthday is required." 
                                ToolTip="Kitty's birthday is required.">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToValidate="TextBoxBirthday" ErrorMessage="Birthday must be a date." 
                                ToolTip="Birthday must be a date." Type="Date" Operator="DataTypeCheck">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td><asp:TextBox ID="TextBoxCity" runat="server" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBoxCity" Display="Dynamic" 
                                ErrorMessage="Kitty's city is required." ToolTip="Kitty's city is required.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>State:</td>
                        <td><asp:DropDownList ID="DropDownListState" runat="server" Height="16px" 
                                Width="128px" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="DropDownListState" Display="Dynamic" 
                                ErrorMessage="Kitty's state is required." ToolTip="Kitty's state is required.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Kitty's Bio:</td>
                        <td><asp:TextBox ID="TextBoxBio" runat="server" Rows="16" TextMode="MultiLine" 
                                Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="TextBoxBio" Display="Dynamic" 
                                ErrorMessage="Kitty's bio is required." ToolTip="Kitty's bio is required.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Veterinary History:</td>
                        <td><asp:TextBox ID="TextBoxVetHistory" runat="server" Rows="16" 
                                TextMode="MultiLine" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="TextBoxVetHistory" Display="Dynamic" 
                                ErrorMessage="Kitty's vet history is required." 
                                ToolTip="Kitty's vet history is required.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Photo:</td>
                        <td> 
                            <asp:FileUpload ID="FileUploadPhoto" runat="server" Width="227px" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><asp:Image ID="Image1" runat="server" ImageUrl="~/CAPTCHAImage.aspx" /></td>
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
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="text-align:center;"><asp:Button ID="ButtonSubmit" runat="server" Text="Post New Kitty For Adoption" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="text-align:center;">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

