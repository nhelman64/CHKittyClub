
Partial Class Adoptions
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LiteralHeader.Visible = False
        HyperLinkApply.Visible = False
        Panel1.Visible = False

        If Not IsPostBack Then
            LiteralHeader.Text = "<h2>Please choose a kitty from the list on the right</h2>"
            LiteralHeader.Visible = True
        End If

        If IsPostBack Then
            If ListBoxAvailable.SelectedIndex > -1 Then
                Panel1.Visible = True
                HyperLinkApply.Visible = True
            End If
        End If
    End Sub

    Protected Sub FormViewAdoptee_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormViewAdoptee.PreRender
        Session("AdopteeID") = ListBoxAvailable.SelectedValue.ToString

        Dim img As Image = FormViewAdoptee.FindControl("ImageKitty")
        If Not img Is Nothing Then
            If img.ImageUrl = "" Then
                img.ImageUrl = "NoImageAvailable.jpg"
            End If
            img.ImageUrl = "images/adoptees/" + img.ImageUrl
        End If

        Dim sb As New StringBuilder

        Dim lblCatName As Label = FormViewAdoptee.FindControl("CatNameLabel")
        If Not lblCatName Is Nothing Then
            sb.Append(lblCatName.Text)
            sb.Replace("&quot;", Chr(34))
            sb.Replace("&amp;", Chr(38))
            lblCatName.Text = sb.ToString
        End If

        Dim lblCatBio As Label = FormViewAdoptee.FindControl("CatBioLabel")
        If Not lblCatBio Is Nothing Then
            sb = New StringBuilder
            sb.Append(lblCatBio.Text)
            sb.Replace("&quot;", Chr(34))
            sb.Replace("&amp;", Chr(38))
            lblCatBio.Text = sb.ToString
        End If

        Dim lblVetHistory As Label = FormViewAdoptee.FindControl("VetHistoryLabel")
        If Not lblVetHistory Is Nothing Then
            sb = New StringBuilder
            sb.Append(lblVetHistory.Text)
            sb.Replace("&quot;", Chr(34))
            sb.Replace("&amp;", Chr(38))
            lblVetHistory.Text = sb.ToString
        End If
    End Sub
End Class
