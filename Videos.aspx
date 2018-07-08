<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Videos.aspx.vb" Inherits="Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Videos of Kitties with Cerebellar Hypoplasia</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <p>The CH Kitty Club also has its own <a href="http://www.youtube.com/user/CHKittyClubVideos">YouTube channel</a>. Now, all you CH kitty mommies and daddies can "video brag" on your furbabies.  Let's show the world how accomplished our amazing CH kitties are!</p>
                <p>Upload videos from your phone by sending them to: <a href="m37mz1mh2iot@m.youtube.com">m37mz1mh2iot@m.youtube.com</a></p>
                <p>Or you can upload videos from your computer. Send it as an attachment to the email address <a href="m37mz1mh2iot@m.youtube.com">m37mz1mh2iot@m.youtube.com</a><br />
- Subject line = video title<br />
- Email body = video description<br />
After sending your video, you will get an email that it is uploading and a few minutes later another email confirming it is processed and available for viewing.</p>
            </div>
        </div>
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceURLs" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    
                    SelectCommand="SELECT [URL], [Title] FROM [CHKC_Videos] WHERE (([VideoID] = @VideoID) AND ([Approved] = @Approved))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxVideos" Name="VideoID" 
                            PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                        <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Literal ID="headline" runat="server" Visible="False"><h2>Choose a video from the list on the right...</h2></asp:Literal>
                        <asp:FormView ID="FormViewVideos" runat="server" 
                            DataSourceID="SqlDataSourceURLs">
                            <ItemTemplate>
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                <br />
                                <br />
                                <asp:Literal ID="LiteralURL" runat="server" Text='<%# Eval("URL", "{0}") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:FormView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListBoxVideos" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div><!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>Choose a video:</h2>
                <ul>
                    <li>
                        <asp:SqlDataSource ID="SqlDataSourceVideos" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            SelectCommand="SELECT [Title], [VideoID] FROM [CHKC_Videos] WHERE ([Approved] = @Approved)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource> 
                        <asp:ListBox ID="ListBoxVideos" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceVideos" DataTextField="Title" 
                            DataValueField="VideoID" Rows="10"></asp:ListBox>
                    </li>
                </ul>
            </li>
            <asp:LoginView ID="LoginView1" runat="server">
                <LoggedInTemplate>
                    <li>
                        <ul>
                            <h2>You may:</h2>
                            <li>Click here to <a href="NewVideo.aspx"><span style="font-weight:bold">suggest a video</span></a></li>
                        </ul>
                    </li>
                </LoggedInTemplate>
            </asp:LoginView>
        </ul>
    </div>
</asp:Content>

