Imports System.Configuration
Imports System.Net
Imports System.Net.Mail

Partial Class Contact
    Inherits System.Web.UI.Page

    Protected Sub ButtonReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonReset.Click
        SetNameAndEmail()
        TextBoxSubject.Text = ""
        TextBoxMessage.Text = ""
    End Sub

    Protected Sub SetNameAndEmail()
        Dim MemUser As MembershipUser
        MemUser = Membership.GetUser
        If Not MemUser Is Nothing Then
            With TextBoxName
                .Text = MemUser.UserName
                .ReadOnly = True
            End With
            With TextBoxEmail
                .Text = MemUser.Email
                .ReadOnly = True
            End With
        Else
            With TextBoxName
                .Text = ""
                .ReadOnly = False
            End With
            With TextBoxEmail
                .Text = ""
                .ReadOnly = False
            End With
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            SetNameAndEmail()

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

    Protected Sub ButtonSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSubmit.Click
        Dim sFrom As String = TextBoxEmail.Text
        Dim sTo As String = ConfigurationManager.AppSettings("smtpFrom")
        Dim sSubject As String = Server.HtmlEncode(TextBoxSubject.Text)
        Dim sBody As String = Server.HtmlEncode(TextBoxMessage.Text)

        Dim msg As New MailMessage(sFrom, sTo, sSubject, sBody)
        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)
        Session("ThankYouPage") = "contact"
        Server.Transfer("Thanks.aspx")

    End Sub
End Class
