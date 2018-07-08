﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Errata.aspx.vb" Inherits="Errata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Artistic Contributions From CH Kitty Club Members</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <asp:Literal ID="headline" runat="server" Visible="False"><h2>Choose from the menu on the right...</h2></asp:Literal>
            </div>
        </div>
    </div><!-- end content -->
    <div id="sidebar">
        <ul>
            <li>
                <h2>You May</h2>
                <ul>
                    <li>Click here to <a href="NewArt.aspx"><span style="font-weight:bold">share your own artistic contribution with the CH Kitty Club</span></a></li>
                </ul>
            </li>
        </ul>
        <ul>
            <li>
                <h2>Artistic Errata</h2>
                <p>Articles, Stories, Poems, and such</p>
                <ul>
                    <li><a href="Errata1.aspx"><em>The Ugly Cat</em></a> - Jan</li>
                    <li><a href="Errata2.aspx"><em>Gordon's Story</em></a> - Lizzie Holochwost</li>
                    <li><a href="Errata3.aspx"><em>A Life</em></a> - a poem submitted by Jessica</li>
                    <li><a href="Errata4.aspx"><em>A Housecat's Story</em></a> - an article featured in <a href="http://wwww.catfancy.com">The Cat Fancy magazine</a></li>
                    <li><a href="Errata5.aspx"><em>To Pippy & Disabled Cats Everywhere</em></a> - poem by Kathy Wolff Heller</li>
                    <li><a href="Errata6.aspx"><em>CH Rescue Haiku</em></a></li>
                    <li><a href="Errata7.aspx"><em>Unwanted Angels</em> - a poem by Amy at Whitelace Cat Haven</a></li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>
