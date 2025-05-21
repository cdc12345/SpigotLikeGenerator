<#include "mcelements.ftl">
<#include "mcitems.ftl">
<#if enableNMS(w)>
(((CraftWorld)world).getHandle().canSeeSkyFromBelowWater(${toNMSBlockPos(input$x,input$y,input$z)}))
<#else>
(false/*Please enable NMS*/)
</#if>