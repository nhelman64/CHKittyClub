<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FRCalendar2.aspx.vb" Inherits="FRCalendar2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="contents">
        <div class="post">
            <h2>CH Kitty Club Fundraising - Calendars</h2>
            <div class="entry">
                <p>To finish placing your order, you must go through PayPal to pay for your calendar.</p>
                <input type="hidden" name="cmd" value="_s-xclick" />
                <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----MIIHbwYJKoZIhvcNAQcEoIIHYDCCB1wCAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYCCRKXS8vnpWeBYFw6clqo71a2r3mhCOwjxOTnmC+Kg+BanLUP518g5gxq4n0LHbRntNUlt7coK8sIb6LGJ/LNic6OoXa9Jh7oDUwNHT/73dTPW5H4oQHams2U3UPv4z1dhBbjbs7Qp6GgqbeL/cio/ne3vZvZIZkcwezQ6hGjLczELMAkGBSsOAwIaBQAwgewGCSqGSIb3DQEHATAUBggqhkiG9w0DBwQI3CVR4bbPdViAgcgpzxQ3Nj3P8qZOpVR4yPbTa9lhY1pe6ukASnmTKB6eI1lC95iaSg9VLFY9W94jt9o62pFpImeoL+Qa8H0CDFlCIufAJ0efyVQpfIC/mcYi/YVJv6fjS3ypprEkzQEMSW4ZW2qbuWAKw6hZEbe1S6OEvTltesIurf2h/DSUy00HzIMXWMRGWebyUf3aXb4q38gyP0/cMrioBX03AVmk9b23BYA9aK9Zo90Qvklczcm6UpySiXXY+60vgbT1tDaB6XEPa62UX/3+JaCCA4cwggODMIIC7KADAgECAgEAMA0GCSqGSIb3DQEBBQUAMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbTAeFw0wNDAyMTMxMDEzMTVaFw0zNTAyMTMxMDEzMTVaMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAwUdO3fxEzEtcnI7ZKZL412XvZPugoni7i7D7prCe0AtaHTc97CYgm7NsAtJyxNLixmhLV8pyIEaiHXWAh8fPKW+R017+EmXrr9EaquPmsVvTywAAE1PMNOKqo2kl4Gxiz9zZqIajOm1fZGWcGS0f5JQ2kBqNbvbg2/Za+GJ/qwUCAwEAAaOB7jCB6zAdBgNVHQ4EFgQUlp98u8ZvF71ZP1LXChvsENZklGswgbsGA1UdIwSBszCBsIAUlp98u8ZvF71ZP1LXChvsENZklGuhgZSkgZEwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tggEAMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADgYEAgV86VpqAWuXvX6Oro4qJ1tYVIT5DgWpE692Ag422H7yRIr/9j/iKG4Thia/Oflx4TdL+IFJBAyPK9v6zZNZtBgPBynXb048hsP16l2vi0k5Q2JKiPDsEfBhGI+HnxLXEaUWAcVfCsQFvd2A1sxRr67ip5y2wwBelUecP3AjJ+YcxggGaMIIBlgIBATCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwCQYFKw4DAhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEwMDcwMTE5MDUyOVowIwYJKoZIhvcNAQkEMRYEFHPvfI6zFs2TcoByqbFgnKRCT9vlMA0GCSqGSIb3DQEBAQUABIGAJP+yMKhLWbMErLGiqdHcU1z6kMs9H1cClQ+jXjfWzoVGMAfq0OIXpUG3AsoRAxmukTWdme4HWhFJLnZYUoscPslNNjbrxyMrP623dtFq82mxM5Z0og5jQuaiD3y6zwUt+kZV0nlSzi0DQfZHGYedh3WVQ6KqUZjWbkARbsNc+TY=-----END PKCS7-----" />
                <asp:ImageButton ID="PayPalButton" runat="server" PostBackUrl="https://www.paypal.com/cgi-bin/webscr" ImageUrl="https://www.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" />
            </div>
        </div>
    </div>
</asp:Content>

