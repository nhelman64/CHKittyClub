<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Birthdays.aspx.vb" Inherits="Birthdays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Our Members' Kitties' Birthdays</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>Our Special Kitties' Birthdays</h2>
            <p>Hold your mouse over a kitty's name to see its age</p>
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceBirthday" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                    SelectCommand="SELECT [Birthday] FROM [CHKC_Members] WHERE ([MemberID] = @MemberID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBoxBirthdays" Name="MemberID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Calendar ID="CalendarBirthdays" runat="server" BackColor="#E7E3CE" 
                            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                            ShowGridLines="True" Width="556px">
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <SelectorStyle BackColor="#D18231" />
                            <TodayDayStyle BackColor="#D18432" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <DayHeaderStyle BackColor="#FCF9E8" Font-Bold="True" Height="1px" />
                            <TitleStyle BackColor="#D18231" Font-Bold="True" Font-Size="9pt" 
                                ForeColor="#FFFFCC" />
                        </asp:Calendar>
                        <asp:FormView ID="FormView1" runat="server" 
                            DataSourceID="SqlDataSourceBirthday">
                            <ItemTemplate>
                                <asp:TextBox ID="BirthdayTextBox" runat="server" 
                                    Text='<%# Eval("Birthday", "{0:d}") %>' ReadOnly="True"
                                    BackColor="#E7E3CE" BorderStyle="None" EnableTheming="False" 
                                    ForeColor="#E7E3CE" />
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListBoxBirthdays" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                
            </div>
        </div>
    </div><!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>Find a Birthday</h2>
                <ul>
                    <li>
                        <asp:SqlDataSource ID="SqlDataSourceCats" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CHKittyClub %>" 
                            
                            
                            SelectCommand="SELECT [CatAndMember], [MemberID] FROM [CHKC_Members] WHERE (([Approved] = @Approved) AND ([Deceased] IS NULL) AND ([Birthday] IS NOT NULL)) ORDER BY [CatAndMember]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="Approved" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:ListBox ID="ListBoxBirthdays" runat="server" AutoPostBack="True" Rows="10" 
                            DataSourceID="SqlDataSourceCats" DataTextField="CatAndMember" 
                            DataValueField="MemberID"></asp:ListBox>
                    </li>
                </ul>
            </li>
            <li>
                <h2>You may:</h2>
                <ul>
                    <asp:LoginView ID="LoginViewBirthdayCard" runat="server">
                        <LoggedInTemplate>
                            <li>Click here to <a href="RegisterForBirthdayCard.aspx"><span style="font-weight:bold">register your kitty for a birthday card</span></a></li>
                        </LoggedInTemplate>
                    </asp:LoginView>
                    <li>Enter your kitty's birthday when you submit his/her story</li>
                </ul>
            </li>
        </ul>
    </div>    
</asp:Content>

