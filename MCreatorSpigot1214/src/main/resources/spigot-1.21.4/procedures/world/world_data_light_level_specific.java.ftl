<#include "mcelements.ftl">
<#if enableNMS(w)>
/*@int*/(((CraftWorld)world).getHandle().getBrightness(LightLayer.${field$layer}, ${toNMSBlockPos(input$x,input$y,input$z)}))
<#else>
(0/*@enableNMS -_-*/)
</#if>