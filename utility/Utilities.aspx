<%@ Page Title="" Language="VB" MasterPageFile="~/SubMasterPage.master" AutoEventWireup="false" CodeFile="Utilities.aspx.vb" Inherits="utility_Utilities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <ul>
                    <li><a href="ReviewMembers.aspx">Approve/Reject New Member Stories</a></li>
                    <li><a href="ReviewTips.aspx">Approve/Reject New Tips</a></li>
                    <li><a href="ReviewAdoptions.aspx">Approve/Reject New Adoptees</a></li>
                    <li><a href="ReviewDiary.aspx">Approve/Reject New Diary Posts</a></li>
                    <li><a href="ChatSchedules.aspx">Maintain Chat Schedules XML File</a></li>
                    <li><a href="../ChatPager.aspx">Chat Pager page (must be left running)</a></li>
                    <li><a href="UsernameEmails.aspx">List of Usernames & Emails</a></li>
                    <li><a href="ViewErrorLog.aspx">View Error Log</a></li>
                    <li>
                        <asp:CheckBox ID="CheckBoxLogChat" runat="server" Text="Log Chat" ToolTip="Turn on to begin logging chat, turn off to stop" AutoPostBack="True" /></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

