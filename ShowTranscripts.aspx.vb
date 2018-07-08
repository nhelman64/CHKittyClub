Imports System.IO

Partial Class ShowTranscripts
    Inherits System.Web.UI.Page

    Protected Sub ListBoxTranscripts_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxTranscripts.Load
        ' Get a list of all files for the date passed in the querystring
        Dim sDate As String = ""
        If Not Session("TranscriptDate") Is Nothing Then
            sDate = Session("TranscriptDate")
        End If

        Dim myDir As DirectoryInfo = New DirectoryInfo(Server.MapPath("~/transcripts"))
        Dim fileInfos() As FileInfo = _
            myDir.GetFiles("chat_log_" + sDate + "*.txt")

        For Each fi As FileInfo In fileInfos
            ListBoxTranscripts.Items.Add(fi.Name)
        Next
    End Sub

    Protected Sub ListBoxTranscripts_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxTranscripts.SelectedIndexChanged
        Dim path As String = Server.MapPath("~/transcripts/")
        Dim filename As String = ListBoxTranscripts.SelectedItem.Text

        Dim sr As New StreamReader(path + filename)
        TextBoxTranscript.Text = sr.ReadToEnd
        sr.Close()
    End Sub
End Class
