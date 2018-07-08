
Partial Class Videos
    Inherits System.Web.UI.Page

    Protected Sub ListBoxVideos_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListBoxVideos.Load
        If Not IsPostBack Then
            ListBoxVideos.SelectedIndex = 0
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ListBoxVideos.SelectedIndex = 0
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            SqlDataSourceURLs.SelectParameters.Item("VideoID").DefaultValue = _
                ListBoxVideos.SelectedValue.ToString
        End If
    End Sub
End Class
