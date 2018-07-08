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
            sb.Append("UPDATE dbo.CHKC_Tips SET ")
            sb.Append("[Approved]=1, [Category]=@Category, [TipText]=@TipText ")
            sb.Append("WHERE [TipID] = @TipID")

            Dim txtTip As TextBox = FormView1.FindControl("TipTextBox")
            Dim txtCategory As TextBox = FormView1.FindControl("CategoryTextBox")

            Dim cmd As New SqlCommand()
            With cmd
                .Connection = conn
                .CommandType = Data.CommandType.Text
                .CommandText = sb.ToString

                Dim parmTipText As SqlParameter = .Parameters.Add("@TipText", Data.SqlDbType.Text, 8192)
                parmTipText.Value = Server.HtmlEncode(txtTip.Text)
                parmTipText.Direction = Data.ParameterDirection.Input

                Dim parmCategory As SqlParameter = .Parameters.Add("@Category", Data.SqlDbType.VarChar, 50)
                parmCategory.Value = Server.HtmlEncode(txtCategory.Text)
                parmCategory.Direction = Data.ParameterDirection.Input

                Dim parmTipID As SqlParameter = .Parameters.Add("@TipID", Data.SqlDbType.Int, 4)
                parmTipID.Value = ListBoxNames.SelectedValue
                parmTipID.Direction = Data.ParameterDirection.Input
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

            ' Send email to the selected user indicating their tip has been approved
            Dim sFrom As String = ConfigurationManager.AppSettings("smtpUser")

            Dim MemUser As MembershipUser
            Dim sTo As String = ""
            MemUser = Membership.GetUser(ListBoxNames.SelectedItem.Text)
            If Not MemUser Is Nothing Then
                sTo = MemUser.Email
            End If

            Dim sBody As String = "Congratulations!  The tip you generously shared with us at the CH Kitty Club has been approved.  Thanks for sharing, and thanks for your support."
            sBody += vbCrLf + vbCrLf + txtTip.Text

            If sTo <> "" Then
                Dim msg As New MailMessage(sFrom, sTo, "Your CH Kitty Club post has been approved!", sBody)

                Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
                client.Credentials = New NetworkCredential( _
                    ConfigurationManager.AppSettings("smtpUser"), _
                    ConfigurationManager.AppSettings("smtpPassword"))
                client.Send(msg)
            End If

            Server.Transfer("ReviewTips.aspx")
        End If
    End Sub

    Protected Sub disapproveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles disapproveButton.Click
        If ListBoxNames.SelectedIndex > -1 Then
            ' Send email to the selected user indicating their tip has been disapproved
            Dim sFrom As String = ConfigurationManager.AppSettings("smtpUser")

            Dim txt As TextBox = FormView1.FindControl("TipTextBox")

            Dim MemUser As MembershipUser
            Dim sTo As String = ""
            MemUser = Membership.GetUser(ListBoxNames.SelectedItem.Text)
            If Not MemUser Is Nothing Then
                sTo = MemUser.Email
            End If

            Dim sBody As String = "Unfortunately, we have rejected the tip you shared with us at the CH Kitty Club.  We definitely appreciate your sharing it, and would like to work with you on making it an acceptable tip.  Thanks for sharing, and thanks for your support."
            sBody += vbCrLf + vbCrLf + "Here's the tip you submitted:  " + txt.Text

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
                .CommandText = "DELETE FROM dbo.CHKC_Tips WHERE [TipID]=@TipID"

                Dim TipID As SqlParameter = .Parameters.Add("@TipID", Data.SqlDbType.Int, 4)
                TipID.Value = ListBoxNames.SelectedValue
                TipID.Direction = Data.ParameterDirection.Input
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
