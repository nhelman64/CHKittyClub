<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PasswordRecovery.aspx.vb" Inherits="PasswordRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Recover Your Password</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>Forgot Your Password?</h2>
            <div class="entry">
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#E7E3CE">
                    <QuestionTemplate>
                        <table border="0" cellpadding="1" cellspacing="0" 
                            style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                Answer the following question to receive your password.</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                User Name:</td>
                                            <td>
                                                <asp:Literal ID="UserName" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Question:</td>
                                            <td>
                                                <asp:Literal ID="Question" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Answer:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                                    ControlToValidate="Answer" ErrorMessage="Answer is required." 
                                                    ToolTip="Answer is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <br />
                                                <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" 
                                                    ValidationGroup="PasswordRecovery1" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </QuestionTemplate>
                    <UserNameTemplate>
                        <table border="0" cellpadding="1" cellspacing="0" 
                            style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                Enter your User Name to receive your password.</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                    ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <br />
                                                <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" 
                                                    ValidationGroup="PasswordRecovery1" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </UserNameTemplate>
                </asp:PasswordRecovery>
            </div>
        </div>
    </div>
</asp:Content>

