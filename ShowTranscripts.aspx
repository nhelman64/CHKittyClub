<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ShowTranscripts.aspx.vb" Inherits="ShowTranscripts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Show Chat Transcripts</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
                    <ContentTemplate>
                        <asp:TextBox ID="TextBoxTranscript" runat="server" 
                         Height="400" Width="575" TextMode="MultiLine" 
                         ReadOnly="True"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ListBoxTranscripts"
                         EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div><!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>Choose a transcript</h2>
                <ul>
                    <li>
                        <asp:ListBox ID="ListBoxTranscripts" runat="server" AutoPostBack="True" 
                            Rows="10"></asp:ListBox>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

