Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail



Partial Class Chat
    Inherits System.Web.UI.Page

    Private _RoomUsage As DataSet
    Private _transcripts As List(Of DateTime)
    Private _moderators As List(Of String)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim lst As New List(Of DateTime)
        _transcripts = lst
        Dim lst2 As New List(Of String)
        _moderators = lst2

        _RoomUsage = JaxterChat1.GetRoomUsage(False)
        GridViewRoomUsage.DataSource = _RoomUsage
        GridViewRoomUsage.DataBind()
    End Sub

    Private Sub GetTranscriptDates()
        Dim myDir As DirectoryInfo = New DirectoryInfo(Server.MapPath("~/transcripts"))
        Dim fileInfos() As FileInfo = myDir.GetFiles("chat_log_*.txt")
        Dim sb As New StringBuilder
        Dim sYear As String
        Dim sMonth As String
        Dim sDay As String

        For Each fi As FileInfo In fileInfos
            'chat_history_201006120000.txt
            sb.Append(fi.Name)
            sYear = sb.ToString(9, 4)
            sMonth = sb.ToString(13, 2)
            sDay = sb.ToString(15, 2)
            Dim dt As New DateTime(CInt(sYear), CInt(sMonth), CInt(sDay))
            _transcripts.Add(dt)
            dt = Nothing
        Next
    End Sub

    Protected Sub CalendarTranscripts_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarTranscripts.DayRender
        ' Boolean used to tell if a date is found in the list, and if so, the date will be selectable
        Dim bFound As New Boolean

        Dim transcriptStyle As New Style
        transcriptStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#D18432")

        For Each dt As DateTime In _transcripts
            If e.Day.Date = dt Then
                bFound = True
                Exit For
            End If
        Next

        If bFound Then
            e.Day.IsSelectable = True
            e.Cell.ApplyStyle(transcriptStyle)
        Else
            e.Day.IsSelectable = False
        End If
    End Sub

    Protected Sub CalendarTranscripts_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarTranscripts.Load
        GetTranscriptDates()
    End Sub

    Protected Sub TimerChats_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles TimerChats.Tick
        Dim nCurrentUsers As Integer
        nCurrentUsers = CInt(_RoomUsage.Tables(0).Rows(0).Field(Of Integer)("Users").ToString)
        If nCurrentUsers > 0 Then
            If Session("InChat") = 0 Then
                GetChatModerators()
                SendEmails()
            End If
        End If
        Session("InChat") = nCurrentUsers
    End Sub

    Protected Sub GetChatModerators()
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = CommandType.Text
            .CommandText = "SELECT [Username] FROM [dbo].[CHKC_ChatModerators]"
        End With

        Try
            conn.Open()
            Dim rdr As SqlDataReader = cmd.ExecuteReader
            If rdr.HasRows Then
                Do While rdr.Read
                    ' Populate with usernames
                    _moderators.Add(rdr.GetString(0))
                Loop
            End If
            conn.Close()

            ' Swap out usernames for email addresses 
            ' (should all be registered on the site)
            Dim MemUser As MembershipUser = Membership.GetUser()
            Dim lst As New List(Of String)
            For Each entry As String In _moderators
                MemUser = Membership.GetUser(entry)
                lst.Add(MemUser.Email)
            Next
            _moderators = lst
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

    Protected Sub SendEmails()
        Dim sFrom As String = ConfigurationManager.AppSettings("smtpFrom")
        Dim sTo As String = sFrom
        Dim sSubject As String = "[ch kitty club] Live Chat Moderator Alert"

        Dim sBody As New StringBuilder
        sBody.Append("***** ***** ***** ATTENTION ***** ***** *****")
        sBody.Append(vbCrLf)
        sBody.Append(vbCrLf)
        sBody.Append("A visitor has logged into the Live Chat on the CH Kitty Club site.")
        sBody.Append(vbCrLf)
        sBody.Append(vbCrLf)
        sBody.Append("You are recieving this message because you volunteered to field questions and concerns in the CH Kitty Club live chat.")
        sBody.Append(vbCrLf)
        sBody.Append(vbCrLf)
        sBody.Append("Thank you for your support!")
        sBody.Append(vbCrLf)
        sBody.Append("Lizzie & Neal")

        Dim msg As New MailMessage(sFrom, sTo, sSubject, sBody.ToString)
        For Each address As String In _moderators
            msg.To.Add(New MailAddress(address))
        Next

        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)

    End Sub
End Class
