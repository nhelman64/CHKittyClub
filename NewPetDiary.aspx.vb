Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail

Partial Class PetDiary
    Inherits System.Web.UI.Page

    Private _email As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim memUser As MembershipUser = Membership.GetUser()
        If Not memUser Is Nothing Then
            TextBoxMemberName.Text = memUser.UserName
            _email = memUser.Email
        Else
            _email = ConfigurationManager.AppSettings("smtpFrom")
        End If
    End Sub

    Protected Sub ButtonPost_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim dtEntryDate As DateTime = Now()
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "INSERT INTO [dbo].[CHKC_PetDiary] ([Username], [CatName], [EntryDate], [EntryBody]) " + _
                           "VALUES (@Username, @CatName, @EntryDate, @EntryBody)"

            Dim pUsername As SqlParameter = .Parameters.Add("@Username", Data.SqlDbType.VarChar, 50)
            pUsername.Value = TextBoxMemberName.Text
            pUsername.Direction = Data.ParameterDirection.Input

            Dim pCatName As SqlParameter = .Parameters.Add("@CatName", Data.SqlDbType.VarChar, 50)
            pCatName.Value = DropDownListKittyName.SelectedItem.Text
            pCatName.Direction = Data.ParameterDirection.Input

            Dim pEntryDate As SqlParameter = .Parameters.Add("@EntryDate", Data.SqlDbType.Date)
            pEntryDate.Value = dtEntryDate
            pEntryDate.Direction = Data.ParameterDirection.Input

            Dim pEntryBody As SqlParameter = .Parameters.Add("@EntryBody", Data.SqlDbType.Text, 8192)
            pEntryBody.Value = Server.HtmlEncode(TextBoxDiaryEntry.Text)
            pEntryBody.Direction = Data.ParameterDirection.Input
        End With

        Try
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()

            If _email = "" Then
                Throw New ApplicationException("Pet Diary email is empty.")
            Else
                Dim sBody As New StringBuilder
                sBody.Append("New CH Kitty Club pet diary post submitted for approval:")
                sBody.Append(vbCrLf)
                sBody.Append(vbCrLf)
                sBody.Append("Name: ")
                sBody.Append(TextBoxMemberName.Text)
                sBody.Append(vbCrLf)
                sBody.Append("Kitty: ")
                sBody.Append(DropDownListKittyName.SelectedItem.Text)
                sBody.Append(vbCrLf)
                sBody.Append("Submitted on: ")
                sBody.Append(dtEntryDate.ToString)
                sBody.Append(vbCrLf)
                sBody.Append(vbCrLf)
                sBody.Append(Server.HtmlEncode(TextBoxDiaryEntry.Text))

                Dim msg As New MailMessage(_email, _
                                           ConfigurationManager.AppSettings("smtpFrom"), _
                                           "[ch kitty club] New Pet Diary Post", _
                                           sBody.ToString)
                Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
                client.Credentials = New NetworkCredential( _
                    ConfigurationManager.AppSettings("smtpUser"), _
                    ConfigurationManager.AppSettings("smtpPassword"))
                client.Send(msg)

                Session("ThankYouPage") = "diary"
                Server.Transfer("Thanks.aspx")
            End If
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

End Class
