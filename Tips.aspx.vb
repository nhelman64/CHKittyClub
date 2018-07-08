Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Tips
    Inherits System.Web.UI.Page

    Protected Sub DataListTips_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListTips.ItemDataBound
        If e.Item.ItemType = ListItemType.Item Then
            Dim txt As TextBox = CType(e.Item.FindControl("TextBoxTip"), TextBox)
            Dim sb As New StringBuilder
            sb.Append(txt.Text)
            sb.Replace("&quot;", Chr(34))
            sb.Replace("&amp;", Chr(38))
            txt.Text = sb.ToString
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ListBoxCategories.SelectedIndex = 0
            SqlDataSourceTips.SelectParameters.Item("Category").DefaultValue = FirstCategory()
        End If
    End Sub

    Private Function FirstCategory() As String
        Dim Category As String

        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "select category from dbo.chkc_tips order by category"
        End With

        Try
            conn.Open()
            Category = CStr(cmd.ExecuteScalar)
            Return Category
        Finally
            conn.Close()
            conn.Dispose()
        End Try
    End Function
End Class
