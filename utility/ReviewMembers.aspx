<%@ Page Title="" Language="VB" MasterPageFile="~/SubMasterPage.master" AutoEventWireup="false" CodeFile="ReviewMembers.aspx.vb" Inherits="Members" %>

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
                        <asp:ControlParameter ControlID="MemberList" DefaultValue="" Name="MemberID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcePhotos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    SelectCommand="SELECT [Filename], [Caption] FROM [CHKC_Photos] WHERE ([MemberID] = @MemberID) ORDER BY [Caption]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="MemberList" DefaultValue="" Name="MemberID" 
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
                                    style="font-family: Tahoma" Width="566px" BackColor="#E7E3CE"  />
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
                                        ImageUrl='<%# Eval("Filename", "../uploads/{0}") %>' />
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
                            DataValueField="MemberID" Rows="16" AutoPostBack="True" 
                            BackColor="#FCF9E8"></asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSourceMemberNames" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            
                            SelectCommand="SELECT [MemberAndCat], [MemberID] FROM [CHKC_Members] WHERE ([Approved] = @Approved) ORDER BY [MemberName], [MemberEmail], [CatName]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="Approved" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </li>
                </ul>
            </li>
                <li>
                    <h2>You may...</h2>
                    <ul>
                    <li><asp:Button ID="approveButton" runat="server" Text="Approve Story" /></li>
                    <li><asp:Button ID="disapproveButton" runat="server" Text="Disapprove Story" /></li>
                    <li><asp:Button ID="deleteButton" runat="server" Text="Delete Story" /></li>
                    </ul>
                </li>
        </ul>
    </div>
</asp:Content>

