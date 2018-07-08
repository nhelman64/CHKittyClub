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

    Protected Sub ButtonUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpload.Click
        If Page.IsValid Then
            Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
            Try
                ' Save the tip in the database, pending approval
                Dim cmd As New SqlCommand
                With cmd
                    .Connection = conn
                    .CommandType = Data.CommandType.Text
                    .CommandText = "INSERT INTO dbo.CHKC_Tips ([MemberName], [TipText], [Category], [Approved])" & _
                                    "VALUES (@MemberName, @TipText, @Category, @Approved)"

                    Dim memberName As SqlParameter = .Parameters.Add("@MemberName", Data.SqlDbType.VarChar, 50)
                    memberName.Value = Server.HtmlEncode(TextBoxUsername.Text)
                    memberName.Direction = Data.ParameterDirection.Input

                    Dim category As SqlParameter = .Parameters.Add("@Category", Data.SqlDbType.VarChar, 50)
                    category.Value = Server.HtmlEncode(TextBoxCategory.Text)
                    category.Direction = Data.ParameterDirection.Input

                    Dim catName As SqlParameter = .Parameters.Add("@TipText", Data.SqlDbType.Text, 8192)
                    catName.Value = Server.HtmlEncode(TextBoxTip.Text)
                    catName.Direction = Data.ParameterDirection.Input

                    Dim approved As SqlParameter = .Parameters.Add("@Approved", Data.SqlDbType.Int, 4)
                    approved.Value = 0
                    approved.Direction = Data.ParameterDirection.Input

                    conn.Open()
                    .ExecuteNonQuery()
                    conn.Close()

                End With

                SendEmail()
                Session("ThankYouPage") = "tip"
                Server.Transfer("Thanks.aspx")
            Finally
                If Not conn Is Nothing Then
                    conn.Close()
                End If
            End Try
        End If
    End Sub

    Private Sub SendEmail()
        ' Build the message body
        Dim sb As New StringBuilder

        With sb
            .Append("The following tip has been submitted:")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Username: ")
            .Append(Server.HtmlEncode(TextBoxUsername.Text))
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Email: ")
            .Append(Server.HtmlEncode(TextBoxEmail.Text))
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Kitty's name: ")
            .Append(Server.HtmlEncode(TextBoxKittyName.Text))
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Tip: ")
            .Append(Server.HtmlEncode(TextBoxCategory.Text))
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Tip: ")
            .Append(Server.HtmlEncode(TextBoxTip.Text))
        End With

        Dim msg As New MailMessage(Server.HtmlEncode(TextBoxEmail.Text), _
                                   ConfigurationManager.AppSettings("smtpFrom"), _
                                   "New CH Kitty Club Tip Submission", _
                                   sb.ToString)

        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))

        client.Send(msg)
    End Sub

    Protected Sub DropDownListCategories_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListCategories.SelectedIndexChanged
        If DropDownListCategories.SelectedIndex = 0 Then
            With TextBoxCategory
                .Text = ""
                .ReadOnly = False
            End With
        Else
            With TextBoxCategory
                .Text = DropDownListCategories.SelectedItem.Text
                .ReadOnly = True
            End With
        End If
    End Sub
End Class
