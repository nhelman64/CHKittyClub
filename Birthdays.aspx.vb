Imports System.Data.SqlClient
Imports System.Configuration


Partial Class Birthdays
    Inherits System.Web.UI.Page

    Private _Birthdays As New Collection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Load kitties and dates to speed calendar rendering
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "SELECT [CatAndMember], [Birthday], [MemberID] FROM dbo.CHKC_Members WHERE [Birthday] IS NOT NULL AND [Deceased] IS NULL ORDER BY [CatAndMember]"
        End With

        Try
            conn.Open()
            Dim rdr As SqlDataReader = cmd.ExecuteReader

            Do While rdr.Read()
                Dim bd As New Birthday(rdr.GetString(0), rdr.GetDateTime(1), CInt(rdr.GetValue(2)))
                _Birthdays.Add(bd, bd.KittyMember)
            Loop

            conn.Close()
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

    Protected Sub CalendarBirthdays_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles CalendarBirthdays.DayRender
        For Each bd As Birthday In _Birthdays
            If e.Day.Date.ToString("m") = bd.KittyBirthday.ToString("m") Then
                Dim lit As New Literal
                lit.Text = "<br />"
                Dim link As New HyperLink
                With link
                    .NavigateUrl = "Members.aspx?id=" + CStr(bd.MemberID)
                    .Text = bd.KittyMember
                    .ToolTip = CStr(DateDiff(DateInterval.Year, bd.KittyBirthday, Now)) + " years old"
                End With
                With e.Cell.Controls
                    .Add(lit)
                    .Add(link)
                End With
            End If
        Next
    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        Dim frm As FormView = UpdatePanel1.FindControl("FormView1")
        Dim txt As TextBox = frm.FindControl("BirthdayTextBox")
        If Not txt Is Nothing Then
            CalendarBirthdays.VisibleDate = txt.Text
        End If
        If IsPostBack Then
            txt.Text = Now
        End If
    End Sub
End Class

Public Class Birthday
    Private _KittyMember As String
    Private _KittyBirthday As Date
    Private _MemberID As Integer

    Public Property KittyMember() As String
        Get
            Return _KittyMember
        End Get
        Set(ByVal value As String)
            _KittyMember = value
        End Set
    End Property

    Public Property KittyBirthday() As Date
        Get
            Return _KittyBirthday
        End Get
        Set(ByVal value As Date)
            _KittyBirthday = value
        End Set
    End Property

    Public Property MemberID() As Integer
        Get
            Return _MemberID
        End Get
        Set(ByVal value As Integer)
            _MemberID = value
        End Set
    End Property

    Public Sub New(ByVal sName As String, ByVal dtBirthday As Date, ByVal iMemberID As Integer)
        KittyMember = sName
        KittyBirthday = dtBirthday
        MemberID = iMemberID
    End Sub
End Class
