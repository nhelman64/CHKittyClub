<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AdoptThisKitty2.aspx.vb" Inherits="AdoptThisKitty2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Adopt This Kitty</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="content">
        <div class="post">
            <h2>
                Adoption Application For
                <asp:Label ID="LabelCatName" runat="server" Text="{kitty name}"></asp:Label></h2>
            <p>
                Page 2 of 2</p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <div class="entry">
                <div style="margin-bottom:5px">
                    <span style="margin-right:14px">Do you plan to declaw the cat? </span>
                    <asp:DropDownList ID="DropDownListDeclaw" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </div>
                <asp:UpdatePanel ID="UpdatePanelDeclaw" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="PanelDeclaw" runat="server">
                            <div style="margin-bottom:5px">
                                <span style="color:red;margin-right:150px">Why? </span>
                                <asp:TextBox ID="TextBoxDeclaw" runat="server" Width="315px"></asp:TextBox>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownListDeclaw" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    Where will the cat sleep at night? 
                    <asp:TextBox ID="TextBoxWhereWillTheCatSleep" runat="server" Width="315px"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    Who will be the cat's primary caretaker? (vet visits, litter duty, etc):<br />
                    <asp:TextBox ID="TextBoxPrimaryCaregiver" runat="server" Width="498px"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    Who will care for the cat in an emergency or during vacations?<br />
                    <asp:TextBox ID="TextBoxEmergencyCare" runat="server" Width="498px"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:54px">Do you own a pet now?</span>
                    <asp:DropDownList ID="DropDownListOwnAPetNow" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </div>
                <asp:UpdatePanel ID="UpdatePanelBreedsOwned" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="PanelBreedsOwned" runat="server">
                            <div style="margin-bottom:5px">
                                <span style="color:red;margin-right:14px">Please list species/breed/age:</span>
                                <asp:TextBox ID="TextBoxBreedsOwned" runat="server" Width="315px"></asp:TextBox>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownListOwnAPetNow" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    Are your current pets up-to-date<br />
                    <span style="margin-right:62px">on their vaccinations? </span>
                    <asp:DropDownList ID="DropDownListVaccinationsCurrent" runat="server">
                    </asp:DropDownList>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:13px">Are cats in the household now:</span>
                    <asp:DropDownList ID="DropDownListIndoorOutdoor" runat="server">
                    </asp:DropDownList>
                </div>
                <div style="margin-bottom:5px">
                    Are current pets all<br />
                    <span style="margin-right:67px">spayed or neutered?</span>
                    <asp:DropDownList ID="DropDownListAllFixed" runat="server">
                    </asp:DropDownList>
                </div>
                <div style="margin-bottom:5px">
                    Have you had<br />
                    <span style="margin-right:58px">other pets in the past?</span>
                    <asp:DropDownList ID="DropDownListPastPets" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </div>
                <asp:UpdatePanel ID="UpdatePanelOtherPetsInPast" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelOtherPetsInPast" runat="server">
                            <div style="margin-bottom:5px">
                                <span style="color:red">Please list species/breed and how long you had them:</span><br />
                                <asp:TextBox ID="TextBoxOtherPetsInThePast" runat="server" Rows="3" 
                                    TextMode="MultiLine" Width="498px"></asp:TextBox>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    <span style="margin-right:66px">Veterinarian's name:</span>
                    <asp:TextBox ID="TextBoxVetName" runat="server"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:17px">Veterinarian's phone number:</span>
                    <asp:TextBox ID="TextBoxVetPhone" runat="server"></asp:TextBox>
                    &nbsp; 999-999-9999
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="TextBoxVetPhone" Display="Dynamic" 
                        ErrorMessage="Please enter a properly formatted phone number (xxx) xxx-xxxx" 
                        ToolTip="Please enter a properly formatted phone number (xxx) xxx-xxxx" 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Please enter a properly formatted phone number (999) 999-9999</asp:RegularExpressionValidator>
                </div>
                <div style="margin-bottom:5px">
                    May we contact your veterinarian<br />
                    <span style="margin-right:32px">regarding this application?</span>
                    <asp:DropDownList ID="DropDownListContactVet" runat="server">
                    </asp:DropDownList>
                </div>
                <div style="margin-bottom:5px">
                    How much time are you willing to spend helping this cat adjust to your home and lifestyle?<br />
                    <asp:TextBox ID="TextBoxTimeToAdjust" runat="server" TextMode="MultiLine" 
                        Rows="3" Width="498px"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    What will you do with the cat if you have to move?<br />
                    <asp:TextBox ID="TextBoxWhatIfYouMove" runat="server" TextMode="MultiLine" 
                        Rows="3" Width="498px"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    Under what circumstances would you not keep this cat?<br />
                    <asp:TextBox ID="TextBoxWouldNotKeep" runat="server" TextMode="MultiLine" 
                        Rows="3" Width="498px"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    Have you ever given away a pet or<br />
                    <span style="margin-right:13px">surrendered a pet to a shelter?</span>
                    <asp:DropDownList ID="DropDownListSurrendered" runat="server" 
                        AutoPostBack="True">
                    </asp:DropDownList>
                </div>
                <asp:UpdatePanel ID="UpdatePanelExplainSurrender" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelExplainSurrender" runat="server">
                            <div style="margin-bottom:5px">
                                <span style="color:red;margin-right:73px">Please explain why: </span>
                                <asp:TextBox ID="TextBoxExplainSurrender" runat="server" Width="306px"></asp:TextBox>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownListSurrendered" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    Do you have knowledge and experience<br />
                    <span style="margin-right:8px">with behavior problems in cats?</span>
                    <asp:DropDownList ID="DropDownListProblemBehavior" runat="server" 
                        AutoPostBack="True">
                    </asp:DropDownList>
                </div>
                <asp:UpdatePanel ID="UpdatePanelProblemBehavior" runat="server" 
                    UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="PanelProblemBehavior" runat="server">
                            <div style="margin-bottom:5px">
                                <span style="color:red;margin-right:97px">Please explain: </span>
                                <asp:TextBox ID="TextBoxProblemBehavior" runat="server" Width="315px"></asp:TextBox>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownListProblemBehavior" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    What would you do if this cat stopped using the litterbox?<br />
                    <asp:TextBox ID="TextBoxStopLitterBox" runat="server" TextMode="MultiLine" 
                        Rows="3" Width="498px"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    Please provide 3 references who can attest to your suitability as a pet owner: <br />
                    <span style="margin-right:75px">Reference 1 Name:</span>
                    <asp:TextBox ID="TextBoxReferenceName1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBoxReferenceName1" Display="Dynamic" 
                        ErrorMessage="Reference 1 name is required." 
                        ToolTip="Reference 1 name is required.">*</asp:RequiredFieldValidator>
                    <br />
                    <span style="margin-right:73px">Reference 1 Phone:</span>
                    <asp:TextBox ID="TextBoxReferencePhone1" runat="server"></asp:TextBox>
                    &nbsp; 999-999-9999<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBoxReferencePhone1" Display="Dynamic" 
                        ErrorMessage="Reference 1 phone is required." 
                        ToolTip="Reference 1 phone is required.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBoxReferencePhone1" Display="Dynamic" 
                        ErrorMessage="Reference phone is required." 
                        ToolTip="Reference phone is required." 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                    <br />
                    <span style="margin-right:42px">Reference 1 Relationship</span>
                    <asp:TextBox ID="TextBoxReferenceRelationship1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBoxReferenceRelationship1" Display="Dynamic" 
                        ErrorMessage="Reference 1 relationship is required." 
                        ToolTip="Reference 1 relationship is required.">*</asp:RequiredFieldValidator>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:75px">Reference 2 Name:</span>
                    <asp:TextBox ID="TextBoxReferenceName2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBoxReferenceName2" Display="Dynamic" 
                        ErrorMessage="Reference 2 name is required." 
                        ToolTip="Reference 2 name is required.">*</asp:RequiredFieldValidator>
                    <br />
                    <span style="margin-right:73px">Reference 2 Phone:</span>
                    <asp:TextBox ID="TextBoxReferencePhone2" runat="server"></asp:TextBox>
                    &nbsp; 999-999-9999<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBoxReferencePhone2" Display="Dynamic" 
                        ErrorMessage="Reference 2 phone is required." 
                        ToolTip="Reference 2 phone is required.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBoxReferencePhone2" Display="Dynamic" 
                        ErrorMessage="Reference phone is required." 
                        ToolTip="Reference phone is required." 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                    <br />
                    <span style="margin-right:42px">Reference 2 Relationship</span>
                    <asp:TextBox ID="TextBoxReferenceRelationship2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBoxReferenceRelationship2" Display="Dynamic" 
                        ErrorMessage="Reference 2 relationship is required." 
                        ToolTip="Reference 2 relationship is required.">*</asp:RequiredFieldValidator>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:75px">Reference 3 Name:</span>
                    <asp:TextBox ID="TextBoxReferenceName3" runat="server"></asp:TextBox><br />
                    <span style="margin-right:73px">Reference 3 Phone:</span>
                    <asp:TextBox ID="TextBoxReferencePhone3" runat="server"></asp:TextBox>
                    &nbsp; 999-999-9999<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                        ControlToValidate="TextBoxReferencePhone3" Display="Dynamic" 
                        ErrorMessage="Reference phone is required." 
                        ToolTip="Reference phone is required." 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                    <br />
                    <span style="margin-right:42px">Reference 3 Relationship</span>
                    <asp:TextBox ID="TextBoxReferenceRelationship3" runat="server"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    <br />
                    I certify that the above is true and correct and understand that 
                    misrepresentations will result in the nullification of this adoption. 
                    Submitting this application constitutes the equivalent of your giving 
                    your electronic signature on this application.
                </div>
                <p style="text-align:center"><asp:Image ID="ImageCAPTCHA" runat="server" ImageUrl="CAPTCHAImage.aspx" /><br />
                <asp:TextBox ID="TextBoxValidate" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidatorCAPTCHA" runat="server" 
                    ControlToValidate="TextBoxValidate" ErrorMessage="Validation error">*</asp:CustomValidator>
                <asp:RequiredFieldValidator ID="rfvTextBoxCAPTCHA" runat="server" 
                    ControlToValidate="TextBoxValidate" ErrorMessage="The field is required">*</asp:RequiredFieldValidator></p>
                <p style="text-align:center"><asp:Button ID="ButtonNextPage" runat="server" 
                    Text="Submit This Adoption Application" Width="321px" /></p>
            </div><!-- end entry -->
        </div><!-- end post -->
    </div><!-- end content -->
</asp:Content>

