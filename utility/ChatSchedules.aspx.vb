Imports System.IO

Partial Class utility_ChatSchedules
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim path As String = Server.MapPath("~/App_Data/")
        Dim filename As String = "ChatSchedule.xml"

        Dim stream As New StreamReader(path + filename)
        TextBoxSchedule.Text = stream.ReadToEnd
        stream.Close()
    End Sub

    Protected Sub ButtonSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSave.Click
        Dim path As String = Server.MapPath("~/App_Data/")
        Dim filename As String = "ChatSchedule.xml"
        Dim sContents As String = TextBoxSchedule.Text

        Dim stream As New StreamWriter(path + filename, False)
        stream.Write(sContents)
        stream.Close()
    End Sub
End Class
