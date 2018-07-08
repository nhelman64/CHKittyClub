Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Members
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sMemberID() As String
        Dim s2MemberID As String
        Dim bQueryString As Boolean = False
        If Not IsPostBack Then
            If Request.QueryString.Count > 0 Then
                If Request.QueryString.GetKey(0) = "id" Then
                    bQueryString = True
                    sMemberID = Request.QueryString.GetValues(0)
                    SqlDataSourceStory.SelectParameters.Item(0).DefaultValue = sMemberID(0)
                    SqlDataSourcePhotos.SelectParameters.Item(0).DefaultValue = sMemberID(0)
                End If
            End If
            If Not bQueryString Then
                s2MemberID = LastestMemberID()
                SqlDataSourcePhotos.SelectParameters.Item("MemberID").DefaultValue = s2MemberID
                SqlDataSourceStory.SelectParameters.Item("MemberID").DefaultValue = s2MemberID
            End If
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        CleanUpStory()
    End Sub

    Private Sub CleanUpStory()
        ' ***** Cleans up "\r\n", replacing them w/vbCrLf to get the right spacing *****

        ' Get a handle on the FormView object w/in the UpdatePanel
        Dim frm As FormView = UpdatePanel1.FindControl("FormViewStory")

        ' Then get a handle on the TextBox w/in the FormView that holds the story
        Dim txt As TextBox = frm.FindControl("TextBoxStory")

        ' Use a StringBuilder to replace "\r\n" with vbCrLf
        Dim sb As New StringBuilder
        If Not txt Is Nothing Then
            sb.Append(txt.Text)
            sb.Replace("\r\n", vbCrLf)
            txt.Text = sb.ToString()
        End If
    End Sub

    Protected Sub FormViewStory_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormViewStory.DataBound
        Dim sb As New StringBuilder
        Dim txt As TextBox = FormViewStory.FindControl("TextBoxStory")

        If Not txt Is Nothing Then
            sb.Append(txt.Text)
            sb.Replace("&quot;", Chr(34))
            sb.Replace("&amp;", Chr(38))
            txt.Text = sb.ToString
        End If
    End Sub

    Protected Sub MemberList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not IsPostBack Then
            MemberList.SelectedIndex = 0
        End If
    End Sub

    Private Function LastestMemberID() As String
        Dim MemberID As String

        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "select memberid from dbo.chkc_members order by lastactivitydate desc, membername, catname"
        End With

        Try
            conn.Open()
            MemberID = CStr(cmd.ExecuteScalar)
            Return MemberID
        Finally
            conn.Close()
            conn.Dispose()
        End Try
    End Function

End Class
