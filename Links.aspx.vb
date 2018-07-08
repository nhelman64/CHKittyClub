Imports System.Net
Imports System.Net.Mail

Partial Class Links
    Inherits System.Web.UI.Page

    Private _email As String
    Private _userName As String

    Protected Sub SuggestionButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SuggestionButton.Click
        SendEmail()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim MemUser As MembershipUser
        MemUser = Membership.GetUser()
        If Not MemUser Is Nothing Then
            _email = MemUser.Email.ToString
            _userName = MemUser.UserName
        Else
            _email = ConfigurationManager.AppSettings("smtpFrom")
            _userName = ConfigurationManager.AppSettings("smtpUser")
        End If

        If Not Page.IsPostBack Then
            Dim objArgs As CAPTCHA.CAPTCHAImage.Args = New CAPTCHA.CAPTCHAImage.Args()
            Session.Add(CAPTCHA.CAPTCHAImage.Args.SessionID, objArgs)
        End If
    End Sub

    Private Sub SendEmail()
        ' Build the message body
        Dim sb As New StringBuilder

        With sb
            .Append("The following has been submitted as new CH kitty member's story:")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Username: ")
            .Append(_userName)
            .Append(vbCrLf)
            .Append("Email: ")
            .Append(_email)
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Link: ")
            .Append(Server.HtmlEncode(SuggestionTextBox.Text))
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Description:  ")
            .Append(Server.HtmlEncode(DescriptionTextBox.Text))
        End With

        Dim msg As New MailMessage(_email, _
                                   ConfigurationManager.AppSettings("smtpFrom"), _
                                  "New CH Kitty Link Suggestion", _
                                   sb.ToString)

        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)
        Session("ThankYouPage") = "link"
        Server.Transfer("Thanks.aspx")
    End Sub

End Class
