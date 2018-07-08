<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Chat.aspx.vb" Inherits="Chat" %>

<%@ Register Assembly="JaxterChat" Namespace="WebFurbish" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Live Chat</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <cc1:JaxterChat ID="JaxterChat1" runat="server" BackColor="#D18432" 
                    EnforceRoomsXML="True" Height="400px" MessageInputBackColor="#E7E3CE" 
                    MessageOutputBackColor="#E7E3CE" RoomName="CH Kitty Chat" Width="575px" 
                    EnteredRoomInstructionText="&lt;BR&gt;If no one else is logged into chat, please be patient.  A volunteer will be paged to help you with your CH kitty questions and concerns.  Please bear with us, it takes a few minutes for a volunteer to receive the email notification and to log into the chat.  We're glad you came, and we'll be here as soon as possible.&lt;BR&gt;&lt;BR&gt;" UserName="Guest">
                </cc1:JaxterChat>
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

