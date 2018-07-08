Imports System.Data.SqlClient
Imports System.Configuration

Partial Class PetDiary
    Inherits System.Web.UI.Page

    Private _diaryDates As List(Of DateTime)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim lst As New List(Of DateTime)
        _diaryDates = lst
        LoadDiaryDates()
    End Sub

    Private Sub LoadDiaryDates()
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "SELECT DISTINCT [EntryDate] FROM [dbo].[CHKC_PetDiary] WHERE [Approved]=1"
        End With
        Try
            conn.Open()
            Dim rdr As SqlDataReader = cmd.ExecuteReader
            Do While rdr.Read
                _diaryDates.Add(rdr.GetDateTime(0))
            Loop
            conn.Close()
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

    Protected Sub CalendarDiaries_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarDiaries.DayRender
        ' Boolean used to tell if a date is found in the list, and if so, the date will be selectable
        Dim bFound As New Boolean

        Dim diaryStyle As New Style
        diaryStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#D18432")

        For Each dt As DateTime In _diaryDates
            If e.Day.Date = dt Then
                bFound = True
                Exit For
            End If
        Next

        If bFound Then
            e.Day.IsSelectable = True
            e.Cell.ApplyStyle(diaryStyle)
        Else
            e.Day.IsSelectable = False
        End If
    End Sub

    Protected Sub DataListDiary_ItemCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListDiary.ItemCreated
        If e.Item.ItemType = ListItemType.Item Then
            Dim lbl As Label = CType(e.Item.FindControl("EntryBodyLabel"), Label)
            Dim sb As New StringBuilder
            sb.Append(lbl.Text)
            sb.Replace("&quot;", Chr(34))
            sb.Replace("&amp;", Chr(38))
            lbl.Text = sb.ToString
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            CalendarDiaries.SelectedDate = DateTime.Today
        End If
    End Sub
End Class
