<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="OtherHandicaps.aspx.vb" Inherits="Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1 {
            text-align: center;
        }
        .style2
        {
            font-size: small;
            text-align: center;
        }
    </style>
    <title>CH Kitty Club - Member Showcase - Stories of Their Special Kitties</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceStory" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    
                    SelectCommand="SELECT [MemberStory], [MemberAndCat] FROM [CHKC_Members] WHERE ([MemberID] = @MemberID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="MemberList" DefaultValue="113" Name="MemberID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcePhotos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    SelectCommand="SELECT [Filename], [Caption] FROM [CHKC_Photos] WHERE ([MemberID] = @MemberID) ORDER BY [Caption]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="MemberList" DefaultValue="113" Name="MemberID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:FormView ID="FormViewStory" runat="server" DataSourceID="SqlDataSourceStory" 
                            Height="172px" Width="577px">
                            <ItemTemplate>
                                <asp:Label ID="TextBoxMemberAndCat" runat="server" 
                                    Text='<%# Eval("MemberAndCat") %>' BorderStyle="None" Font-Bold="True" 
                                    style="font-family: Tahoma" Width="566px" BackColor="#E7E3CE" />
                                <br />
                                <br />
                                <asp:TextBox ID="TextBoxStory" runat="server" 
                                    Text='<%# Eval("MemberStory") %>' BorderStyle="None" TextMode="MultiLine" 
                                    ReadOnly="True" MaxLength="8192" Height="254px" Width="566px" 
                                    BackColor="#E7E3CE" />
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <br />
                        <asp:DataList ID="DataListPhotos" runat="server" 
                            DataSourceID="SqlDataSourcePhotos">
                            <SeparatorTemplate>
                                <hr />
                            </SeparatorTemplate>
                            <ItemTemplate>
                                <div class="style1">
                                    <asp:Label ID="LabelCaption" runat="server" Text='<%# Eval("Caption", "{0}") %>'></asp:Label>
                                    <br />
                                    <asp:Image ID="ImagePhoto" runat="server" 
                                        ImageUrl='<%# Eval("Filename", "images/stories/{0}") %>' />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MemberList" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div><!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>Choose a Member's Story</h2>
                <ul>
                    <li>
                        <asp:ListBox ID="MemberList" runat="server" 
                            DataSourceID="SqlDataSourceMemberNames" DataTextField="MemberAndCat" 
                            DataValueField="MemberID" Rows="10" AutoPostBack="True" 
                            BackColor="#E7E3CE" Width="236px"></asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSourceMemberNames" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            
                            
                            SelectCommand="SELECT [MemberAndCat], [MemberID] FROM [CHKC_Members] WHERE (([Approved] = @Approved) AND ([OtherHandicap] = @OtherHandicap)) ORDER BY [LastActivityDate] DESC, [MemberName], [CatName]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                                <asp:Parameter DefaultValue="1" Name="OtherHandicap" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </li>
                    <li>Click here to <a href="Members.aspx"><span style="font-weight:bold">see stories of our members' kitties that have CH</span></a></li>
                </ul>
            </li>
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                    <li>
                        <h2>You may...</h2>
                        <ul>
                            <li>Click here to <a href="NewStory.aspx"><span style="font-weight:bold">submit your kitty's story and photos</span></a></li>
                            <li>Click here to <a href="NewPhotos.aspx"><span style="font-weight:bold">upload new photos</span></a></li>
                        </ul>
                    </li>
                    </LoggedInTemplate>
                </asp:LoginView>
        </ul>
    </div>
</asp:Content>

