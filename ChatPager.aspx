<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ChatPager.aspx.vb" Inherits="Chat" %>

<%@ Register Assembly="JaxterChat" Namespace="WebFurbish" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>Chat Pager Page</h2>
            <div class="entry">
                <cc1:JaxterChat ID="JaxterChat1" runat="server" BackColor="#D18432" 
                    EnforceRoomsXML="False" Height="400px" MessageInputBackColor="#E7E3CE" 
                    MessageOutputBackColor="#E7E3CE" RoomName="admin" Width="575px" 
                    EnteredRoomInstructionText="&lt;BR&gt;If no one else is logged into chat, please be patient.  A volunteer will be paged to help you with your CH kitty questions and concerns.&lt;BR&gt;&lt;BR&gt;" 
                    ClearPageButtonImageUrl="JaxterChat/Images/clear_page.gif" 
                    EmoticonsButtonImageUrl="JaxterChat/Images/emoticons.gif" 
                    MessageOutputPostIconUrl="JaxterChat/Images/icon.gif" 
                    PopupCloseButtonImageUrl="JaxterChat/Images/popup_close.gif" 
                    SendButtonImageUrl="JaxterChat/Images/send_button.gif" 
                    ToggleSoundOffButtonImageUrl="JaxterChat/Images/sound_off.gif" 
                    ToggleSoundOnButtonImageUrl="JaxterChat/Images/sound_on.gif" 
                    UserListButtonImageUrl="JaxterChat/Images/users.gif">
                </cc1:JaxterChat>
            </div>
        </div>
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:Timer ID="TimerChats" runat="server" Interval="6000">
                </asp:Timer>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="GridViewRoomUsage" runat="server">
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="TimerChats" EventName="Tick" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div><!-- end contents -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>Icon Legend</h2>
                <ul>
                    <li>
                        <table cellpadding="5" cellspacing="5">
                            <tr>
                                <td><img src="JaxterChat/Images/users.gif" /></td>
                                <td>Users In Chat</td>
                            </tr>
                            <tr>
                                <td><img src="JaxterChat/Images/emoticons.gif" /></td>
                                <td>Emoticons</td>
                            </tr>
                            <tr>
                                <td><img src="JaxterChat/Images/clear_page.gif" /></td>
                                <td>Clear Page</td>
                            </tr>
                            <tr>
                                <td><img src="JaxterChat/Images/sound_on.gif" /></td>
                                <td>Toggle Sound</td>
                            </tr>
                        </table>
                    </li>
                </ul>
            </li>
            <li>
                <h2>Chat Transcripts</h2>
                <ul>
                    <li>
                        <asp:Calendar ID="CalendarTranscripts" runat="server"></asp:Calendar>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

