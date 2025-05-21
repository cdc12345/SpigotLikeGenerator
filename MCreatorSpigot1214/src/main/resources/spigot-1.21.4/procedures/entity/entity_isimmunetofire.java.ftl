<#if w.getWorkspace().getWorkspaceSettings().getMCreatorDependencies().contains("NMS")>
(((CraftEntity)${input$entity}).getHandle().fireImmune())
<#else>
(false/*@EnableNMS*/)
</#if>