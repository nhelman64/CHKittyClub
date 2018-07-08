
Partial Class Members
    Inherits System.Web.UI.Page

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        CleanUpStory()
    End Sub

    Protected Sub MemberList_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MemberList.Load
        If Not IsPostBack Then
            MemberList.SelectedIndex = 0
        End If
    End Sub

    Private Sub CleanUpStory()
        ' ***** Cleans up "\r\n", replacing them w/vbCrLf to get the right spacing *****

        ' Get a handle on the FormView object w/in the UpdatePanel
        Dim frm As FormView = UpdatePanel1.FindControl("FormViewStory")

        ' Then get a handle on the TextBox w/in the FormView that holds the story
        Dim txt As TextBox = frm.FindControl("TextBoxStory")

        ' Use a StringBuilder to replace "\r\n" with vbCrLf
        Dim sb As New StringBuilder
        sb.Append(txt.Text)
        sb.Replace("\r\n", vbCrLf)
        sb.Replace("&quot;", Chr(34))
        sb.Replace("&amp;", Chr(38))
        txt.Text = sb.ToString()
    End Sub

End Class
