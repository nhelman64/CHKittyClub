Imports System.Configuration
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime

Partial Class NewArt
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim MemUser As MembershipUser = Membership.GetUser()
            If Not MemUser Is Nothing Then
                TextBoxUsername.Text = MemUser.UserName
                TextBoxEmail.Text = MemUser.Email
            End If

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

    Protected Sub ButtonShare_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonShare.Click
        If TextBoxUsername.Text = "" Then
            Server.Transfer("Errata.aspx")
        End If
        SendEmail()
    End Sub

    Protected Sub SendEmail()
        Dim sFrom As String = TextBoxEmail.Text
        Dim sTo As String = ConfigurationManager.AppSettings("smtpFrom")
        Dim sSubject As String = "[ch kitty club] artistic contribution submitted"
        Dim sBody As New StringBuilder

        sBody.Append("Username: ")
        sBody.Append(TextBoxUsername.Text)
        sBody.Append(vbCrLf)
        sBody.Append(vbCrLf)
        If TextBoxContribution.Text <> "" Then
            sBody.Append(TextBoxContribution.Text)
            sBody.Append(vbCrLf)
            sBody.Append(vbCrLf)
        End If


        Dim msg As New MailMessage(sFrom, sTo, sSubject, sBody.ToString)
        If FileUploadAttachment.HasFile Then
            Dim att As New Attachment(SaveFile(FileUploadAttachment))
            msg.Attachments.Add(att)
        End If
        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)
        Session("ThankYouPage") = "art"
        Server.Transfer("Thanks.aspx")
    End Sub

    Protected Function SaveFile(ByRef oFU As FileUpload) As String
        Dim file As HttpPostedFile = oFU.PostedFile

        ' Specify the path to save the uploaded file to.
        Dim savePath As String = Server.MapPath("~/uploads/")

        ' Get the name of the file to upload.
        Dim fileName As String = Server.HtmlEncode(TextBoxUsername.Text) + _
            "_" + oFU.FileName

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
        Return savePath
    End Function
End Class
