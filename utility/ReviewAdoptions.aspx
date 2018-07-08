<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ReviewAdoptions.aspx.vb" Inherits="Adoptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Kitties Available For Adoption</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceAdoptee" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    
                    
                    SelectCommand="SELECT [Username], [CatName], [CatBirthday], [CatCity], [CatState], [CatBio], [Gender], [CatPhoto], [VetHistory] FROM [CHKC_Adoptions] WHERE ([UID] = @UID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxAvailable" Name="UID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Literal ID="LiteralHeader" runat="server" Visible="False"></asp:Literal>
                        <asp:FormView ID="FormViewAdoptee" runat="server" 
                            DataSourceID="SqlDataSourceAdoptee">
                            <ItemTemplate>
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
                                Kitty&#39;s Bio:
                                <asp:Label ID="CatBioLabel" runat="server" Text='<%# Bind("CatBio") %>' />
                                <br />
                                <br />
                                Kitty&#39;s Vet History:
                                <asp:Label ID="VetHistoryLabel" runat="server" Text='<%# Bind("VetHistory") %>' />
                                <br />
                                <br />
                                Contact Person's Username:
                                <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
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
                            
                            SelectCommand="SELECT [LocationAge], [UID] FROM [CHKC_Adoptions] WHERE (([Approved] IS NULL) AND ([Placed] IS NULL)) ORDER BY [LocationAge]">
                        </asp:SqlDataSource>
                        <asp:ListBox ID="ListBoxAvailable" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceAvailable" DataTextField="LocationAge" 
                            DataValueField="UID"></asp:ListBox>
                    </li>
                </ul>
            </li>
            <li>
                <h2>You May...</h2>
                <ul>
                    <li><asp:Button ID="ButtonApprove" runat="server" Text="Approve" /></li>
                    <li><asp:Button ID="ButtonDelete" runat="server" Text="Delete" /></li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

