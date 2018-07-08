Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail


Partial Class Members
    Inherits System.Web.UI.Page

    Protected Sub MemberList_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MemberList.Load
        If Not IsPostBack Then
            MemberList.SelectedIndex = -1
        End If
    End Sub


    Protected Sub approveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles approveButton.Click
        If MemberList.SelectedIndex > -1 Then
            ' ***** Move file to Stories folder *****
            ActOnFiles(MemberList.SelectedValue, "Move")

            Dim MemberName As String = GetMemberName()

            Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)

            ' Command object to set the story to approved
            Dim cmd As New SqlCommand
            With cmd
                .Connection = conn
                .CommandType = Data.CommandType.Text
                .CommandText = "UPDATE dbo.CHKC_Members SET [Approved] = 1 WHERE [MemberID] = @MemberID"

                Dim MemberID As SqlParameter = .Parameters.Add("@MemberID", Data.SqlDbType.Int, 4)
                MemberID.Value = MemberList.SelectedValue
                MemberID.Direction = Data.ParameterDirection.Input
            End With

            ' Command object to set the photos to approved
            Dim cmd2 As New SqlCommand
            With cmd2
                .Connection = conn
                .CommandType = Data.CommandType.Text
                .CommandText = "UPDATE dbo.CHKC_Photos SET [Approved] = 1 WHERE [MemberID] = @MemberID"

                Dim MemberID As SqlParameter = .Parameters.Add("@MemberID", Data.SqlDbType.Int, 4)
                MemberID.Value = MemberList.SelectedValue
                MemberID.Direction = Data.ParameterDirection.Input
            End With

            Try
                conn.Open()
                cmd.ExecuteNonQuery()
                cmd2.ExecuteNonQuery()
                conn.Close()
            Finally
                If Not conn Is Nothing Then
                    conn.Close()
                End If
            End Try

            ' ***** Send out email *****
            Dim sFrom As String = ConfigurationManager.AppSettings("smtpFrom")

            Dim MemUser As MembershipUser
            Dim sTo As String = ""
            MemUser = Membership.GetUser(MemberName)
            If Not MemUser Is Nothing Then
                sTo = MemUser.Email
            End If

            Dim txtStory As TextBox = FormViewStory.FindControl("TextBoxStory")
            Dim sBody As String = "Congratulations!  The story you generously shared with us at the CH Kitty Club has been approved." + _
                vbCrLf + vbCrLf + "Thanks for sharing, and thanks for your support." + _
                vbCrLf + vbCrLf + "Story:  " + txtStory.Text

            If sTo <> "" Then
                Dim msg As New MailMessage(sFrom, sTo, "Your CH Kitty Club post has been approved!", sBody)

                Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
                client.Credentials = New NetworkCredential( _
                    ConfigurationManager.AppSettings("smtpUser"), _
                    ConfigurationManager.AppSettings("smtpPassword"))
                client.Send(msg)
            End If

            Server.Transfer("ReviewMembers.aspx")
        End If
    End Sub

    Protected Sub disapproveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles disapproveButton.Click
        If MemberList.SelectedIndex > -1 Then
            ' Get MemberName (listbox has derived field that includes cat name)
            Dim MemberName As String = GetMemberName()

            ' Send email to the selected user indicating their tip has been disapproved
            Dim sFrom As String = ConfigurationManager.AppSettings("smtpUser")

            Dim txt As TextBox = FormViewStory.FindControl("TextBoxStory")

            Dim MemUser As MembershipUser
            Dim sTo As String = ""
            MemUser = Membership.GetUser(MemberName)
            If Not MemUser Is Nothing Then
                sTo = MemUser.Email
            End If

            Dim sBody As String = "Unfortunately, we have rejected the story you shared with us at the CH Kitty Club.  We definitely appreciate your sharing it, and would like to work with you on making it an acceptable story." + _
                vbCrLf + vbCrLf + "Thanks for sharing, and thanks for your support." + _
                vbCrLf + vbCrLf + "Here's the story you submitted:  " + txt.Text

            If sTo <> "" Then
                Dim msg As New MailMessage(sFrom, sTo, "Your CH Kitty Club post has been rejected!", sBody)

                Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
                client.Credentials = New NetworkCredential( _
                    ConfigurationManager.AppSettings("smtpUser"), _
                    ConfigurationManager.AppSettings("smtpPassword"))
                client.Send(msg)
            End If

            Server.Transfer("ReviewMembers.aspx")
        End If
    End Sub

    Protected Sub deleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles deleteButton.Click
        If MemberList.SelectedIndex > -1 Then
            ActOnFiles(MemberList.SelectedValue, "Delete")

            Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)

            Dim cmd As New SqlCommand
            With cmd
                .Connection = conn
                .CommandType = Data.CommandType.Text
                .CommandText = "DELETE FROM dbo.CHKC_Members WHERE [MemberID]=@MemberID"

                Dim MemberID As SqlParameter = .Parameters.Add("@MemberID", Data.SqlDbType.Int, 4)
                MemberID.Value = MemberList.SelectedValue
                MemberID.Direction = Data.ParameterDirection.Input
            End With

            Dim cmd2 As New SqlCommand
            With cmd2
                .Connection = conn
                .CommandType = Data.CommandType.Text
                .CommandText = "DELETE FROM dbo.CHKC_Photos WHERE [MemberID]=@MemberID"

                Dim MemberID As SqlParameter = .Parameters.Add("@MemberID", Data.SqlDbType.Int, 4)
                MemberID.Value = MemberList.SelectedValue
                MemberID.Direction = Data.ParameterDirection.Input
            End With

            Try
                conn.Open()
                cmd.ExecuteNonQuery()
                cmd2.ExecuteNonQuery()
                conn.Close()

                Server.Transfer("ReviewMembers.aspx")
            Finally
                If Not conn Is Nothing Then
                    conn.Close()
                End If
            End Try
        End If
    End Sub

    Protected Sub ActOnFiles(ByVal MemberID As Integer, ByVal sMode As String)
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "SELECT [Filename] FROM dbo.CHKC_Photos WHERE [MemberID] = @MemberID AND [Approved] = 0"

            Dim pMemberID As SqlParameter = .Parameters.Add("@MemberID", Data.SqlDbType.Int, 4)
            pMemberID.Value = MemberID
            pMemberID.Direction = Data.ParameterDirection.Input
        End With

        Try
            conn.Open()
            Dim rdr As SqlDataReader = cmd.ExecuteReader

            Dim srcDir As String = Server.MapPath("../uploads/")
            Dim tgtDir As String = Server.MapPath("../images/stories/")
            Dim sFile As String

            If rdr.HasRows Then
                Do While rdr.Read()
                    sFile = rdr.GetString(0)
                    If sMode = "Move" Then
                        My.Computer.FileSystem.MoveFile(srcDir + sFile, tgtDir + sFile)
                    ElseIf sMode = "Delete" Then
                        My.Computer.FileSystem.DeleteFile(srcDir + sFile)
                    End If
                Loop
            End If
            conn.Close()
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

    Protected Function GetMemberName() As String
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        Dim MemberName As String
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "SELECT [MemberName] FROM dbo.CHKC_Members WHERE [MemberID] = @MemberID"

            Dim MemberID As SqlParameter = .Parameters.Add("@MemberID", Data.SqlDbType.Int, 4)
            MemberID.Value = MemberList.SelectedValue
            MemberID.Direction = Data.ParameterDirection.Input
        End With

        Try
            conn.Open()
            MemberName = cmd.ExecuteScalar()
            conn.Close()
            Return MemberName
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Function
End Class
