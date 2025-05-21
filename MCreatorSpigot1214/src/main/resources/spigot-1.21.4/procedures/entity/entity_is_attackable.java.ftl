<#if w.getWorkspace().getWorkspaceSettings().getMCreatorDependencies().contains("NMS")>
(((CraftEntity)${input$entity}).getHandle().isAttackable())
<#else>
(false/*@EnableNMS*/)
</#if>
