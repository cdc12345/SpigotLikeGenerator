<#include "mcelements.ftl">
<#if w.getWorkspace().getWorkspaceSettings().getMCreatorDependencies().contains("NMS")>
/*@float*/(((CraftWorld)world).getHandle().getBiome(${toNMSBlockPos(input$x,input$y,input$z)}).value().getBaseTemperature() * 100f)
<#else>
(0f/*@EnableNMS*/)
</#if>