Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.IO
Imports System.Drawing

Partial Class NewStory
    Inherits System.Web.UI.Page

    Private _fileName1 As String
    Private _fileName2 As String
    Private _fileName3 As String
    Private _fileName4 As String
    Private _fileName5 As String
    Private _fileName6 As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBoxUsername.Text = Context.User.Identity.Name

        Dim MemUser As MembershipUser
        MemUser = Membership.GetUser()
        If Not MemUser Is Nothing Then
            TextBoxEmail.Text = MemUser.Email.ToString
        End If

        If Not Page.IsPostBack Then
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

    Protected Sub ButtonUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUpload.Click
        If Page.IsValid Then
            _fileName1 = ""
            _fileName2 = ""
            _fileName3 = ""
            _fileName4 = ""
            _fileName5 = ""
            _fileName6 = ""

            If FileUpload1.HasFile Then
                _fileName1 = SaveFile(FileUpload1, TextBoxCaption1)
            End If

            If FileUpload2.HasFile Then
                _fileName2 = SaveFile(FileUpload2, TextBoxCaption2)
            End If

            If FileUpload3.HasFile Then
                _fileName3 = SaveFile(FileUpload3, TextBoxCaption3)
            End If

            If FileUpload4.HasFile Then
                _fileName4 = SaveFile(FileUpload4, TextBoxCaption4)
            End If

            If FileUpload5.HasFile Then
                _fileName5 = SaveFile(FileUpload5, TextBoxCaption5)
            End If

            If FileUpload6.HasFile Then
                _fileName6 = SaveFile(FileUpload6, TextBoxCaption6)
            End If

            SendEmail()
            Session("ThankYouPage") = "photos"
            Server.Transfer("Thanks.aspx")
        End If
    End Sub

    Protected Function SaveFile(ByRef oFU As FileUpload, ByRef oCap As TextBox) _
    As String

        Dim file As HttpPostedFile = oFU.PostedFile

        ' Specify the path to save the uploaded file to.
        Dim savePath As String = Server.MapPath("~/uploads/")

        ' Get the name of the file to upload.
        Dim fileName As String = Server.HtmlEncode(TextBoxUsername.Text) + "_" + oFU.FileName

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

        Dim newWidth As Integer = 400
        Dim newHeight As Integer = 400

        'Set the new bitmap resolution to 72 pixels per inch
        Dim upBmp As Bitmap = Bitmap.FromStream(oFU.PostedFile.InputStream)
        Dim newBmp As Bitmap = New Bitmap(newWidth, newHeight, Imaging.PixelFormat.Format24bppRgb)

        newBmp.SetResolution(72, 72)

        'Get the uploaded image width and height
        Dim upWidth As Integer = upBmp.Width
        Dim upHeight As Integer = upBmp.Height
        Dim newX As Integer = 0 'Set the new top left drawing position on the image canvas
        Dim newY As Integer = 0
        Dim reDuce As Decimal

        'Keep the aspect ratio of image the same if not 4:3 and work out the newX and newY positions
        'to ensure the image is always in the centre of the canvas vertically and horizontally
        If upWidth > upHeight Then 'Landscape picture
            reDuce = newWidth / upWidth

            'calculate the width percentage reduction as decimal
            newHeight = Int(upHeight * reDuce)

            'reduce the uploaded image height by the reduce amount
            newY = Int((400 - newHeight) / 2)

            'Position the image centrally down the canvas
            newX = 0 'Picture will be full width

        ElseIf upWidth < upHeight Then 'Portrait picture
            reDuce = newHeight / upHeight

            'calculate the height percentage reduction as decimal
            newWidth = Int(upWidth * reDuce)

            'reduce the uploaded image height by the reduce amount
            newX = Int((400 - newWidth) / 2)

            'Position the image centrally across the canvas
            newY = 0 'Picture will be full hieght

        ElseIf upWidth = upHeight Then 'square picture
            reDuce = newHeight / upHeight

            'calculate the height percentage reduction as decimal
            newWidth = Int(upWidth * reDuce)

            'reduce the uploaded image height by the reduce amount
            newX = Int((400 - newWidth) / 2) 'Position the image centrally across the canvas
            newY = Int((400 - newHeight) / 2) 'Position the image centrally down the canvas
        End If

        'Create a new image from the uploaded picture using the Graphics class
        'Clear the graphic and set the background colour to white
        'Use Antialias and High Quality Bicubic to maintain a good quality picture
        'Save the new bitmap image using 'Png' picture format and the calculated canvas positioning

        Dim newGraphic As Graphics = Graphics.FromImage(newBmp)

        newGraphic.Clear(Color.White)
        newGraphic.SmoothingMode = Drawing2D.SmoothingMode.AntiAlias
        newGraphic.InterpolationMode = Drawing2D.InterpolationMode.HighQualityBicubic
        newGraphic.DrawImage(upBmp, newX, newY, newWidth, newHeight)
        newBmp.Save(savePath, Imaging.ImageFormat.Jpeg)

        AddToDatabase(Server.HtmlEncode(TextBoxUsername.Text), _
                      DropDownListCats.SelectedItem.Text, fileName, _
                      Server.HtmlEncode(oCap.Text))

        Return fileName
    End Function

    Private Sub AddToDatabase(ByVal sMemberName As String, ByVal sCatName As String, _
                              ByVal sFilename As String, ByVal sCaption As String)
        ' First, get the MemberID from the record just stored
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "SELECT [MemberID] FROM dbo.CHKC_Members WHERE [MemberName] = @MemberName AND [CatName] = @CatName"

            Dim pMemberName As SqlParameter = .Parameters.Add("@MemberName", Data.SqlDbType.VarChar, 50)
            pMemberName.Value = Server.HtmlEncode(TextBoxUsername.Text)
            pMemberName.Direction = Data.ParameterDirection.Input

            Dim pCatName As SqlParameter = .Parameters.Add("@CatName", Data.SqlDbType.VarChar, 50)
            pCatName.Value = DropDownListCats.SelectedItem.Text
            pCatName.Direction = Data.ParameterDirection.Input
        End With

        Try
            conn.Open()
            Dim iMemberID As Integer = cmd.ExecuteScalar()

            With cmd
                .CommandText = "INSERT INTO dbo.CHKC_Photos ([MemberID], [Filename], [Caption], [Approved]) " & _
                                "VALUES (@MemberID, @Filename, @Caption, 0)"

                Dim pMemberID As SqlParameter = .Parameters.Add("@MemberID", Data.SqlDbType.Int, 4)
                pMemberID.Value = iMemberID
                pMemberID.Direction = Data.ParameterDirection.Input

                Dim pFilename As SqlParameter = .Parameters.Add("@Filename", Data.SqlDbType.VarChar, 128)
                pFilename.Value = sFilename
                pFilename.Direction = Data.ParameterDirection.Input

                Dim pCaption As SqlParameter = .Parameters.Add("@Caption", Data.SqlDbType.VarChar, 50)
                pCaption.Value = sCaption
                pCaption.Direction = Data.ParameterDirection.Input
            End With

            cmd.ExecuteNonQuery()
            conn.Close()
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

    Private Sub SendEmail()
        ' Build the message body
        Dim sb As New StringBuilder

        With sb
            .Append("The following photos have been submitted for a CH kitty member's story:")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Username: ")
            .Append(Server.HtmlEncode(TextBoxUsername.Text))
            .Append(vbCrLf)
            .Append("Email: ")
            .Append(Server.HtmlEncode(TextBoxEmail.Text))
            .Append(vbCrLf)
            .Append("Kitty's name: ")
            .Append(DropDownListCats.SelectedItem.Text)
        End With

        Dim msg As New MailMessage(Server.HtmlEncode(TextBoxEmail.Text), _
                                   ConfigurationManager.AppSettings("smtpFrom"), _
                                   "New CH Kitty Photos Submission", _
                                   sb.ToString)

        ' Prepare attachments (uploaded photos)
        Dim att As Attachment
        Dim userName As String = Server.HtmlEncode(TextBoxUsername.Text)

        att = AttachmentFilename(userName, _fileName1)
        If Not att Is Nothing Then
            msg.Attachments.Add(att)
        End If

        att = AttachmentFilename(userName, _fileName2)
        If Not att Is Nothing Then
            msg.Attachments.Add(att)
        End If

        att = AttachmentFilename(userName, _fileName3)
        If Not att Is Nothing Then
            msg.Attachments.Add(att)
        End If

        att = AttachmentFilename(userName, _fileName4)
        If Not att Is Nothing Then
            msg.Attachments.Add(att)
        End If

        att = AttachmentFilename(userName, _fileName5)
        If Not att Is Nothing Then
            msg.Attachments.Add(att)
        End If

        att = AttachmentFilename(userName, _fileName6)
        If Not att Is Nothing Then
            msg.Attachments.Add(att)
        End If

        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))

        client.Send(msg)
    End Sub

    Private Function AttachmentFilename(ByVal userName As String, ByVal sFilename As String) _
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
