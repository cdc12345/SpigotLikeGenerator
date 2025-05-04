name: ${settings.getModID()}
version: '${settings.getCleanVersion()}'
main: ${settings.getModElementsPackage() + "." + settings.getJavaModName()}
api-version: '1.21'
<#if settings.getAuthor()?has_content>
authors: [${JavaConventions.escapeStringForJava(settings.getAuthor())}]
</#if>
<#if settings.getDescription()?has_content>
description: ${JavaConventions.escapeStringForJava(settings.getDescription())}
</#if>
<#if settings.getWebsiteURL()?has_content>
website: ${JavaConventions.escapeStringForJava(settings.getWebsiteURL())}
</#if>

commands:
  <#list w.getElementsOfType("command") as command>
  ${command.getGeneratableElement().commandName}:
    permission: ${command.getGeneratableElement().commandName}.use
  </#list>
