<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ChatSchedules.aspx.vb" Inherits="utility_ChatSchedules" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:TextBox ID="TextBoxSchedule" runat="server" Rows="16" TextMode="MultiLine" 
                    Width="450px"></asp:TextBox>
                <br />
                <span style="text-align:center"><asp:Button ID="ButtonSave" runat="server" 
                    Text="Save" /></span>
            </div>
        </div>
    </div>
</asp:Content>

