<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CreateAccount.aspx.vb" Inherits="CreateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Create An Account</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>Create An Account</h2>
            <div class="entry">
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
                    <StartNavigationTemplate>
                        <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="Next" />
                    </StartNavigationTemplate>
                    <wizardsteps> <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server"> 
                        <ContentTemplate>
                            <table border="0">
                                <tr>
                                    <td colspan="2">
                                        We request that you pick a username that uses your real name in some fashion 
                                        (e.g., NealHelman, NealH, or NHelman) to help ensure the uniqueness of your 
                                        username as well as to promote a sense of identity and community on our site. 
                                        &nbsp;Your username will be used in your kitties&#39; Member Showcase stories, as well as 
                                        in Live Chat and your Daily Pet Diary entries.<br /><br />Thanks for your consideration 
                                        and support.</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                            ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">Passwords must be at least 7 characters.</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="Password is required." 
                                            ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                            AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                            ControlToValidate="ConfirmPassword" 
                                            ErrorMessage="Confirm Password is required." 
                                            ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Email" runat="server" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                            ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                            ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Question" runat="server" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                            ControlToValidate="Question" ErrorMessage="Security question is required." 
                                            ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Answer" runat="server" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                            ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                            ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                            ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                            Display="Dynamic" 
                                            ErrorMessage="The Password and Confirmation Password must match." 
                                            ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        Having trouble creating an account?<br />
                                        Cookies must be enabled to create an account or login to this site.<br />
                                        Click <a href="EnableCookies.aspx">here</a> to find out how to enable cookies on different browsers.
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <CustomNavigationTemplate>
                            <table border="0" cellspacing="5" style="width: 100%; height: 100%;">
                                <tr align="right">
                                    <td align="right" colspan="0">
                                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                                            Text="Create User" ValidationGroup="CreateUserWizard1" />
                                    </td>
                                </tr>
                            </table>
                        </CustomNavigationTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server"> 
                            <ContentTemplate>
                                <table border="0">
                                    <tr>
                                        <td align="center">
                                            Complete</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Your account has been successfully created.</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                                CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" 
                                                onclick="ContinueButton_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </wizardsteps>
                </asp:CreateUserWizard>
            </div>
        </div>
    </div><!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <p style="font-weight:bold;text-align:center;">Benefits of Membership</p>
                <p>By creating an account at CH Kitty Club, you can contribute to the following pages:</p>
                <ul>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    <li><em>Member Stories</em> - Where CH Kitty Club members tell their special kitty's stories and share photos of them</li>
                    <li><em>Tips From Members</em> - Learn tips and tricks from people who have been living with CH kitties</li>
                    <li><em>Videos</em> - An extensive collection of YouTube videos showing CH kitties</li>
                    <li><em>Artistic Errata</em> - Poems, stories, and other artistic expression from our members</li>
                    <li><em>Birthdays</em> - Help celebrate our members' special kitties', birthdays</li>
                    <li><em>Memorials</em> - Celebrate the lives of our special kitties who have passed on</li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

