<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Donate.aspx.vb" Inherits="Donate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Donate to Help Defray Our Costs</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>Please Support CH Kitty Club<br />With Your Kind Donation</h2>
            <div class="entry">
                <!-- <input type="hidden" name="cmd" value="_s-xclick" />
                <input type="hidden" name="hosted_button_id" value="TNLNHMS7NF3J4" />
                <asp:ImageButton ID="PayPalButton" runat="server" PostBackUrl="https://www.paypal.com/cgi-bin/webscr" ImageUrl="https://www.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" />
                -->
            
            <a id="paypalDonate" target="_blank" href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=TNLNHMS7NF3J4">
                <img border="0" id="payPalImage" src="https://www.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" alt="Donate to the CH Kitty Club" />
            </a>

            </div>
        </div><!-- end post -->
        <div class="post">
            <h2>CH Kitty Club Fundraising - Calendars</h2>
            <div class="entry">
                <p>Let us create a personalized calendar just for you and you special kitty (or kitties).&nbsp; 
                You choose the color you wish your calendar to be (pastels: canary yellow, blue, green, or pink) and
                which photo(s) you wish to use on your calendar.&nbsp Send your photos to us, and we'll send you back a
                delightful calendar with which to always remember your special kitty and the CH Kitty Club.&nbsp; 
                    The calendar is 8.5&quot;x11&quot;.</p>
                <p style="text-align: center">
                    <img alt="blue landscape calendar" src="images/CalendarSampleLandscapeBlue.jpg" 
                        style="width: 288px; height: 223px;"/><br />
                Price: US$9.95 by PayPal.&nbsp;
                    <asp:HyperLink ID="HyperLinkFRCalendar" runat="server" 
                        NavigateUrl="~/FRCalendar.aspx">Click here to order your calendar today!</asp:HyperLink>
                </p>
            </div>
        </div>
    </div>
    <div class="post">
        <div class="entry">
            <div style="text-align:center">
                <script type="text/javascript"><!--
                    google_ad_client = "pub-6266649143620889";
                    /* CH Kitty Club 468x60 */
                    google_ad_slot = "4524065524";
                    google_ad_width = 468;
                    google_ad_height = 60;
                //-->
                </script>
                <script type="text/javascript"
                src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                </script>
            </div>
        </div>
    </div>
    <div class="post">
        <div class="entry">
            <h2>Show How Much You Love Your CH Kitty With A Pin</h2>
            <p>We also would like to offer these wonderful CH Kitty pins when you make a donation to the CH Kitty Club. That helps us keep things rolling! It helps the newsletter and  the website. Help us if you can; every little bit helps!</p>
            <p>Simply make a donation of at least $5.00 using the PayPal button at the top of 
                the page, and you&#39;ll receive one of the buttons pictured below.</p>
            <center><img src="images/CHKittyButtons.jpg" alt="CH kitty buttons" /></center>
        </div>
    </div>
</asp:Content>

