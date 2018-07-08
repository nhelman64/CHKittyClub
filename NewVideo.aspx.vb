Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime

Partial Class NewStory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBoxUsername.Text = Context.User.Identity.Name

        Dim MemUser As MembershipUser
        MemUser = Membership.GetUser()
        If Not MemUser Is Nothing Then
            TextBoxEmail.Text = MemUser.Email.ToString
        End If

        If Not Page.IsPostBack Then
            Dim objArgs As CAPTCHA.CAPTCHAImage.Args = New CAPTCHA.CAPTCHAImage.Args()
            Session.Add(CAPTCHA.CAPTCHAImage.Args.SessionID, objArgs)
        End If
    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        args.IsValid = False
        If Session(CAPTCHA.CAPTCHAImage.Args.SessionID) IsNot Nothing Then
            Dim strText As String = DirectCast(Session(CAPTCHA.CAPTCHAImage.Args.SessionID), CAPTCHA.CAPTCHAImage.Args).Text
            If Me.TextBoxValidate.Text.Trim = strText Then
                args.IsValid = True
            End If
        End If
    End Sub

    Protected Sub ButtonRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonRegister.Click
        If Page.IsValid Then
            SendEmail()
            Session("ThankYouPage") = "video"
            Server.Transfer("Thanks.aspx")
        End If
    End Sub

    Private Sub SendEmail()
        ' Build the message body
        Dim sb As New StringBuilder

        With sb
            .Append("The following CH kitty video has been suggested:")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Username: ")
            .Append(Server.HtmlEncode(TextBoxUsername.Text))
            .Append(vbCrLf)
            .Append("Email: ")
            .Append(Server.HtmlEncode(TextBoxEmail.Text))
            .Append(vbCrLf)
            .Append("Video URL: ")
            .Append(Server.HtmlEncode(TextBoxVideo.Text))
        End With

        Dim msg As New MailMessage(Server.HtmlEncode(TextBoxEmail.Text), _
                                   ConfigurationManager.AppSettings("smtpFrom"), _
                                   "New CH Kitty Video Suggestion", _
                                   sb.ToString)

        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)
    End Sub

End Class
