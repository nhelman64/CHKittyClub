<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Thanks.aspx.vb" Inherits="ThanksForNewStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>CH Kitty Club - Thanks You</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="ViewLink" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Thank you for the link you suggested.  We will examine it, and post it on the site if it's appropriate.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewMemorial" runat="server">
                    <h2>Thanks for letting us know</h2>
                    <div class="entry">
                        <p>Thank you for informing us of your special kitty's passing.  We'll post your kitty's photo (if you've given us one) on our Memorial page as soon as we can.</p>
                        <p>We're very sorry for your loss.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewPhotos" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Thank you for sharing your special kitty's photos with us.  We will examine your submission, and get back to you with our approval decision.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewStory" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Thank you for sharing your special kitty's story and photos with us.  We will examine your submission, and get back to you with our approval decision.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewTip" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Thank you for sharing with us what you've learned from living with your special kitty.  We will examine your submission, and get back to you with our approval decision.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewBirthday" runat="server">
                    <h2>Thanks for registering</h2>
                    <div class="entry">
                        <p>Thank you for sharing your special kitty's birthday with us.  We've signed you and your kitty up to receive birthday e-cards.</p>
                        <p>Thanks for supporting the CH Kitty Club.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewVideo" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Thank you for sharing the video with us.  We will examine your submission, and get back to you with our approval decision.</p>
                        <p>Thanks for sharing, and thanks for your support.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewAdoptee" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Thank you for submitting your special kitty for adoption.  We will examine your submission, and get back to you with our approval decision.</p>
                        <p>Thanks for your support.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewAdoptionApplication" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Thank you for submitting your application for adopting this special kitty.  The person who posted the kitty for adoption will examine your application, and get back to you with their approval decision.</p>
                        <p>Thanks for your support.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewContact" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Your message has been sent.  Thanks for your participation and support.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewArt" runat="server">
                    <h2>Thanks for your contribution</h2>
                    <div class="entry">
                        <p>Your submission has been sent.  Upon approval it will be posted for the rest of the CH Kitty Club to see.  Thanks for your participation and support.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewLinks" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Your submission has been sent.  Upon approval it will be added to the list of external links.  Thanks for your participation and support.</p>
                    </div>
                </asp:View>
                <asp:View ID="ViewDiary" runat="server">
                    <h2>Thanks for your submission</h2>
                    <div class="entry">
                        <p>Thank you for sharing your special kitty's life with us.  We will examine your submission, and get back to you with our approval decision.</p>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>

