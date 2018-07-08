<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ReviewDiary.aspx.vb" Inherits="Tips" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceTips" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    
                    
                    SelectCommand="SELECT [EntryBody] FROM [CHKC_PetDiary] WHERE ([UID] = @UID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxNames" Name="UID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <asp:UpdatePanel ID="UpdatePanelTips" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceTips">
                        <ItemTemplate>
                            <asp:TextBox ID="DiaryTextBox" runat="server" Text='<%# Bind("EntryBody") %>' 
                                Width="566px" Rows="16" TextMode="MultiLine" />
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListBoxNames" EventName="SelectedIndexChanged">
                        </asp:AsyncPostBackTrigger>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div> <!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>Tips Menu</h2>
                <ul>
                    <li>
                        <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            
                            SelectCommand="SELECT [PostLabel], [UID] FROM [CHKC_PetDiary] WHERE ([Approved] IS NULL) ORDER BY [EntryDate] DESC, [Username], [CatName]">
                        </asp:SqlDataSource>
                        <asp:ListBox ID="ListBoxNames" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceCategories" DataTextField="PostLabel" 
                            DataValueField="UID" Rows="16"></asp:ListBox>
                    </li>
                </ul>
            </li>
            <li>
                <h2>You may:</h2>
                <ul>
                    <li><asp:Button ID="approveButton" runat="server" Text="Approve Post" /></li>
                    <li><asp:Button ID="disapproveButton" runat="server" Text="Disapprove Post" /></li>
                    <li><asp:Button ID="deleteButton" runat="server" Text="Delete Post" /></li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

