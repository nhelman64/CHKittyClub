<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Tips.aspx.vb" Inherits="Tips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CH Kitty Club - Tips Our Members Learned In Living With Their Special Kitties</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceTips" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    
                    SelectCommand="SELECT [TipText] FROM [CHKC_Tips] WHERE (([Category] = @Category) AND ([Approved] = @Approved))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxCategories" Name="Category" 
                            PropertyName="SelectedValue" Type="String" DefaultValue="Anesthesia" />
                        <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:UpdatePanel ID="UpdatePanelTips" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DataList ID="DataListTips" runat="server" DataSourceID="SqlDataSourceTips">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxTip" runat="server" Height="186px" ReadOnly="True" 
                                    Text='<%# Eval("TipText", "{0}") %>' TextMode="MultiLine" Width="566px">
                                </asp:TextBox>
                            </ItemTemplate>
                            <SeparatorTemplate>
                                <br />
                            </SeparatorTemplate>
                        </asp:DataList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListBoxCategories" EventName="SelectedIndexChanged">
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
                            SelectCommand="SELECT DISTINCT [Category] FROM [CHKC_Tips] WHERE ([Approved] = @Approved)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListBox ID="ListBoxCategories" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceCategories" DataTextField="Category" 
                            DataValueField="Category" Rows="10"></asp:ListBox>
                    </li>
                </ul>
            </li>
            <asp:LoginView ID="LoginView1" runat="server">
                <LoggedInTemplate>
                    <li>
                        <h2>You may:</h2>
                        <ul>
                            <li><a href="NewTip.aspx">Click here to <span style="font-weight:bold">share your own tip for other members or visitors to view</span></a></li>
                        </ul>
                    </li>
                </LoggedInTemplate>
            </asp:LoginView>
        </ul>
    </div>
</asp:Content>

