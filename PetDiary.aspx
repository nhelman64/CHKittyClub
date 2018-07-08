<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PetDiary.aspx.vb" Inherits="PetDiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Daily Pet Diaries</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:Literal ID="LiteralHeader" runat="server"></asp:Literal>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceDaily" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    SelectCommand="SELECT [Username], [CatName], [EntryBody] FROM [CHKC_PetDiary] WHERE (([EntryDate] = @EntryDate) AND ([Approved] = @Approved)) ORDER BY [UID]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CalendarDiaries" DbType="Date" 
                            Name="EntryDate" PropertyName="SelectedDate" />
                        <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:UpdatePanel ID="UpdatePanelDiary" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DataList ID="DataListDiary" runat="server" DataSourceID="SqlDataSourceDaily">
                            <ItemTemplate>
                                Member&#39;s name:
                                <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' 
                                    style="font-weight: 700" />
                                <br />
                                Kitty&#39;s name:
                                <asp:Label ID="CatNameLabel" runat="server" Text='<%# Eval("CatName") %>' 
                                    style="font-weight: 700" />
                                <br />
                                <br />
                                <asp:Label ID="EntryBodyLabel" runat="server" Text='<%# Eval("EntryBody") %>' />
                                <br />
                                <br />
                            </ItemTemplate>
                            <SeparatorTemplate>
                                ***** ***** ***** ***** *****<br />
                            </SeparatorTemplate>
                        </asp:DataList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="CalendarDiaries" 
                            EventName="SelectionChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div><!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>Daily Pet Diaries</h2>
                <ul>
                    <li>
                        <p>Click on one of the highlighted dates below to view diary entries of our CH kitties.</p>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Calendar ID="CalendarDiaries" runat="server"></asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </li>
                </ul>
            </li>
        </ul>
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                <ul>
                    <li>
                        <h2>You May...</h2>
                        <ul>
                            <li>Click here to <a href="NewPetDiary.aspx"><span style="font-weight:bold">post your own pet's diary entry</span></a></li>
                        </ul>
                    </li>
                </ul>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
</asp:Content>

