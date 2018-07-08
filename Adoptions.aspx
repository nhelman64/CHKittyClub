<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Adoptions.aspx.vb" Inherits="Adoptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Kitties Available For Adoption</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
    <link href="img-shadow.css" rel="Stylesheet" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>CH Kitty Club Adoption Specialist</h2>
            <div class="entry">
                <p>If you have a CH kitty for adoption, we encourage you to post the details on the <a href="Adoptions.aspx">Adoption page</a>, as well as 
                to post in the <a href="http://groups.yahoo.com/group/chkittyclub/">Yahoo group</a>.&nbsp; Additionally, you may post the details of the 
                adoption on the <a href="https://www.facebook.com/groups/CHcat/">Cerebellar Hypoplasia Cats &amp; Kittens Facebook page</a>.&nbsp; 
                This should greatly increase the likelihood that the kitty will find a suitable furever home.&nbsp; 
                    To display our Adoption Form, sign into your CH Kitty Club website account and click the link in the &quot;You May&quot; section on the right side of the screen.</p>
            </div>
        </div>
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceAdoptee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    
                    SelectCommand="SELECT [Username], [CatName], [CatBirthday], [CatCity], [CatState], [CatBio], [Gender], [CatPhoto], [VetHistory] FROM [CHKC_Adoptions] WHERE (([Approved] = @Approved) AND ([Placed] IS NULL) AND ([SubmissionAge] < 90) AND ([UID] = @UID))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                        <asp:ControlParameter ControlID="ListBoxAvailable" Name="UID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Literal ID="LiteralHeader" runat="server" Visible="False"></asp:Literal>
                        <asp:FormView ID="FormViewAdoptee" runat="server" 
                            DataSourceID="SqlDataSourceAdoptee" Height="203px">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="CatNameLabel" runat="server" Text='<%# Eval("CatName") %>' 
                                                style="font-weight: 700" />
                                            &nbsp;is available for adoption.<br />
                                            Gender:
                                            <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                            <br />
                                            Birthday:
                                            <asp:Label ID="CatBirthdayLabel" runat="server" 
                                                Text='<%# Eval("CatBirthday", "{0:d}") %>' />
                                            <br />
                                            Location:
                                            <asp:Label ID="CatCityLabel" runat="server" Text='<%# Eval("CatCity") %>' 
                                                style="font-weight: 700" />
                                            <b>,</b>
                                            <asp:Label ID="CatStateLabel" runat="server" Text='<%# Eval("CatState") %>' 
                                                style="font-weight: 700" />
                                            <br />
                                            <br />
                                            <div class="img-shadow">
                                                <div>
                                                    <asp:Image ID="ImageKitty" runat="server" 
                                                        ImageUrl='<%# Eval("CatPhoto", "{0}") %>' />
                                                </div>
                                            </div>
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="CatBioLabel" runat="server" Text='<%# Eval("CatBio") %>' />
                                            <br />
                                            <br />
                                            Vet History:
                                            <asp:Label ID="VetHistoryLabel" runat="server" 
                                                Text='<%# Eval("VetHistory") %>' />
                                            <br />
                                            <br />
                                            Contact Person's Username:
                                            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                                            <br />
                                            <br />
                                            <asp:HyperLink ID="HyperLinkApply" runat="server" 
                                                NavigateUrl="AdoptThisKitty.aspx">Apply to adopt this kitty</asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListBoxAvailable" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div><!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>Kitties Available<br />For Adoption</h2>
                <ul>
                    <li>
                        <asp:SqlDataSource ID="SqlDataSourceAvailable" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            SelectCommand="SELECT [LocationAge], [UID] FROM [CHKC_Adoptions] WHERE (([Approved] = @Approved) AND ([SubmissionAge] < 90) AND ([Placed] IS NULL)) ORDER BY [LocationAge]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListBox ID="ListBoxAvailable" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceAvailable" DataTextField="LocationAge" 
                            DataValueField="UID" Rows="10"></asp:ListBox>
                    </li>
                </ul>
            </li>
            <li>
                <h2>You May...</h2>
                <ul>
                    <asp:LoginView ID="LoginViewYouMay" runat="server">
                        <LoggedInTemplate>
                            <li>Click here to <a href="NewAdoptee.aspx"><span style="font-weight:bold">enter a new adoptee</span></a></li>
                        </LoggedInTemplate>
                    </asp:LoginView>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="Panel1" runat="server" Visible="False">
                                <li><asp:HyperLink ID="HyperLinkApply" runat="server" 
                                        NavigateUrl="AdoptThisKitty.aspx" Visible="False">Click here to <span style="font-weight:bold">apply to adopt this kitty</span></asp:HyperLink></li>
                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ListBoxAvailable" 
                                EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

