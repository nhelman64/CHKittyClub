Imports System.Data.SqlClient
Imports System.Configuration

Partial Class AdoptThisKitty
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LabelCatName.Text = GetCatName(Session("AdopteeID"))
            With DropDownListAllergic.Items
                .Clear()
                .Add("No")
                .Add("Yes")
            End With
            With DropDownListDwellingType.Items
                .Clear()
                .Add("House")
                .Add("Apartment")
                .Add("Multifamily")
                .Add("Dwelling")
                .Add("Other")
            End With
            With DropDownListHomeOwnership.Items
                .Clear()
                .Add("Own your home")
                .Add("Rent your home")
            End With
            With DropDownListAdoptionReason.Items
                .Clear()
                .Add("Family Pet")
                .Add("Companion For Other Cat")
                .Add("Gift")
                .Add("Other")
            End With
            With DropDownListCatThatLives.Items
                .Clear()
                .Add("Indoors?")
                .Add("Outdoors?")
                .Add("Both?")
            End With

            Helper.PopulateStateDropDown(DropDownListStreetState)
            Helper.PopulateStateDropDown(DropDownListMailingState)
        End If

        If Not Page.IsPostBack Then
            Dim objArgs As CAPTCHA.CAPTCHAImage.Args = New CAPTCHA.CAPTCHAImage.Args()
            Session.Add(CAPTCHA.CAPTCHAImage.Args.SessionID, objArgs)
        End If
    End Sub

    Private Function GetCatName(ByVal adopteeID As Integer) As String
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "SELECT [CatName] FROM dbo.CHKC_Adoptions WHERE UID = @UID"

            Dim pUID As SqlParameter = .Parameters.Add("@UID", Data.SqlDbType.Int)
            pUID.Value = adopteeID
            pUID.Direction = Data.ParameterDirection.Input
        End With
        Try
            conn.Open()
            Dim retVal As String = cmd.ExecuteScalar()
            conn.Close()
            Return retVal
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Function

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        ' ALLERGIES
        If DropDownListAllergic.SelectedItem.Text = "Yes" Then
            PanelAllergies.Visible = True
            RFVWhoIsAllergic.Enabled = True
            RFVAllergicToWhat.Enabled = True
        Else
            PanelAllergies.Visible = False
            RFVWhoIsAllergic.Enabled = False
            RFVAllergicToWhat.Enabled = False
        End If

        ' MAILING ADDRESS DIFFERENT FROM STREET ADDRESS
        If CheckBoxMailingAddress.Checked Then
            PanelMailingAddress.Visible = True
            RFVMailingAddress.Enabled = True
            RFVMailingCity.Enabled = True
            RFVMailingZip.Enabled = True
        Else
            PanelMailingAddress.Visible = False
            RFVMailingAddress.Enabled = False
            RFVMailingCity.Enabled = False
            RFVMailingZip.Enabled = False
        End If

        ' DWELLING TYPE
        If DropDownListDwellingType.SelectedItem.Text = "Other" Then
            PanelDwellingType.Visible = True
            RFVDwelling.Enabled = True
        Else
            PanelDwellingType.Visible = False
            RFVDwelling.Enabled = False
        End If

        ' RENTAL INFO
        If DropDownListHomeOwnership.SelectedItem.Text = "Rent your home" Then
            PanelHomeOwnership.Visible = True
            RFVLandlordName.Enabled = True
            RFVLandlordPhone.Enabled = True
        Else
            PanelHomeOwnership.Visible = False
            RFVLandlordName.Enabled = False
            RFVLandlordPhone.Enabled = False
        End If

        ' ADOPTION REASON
        If DropDownListAdoptionReason.SelectedItem.Text = "Other" Then
            PanelAdoptionReason.Visible = True
            RFVAdoptionReason.Enabled = True
        Else
            PanelAdoptionReason.Visible = False
            RFVAdoptionReason.Enabled = False
        End If
    End Sub

    Protected Sub ButtonNextPage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonNextPage.Click
        If Page.IsValid Then
            Dim oAdoptionInfo As New AdoptionForm(CInt(Session("AdopteeID")))
            With oAdoptionInfo
                .YourName = Server.HtmlEncode(TextBoxName.Text)
                .YourEmail = Server.HtmlEncode(TextBoxEmailAddress.Text)
                .OtherNames = Server.HtmlEncode(TextBoxOtherNames.Text)
                .HomePhone = Server.HtmlEncode(TextBoxHomePhone.Text)
                .WorkPhone = Server.HtmlEncode(TextBoxWorkPhone.Text)
                .AdultsInHome = Server.HtmlEncode(TextBoxAdultsInHome.Text)
                If TextBoxChildrenInHome.Text <> "" Then
                    .ChildrenInHome = Server.HtmlEncode(TextBoxChildrenInHome.Text)
                End If
                .ChildrenAges = Server.HtmlEncode(TextBoxChildrenAges.Text)
                If DropDownListAllergic.SelectedItem.Text = "Yes" Then
                    .Allergic = True
                    .WhoIsAllergic = Server.HtmlEncode(TextBoxWhoIsAllergic.Text)
                    .AllergicToWhat = Server.HtmlEncode(TextBoxAllergicToWhat.Text)
                Else
                    .Allergic = False
                End If
                .Occupations = Server.HtmlEncode(TextBoxOccupations.Text)
                .StreetAddress1 = Server.HtmlEncode(TextBoxStreetAddress1.Text)
                .StreetAddress2 = Server.HtmlEncode(TextBoxStreetAddress2.Text)
                .StreetCity = Server.HtmlEncode(TextBoxStreetCity.Text)
                .StreetState = DropDownListStreetState.SelectedItem.Text
                .StreetZip = Server.HtmlEncode(TextBoxStreetZip.Text)
                If CheckBoxMailingAddress.Checked Then
                    .IsMailingDifferent = True
                    .MailingAddress1 = Server.HtmlEncode(TextBoxMailingAddress1.Text)
                    .MailingAddress2 = Server.HtmlEncode(TextBoxMailingAddress2.Text)
                    .MailingCity = Server.HtmlEncode(TextBoxMailingCity.Text)
                    .MailingState = DropDownListMailingState.SelectedItem.Text
                    .MailingZip = Server.HtmlEncode(TextBoxMailingZip.Text)
                Else
                    .IsMailingDifferent = False
                End If
                .DwellingType = DropDownListDwellingType.SelectedItem.Text
                If .DwellingType = "Other" Then
                    .DwellingType = Server.HtmlEncode(TextBoxDwellingType.Text)
                End If
                .HomeOwnership = DropDownListHomeOwnership.SelectedItem.Text
                If .HomeOwnership = "Rent your home" Then
                    .LandlordName = Server.HtmlEncode(TextBoxLandlordName.Text)
                    .LandlordPhone = Server.HtmlEncode(TextBoxLandlordPhone.Text)
                End If
                .AdoptionReason = DropDownListAdoptionReason.SelectedItem.Text
                If .AdoptionReason = "Other" Then
                    .AdoptionReason = Server.HtmlEncode(TextBoxAdoptionReason.Text)
                End If
                .IndoorOutdoor = DropDownListCatThatLives.SelectedItem.Text
                .HoursAlone = Server.HtmlEncode(TextBoxHoursAlone.Text)
                .WhereDuringWork = Server.HtmlEncode(TextBoxWhereDuringWork.Text)
            End With

            Session("AdoptionForm") = oAdoptionInfo
            Server.Transfer("AdoptThisKitty2.aspx")
        End If
    End Sub

    Protected Sub CustomValidatorCAPTCHA_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidatorCAPTCHA.ServerValidate
        args.IsValid = False
        If Session(CAPTCHA.CAPTCHAImage.Args.SessionID) IsNot Nothing Then
            Dim strText As String = DirectCast(Session(CAPTCHA.CAPTCHAImage.Args.SessionID), CAPTCHA.CAPTCHAImage.Args).Text
            If Me.TextBoxValidate.Text.Trim = strText Then
                args.IsValid = True
            End If
        End If
    End Sub
End Class
