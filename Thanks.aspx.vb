
Partial Class ThanksForNewStory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim avi As Integer = -1

        Select Case Session("ThankYouPage")
            Case "link"
                avi = 0
            Case "memorial"
                avi = 1
            Case "photos"
                avi = 2
            Case "story"
                avi = 3
            Case "tip"
                avi = 4
            Case "birthday"
                avi = 5
            Case "video"
                avi = 6
            Case "adoptee"
                avi = 7
            Case "adoption application"
                avi = 8
            Case "contact"
                avi = 9
            Case Is = "art"
                avi = 10
            Case Is = "link"
                avi = 11
            Case Is = "diary"
                avi = 12
        End Select

        MultiView1.ActiveViewIndex = avi
    End Sub
End Class
