
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub LinkButtonLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormsAuthentication.SignOut()
        Session.Clear()
        FormsAuthentication.RedirectToLoginPage()
    End Sub
End Class

