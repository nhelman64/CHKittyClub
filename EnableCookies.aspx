<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EnableCookies.aspx.vb" Inherits="EnableCookies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <div class="entry">
                <h2>Internet Explorer</h2>
                <p>Internet Explorer 7 or 8: </p>
                <ol>
                <li>Click <strong>Start</strong> &gt; <strong>Control Panel</strong>.
                (Note: with Windows XP Classic View, click the Windows <strong>Start</strong> button &gt; <strong>Settings &gt; Control Panel</strong>).</li>

                <li>Double-click the <strong>Internet Options</strong> icon.</li>
                <li>Click the <strong>Privacy</strong> tab.</li>
                <li>Click the <strong>Advanced</strong> button. </li>
                <li>Select the option 'Override automatic cookie handling' under the Cookies section in the Advanced Privacy Settings window.</li>

                <li>Select the 'Accept' or 'Prompt' option under 'First-party Cookies.'</li>
                <li>Select the 'Accept' or 'Prompt' option under 'Third-party Cookies.' (Note: if you select the 'Prompt' option, you'll be prompted to click <strong>OK</strong> every time a website attempts to send you a cookie.) </li>
                <li>In the Internet Options window, click <strong>OK</strong> to exit.</li>
                </ol>
                <p>Internet Explorer 6:</p>
                <ol>
                <li>Click <strong>Start</strong> &gt; <strong>Control Panel</strong>.
                (Note: with Windows XP Classic View, click the Windows <strong>Start</strong> button &gt; <strong>Settings &gt; Control Panel</strong>).</li>

                <li>Click the <strong>Advanced</strong> button. </li>
                <li>Select the option 'Override Automatic Cookie Handling.' </li>
                <li>Select the 'Accept' or 'Prompt' option under 'First-party Cookies.'</li>
                <li>Select the 'Accept' or 'Prompt' option under 'Third-party Cookies.' (Note: if you select the 'Prompt' option, you'll be prompted to click <strong>OK</strong> every time a website attempts to send you a cookie.) </li>
                <li>In the Internet Options window, click <strong>OK</strong> to exit.</li>

                </ol>
            </div>
        </div>
        <div class="post">
            <div class="entry">
                <h2>FireFox</h2>
                <p>Firefox 3.x (PC):</p>
                <ol>
                <li>Click <strong>Tools > Options</strong>.</li>
                <li>Click <strong>Privacy</strong> in the top panel.</li>

                <li>Set 'Firefox will': to <strong>Use custom settings for history</strong>.</li>
                <li>Check the box next to <strong>Accept cookies from sites</strong> to enable cookies, or uncheck it to disable them.</li>
                <li>Click <strong>OK</strong>.</li>
                </ol>
                <p>Firefox 2.x (PC):</p>
                <ol>

                <li>Click <strong>Tools &gt; </strong><strong>Options</strong>.</li>
                <li>Click <strong>Privacy</strong> in the top panel.</li>
                <li>Select the checkbox labeled 'Accept cookies from sites.'</li>
                <li>Click <strong>OK</strong>.</li>

                </ol>
                <p>Firefox (Mac):</p>
                <ol>
                <li>Go to the <strong>Firefox</strong> drop-down menu.</li>
                <li>Select <strong>Preferences</strong>.</li>
                <li>Click <strong>Privacy</strong>.</li>

                <li>Set 'Firefox will': to <strong>Use custom settings for history</strong>. </li>
                <li>Check the box next to <strong>Accept cookies from sites</strong> to enable cookies, or uncheck it to disable them.</li>
                <li>Click <strong>OK</strong>.</li>
                </ol>
            </div>
        </div>
        <div class="post">
            <div class="entry">
                <h2>Chrome</h2>
                    <p>Chrome (PC):</p>
                    <ol>
                    <li>Click the <strong>Tools</strong> menu.</li>
                    <li>Select <strong>Options</strong>.</li>
                    <li>Click the <strong>Under the Hood</strong> tab.</li>

                    <li>Click <strong>Content settings</strong> in the 'Privacy' section.</li>
                    <li>Make sure <strong>Allow local data to be set</strong> is selected to allow both first-party and third-party cookies. For any given webpage, first-party cookies are cookies that are set by the site domain listed in the address bar. Third-party cookies come from other domain sources that have items, such as ads or images, embedded on the page. If you only want to accept first-party cookies, check the box next to <strong>Block all third-party cookies without exception</strong>.</li>
                    </ol>
                    <p>Chrome (Mac):</p>
                    <ol>
                    <li>Select <strong>Chrome > Preferences</strong> on the menu bar.</li>

                    <li>Click the <strong>Under the Hood</strong> tab.</li>
                    <li>Click <strong>Content settings</strong> in the 'Privacy' section.</li>
                    <li>Make sure <strong>Allow local data to be set</strong> is selected to allow both first-party and third-party cookies. For any given webpage, first-party cookies are cookies that are set by the site domain listed in the address bar. Third-party cookies come from other domain sources that have items, such as ads or images, embedded on the page. If you only want to accept first-party cookies, check the box next to <strong>Block all third-party cookies without exception</strong>.</li>

                    </ol>
            </div>
        </div>
        <div class="post">
            <div class="entry">
                <h2>Safari</h2>
                <ol>
                <li>Go to the <strong>Safari</strong> drop-down menu.</li>
                <li>Select <strong>Preferences</strong>.</li>

                <li>Click <strong>Security</strong> in the top panel.</li>
                <li>Under 'Accept Cookies' select the option 'Only from sites you navigate to.'</li>
                </ol>
            </div>
        </div>
    </div>
</asp:Content>

