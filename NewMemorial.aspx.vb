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
            LogRequestInDatabase()
            Session("ThankYouPage") = "memorial"
            Server.Transfer("Thanks.aspx")
        End If
    End Sub


    Private Sub LogRequestInDatabase()
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "UPDATE dbo.CHKC_Members SET [Deceased] = 1 " + _
                "WHERE [MemberName] = @MemberName " + _
                "AND [CatName] = @CatName"

            Dim MemberName As SqlParameter = .Parameters.Add("@MemberName", Data.SqlDbType.VarChar, 50)
            MemberName.Value = Server.HtmlEncode(TextBoxUsername.Text)
            MemberName.Direction = Data.ParameterDirection.Input

            Dim CatName As SqlParameter = .Parameters.Add("@CatName", Data.SqlDbType.VarChar, 50)
            CatName.Value = DropDownListCats.SelectedItem.Text
            CatName.Direction = Data.ParameterDirection.Input
        End With

        Try
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

    Private Sub SendEmail()
        ' Build the message body
        Dim sb As New StringBuilder

        With sb
            .Append("The following CH kitty has passed away:")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Username: ")
            .Append(Server.HtmlEncode(TextBoxUsername.Text))
            .Append(vbCrLf)
            .Append("Email: ")
            .Append(Server.HtmlEncode(TextBoxEmail.Text))
            .Append(vbCrLf)
            .Append("Kitty's name: ")
            .Append(DropDownListCats.SelectedItem.Text)
            .Append(vbCrLf)
            .Append("Here's what their person has to say: ")
            .Append(Server.HtmlEncode(TextBoxToSay.Text))
        End With

        Dim msg As New MailMessage(TextBoxEmail.Text.ToString, _
                                   ConfigurationManager.AppSettings("smtpFrom"), _
                                   "New CH Kitty Memorial Announcement", _
                                   sb.ToString)

        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)
    End Sub

End Class
