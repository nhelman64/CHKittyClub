Imports System.Configuration
Imports System.Web.Configuration

Partial Class utility_ProtectConfig
    Inherits System.Web.UI.Page

    Protected Sub ButtonProtect_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonProtect.Click
        Dim config As Configuration = WebConfigurationManager.OpenWebConfiguration( _
            Request.ApplicationPath)

        Dim section1 As ConfigurationSection = config.GetSection("connectionStrings")
        Dim section2 As ConfigurationSection = config.GetSection("system.net/mailSettings/smtp")
        Dim section3 As ConfigurationSection = config.GetSection("appSettings")

        section1.SectionInformation.ProtectSection("MyRsaProtectedConfigurationProvider")
        section2.SectionInformation.ProtectSection("MyRsaProtectedConfigurationProvider")
        section3.SectionInformation.ProtectSection("MyRsaProtectedConfigurationProvider")

        config.Save()
    End Sub

    Protected Sub ButtonUnProtect_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonUnProtect.Click
        Dim config As Configuration = WebConfigurationManager.OpenWebConfiguration( _
                            Request.ApplicationPath)

        Dim section1 As ConfigurationSection = config.GetSection("connectionStrings")
        Dim section2 As ConfigurationSection = config.GetSection("system.net/mailSettings/smtp")
        Dim section3 As ConfigurationSection = config.GetSection("appSettings")

        section1.SectionInformation.UnprotectSection()
        section2.SectionInformation.UnprotectSection()
        section3.SectionInformation.UnprotectSection()
        config.Save()
    End Sub
End Class
