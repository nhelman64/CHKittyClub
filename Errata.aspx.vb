
Partial Class Errata
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            headline.Visible = True
        Else
            headline.Visible = False
        End If
    End Sub
End Class
