Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.IO
Imports System.Drawing

Partial Class NewAdoptee
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBoxUsername.Text = Context.User.Identity.Name
        If Not IsPostBack Then
            With DropDownListGender.Items
                .Add("Male")
                .Add("Male - Neutered")
                .Add("Female")
                .Add("Female - Spayed")
            End With
            Helper.PopulateStateDropDown(DropDownListState)

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

    Protected Sub ButtonSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonSubmit.Click
        If Page.IsValid Then
            Dim sCatPhoto As String = ""
            If FileUploadPhoto.HasFile Then
                sCatPhoto = SaveUpload(FileUploadPhoto)
            End If
            SaveInput(sCatPhoto)
            SendEmail()
        End If
    End Sub

    Protected Function SaveUpload(ByRef oFU As FileUpload) As String
        Dim file As HttpPostedFile = oFU.PostedFile

        ' Specify the path to save the uploaded file to.
        Dim savePath As String = Server.MapPath("~/images/adoptees/")

        ' Get the name of the file to upload.
        Dim fileName As String = TextBoxUsername.Text + "_" + oFU.FileName

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
        'Use HighQuality and High Quality Bicubic to maintain a good quality picture
        'Save the new bitmap image using 'Jpeg' picture format and the calculated canvas positioning

        Dim newGraphic As Graphics = Graphics.FromImage(newBmp)

        newGraphic.Clear(Color.White)
        newGraphic.SmoothingMode = Drawing2D.SmoothingMode.HighQuality
        newGraphic.InterpolationMode = Drawing2D.InterpolationMode.HighQualityBicubic
        newGraphic.DrawImage(upBmp, newX, newY, newWidth, newHeight)
        newBmp.Save(savePath, Imaging.ImageFormat.Jpeg)

        newGraphic.Dispose()
        newBmp.Dispose()
        GC.Collect()

        Return fileName
    End Function

    Protected Sub SaveInput(ByVal sCatPhoto As String)
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "INSERT INTO [dbo].[CHKC_Adoptions] " + _
                           "([Username], [CatName], [Gender], [CatBirthday], [CatCity], [CatState], [CatBio], [CatPhoto], [VetHistory], [SubmitDate]) " + _
                           "VALUES " + _
                           "(@Username, @CatName, @Gender, @CatBirthday, @CatCity, @CatState, @CatBio, @CatPhoto, @VetHistory, @SubmitDate)"

            Dim pUsername As SqlParameter = .Parameters.Add("@Username", Data.SqlDbType.VarChar, 50)
            pUsername.Value = Server.HtmlEncode(TextBoxUsername.Text)
            pUsername.Direction = Data.ParameterDirection.Input

            Dim pCatName As SqlParameter = .Parameters.Add("@CatName", Data.SqlDbType.VarChar, 50)
            pCatName.Value = Server.HtmlEncode(TextBoxKittyName.Text)
            pCatName.Direction = Data.ParameterDirection.Input

            Dim pGender As SqlParameter = .Parameters.Add("@Gender", Data.SqlDbType.VarChar, 6)
            pGender.Value = DropDownListGender.SelectedValue.ToString
            pGender.Direction = Data.ParameterDirection.Input

            Dim pCatBirthday As SqlParameter = .Parameters.Add("@CatBirthday", Data.SqlDbType.Date)
            pCatBirthday.Value = CDate(Server.HtmlEncode(TextBoxBirthday.Text))
            pCatBirthday.Direction = Data.ParameterDirection.Input

            Dim pCatCity As SqlParameter = .Parameters.Add("@CatCity", Data.SqlDbType.VarChar, 50)
            pCatCity.Value = Server.HtmlEncode(TextBoxCity.Text)
            pCatCity.Direction = Data.ParameterDirection.Input

            Dim pCatState As SqlParameter = .Parameters.Add("@CatState", Data.SqlDbType.VarChar, 2)
            pCatState.Value = DropDownListState.SelectedItem.Text
            pCatState.Direction = Data.ParameterDirection.Input

            Dim pCatBio As SqlParameter = .Parameters.Add("@CatBio", Data.SqlDbType.Text, 8192)
            pCatBio.Value = Server.HtmlEncode(TextBoxBio.Text)
            pCatBio.Direction = Data.ParameterDirection.Input

            Dim pCatPhoto As SqlParameter = .Parameters.Add("@CatPhoto", Data.SqlDbType.VarChar, 128)
            pCatPhoto.Value = Server.HtmlEncode(sCatPhoto)
            pCatPhoto.Direction = Data.ParameterDirection.Input

            Dim pVetHistory As SqlParameter = .Parameters.Add("@VetHistory", Data.SqlDbType.Text, 8192)
            pVetHistory.Value = Server.HtmlEncode(TextBoxVetHistory.Text)
            pVetHistory.Direction = Data.ParameterDirection.Input

            Dim pSubmitDate As SqlParameter = .Parameters.Add("@SubmitDate", Data.SqlDbType.Date)
            pSubmitDate.Value = Now
            pSubmitDate.Direction = Data.ParameterDirection.Input
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

    Protected Sub SendEmail()
        Dim oUser As MembershipUser = Membership.GetUser()
        Dim sFrom As String = ""
        If Not oUser Is Nothing Then
            sFrom = oUser.Email
        End If

        Dim sTo As String = ConfigurationManager.AppSettings("smtpFrom")
        Dim sSubject As String = "New CH Kitty Adoptee"

        Dim sbBody As New StringBuilder
        With sbBody
            .Append(sSubject)
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Username:  ")
            .Append(Server.HtmlEncode(TextBoxUsername.Text))
            .Append(vbCrLf)
            .Append("Kitty's Name:  ")
            .Append(Server.HtmlEncode(TextBoxKittyName.Text))
            .Append(vbCrLf)
            .Append("Kitty's Gender:  ")
            .Append(DropDownListGender.SelectedValue.ToString)
            .Append(vbCrLf)
            .Append("Kitty's Birthday:  ")
            .Append(Server.HtmlEncode(TextBoxBirthday.Text))
            .Append(vbCrLf)
            .Append("Kitty's Location:  ")
            .Append(Server.HtmlEncode(TextBoxCity.Text))
            .Append(", ")
            .Append(DropDownListState.SelectedValue.ToString)
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Kitty's Bio:  ")
            .Append(Server.HtmlEncode(TextBoxBio.Text))
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Vet History:  ")
            .Append(Server.HtmlEncode(TextBoxVetHistory.Text))
        End With

        Dim msg As New MailMessage(sFrom, sTo, sSubject, sbBody.ToString)

        ' Set up attachment
        Dim att As Attachment
        att = AttachmentFilename(Context.User.Identity.Name, FileUploadPhoto)
        If Not att Is Nothing Then
            msg.Attachments.Add(att)
        End If

        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)
        Session("ThankYouPage") = "adoptee"
        Server.Transfer("Thanks.aspx")
    End Sub

    Private Function AttachmentFilename(ByVal userName As String, ByRef oFU As FileUpload) _
    As Attachment
        Dim att As Attachment = Nothing
        Dim savePath As String = Server.MapPath("~/images/adoptees/")
        Dim fileName As String = ""
        If oFU.HasFile Then
            fileName = savePath + userName + "_" + oFU.FileName
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
