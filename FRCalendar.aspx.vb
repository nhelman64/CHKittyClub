Imports System.Configuration
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime

Partial Class Donate
    Inherits System.Web.UI.Page

    Private _fileName1 As String
    Private _fileName2 As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Dim hl As HyperLink = UpdatePanel1.FindControl("HyperLinkCalendar")
            Dim img As Image = UpdatePanel1.FindControl("ImageCalendar")
            Dim imglnk As String = "images/CalendarSample"

            If DropDownListOrientation.SelectedValue.ToString = "two" Then
                hl.NavigateUrl = "images/Sample 2Pics Landscape Calendar.pdf"
                imglnk += "Landscape"
                rfvPhoto2.Enabled = True
            ElseIf DropDownListOrientation.SelectedValue.ToString = "one" Then
                hl.NavigateUrl = "images/Sample 1Pic Portrait Calendar.pdf"
                imglnk += "Portrait"
                rfvPhoto2.Enabled = False
            End If

            imglnk += DropDownListColor.SelectedItem.Text + ".jpg"
            img.ImageUrl = imglnk
        Else
            Dim memUser As MembershipUser = Membership.GetUser()
            If Not memUser Is Nothing Then
                TextBoxEmail.Text = memUser.Email
                TextBoxEmail.Enabled = False
            Else
                TextBoxEmail.Text = ""
                TextBoxEmail.Enabled = True
            End If

            Helper.PopulateStateDropDown(DropDownListMailingState)
            Dim objArgs As CAPTCHA.CAPTCHAImage.Args = New CAPTCHA.CAPTCHAImage.Args()
            Session.Add(CAPTCHA.CAPTCHAImage.Args.SessionID, objArgs)
        End If
    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        args.IsValid = False
        If Session(CAPTCHA.CAPTCHAImage.Args.SessionID) IsNot Nothing Then
            Dim strText As String = DirectCast(Session(CAPTCHA.CAPTCHAImage.Args.SessionID), CAPTCHA.CAPTCHAImage.Args).Text
            If Me.TextBoxValidate.Text.Trim = strText Then
                args.IsValid = True
            End If
        End If
    End Sub

    Protected Sub ButtonOrder_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonOrder.Click
        If Page.IsValid Then
            Dim sFrom As String = Server.HtmlEncode(TextBoxEmail.Text)
            Dim sTo As String = ConfigurationManager.AppSettings("smtpFrom")
            Dim sSubject As String = "[ch kitty club] Calendar Purchase"
            Dim sBody As New StringBuilder

            sBody.Append("Request for a ")
            sBody.Append(DropDownListColor.SelectedItem.Text)
            sBody.Append(" calendar from ")
            sBody.Append(sFrom)
            sBody.Append(".  ")
            sBody.Append(DropDownListOrientation.SelectedValue.ToString)
            sBody.Append(" attachment(s) included.")
            sBody.Append(vbCrLf)
            sBody.Append("Caption1:  ")
            sBody.Append(Server.HtmlEncode(TextBoxName1.Text))
            sBody.Append(vbCrLf)
            If TextBoxName2.Text <> "" Then
                sBody.Append(Server.HtmlEncode(TextBoxName2.Text))
                sBody.Append(vbCrLf)
            End If
            sBody.Append(vbCrLf)
            sBody.Append(vbCrLf)
            sBody.Append("Mailing Address:")
            sBody.Append(vbCrLf)
            sBody.Append(Server.HtmlEncode(TextBoxMailingName.Text))
            sBody.Append(vbCrLf)
            sBody.Append(Server.HtmlEncode(TextBoxMailingAddress1.Text))
            sBody.Append(vbCrLf)
            If TextBoxMailingAddress2.Text <> "" Then
                sBody.Append(Server.HtmlEncode(TextBoxMailingAddress2.Text))
                sBody.Append(vbCrLf)
            End If
            sBody.Append(Server.HtmlEncode(TextBoxMailingCity.Text))
            sBody.Append(", ")
            sBody.Append(DropDownListMailingState.SelectedItem.Text)
            sBody.Append("  ")
            sBody.Append(Server.HtmlEncode(TextBoxMailingZip.Text))


            Dim msg As New MailMessage(sFrom, sTo, sSubject, sBody.ToString)
            Dim att As Attachment

            If FileUpload1.HasFile Then
                _fileName1 = SaveFile(FileUpload1)
            End If

            If FileUpload2.HasFile Then
                _fileName2 = SaveFile(FileUpload2)
            End If

            att = AttachmentFilename(_fileName1)
            If Not att Is Nothing Then
                msg.Attachments.Add(att)
            End If

            att = AttachmentFilename(_fileName2)
            If Not att Is Nothing Then
                msg.Attachments.Add(att)
            End If

            Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
            client.Credentials = New NetworkCredential( _
                ConfigurationManager.AppSettings("smtpUser"), _
                ConfigurationManager.AppSettings("smtpPassword"))

            client.Send(msg)
            Server.Transfer("FRCalendar2.aspx")
        End If
    End Sub

    Protected Function SaveFile(ByRef oFU As FileUpload) As String
        Dim file As HttpPostedFile = oFU.PostedFile

        ' Specify the path to save the uploaded file to.
        Dim savePath As String = Server.MapPath("~/uploads/")

        ' Get the name of the file to upload.
        Dim fileName As String = oFU.FileName

        ' Create the path and file name to check for duplicates.
        Dim pathToCheck As String = savePath + fileName

        ' Create a temporary file name to use for checking duplicates.
        Dim tempfileName As String = ""

        ' Check to see if a file already exists with the
        ' same name as the file to upload.        
        If (System.IO.File.Exists(pathToCheck)) Then
            Dim counter As Integer = 2
            While (System.IO.File.Exists(pathToCheck))
                ' If a file with this name already exists,
                ' prefix the filename with a number.
                tempfileName = counter.ToString() + fileName
                pathToCheck = savePath + tempfileName
                counter = counter + 1
            End While

            fileName = tempfileName

        End If

        ' Append the name of the file to upload to the path.
        savePath += fileName

        oFU.SaveAs(savePath)

        Return fileName
    End Function

    Private Function AttachmentFilename(ByVal sFilename As String) _
    As Attachment
        Dim att As Attachment = Nothing
        Dim savePath As String = Server.MapPath("~/uploads/")
        Dim fileName As String = ""
        If sFilename <> "" Then
            fileName = savePath + sFilename
            Dim attach As New Attachment(fileName, MediaTypeNames.Image.Jpeg)
            Dim disposition As New ContentDisposition
            With disposition
                .CreationDate = System.IO.File.GetCreationTime(fileName)
                .ModificationDate = System.IO.File.GetLastWriteTime(fileName)
                .ReadDate = System.IO.File.GetLastAccessTime(fileName)
            End With
            att = attach
        End If
        Return att
    End Function
End Class
