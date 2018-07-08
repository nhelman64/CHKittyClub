Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Adoptions
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LiteralHeader.Visible = False

        If Not IsPostBack Then
            LiteralHeader.Text = "<h2>Please choose a kitty from the list on the right</h2>"
            LiteralHeader.Visible = True
        End If
    End Sub

    Protected Sub FormViewAdoptee_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormViewAdoptee.DataBound
        Dim img As Image = FormViewAdoptee.FindControl("ImageKitty")
        If Not img Is Nothing Then
            img.ImageUrl = "images/adoptees/" + img.ImageUrl
        End If
        Session("AdopteeID") = ListBoxAvailable.SelectedValue.ToString
    End Sub

    Protected Sub ButtonApprove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonApprove.Click
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "UPDATE DBO.CHKC_ADOPTIONS SET [Approved] = 1 WHERE UID = @UID"

            Dim pUID As SqlParameter = .Parameters.Add("@UID", Data.SqlDbType.Int)
            pUID.Value = CInt(ListBoxAvailable.SelectedValue.ToString)
            pUID.Direction = Data.ParameterDirection.Input
        End With

        Try
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

    Protected Sub ButtonDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonDelete.Click
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "DELETE FROM DBO.CHKC_ADOPTIONS WHERE UID = @UID"

            Dim pUID As SqlParameter = .Parameters.Add("@UID", Data.SqlDbType.Int)
            pUID.Value = CInt(ListBoxAvailable.SelectedValue.ToString)
            pUID.Direction = Data.ParameterDirection.Input
        End With

        Try
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub
End Class
