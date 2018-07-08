<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FRCalendar.aspx.vb" Inherits="Donate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CH Kitty Club - Donate to Help Defray Our Costs</title>
    <meta name="keywords" content="ch,cerebellar,hypoplasia,special,needs,cat,kitty,kitties,cats,neurological,brain,damaged,disabilities,club,members,chat,cerebellar hypoplasia" />
    <meta name="description" content="Bringing together owners of cats with neurological and special needs. A place to find out more information to help you help your special kitty." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="content">
        <div class="post">
            <h2>CH Kitty Club Fundraising - Calendars</h2>
            <div class="entry">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                <div style="margin-bottom:5px">
                    <span style="margin-right:50px">Pick a layout:</span>
                    <asp:DropDownList ID="DropDownListOrientation" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="one" Selected="True">I have one portrait photo (taller than it is wide)</asp:ListItem>
                        <asp:ListItem Value="two">I have two landscape photos (wider than they are tall)</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div style="margin-bottom:5px">
                    <span style="margin-right:55px">Pick a color:</span>
                    <asp:DropDownList ID="DropDownListColor" runat="server" AutoPostBack="True">
                        <asp:ListItem Selected="True">Blue</asp:ListItem>
                        <asp:ListItem>Green</asp:ListItem>
                        <asp:ListItem>Yellow</asp:ListItem>
                        <asp:ListItem>Pink</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <br />
                <div style="margin-bottom:5px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <span style="margin-right:120px">&nbsp;</span><asp:HyperLink ID="HyperLinkCalendar" runat="server" NavigateUrl="images/Sample 1Pic Portrait Calendar.pdf" Target="_blank">
                                <asp:Image ID="ImageCalendar" runat="server" ImageUrl="images/CalendarSamplePortraitBlue.jpg" Width="288" Height="233" />
                            </asp:HyperLink>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownListOrientation" 
                                EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="DropDownListColor" 
                                EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:70px">Photo #1:</span><asp:FileUpload ID="FileUpload1" runat="server" />  
                        <asp:RequiredFieldValidator ID="rfvPhoto1" runat="server" 
                        ControlToValidate="FileUpload1" Display="Dynamic" 
                        ErrorMessage="Photo #1 is required." ToolTip="Photo #1 is required.">*</asp:RequiredFieldValidator>
                        &nbsp; Kitty's Name: <asp:TextBox ID="TextBoxName1" runat="server"></asp:TextBox>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:70px">Photo #2:</span><asp:FileUpload ID="FileUpload2" runat="server" />  
                        <asp:RequiredFieldValidator ID="rfvPhoto2" runat="server" 
                        ControlToValidate="FileUpload2" Display="Dynamic" 
                        ErrorMessage="Photo #2 is required." ToolTip="Photo #2 is required." 
                        EnableClientScript="False" Enabled="False">*</asp:RequiredFieldValidator>
                        &nbsp; Kitty's Name: <asp:TextBox ID="TextBoxName2" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    JPEGs only please.&nbsp; We won&#39;t be able to include any other image types when 
                    we create your calendar.<br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:38px">Email Address:</span><asp:TextBox ID="TextBoxEmail"
                        runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="TextBoxEmail" Display="Dynamic" 
                        ErrorMessage="Email is required." ToolTip="Email is required.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBoxEmail" Display="Dynamic" 
                        ErrorMessage="Please use a valid email address." 
                        ToolTip="Please use a valid email address." 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:60px">Your Name</span><asp:TextBox ID="TextBoxMailingName" runat="server" Width="300"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="TextBoxMailingName" Display="Dynamic" 
                        ErrorMessage="Your name is required." ToolTip="Your name is required.">*</asp:RequiredFieldValidator>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:31px">Mailing Address:</span><asp:TextBox 
                        ID="TextBoxMailingAddress1" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBoxMailingAddress1" Display="Dynamic" 
                        ErrorMessage="Mailing Address is required." 
                        ToolTip="Mailing Address is required.">*</asp:RequiredFieldValidator>
                    <br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:119px">&nbsp;</span><asp:TextBox 
                        ID="TextBoxMailingAddress2" runat="server" Width="300px"></asp:TextBox><br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:99px">City:</span><asp:TextBox ID="TextBoxMailingCity" 
                        runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBoxMailingCity" Display="Dynamic" 
                        ErrorMessage="City is required." 
                        ToolTip="City is required.">*</asp:RequiredFieldValidator>
                    <br />
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:91px">State:</span><asp:DropDownList ID="DropDownListMailingState" runat="server">
                            </asp:DropDownList>
                </div>
                <div style="margin-bottom:5px">
                    <span style="margin-right:101px">Zip:</span><asp:TextBox ID="TextBoxMailingZip" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBoxMailingZip" Display="Dynamic" 
                        ErrorMessage="Zip Code is required." 
                        ToolTip="Zip Code is required.">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBoxMailingZip" Display="Dynamic" 
                        ErrorMessage="Please enter a Zip Code in the proper format." 
                        ToolTip="Please enter a Zip Code in the proper format." 
                        ValidationExpression="\d{5}(-\d{4})?">Please enter a Zip Code in the proper format.</asp:RegularExpressionValidator>
                </div>
                <div style="margin-bottom:5px">
                    <br />
                    For non-US orders, please use the Contact Us form to give us your address.&nbsp; 
                    We will need to determine the extra shipping costs, and will contact you with 
                    that information.<br />
                    <br />
                </div>
                <div style="margin-bottom:15px">
            </div>
                        <br /><span style="margin-right:119px">&nbsp;</span><asp:Image ID="Image1" runat="server" ImageUrl="~/CAPTCHAImage.aspx" />
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:119px">&nbsp;</span><asp:TextBox ID="TextBoxValidate" runat="server"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ControlToValidate="TextBoxValidate" ErrorMessage="Validation error">*</asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" 
                        ControlToValidate="TextBoxValidate" ErrorMessage="The field is required">*</asp:RequiredFieldValidator>
                    </div>
                    <div style="margin-bottom:5px">
                        <span style="margin-right:119px">&nbsp;</span><asp:Button ID="ButtonOrder" runat="server" Text="Order Your Calendar" />
                    </div>
                </div>
        </div>        
    </div>
</asp:Content>

