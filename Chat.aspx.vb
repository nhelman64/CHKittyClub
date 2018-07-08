Imports System.IO

Partial Class Chat
    Inherits System.Web.UI.Page

    Private _transcripts As List(Of DateTime)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim lst As New List(Of DateTime)
        _transcripts = lst
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        JaxterChat1.UserName = Context.User.Identity.Name
    End Sub

    Protected Sub JaxterChat1_MessagePosted(ByVal o As Object, ByVal e As WebFurbish.JaxterMessageEventArgs) Handles JaxterChat1.MessagePosted
        If Application("LogChat") = True Then
            Dim savepath As String = Server.MapPath("~/transcripts/")
            Dim filename As String = Application("ChatLogFilename")
            Dim stream As New StreamWriter(savepath + filename, True)
            stream.WriteLine("(" + DateString() + ")" + e.UserName + " - " + e.Message)
            stream.Flush()
            stream.Close()
        End If
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

    Protected Sub CalendarTranscripts_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CalendarTranscripts.SelectionChanged
        Dim dt As DateTime
        Dim fn As String

        dt = CalendarTranscripts.SelectedDate
        fn = dt.ToString("yyyy") + _
             dt.ToString("MM") + _
             dt.ToString("dd")

        Session("TranscriptDate") = fn
        Server.Transfer("ShowTranscripts.aspx")
    End Sub
End Class
