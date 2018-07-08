Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail

Public Class AdoptionForm
    Private _UID As Integer
    Private _userName As String
    Private _posterEmail As String
    Private _catName As String
    Private _catBirthday As Date
    Private _catCity As String
    Private _catState As String
    Private _yourName As String
    Private _yourEmail As String
    Private _otherNames As String
    Private _homePhone As String
    Private _workPhone As String
    Private _adultsInHome As Integer
    Private _childrenInHome As Integer
    Private _childrenAges As String
    Private _allergic As Boolean
    Private _whoIsAllergic As String
    Private _allergicToWhat As String
    Private _occupations As String
    Private _streetAddress1 As String
    Private _streetAddress2 As String
    Private _streetCity As String
    Private _streetState As String
    Private _streetZip As String
    Private _isMailingDifferent As Boolean
    Private _mailingAddress1 As String
    Private _mailingAddress2 As String
    Private _mailingCity As String
    Private _mailingState As String
    Private _mailingZip As String
    Private _dwellingType As String
    Private _homeOwnership As String
    Private _landlordName As String
    Private _landlordPhone As String
    Private _adoptionReason As String
    Private _indoorOutdoor As String
    Private _hoursAlone As Integer
    Private _whereDuringWork As String

    Private _declaw As Boolean
    Private _declawExplain As String
    Private _whereWillTheCatSleep As String
    Private _primaryCaregiver As String
    Private _emergencyCare As String
    Private _ownAPetNow As Boolean
    Private _breedsOwned As String
    Private _vaccinationsCurrent As Boolean
    Private _indoorOutdoorCurrent As String
    Private _allFixed As Boolean
    Private _pastPets As Boolean
    Private _otherPetsInThePast As String
    Private _vetName As String
    Private _vetPhone As String
    Private _contactVet As Boolean
    Private _timeToAdjust As String
    Private _whatIfYouMove As String
    Private _wouldNotKeep As String
    Private _surrendered As Boolean
    Private _explainSurrender As String
    Private _problemBehavior As Boolean
    Private _explainProblemBehavior As String
    Private _stopLitterBox As String
    Private _referenceName1 As String
    Private _referencePhone1 As String
    Private _referenceRelationship1 As String
    Private _referenceName2 As String
    Private _referencePhone2 As String
    Private _referenceRelationship2 As String
    Private _referenceName3 As String
    Private _referencePhone3 As String
    Private _referenceRelationship3 As String

    Public Property UserName() As String
        Get
            Return _userName
        End Get
        Set(ByVal value As String)
            _userName = value
        End Set
    End Property

    Public Property PosterEmail() As String
        Get
            Return _posterEmail
        End Get
        Set(ByVal value As String)
            _posterEmail = value
        End Set
    End Property

    Public Property CatName() As String
        Get
            Return _catName
        End Get
        Set(ByVal value As String)
            _catName = value
        End Set
    End Property

    Public Property YourName() As String
        Get
            Return _yourName
        End Get
        Set(ByVal value As String)
            _yourName = value
        End Set
    End Property

    Public Property YourEmail() As String
        Get
            Return _yourEmail
        End Get
        Set(ByVal value As String)
            _yourEmail = value
        End Set
    End Property

    Public Property OtherNames() As String
        Get
            Return _otherNames
        End Get
        Set(ByVal value As String)
            _otherNames = value
        End Set
    End Property

    Public Property HomePhone() As String
        Get
            Return _homePhone
        End Get
        Set(ByVal value As String)
            _homePhone = value
        End Set
    End Property

    Public Property WorkPhone() As String
        Get
            Return _workPhone
        End Get
        Set(ByVal value As String)
            _workPhone = value
        End Set
    End Property

    Public Property AdultsInHome() As Integer
        Get
            Return _adultsInHome
        End Get
        Set(ByVal value As Integer)
            _adultsInHome = value
        End Set
    End Property

    Public Property ChildrenInHome() As Integer
        Get
            Return _childrenInHome
        End Get
        Set(ByVal value As Integer)
            _childrenInHome = value
        End Set
    End Property

    Public Property ChildrenAges() As String
        Get
            Return _childrenAges
        End Get
        Set(ByVal value As String)
            _childrenAges = value
        End Set
    End Property

    Public Property Allergic() As Boolean
        Get
            Return _allergic
        End Get
        Set(ByVal value As Boolean)
            _allergic = value
        End Set
    End Property

    Public Property WhoIsAllergic() As String
        Get
            Return _whoIsAllergic
        End Get
        Set(ByVal value As String)
            _whoIsAllergic = value
        End Set
    End Property

    Public Property AllergicToWhat() As String
        Get
            Return _allergicToWhat
        End Get
        Set(ByVal value As String)
            _allergicToWhat = value
        End Set
    End Property

    Public Property Occupations() As String
        Get
            Return _occupations
        End Get
        Set(ByVal value As String)
            _occupations = value
        End Set
    End Property

    Public Property StreetAddress1() As String
        Get
            Return _streetAddress1
        End Get
        Set(ByVal value As String)
            _streetAddress1 = value
        End Set
    End Property

    Public Property StreetAddress2() As String
        Get
            Return _streetAddress2
        End Get
        Set(ByVal value As String)
            _streetAddress2 = value
        End Set
    End Property

    Public Property StreetCity() As String
        Get
            Return _streetCity
        End Get
        Set(ByVal value As String)
            _streetCity = value
        End Set
    End Property

    Public Property StreetState() As String
        Get
            Return _streetState
        End Get
        Set(ByVal value As String)
            _streetState = value
        End Set
    End Property

    Public Property StreetZip() As String
        Get
            Return _streetZip
        End Get
        Set(ByVal value As String)
            _streetZip = value
        End Set
    End Property

    Public Property IsMailingDifferent() As Boolean
        Get
            Return _isMailingDifferent
        End Get
        Set(ByVal value As Boolean)
            _isMailingDifferent = value
        End Set
    End Property

    Public Property MailingAddress1() As String
        Get
            Return _mailingAddress1
        End Get
        Set(ByVal value As String)
            _mailingAddress1 = value
        End Set
    End Property

    Public Property MailingAddress2() As String
        Get
            Return _mailingAddress2
        End Get
        Set(ByVal value As String)
            _mailingAddress2 = value
        End Set
    End Property

    Public Property MailingCity() As String
        Get
            Return _mailingCity
        End Get
        Set(ByVal value As String)
            _mailingCity = value
        End Set
    End Property

    Public Property MailingState() As String
        Get
            Return _mailingState
        End Get
        Set(ByVal value As String)
            _mailingState = value
        End Set
    End Property

    Public Property MailingZip() As String
        Get
            Return _mailingZip
        End Get
        Set(ByVal value As String)
            _mailingZip = value
        End Set
    End Property

    Public Property DwellingType() As String
        Get
            Return _dwellingType
        End Get
        Set(ByVal value As String)
            _dwellingType = value
        End Set
    End Property

    Public Property HomeOwnership() As String
        Get
            Return _homeOwnership
        End Get
        Set(ByVal value As String)
            _homeOwnership = value
        End Set
    End Property

    Public Property LandlordName() As String
        Get
            Return _landlordName
        End Get
        Set(ByVal value As String)
            _landlordName = value
        End Set
    End Property

    Public Property LandlordPhone() As String
        Get
            Return _landlordPhone
        End Get
        Set(ByVal value As String)
            _landlordPhone = value
        End Set
    End Property

    Public Property AdoptionReason() As String
        Get
            Return _adoptionReason
        End Get
        Set(ByVal value As String)
            _adoptionReason = value
        End Set
    End Property

    Public Property IndoorOutdoor() As String
        Get
            Return _indoorOutdoor
        End Get
        Set(ByVal value As String)
            _indoorOutdoor = value
        End Set
    End Property

    Public Property HoursAlone() As Integer
        Get
            Return _hoursAlone
        End Get
        Set(ByVal value As Integer)
            _hoursAlone = value
        End Set
    End Property

    Public Property WhereDuringWork() As String
        Get
            Return _whereDuringWork
        End Get
        Set(ByVal value As String)
            _whereDuringWork = value
        End Set
    End Property

    Public Property Declaw() As Boolean
        Get
            Return _declaw
        End Get
        Set(ByVal value As Boolean)
            _declaw = value
        End Set
    End Property

    Public Property ExplainDeclaw() As String
        Get
            Return _declawExplain
        End Get
        Set(ByVal value As String)
            _declawExplain = value
        End Set
    End Property

    Public Property WhereWillTheCatSleep() As String
        Get
            Return _whereWillTheCatSleep
        End Get
        Set(ByVal value As String)
            _whereWillTheCatSleep = value
        End Set
    End Property

    Public Property PrimaryCaregiver() As String
        Get
            Return _primaryCaregiver
        End Get
        Set(ByVal value As String)
            _primaryCaregiver = value
        End Set
    End Property

    Public Property EmergencyCare() As String
        Get
            Return _emergencyCare
        End Get
        Set(ByVal value As String)
            _emergencyCare = value
        End Set
    End Property

    Public Property OwnAPetNow() As Boolean
        Get
            Return _ownAPetNow
        End Get
        Set(ByVal value As Boolean)
            _ownAPetNow = value
        End Set
    End Property

    Public Property BreedsOwned() As String
        Get
            Return _breedsOwned
        End Get
        Set(ByVal value As String)
            _breedsOwned = value
        End Set
    End Property

    Public Property VaccinationsCurrent() As Boolean
        Get
            Return _vaccinationsCurrent
        End Get
        Set(ByVal value As Boolean)
            _vaccinationsCurrent = value
        End Set
    End Property

    Public Property IndoorOutdoorCurrent() As String
        Get
            Return _indoorOutdoorCurrent
        End Get
        Set(ByVal value As String)
            _indoorOutdoorCurrent = value
        End Set
    End Property

    Public Property AllFixed() As Boolean
        Get
            Return _allFixed
        End Get
        Set(ByVal value As Boolean)
            _allFixed = VaccinationsCurrent
        End Set
    End Property

    Public Property PastPets() As Boolean
        Get
            Return _pastPets
        End Get
        Set(ByVal value As Boolean)
            _pastPets = value
        End Set
    End Property

    Public Property OtherPetsInThePast() As String
        Get
            Return _otherPetsInThePast
        End Get
        Set(ByVal value As String)
            _otherPetsInThePast = value
        End Set
    End Property

    Public Property VetName() As String
        Get
            Return _vetName
        End Get
        Set(ByVal value As String)
            _vetName = value
        End Set
    End Property

    Public Property VetPhone() As String
        Get
            Return _vetPhone
        End Get
        Set(ByVal value As String)
            _vetPhone = value
        End Set
    End Property

    Public Property ContactVet() As Boolean
        Get
            Return _contactVet
        End Get
        Set(ByVal value As Boolean)
            _contactVet = value
        End Set
    End Property

    Public Property TimeToAdjust() As String
        Get
            Return _timeToAdjust
        End Get
        Set(ByVal value As String)
            _timeToAdjust = value
        End Set
    End Property

    Public Property WhatIfYouMove() As String
        Get
            Return _whatIfYouMove
        End Get
        Set(ByVal value As String)
            _whatIfYouMove = value
        End Set
    End Property

    Public Property WouldNotKeep() As String
        Get
            Return _wouldNotKeep
        End Get
        Set(ByVal value As String)
            _wouldNotKeep = value
        End Set
    End Property

    Public Property Surrendered() As Boolean
        Get
            Return _surrendered
        End Get
        Set(ByVal value As Boolean)
            _surrendered = value
        End Set
    End Property

    Public Property ExplainSurrender() As String
        Get
            Return _explainSurrender
        End Get
        Set(ByVal value As String)
            _explainSurrender = value
        End Set
    End Property

    Public Property ProblemBehavior() As Boolean
        Get
            Return _problemBehavior
        End Get
        Set(ByVal value As Boolean)
            _problemBehavior = value
        End Set
    End Property

    Public Property ExplainProblemBehavior() As String
        Get
            Return _explainProblemBehavior
        End Get
        Set(ByVal value As String)
            _explainProblemBehavior = value
        End Set
    End Property

    Public Property StopLitterBox() As String
        Get
            Return _stopLitterBox
        End Get
        Set(ByVal value As String)
            _stopLitterBox = value
        End Set
    End Property

    Public Property Reference1Name() As String
        Get
            Return _referenceName1
        End Get
        Set(ByVal value As String)
            _referenceName1 = value
        End Set
    End Property

    Public Property Reference1Phone() As String
        Get
            Return _referencePhone1
        End Get
        Set(ByVal value As String)
            _referencePhone1 = value
        End Set
    End Property

    Public Property Reference1Relationship() As String
        Get
            Return _referenceRelationship1
        End Get
        Set(ByVal value As String)
            _referenceRelationship1 = value
        End Set
    End Property

    Public Property Reference2Name() As String
        Get
            Return _referenceName2
        End Get
        Set(ByVal value As String)
            _referenceName2 = value
        End Set
    End Property

    Public Property Reference2Phone() As String
        Get
            Return _referencePhone2
        End Get
        Set(ByVal value As String)
            _referencePhone2 = value
        End Set
    End Property

    Public Property Reference2Relationship() As String
        Get
            Return _referenceRelationship2
        End Get
        Set(ByVal value As String)
            _referenceRelationship2 = value
        End Set
    End Property

    Public Property Reference3Name() As String
        Get
            Return _referenceName3
        End Get
        Set(ByVal value As String)
            _referenceName3 = value
        End Set
    End Property

    Public Property Reference3Phone() As String
        Get
            Return _referencePhone3
        End Get
        Set(ByVal value As String)
            _referencePhone3 = value
        End Set
    End Property

    Public Property Reference3Relationship() As String
        Get
            Return _referenceRelationship3
        End Get
        Set(ByVal value As String)
            _referenceRelationship3 = value
        End Set
    End Property

    Public Sub New(ByVal iUID As Integer)
        _UID = iUID
        GetUserName(iUID)

        Dim MemUser As MembershipUser = Membership.GetUser(_userName)
        If Not MemUser Is Nothing Then
            _posterEmail = MemUser.Email
        End If
    End Sub

    Private Sub GetUserName(ByVal iUID As Integer)
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "SELECT [UserName], [CatName], [CatBirthday], [CatCity], [CatState] FROM DBO.CHKC_ADOPTIONS WHERE UID=@UID"

            Dim pUID As SqlParameter = .Parameters.Add("@UID", Data.SqlDbType.Int)
            pUID.Value = iUID
            pUID.Direction = Data.ParameterDirection.Input
        End With

        Try
            conn.Open()
            Dim rdr As SqlDataReader = cmd.ExecuteReader
            Do While rdr.Read
                _userName = CStr(rdr.GetValue(0))
                _catName = CStr(rdr.GetValue(1))
                _catBirthday = CDate(rdr.GetValue(2))
                _catCity = CStr(rdr.GetValue(3))
                _catState = CStr(rdr.GetValue(4))
            Loop
            conn.Close()
        Finally
            If Not conn Is Nothing Then
                conn.Close()
            End If
        End Try
    End Sub

    Public Sub SendEmail()
        Dim sFrom As String = _yourEmail
        Dim sTo As String = _posterEmail
        Dim sSubject As String = "[ch kitty club] Adoption application for " + _
            _catName

        Dim sBody As New StringBuilder
        With sBody
            .Append("The following application for adopting ")
            .Append(_catName)
            .Append(" has been submitted through the CH Kitty Club website.")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Please read it, decide whether you think it will be a good home for ")
            .Append(_catName)
            .Append(".  Make sure to do the research, including calling references, landlord if appropriate, and especially their veterinarian.")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Please get in touch with the applicant either way to let them know whether or not they are going to be adopting.")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("If this applicant ends up adopting ")
            .Append(_catName)
            .Append(", please let us know, too, so we can take ")
            .Append(_catName)
            .Append(" out of the adoption system on our website.")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("********** ********** ADOPTION APPLICATION INFORMATION ********** **********")
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Kitty Available For Adoption: ")
            .Append(_catName)
            .Append(vbCrLf)
            .Append("Birthday:  ")
            .Append(_catBirthday.ToShortDateString)
            .Append(vbCrLf)
            .Append("Location:  ")
            .Append(_catCity)
            .Append(", ")
            .Append(_catState)
            .Append(vbCrLf)
            .Append(vbCrLf)

            ' NAMES & CONTACT INFO
            .Append("Name:  ")
            .Append(_yourName)
            .Append(vbCrLf)
            .Append("Spouse/Roomate(s) Name(s):  ")
            .Append(_otherNames)
            .Append(vbCrLf)
            .Append("Home Phone:  ")
            .Append(_homePhone)
            .Append(vbCrLf)
            .Append("Work Phone:  ")
            .Append(_workPhone)
            .Append(vbCrLf)
            .Append("Email:  ")
            .Append(_yourEmail)
            .Append(vbCrLf)
            .Append(vbCrLf)

            ' ADULTS/CHILDREN IN HOME
            .Append("Adults In Home:  ")
            .Append(CStr(_adultsInHome))
            .Append(vbCrLf)
            .Append("Children In Home:  ")
            .Append(CStr(_childrenInHome))
            .Append(vbCrLf)
            .Append("Children's Ages:  ")
            .Append(_childrenAges)
            .Append(vbCrLf)
            .Append(vbCrLf)

            ' ALLERGIC
            If _allergic = False Then
                .Append("No one in the house is allergic to animals.")
            Else
                .Append("Who is allergic to animals?  ")
                .Append(_whoIsAllergic)
                .Append(vbCrLf)
                .Append("What are they allergic to?  ")
                .Append(_allergicToWhat)
            End If
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Occupations:  ")
            .Append(_occupations)
            .Append(vbCrLf)
            .Append(vbCrLf)

            ' STREET ADDRESS
            .Append("Street Address:")
            .Append(vbCrLf)
            .Append(_streetAddress1)
            .Append(vbCrLf)
            If _streetAddress2 <> "" Then
                .Append(_streetAddress2)
                .Append(vbCrLf)
            End If
            .Append(_streetCity)
            .Append(", ")
            .Append(_streetState)
            .Append("  ")
            .Append(_streetZip)
            .Append(vbCrLf)
            .Append(vbCrLf)

            ' MAILING ADDRESS
            If _isMailingDifferent Then
                .Append("Mailing Address:")
                .Append(vbCrLf)
                .Append(_mailingAddress1)
                .Append(vbCrLf)
                If _mailingAddress2 <> "" Then
                    .Append(_mailingAddress2)
                    .Append(vbCrLf)
                End If
                .Append(_mailingCity)
                .Append(", ")
                .Append(_mailingState)
                .Append("  ")
                .Append(_mailingZip)
                .Append(vbCrLf)
                .Append(vbCrLf)
            End If

            .Append("Type of Dwelling:  ")
            .Append(_dwellingType)
            .Append(vbCrLf)
            .Append(vbCrLf)

            ' HOME OWNERSHIP
            .Append("Home Ownership:  ")
            .Append(_homeOwnership)
            .Append(vbCrLf)
            If _homeOwnership = "Rent your home" Then
                .Append("Landlord's Name:  ")
                .Append(_landlordName)
                .Append(vbCrLf)
                .Append("Landlord's Phone:  ")
                .Append(_landlordPhone)
                .Append(vbCrLf)
            End If
            .Append(vbCrLf)

            .Append("Primary reason for adopting:  ")
            .Append(_adoptionReason)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Looking for a cat that lives:  ")
            .Append(_indoorOutdoor)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Hours the cat will be home alone:  ")
            .Append(CStr(_hoursAlone))
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Where will the cat be while you are at work?  ")
            .Append(_whereDuringWork)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Do you want to declaw the cat?  ")
            .Append(CStr(_declaw))
            .Append(vbCrLf)
            If _declaw Then
                .Append(_declawExplain)
                .Append(vbCrLf)
            End If
            .Append(vbCrLf)

            .Append("Where will the cat sleep at night?  ")
            .Append(_whereWillTheCatSleep)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Who will be the cat's primary caretaker?  ")
            .Append(_primaryCaregiver)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Who will care for the cat in an emergency or during vacations?  ")
            .Append(_emergencyCare)
            .Append(vbCrLf)
            .Append(vbCrLf)

            If _ownAPetNow Then
                .Append("Pets owned now:  ")
                .Append(vbCrLf)
                .Append(_breedsOwned)
            Else
                .Append("I do not currently own any pets.")
            End If
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Up to date on vaccinations?  ")
            .Append(CStr(_vaccinationsCurrent))
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Cats currently in the household are:  ")
            .Append(_indoorOutdoorCurrent)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("All current pets are spayed or neutered?  ")
            .Append(CStr(_allFixed))
            .Append(vbCrLf)
            .Append(vbCrLf)

            If _pastPets Then
                .Append("I have owned other pets in the past:  ")
                .Append(_otherPetsInThePast)
            Else
                .Append("I haven't owned any other pets in the past.")
            End If
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Veterinarian's name:  ")
            .Append(_vetName)
            .Append(vbCrLf)
            .Append("Veterinarian's phone:  ")
            .Append(_vetPhone)
            .Append(vbCrLf)
            .Append("May contact about this application:  ")
            .Append(CStr(_contactVet))
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("How much time are you willing to spend helping this cat adjust to your home and lifestyle?  ")
            .Append(_timeToAdjust)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("What will you do with the cat if you have to move?  ")
            .Append(_whatIfYouMove)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("Under what circumstances would you not keep this cat?  ")
            .Append(_wouldNotKeep)
            .Append(vbCrLf)
            .Append(vbCrLf)

            If _surrendered Then
                .Append("I have given away a pet or surrendered a pet to a shelter.")
                .Append(vbCrLf)
                .Append("Reason:  ")
                .Append(_explainSurrender)
            Else
                .Append("I have never given away a pet or surrendered a pet to a shelter.")
            End If
            .Append(vbCrLf)
            .Append(vbCrLf)

            If _problemBehavior Then
                .Append("I have knowledge and experience with problem behavior in cats.")
                .Append(_explainProblemBehavior)
            Else
                .Append("I have no knowledge or experience with problem behavior in cats.")
            End If
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("What would you do if your cat stopped using the litterbox?  ")
            .Append(_stopLitterBox)
            .Append(vbCrLf)
            .Append(vbCrLf)

            .Append("References:")
            .Append(vbCrLf)
            .Append("Name:  ")
            .Append(_referenceName1)
            .Append(vbCrLf)
            .Append("Phone:  ")
            .Append(_referencePhone1)
            .Append(vbCrLf)
            .Append("Relationship:  ")
            .Append(_referenceRelationship1)
            .Append(vbCrLf)
            .Append(vbCrLf)
            .Append("Name:  ")
            .Append(_referenceName2)
            .Append(vbCrLf)
            .Append("Phone:  ")
            .Append(_referencePhone2)
            .Append(vbCrLf)
            .Append("Relationship:  ")
            .Append(_referenceRelationship2)
            .Append(vbCrLf)
            .Append(vbCrLf)
            If _referenceName3 <> "" Then
                .Append("Name:  ")
                .Append(_referenceName3)
                .Append(vbCrLf)
                .Append("Phone:  ")
                .Append(_referencePhone3)
                .Append(vbCrLf)
                .Append("Relationship:  ")
                .Append(_referenceRelationship3)
                .Append(vbCrLf)
                .Append(vbCrLf)
            End If
            .Append("********** ********** END ADOPTION APPLICATION INFORMATION ********** **********")
        End With

        Dim msg As New MailMessage(sFrom, sTo, sSubject, sBody.ToString)
        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)
        IncrementApplicationCounter()

    End Sub

    Private Sub IncrementApplicationCounter()
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CHKittyClub").ToString)
        Dim cmd As New SqlCommand
        With cmd
            .Connection = conn
            .CommandType = Data.CommandType.Text
            .CommandText = "UPDATE DBO.CHKC_ADOPTIONS SET [ApplicationCount] = [ApplicationCount] + 1 WHERE [UID] = @UID"

            Dim pUID As SqlParameter = .Parameters.Add("@UID", Data.SqlDbType.Int)
            pUID.Value = _UID
            pUID.Direction = Data.ParameterDirection.Input
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
End Class
