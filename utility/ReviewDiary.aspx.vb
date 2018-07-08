Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net.Mail
Imports System.Net


Partial Class Tips
    Inherits System.Web.UI.Page

    Protected Sub ListBoxNames_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxNames.Load
        If Not IsPostBack Then
            ListBoxNames.SelectedIndex = -1
        End If
    End Sub

    Protected Sub approveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles approveButton.Click
        If ListBoxNames.SelectedIndex > -1 Then
            Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
            Dim sb As New StringBuilder

            'Update the TipText column with any changes while setting the Approved column
            sb.Append("UPDATE dbo.CHKC_PetDiary SET ")
            sb.Append("[Approved]=1 ")
            sb.Append("WHERE [UID] = @UID")

            Dim cmd As New SqlCommand()
            With cmd
                .Connection = conn
                .CommandType = Data.CommandType.Text
                .CommandText = sb.ToString

                Dim parmUID As SqlParameter = .Parameters.Add("@UID", Data.SqlDbType.Int, 4)
                parmUID.Value = ListBoxNames.SelectedValue
                parmUID.Direction = Data.ParameterDirection.Input
            End With

            Try
                conn.Open()
                cmd.ExecuteNonQuery()
                conn.Close()
                Response.Redirect("ReviewDiary.aspx")
            Finally
                If Not conn Is Nothing Then
                    conn.Close()
                End If
            End Try
        End If
    End Sub

    Protected Sub disapproveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles disapproveButton.Click
        If ListBoxNames.SelectedIndex > -1 Then
            ' Send email to the selected user indicating their tip has been disapproved
            Dim sFrom As String = ConfigurationManager.AppSettings("smtpUser")

            Dim txt As TextBox = FormView1.FindControl("DiaryTextBox")

            Dim MemUser As MembershipUser
            Dim sTo As String = ""
            MemUser = Membership.GetUser(ListBoxNames.SelectedItem.Text)
            If Not MemUser Is Nothing Then
                sTo = MemUser.Email
            End If

            Dim sBody As String = "Unfortunately, we have rejected the diary post you shared with us at the CH Kitty Club.  We definitely appreciate your sharing it, and would like to work with you on making it an acceptable tip.  Thanks for sharing, and thanks for your support."
            sBody += vbCrLf + vbCrLf + "Here's the diary post you submitted:  " + txt.Text

            If sTo <> "" Then
                Dim msg As New MailMessage(sFrom, sTo, "Your CH Kitty Club post has been rejected!", sBody)

                Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
                client.Credentials = New NetworkCredential( _
                    ConfigurationManager.AppSettings("smtpUser"), _
                    ConfigurationManager.AppSettings("smtpPassword"))
                client.Send(msg)
            End If

            Server.Transfer("ReviewTips.aspx")
        End If
    End Sub

    Protected Sub deleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles deleteButton.Click
        If ListBoxNames.SelectedIndex > -1 Then
            Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
            Dim cmd As New SqlCommand
            With cmd
                .Connection = conn
                .CommandType = Data.CommandType.Text
                .CommandText = "DELETE FROM dbo.CHKC_PetDiary WHERE [UID]=@UID"

                Dim UID As SqlParameter = .Parameters.Add("@UID", Data.SqlDbType.Int, 4)
                UID.Value = ListBoxNames.SelectedValue
                UID.Direction = Data.ParameterDirection.Input
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
        End If
    End Sub
End Class
