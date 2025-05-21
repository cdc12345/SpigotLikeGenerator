<#if w.getWorkspace().getWorkspaceSettings().getMCreatorDependencies().contains("NMS")>
/*@float*/(((CraftEntity)${input$entity}).getHandle().maxUpStep())
<#else>
(0f/*@EnableNMS*/)
</#if>