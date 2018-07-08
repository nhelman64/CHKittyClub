<%@ Application Language="VB" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Application("LogChat") = False
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        Dim objErr As Exception = Server.GetLastError().GetBaseException()
        LogError(objErr)
        'SendEmail()
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
    
    Sub LogError(ByRef objErr As Exception)
        Dim logpath As String = Server.MapPath("~/errorlogs/")
        Dim sw As New StreamWriter(logpath + "error_log.txt", True)
        Try
            sw.WriteLine("----------------------------------------------")
            sw.WriteLine(Now.ToString)
            sw.WriteLine("Message:      " + objErr.Message)
            sw.WriteLine("Source:       " + objErr.Source)
            sw.WriteLine("Stack Trace:  " + objErr.StackTrace)
        Finally
            sw.Close()
        End Try
    End Sub
    
    Sub SendEmail()
        Dim sFrom As String = ConfigurationManager.AppSettings("smtpFrom")
        Dim sTo As String = sFrom
        Dim sSubject As String = "[ch kitty club] ERROR OCCURRED"
        Dim sBody As String = Now.ToString
        
        Dim msg As New MailMessage(sFrom, sTo, sSubject, sBody)
        Dim att As New Attachment(Server.MapPath("~/errorlogs/error_log.txt"))
        msg.Attachments.Add(att)
        Dim client As New SmtpClient(ConfigurationManager.AppSettings("smtpServer"), 25)
        client.Credentials = New NetworkCredential( _
            ConfigurationManager.AppSettings("smtpUser"), _
            ConfigurationManager.AppSettings("smtpPassword"))
        client.Send(msg)
    End Sub
       
</script>