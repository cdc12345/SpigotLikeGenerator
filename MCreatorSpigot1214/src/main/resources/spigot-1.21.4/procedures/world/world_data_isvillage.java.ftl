<#include "mcelements.ftl">
<#if enableNMS1(w)>
(((CraftWorld)world).getHandle().isVillage(${toNMSBlockPos(input$x,input$y,input$z)}))
<#else>
(false/*@enableNMS*/)
</#if>