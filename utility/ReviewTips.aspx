<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ReviewTips.aspx.vb" Inherits="Tips" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceTips" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    
                    SelectCommand="SELECT [Category], [TipText] FROM [CHKC_Tips] WHERE (([TipID] = @TipID) AND ([Approved] = @Approved))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxNames" Name="TipID" 
                            PropertyName="SelectedValue" Type="String" DefaultValue="" />
                        <asp:Parameter DefaultValue="0" Name="Approved" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <asp:UpdatePanel ID="UpdatePanelTips" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceTips">
                        <ItemTemplate>
                            <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>'
                                Width="566px" />
                            <br />
                            <br />
                            <asp:TextBox ID="TipTextBox" runat="server" Text='<%# Bind("TipText") %>' 
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
                            SelectCommand="SELECT [TipID], [MemberName] FROM [CHKC_Tips] WHERE ([Approved] = @Approved)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="Approved" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListBox ID="ListBoxNames" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceCategories" DataTextField="MemberName" 
                            DataValueField="TipID" Rows="16"></asp:ListBox>
                    </li>
                </ul>
            </li>
            <li>
                <h2>You may:</h2>
                <ul>
                    <li><asp:Button ID="approveButton" runat="server" Text="Approve Tip" /></li>
                    <li><asp:Button ID="disapproveButton" runat="server" Text="Disapprove Tip" /></li>
                    <li><asp:Button ID="deleteButton" runat="server" Text="Delete Tip" /></li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

