Imports System.IO

Partial Class utility_ViewErrorLog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strm As New StreamReader(Server.MapPath("~/errorlogs/error_log.txt"))
        TextBox1.Text = strm.ReadToEnd()
        strm.Close()
    End Sub
End Class
