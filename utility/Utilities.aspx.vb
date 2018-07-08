
Partial Class utility_Utilities
    Inherits System.Web.UI.Page

    Protected Sub CheckBoxLogChat_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxLogChat.CheckedChanged
        With CheckBoxLogChat
            If .Checked Then
                Application("LogChat") = True
                Application("ChatLogFilename") = "chat_log_" + _
                    Now.ToString("yyyy") + _
                    Now.ToString("MM") + _
                    Now.ToString("dd") + _
                    Now.ToString("HH") + _
                    Now.ToString("mm") + _
                    ".txt"
            Else
                Application("LogChat") = False
                Application("ChatLogFilename") = ""
            End If
        End With
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Application("LogChat") = True Then
            CheckBoxLogChat.Checked = True
        Else
            CheckBoxLogChat.Checked = False
        End If
    End Sub
End Class
