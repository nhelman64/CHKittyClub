<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewPetDiary.aspx.vb" Inherits="PetDiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Daily Pet Diaries</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <table>
                    <tr>
                        <td>Member's name:</td>
                        <td>
                            <asp:TextBox ID="TextBoxMemberName" runat="server" ReadOnly="True" 
                                Width="237px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Kitty's name:</td>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSourceKittyNames" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                                SelectCommand="SELECT [CatName] FROM [CHKC_Members] WHERE (([MemberName] = @MemberName) AND ([Approved] = @Approved))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBoxMemberName" Name="MemberName" 
                                        PropertyName="Text" Type="String" />
                                    <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DropDownList ID="DropDownListKittyName" runat="server" 
                                Width="237px" DataSourceID="SqlDataSourceKittyNames" 
                                DataTextField="CatName" DataValueField="CatName">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="DropDownListKittyName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>If you don&#39;t see your kitty&#39;s name, it is because he/she has no story in the 
                            Members&#39; Showcase.<br />
                            <br />
                            In order to post a diary entry, you must have a kitty that has a story in the 
                            Members&#39; Showcase.</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">Diary entry:</td>
                        <td>
                            <asp:TextBox ID="TextBoxDiaryEntry" runat="server" TextMode="MultiLine" 
                                Rows="16" Width="490px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBoxDiaryEntry" Display="Dynamic" 
                                ErrorMessage="A diary entry is required." ToolTip="A diary entry is required.">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr><td colspan="2"</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="text-align:center">
                            <asp:Button ID="ButtonPost" runat="server" Text="Post Diary Entry" 
                                onclick="ButtonPost_Click" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div><!-- end content -->
</asp:Content>

