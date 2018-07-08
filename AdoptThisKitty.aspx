<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="AdoptThisKitty.aspx.vb" Inherits="AdoptThisKitty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>CH Kitty Club - Adopt This Kitty</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="contents">
        <div class="post">
            <h2>
                Adoption Application For
                <asp:Label ID="LabelCatName" runat="server" Text="{kitty name}"></asp:Label></h2>
            <p>
                Page 1 of 2</p>
            <div class="entry">
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:164px">Your Name:</span><asp:TextBox ID="TextBoxName" runat="server" Width="315px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBoxName" Display="Dynamic" 
                            ErrorMessage="Name is a required field." ToolTip="Name is a required field.">*</asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:51px">Spouse/Roommate(s) Name(s):</span><asp:TextBox ID="TextBoxOtherNames" runat="server" Width="315px"></asp:TextBox><br />
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:153px">Home Phone:</span><asp:TextBox ID="TextBoxHomePhone" runat="server"></asp:TextBox> &nbsp; 
                        999-999-9999
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBoxHomePhone" Display="Dynamic" 
                            ErrorMessage="Your home phone number is required." 
                            ToolTip="Your home phone number is required.">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBoxHomePhone" Display="Dynamic" 
                            ErrorMessage="Please enter a properly formatted phone number (xxx) xxx-xxxx" 
                            ToolTip="Please enter a properly formatted phone number (xxx) xxx-xxxx" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Please enter a properly formatted phone number (999) 999-9999</asp:RegularExpressionValidator>
                        <br />
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:159px">Work Phone:</span><asp:TextBox ID="TextBoxWorkPhone" runat="server"></asp:TextBox>&nbsp; 999-999-9999
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                            ControlToValidate="TextBoxWorkPhone" Display="Dynamic" 
                            ErrorMessage="Please enter a properly formatted phone number (xxx) xxx-xxxx" 
                            ToolTip="Please enter a properly formatted phone number (xxx) xxx-xxxx" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Please enter a properly formatted phone number (999) 999-9999</asp:RegularExpressionValidator>
                        <br />
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:145px">Email Address:</span><asp:TextBox ID="TextBoxEmailAddress" runat="server" Width="315px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBoxEmailAddress" Display="Dynamic" 
                            ErrorMessage="Email is required." ToolTip="Email is required.">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBoxEmailAddress" Display="Dynamic" 
                            ErrorMessage="A valid email format is required." 
                            ToolTip="A valid email format is required." 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">A valid email format is required.</asp:RegularExpressionValidator>
                        <br />
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:80px">Number of people in home:</span><span style="margin-right:83px">Adults</span>
                        <asp:TextBox ID="TextBoxAdultsInHome" runat="server" Width="44px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="TextBoxAdultsInHome" Display="Dynamic" 
                            ErrorMessage="Adults In Home is required." 
                            ToolTip="Adults In Home is required.">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ControlToValidate="TextBoxAdultsInHome" Display="Dynamic" 
                            ErrorMessage="Adults In Home can only be numbers." 
                            ToolTip="Adults In Home can only be numbers." ValidationExpression="^\d{1,2}$">*</asp:RegularExpressionValidator>
                            &nbsp;<br />
                        <span style="margin-right:225px">&nbsp;</span><span style="margin-right:72px">Children</span> 
                        <asp:TextBox ID="TextBoxChildrenInHome" runat="server" Width="44px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
                            runat="server" ControlToValidate="TextBoxChildrenInHome" Display="Dynamic" 
                            ErrorMessage="Children In Home can only be numbers." 
                            ToolTip="Children In Home can only be numbers." 
                            ValidationExpression="^\d{1,2}$">*</asp:RegularExpressionValidator>
                            &nbsp;<br />
                        <span style="margin-right:225px">&nbsp;</span><span style="margin-right:35px">Age of Children</span> <asp:TextBox ID="TextBoxChildrenAges" runat="server" Width="42px"></asp:TextBox><br />
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:6px">Anyone in the house allergic to animals?</span><asp:DropDownList ID="DropDownListAllergic" runat="server" Width="55px"
                                AutoPostBack="True">
                            </asp:DropDownList><br />
                    </div>
                    <div style="margin-bottom:5px">
                    <asp:UpdatePanel ID="UpdatePanelAllergies" runat="server" 
                        UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="PanelAllergies" runat="server">
                                <div style="margin-bottom:5px">
                                    <span style="margin-right:200px">
                                        <asp:Label ID="LabelWhoIsAllergic" runat="server" Text="Who:" ForeColor="#FF3300"></asp:Label></span>
                                    <asp:TextBox ID="TextBoxWhoIsAllergic" runat="server" Width="315px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVWhoIsAllergic" runat="server" 
                                        ControlToValidate="TextBoxWhoIsAllergic" Enabled="False" 
                                        ErrorMessage="Who Is Allergic is required." 
                                        ToolTip="Who Is Allergic is required.">*</asp:RequiredFieldValidator>
                                    <br />
                                </div>
                                <div style="margin-bottom:5px">
                                    <span style="margin-right:143px">
                                        <asp:Label ID="LabelAllergicToWhat" runat="server" Text="Allergic to what:" ForeColor="#FF3300"></asp:Label></span>
                                    <asp:TextBox ID="TextBoxAllergicToWhat" runat="server" Width="315px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVAllergicToWhat" runat="server" 
                                        ControlToValidate="TextBoxAllergicToWhat" Display="Dynamic" Enabled="False" 
                                        ErrorMessage="Allergic To What is required." 
                                        ToolTip="Allergic To What is required.">*</asp:RequiredFieldValidator>
                                    <br />
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownListAllergic" 
                                EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    <span style="margin-right:155px">Occupations:</span><asp:TextBox ID="TextBoxOccupations" runat="server" Rows="3" TextMode="MultiLine"
                                Width="315px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBoxOccupations" Display="Dynamic" 
                        ErrorMessage="Occupation is required." ToolTip="Occupation is required.">*</asp:RequiredFieldValidator>
                    <br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:143px">Street Address:</span><asp:TextBox ID="TextBoxStreetAddress1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBoxStreetAddress1" Display="Dynamic" 
                        ErrorMessage="Street Address is required." 
                        ToolTip="Street Address is required.">*</asp:RequiredFieldValidator>
                    <br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:224px">&nbsp;</span><asp:TextBox ID="TextBoxStreetAddress2" runat="server"></asp:TextBox><br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:204px">City:</span><asp:TextBox ID="TextBoxStreetCity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBoxStreetCity" Display="Dynamic" 
                        ErrorMessage="City (street address) is required." 
                        ToolTip="City (street address) is required.">*</asp:RequiredFieldValidator>
                    <br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:196px">State:</span><asp:DropDownList ID="DropDownListStreetState" runat="server">
                            </asp:DropDownList><br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:206px">Zip:</span><asp:TextBox ID="TextBoxStreetZip" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBoxStreetZip" Display="Dynamic" 
                        ErrorMessage="Zip Code (street address) is required." 
                        ToolTip="Zip Code (street address) is required.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBoxStreetZip" Display="Dynamic" 
                        ErrorMessage="Please enter a Zip Code in the proper format." 
                        ToolTip="Please enter a Zip Code in the proper format." 
                        ValidationExpression="\d{5}(-\d{4})?">Please enter a Zip Code in the proper format.</asp:RegularExpressionValidator>
                    <br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:68px">Is Mailing Address different?</span><asp:CheckBox ID="CheckBoxMailingAddress" runat="server" AutoPostBack="True" Text=" " /><br />
                </div>
                <asp:UpdatePanel ID="UpdatePaneMailingAddress" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="PanelMailingAddress" runat="server" Visible="False">
                            <div style="margin-bottom:5px">
                                <span style="margin-right:135px;color:#FF3300">Mailing Address:</span><asp:TextBox ID="TextBoxMailingAddress1" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVMailingAddress" runat="server" 
                                    ControlToValidate="TextBoxMailingAddress1" Display="Dynamic" 
                                    ErrorMessage="Mailing Address is required." 
                                    ToolTip="Mailing Address is required.">*</asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <div style="margin-bottom:5px">
                                <span style="margin-right:223px;color:#FF3300">&nbsp;</span><asp:TextBox ID="TextBoxMailingAddress2" runat="server"></asp:TextBox><br />
                            </div>
                            <div style="margin-bottom:5px">
                                <span style="margin-right:203px;color:#FF3300">City:</span><asp:TextBox ID="TextBoxMailingCity" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVMailingCity" runat="server" 
                                    ControlToValidate="TextBoxMailingCity" Display="Dynamic" 
                                    ErrorMessage="City (mailing address) is required." 
                                    ToolTip="City (mailing address) is required.">*</asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <div style="margin-bottom:5px">
                                <span style="margin-right:195px;color:#FF3300">State:</span><asp:DropDownList ID="DropDownListMailingState" runat="server">
                                        </asp:DropDownList><br />
                            </div>
                            <div style="margin-bottom:5px">
                                <span style="margin-right:205px;color:#FF3300">Zip:</span><asp:TextBox ID="TextBoxMailingZip" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVMailingZip" runat="server" 
                                    ControlToValidate="TextBoxMailingZip" Display="Dynamic" 
                                    ErrorMessage="Zip Code (mailing address) is required." 
                                    ToolTip="Zip Code (mailing address) is required.">*</asp:RequiredFieldValidator>
                                <br />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="CheckBoxMailingAddress" 
                            EventName="CheckedChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    <span style="margin-right:133px">Type of Dwelling:</span><asp:DropDownList ID="DropDownListDwellingType" runat="server" AutoPostBack="True">
                            </asp:DropDownList><br />
                </div>
                <asp:UpdatePanel ID="UpdatePanelDwellingType" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelDwellingType" runat="server">
                            <div style="margin-bottom:5px">
                                <span style="margin-right:142px;color:#FF3300">Please specify:</span><asp:TextBox 
                                    ID="TextBoxDwellingType" runat="server" Width="315px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVDwelling" runat="server" 
                                    ControlToValidate="TextBoxDwellingType" Display="Dynamic" Enabled="False" 
                                    ErrorMessage="Dwelling is required." ToolTip="Dwelling is required.">*</asp:RequiredFieldValidator>
                                <br />
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownListDwellingType" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    <span style="margin-right:125px">Home Ownership:</span><asp:DropDownList ID="DropDownListHomeOwnership" runat="server" AutoPostBack="True">
                            </asp:DropDownList><br />
                </div>
                <asp:UpdatePanel ID="UpdatePanelHomeOwnership" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="PanelHomeOwnership" runat="server">
                            <div style="margin-bottom:5px">
                                <span style="margin-right:126px;color:#FF3300">Landlord's Name:</span><asp:TextBox 
                                    ID="TextBoxLandlordName" runat="server" Width="315px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVLandlordName" runat="server" 
                                    ControlToValidate="TextBoxLandlordName" Display="Dynamic" Enabled="False" 
                                    ErrorMessage="Landlord's name is required." 
                                    ToolTip="Landlord's name is required.">*</asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <div style="margin-bottom:5px">
                                <span style="margin-right:124px;color:#FF3300">Landlord's Phone:</span><asp:TextBox ID="TextBoxLandlordPhone" runat="server"></asp:TextBox>
                                &nbsp; 999-999-9999<asp:RequiredFieldValidator ID="RFVLandlordPhone" runat="server" 
                                    ControlToValidate="TextBoxLandlordPhone" Display="Dynamic" Enabled="False" 
                                    ErrorMessage="Landlord's phone is required." 
                                    ToolTip="Landlord's phone is required.">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                    ControlToValidate="TextBoxLandlordPhone" Display="Dynamic" 
                                    ErrorMessage="Please enter a properly formatted phone number (xxx) xxx-xxxx" 
                                    ToolTip="Please enter a properly formatted phone number (xxx) xxx-xxxx" 
                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Please enter a properly formatted phone number (999) 999-9999</asp:RegularExpressionValidator>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownListHomeOwnership" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    <span style="margin-right:113px">What is your primary reason<br />for adopting this cat:</span><asp:DropDownList ID="DropDownListAdoptionReason" runat="server" AutoPostBack="True">
                            </asp:DropDownList><br />
                </div>
                <asp:UpdatePanel ID="UpdatePanelAdoptionReason" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="PanelAdoptionReason" runat="server">
                            <div style="margin-bottom:5px">
                                <span style="margin-right:175px;color:#FF3300">Reason:</span><asp:TextBox 
                                    ID="TextBoxAdoptionReason" runat="server" Width="315px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFVAdoptionReason" runat="server" 
                                    ControlToValidate="TextBoxAdoptionReason" Display="Dynamic" Enabled="False" 
                                    ErrorMessage="Adoption reason is required." 
                                    ToolTip="Adoption reason is required.">*</asp:RequiredFieldValidator>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownListAdoptionReason" 
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <div style="margin-bottom:5px">
                    <span style="margin-right:39px">Are you looking for a cat that lives:</span><asp:DropDownList 
                        ID="DropDownListCatThatLives" runat="server" Width="96px" Height="18px">
                        </asp:DropDownList><br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:131px">How many hours a day will the cat<br />be home alone?</span><asp:TextBox ID="TextBoxHoursAlone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVHoursAlone" runat="server" 
                        ControlToValidate="TextBoxHoursAlone" Display="Dynamic" 
                        ErrorMessage="Hours alone is required." ToolTip="Hours alone is required.">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="TextBoxHoursAlone" Display="Dynamic" 
                        ErrorMessage="Enter a number 0 through 24" MaximumValue="24" MinimumValue="0" 
                        ToolTip="Enter a number 0 through 24">*</asp:RangeValidator>
                </div>
                <div style="margin-bottom:10px">
                    <span style="margin-right:174px">Where will the cat be while you are<br />at work?</span><asp:TextBox 
                        ID="TextBoxWhereDuringWork" runat="server" Width="315px"></asp:TextBox>
                </div>
                <p style="text-align:center"><asp:Image ID="ImageCAPTCHA" runat="server" ImageUrl="CAPTCHAImage.aspx" /><br />
                <asp:TextBox ID="TextBoxValidate" runat="server"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidatorCAPTCHA" runat="server" 
                    ControlToValidate="TextBoxValidate" ErrorMessage="Validation error">*</asp:CustomValidator>
                <asp:RequiredFieldValidator ID="rfvTextBoxCAPTCHA" runat="server" 
                    ControlToValidate="TextBoxValidate" ErrorMessage="The field is required">*</asp:RequiredFieldValidator></p>
                <p style="text-align:center"><asp:Button ID="ButtonNextPage" runat="server" 
                    Text="Continue to Next Page of Application" Width="321px" /></p>
            </div><!-- end entry -->
        </div><!-- end post -->
    </div>
    </div><!-- end contents -->
</asp:Content>
