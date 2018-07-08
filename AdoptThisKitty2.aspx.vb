Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail

Partial Class AdoptThisKitty2
    Inherits System.Web.UI.Page

    Protected Sub DDLYesNo(ByRef ddl As DropDownList)
        With ddl.Items
            .Clear()
            .Add("Yes")
            .Add("No")
        End With
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("AdoptionForm") Is Nothing Then
            If Not Page.IsPostBack Then

                DDLYesNo(DropDownListDeclaw)
                DDLYesNo(DropDownListOwnAPetNow)
                DDLYesNo(DropDownListVaccinationsCurrent)
                With DropDownListIndoorOutdoor.Items
                    .Clear()
                    .Add("Indoor")
                    .Add("Outdoor")
                    .Add("Indoor/Outdoor")
                End With
                DDLYesNo(DropDownListAllFixed)
                DDLYesNo(DropDownListPastPets)
                DDLYesNo(DropDownListContactVet)
                DDLYesNo(DropDownListSurrendered)
                DDLYesNo(DropDownListProblemBehavior)

                LabelCatName.Text = GetCatName(Session("AdopteeID"))
                Dim objArgs As CAPTCHA.CAPTCHAImage.Args = New CAPTCHA.CAPTCHAImage.Args()
                Session.Add(CAPTCHA.CAPTCHAImage.Args.SessionID, objArgs)
            End If
        Else
            ' If we've reached this point, we shouldn't be here
            ' Instead, we should be on the 1st page of the form
            Server.Transfer("AdoptThisKitty.aspx")
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
        If DropDownListDeclaw.SelectedItem.Text = "Yes" Then
            PanelDeclaw.Visible = True
        Else
            PanelDeclaw.Visible = False
        End If

        If DropDownListOwnAPetNow.SelectedItem.Text = "Yes" Then
            PanelBreedsOwned.Visible = True
        Else
            PanelBreedsOwned.Visible = False
        End If

        If DropDownListPastPets.SelectedItem.Text = "Yes" Then
            PanelOtherPetsInPast.Visible = True
        Else
            PanelOtherPetsInPast.Visible = False
        End If

        If DropDownListSurrendered.SelectedItem.Text = "Yes" Then
            PanelExplainSurrender.Visible = True
        Else
            PanelExplainSurrender.Visible = False
        End If
    End Sub

    Protected Sub ButtonNextPage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonNextPage.Click
        If Page.IsValid Then
            Dim oForm As AdoptionForm = Session("AdoptionForm")
            With oForm
                If DropDownListDeclaw.SelectedItem.Text = "Yes" Then
                    .Declaw = True
                    .ExplainDeclaw = Server.HtmlEncode(TextBoxDeclaw.Text)
                Else
                    .Declaw = False
                End If
                .WhereWillTheCatSleep = Server.HtmlEncode(TextBoxWhereWillTheCatSleep.Text)
                .PrimaryCaregiver = Server.HtmlEncode(TextBoxPrimaryCaregiver.Text)
                .EmergencyCare = Server.HtmlEncode(TextBoxEmergencyCare.Text)
                If DropDownListOwnAPetNow.SelectedItem.Text = "Yes" Then
                    .OwnAPetNow = True
                    .BreedsOwned = Server.HtmlEncode(TextBoxBreedsOwned.Text)
                Else
                    .OwnAPetNow = False
                End If
                If DropDownListVaccinationsCurrent.SelectedItem.Text = "Yes" Then
                    .VaccinationsCurrent = True
                Else
                    .VaccinationsCurrent = False
                End If
                .IndoorOutdoorCurrent = DropDownListIndoorOutdoor.SelectedItem.Text
                If DropDownListAllFixed.SelectedItem.Text = "Yes" Then
                    .AllFixed = True
                Else
                    .AllFixed = False
                End If
                If DropDownListPastPets.SelectedItem.Text = "Yes" Then
                    .PastPets = True
                    .OtherPetsInThePast = Server.HtmlEncode(TextBoxOtherPetsInThePast.Text)
                Else
                    .PastPets = False
                End If
                .VetName = Server.HtmlEncode(TextBoxVetName.Text)
                .VetPhone = Server.HtmlEncode(TextBoxVetPhone.Text)
                If DropDownListContactVet.SelectedItem.Text = "Yes" Then
                    .ContactVet = True
                Else
                    .ContactVet = False
                End If
                .TimeToAdjust = Server.HtmlEncode(TextBoxTimeToAdjust.Text)
                .WhatIfYouMove = Server.HtmlEncode(TextBoxWhatIfYouMove.Text)
                .WouldNotKeep = Server.HtmlEncode(TextBoxWouldNotKeep.Text)
                If DropDownListSurrendered.SelectedItem.Text = "Yes" Then
                    .Surrendered = True
                    .ExplainSurrender = Server.HtmlEncode(TextBoxExplainSurrender.Text)
                Else
                    .Surrendered = False
                End If
                If DropDownListProblemBehavior.SelectedItem.Text = "Yes" Then
                    .ProblemBehavior = True
                    .ExplainProblemBehavior = Server.HtmlEncode(TextBoxProblemBehavior.Text)
                Else
                    .ProblemBehavior = False
                End If
                .StopLitterBox = Server.HtmlEncode(TextBoxStopLitterBox.Text)
                .Reference1Name = Server.HtmlEncode(TextBoxReferenceName1.Text)
                .Reference1Phone = Server.HtmlEncode(TextBoxReferencePhone1.Text)
                .Reference1Relationship = Server.HtmlEncode(TextBoxReferenceRelationship1.Text)
                .Reference2Name = Server.HtmlEncode(TextBoxReferenceName2.Text)
                .Reference2Phone = Server.HtmlEncode(TextBoxReferencePhone2.Text)
                .Reference2Relationship = Server.HtmlEncode(TextBoxReferenceRelationship2.Text)
                .Reference3Name = Server.HtmlEncode(TextBoxReferenceName3.Text)
                .Reference3Phone = Server.HtmlEncode(TextBoxReferencePhone3.Text)
                .Reference3Relationship = Server.HtmlEncode(TextBoxReferenceRelationship3.Text)
                .SendEmail()
                Session("ThankYouPage") = "adoption application"
                Server.Transfer("Thanks.aspx")
            End With
        End If
    End Sub
End Class
