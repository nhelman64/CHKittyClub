Public Partial Class CAPTCHAImage
    Inherits System.Web.UI.Page

    Public Class Args
        Private numWidth As Byte
        Private numHeight As Byte
        Private numCountChar As Byte
        Private objBackgroundColorBegin As System.Drawing.Color
        Private objBackgroundColorEnd As System.Drawing.Color
        Private objFont As System.Drawing.Font
        Private strTexto As String

        Public Shared ReadOnly Property SessionID() As String
            Get
                Return "captcha"
            End Get
        End Property

        Public Property Width() As Byte
            Get
                Return numWidth
            End Get
            Set(ByVal value As Byte)
                numWidth = value
            End Set
        End Property

        Public Property Height() As Byte
            Get
                Return numHeight
            End Get
            Set(ByVal value As Byte)
                numHeight = value
            End Set
        End Property

        Public Property CountChar() As Byte
            Get
                Return numCountChar
            End Get
            Set(ByVal value As Byte)
                numCountChar = value
            End Set
        End Property

        Public Property BackgroundColorBegin() As System.Drawing.Color
            Get
                Return objBackgroundColorBegin
            End Get
            Set(ByVal value As System.Drawing.Color)
                objBackgroundColorBegin = value
            End Set
        End Property

        Public Property BackgroundColorEnd() As System.Drawing.Color
            Get
                Return objBackgroundColorEnd
            End Get
            Set(ByVal value As System.Drawing.Color)
                objBackgroundColorEnd = value
            End Set
        End Property

        Public Property Font() As System.Drawing.Font
            Get
                Return objFont
            End Get
            Set(ByVal value As System.Drawing.Font)
                objFont = value
            End Set
        End Property

        Public Property Text() As String
            Get
                Return strTexto
            End Get
            Set(ByVal value As String)
                strTexto = value
            End Set
        End Property

        Public Sub New()
            '--- Set Default Values ---
            Me.Height = 60
            Me.Width = 120
            Me.CountChar = 3
            Me.BackgroundColorBegin = Drawing.Color.DarkGray
            Me.BackgroundColorEnd = Drawing.Color.Coral
            Me.Font = New System.Drawing.Font("System", 27, Drawing.FontStyle.Bold)
            Me.Text = GenerateText()
        End Sub

        Public Function GenerateText(ByVal numQuantidadeDigitos As Byte) As String
            Me.CountChar = numQuantidadeDigitos
            Return GenerateText()
        End Function

        Public Function GenerateText() As String
            Const strChars As String = "0123456789ABCDEFGHIJKLMNOPQRSTUVXYWZabcdefghijklmnopqrstuvxwyz"
            Dim objRandom As System.Random = New System.Random()
            Dim strText As System.Text.StringBuilder = New System.Text.StringBuilder(Me.CountChar)
            For i As Byte = 1 To Me.CountChar
                strText.Append(strChars.Chars(objRandom.Next(0, 61)))
            Next
            Me.Text = strText.ToString()
            Return strText.ToString()
        End Function
    End Class

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("captcha") IsNot Nothing Then
            Dim objArgs As Args = Session("captcha")
            Using objBitMap As Drawing.Bitmap = New Drawing.Bitmap(objArgs.Width, objArgs.Height, Drawing.Imaging.PixelFormat.Format24bppRgb)
                Using objImage As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(objBitMap)
                    Dim objRectangle As System.Drawing.Rectangle = New System.Drawing.Rectangle(0, 0, objArgs.Width, objArgs.Height)
                    objImage.FillRectangle(New Drawing.Drawing2D.LinearGradientBrush(objRectangle, objArgs.BackgroundColorBegin, objArgs.BackgroundColorEnd, Drawing.Drawing2D.LinearGradientMode.Vertical), objRectangle)
                    Dim objTextSize As System.Drawing.SizeF = objImage.MeasureString(objArgs.Text, objArgs.Font)
                    Dim objRandom As System.Random = New System.Random()
                    objImage.DrawString(objArgs.Text, objArgs.Font, New Drawing.Drawing2D.LinearGradientBrush(New System.Drawing.Rectangle(0, -10, objTextSize.Width, objTextSize.Height * 1.2), Drawing.Color.DarkGray, Drawing.Color.White, Drawing.Drawing2D.LinearGradientMode.Vertical), objRandom.Next(0, objArgs.Width - objTextSize.Width), objRandom.Next(-10, (objArgs.Height - objTextSize.Height) * 1.5))
                    objTextSize = Nothing
                    '--- Insert cross lines ---
                    objImage.DrawLine(Drawing.Pens.Blue, objRandom.Next(0, objArgs.Width \ 4), 0, objRandom.Next((objArgs.Width \ 4) * 3, objArgs.Width), objArgs.Height)
                    objImage.DrawLine(Drawing.Pens.Green, 0, objRandom.Next((objArgs.Height \ 4) * 3, objArgs.Height), objArgs.Width, objRandom.Next(0, objArgs.Height \ 4))
                    objImage.DrawLine(Drawing.Pens.Yellow, 0, objRandom.Next(0, objArgs.Height \ 2), objArgs.Width, objRandom.Next(objArgs.Height \ 2, objArgs.Height))
                    objImage.DrawLine(Drawing.Pens.Red, objRandom.Next(0, objArgs.Width \ 2), objArgs.Width, objRandom.Next(objArgs.Width \ 2, objArgs.Width), 0)
                    objRandom = Nothing
                    '--- Return a image building for caller method ---
                    Response.ContentType = "image/jpeg"
                    objBitMap.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg)
                    objRectangle = Nothing
                End Using
            End Using
        End If
    End Sub

End Class