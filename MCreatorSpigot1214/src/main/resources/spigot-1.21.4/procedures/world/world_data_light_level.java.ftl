<#include "mcelements.ftl">
<#if enableNMS1(w)>
/*@int*/(((CraftWorld)world).getHandle().getRawBrightness(${toNMSBlockPos(input$x,input$y,input$z)},1))
<#else>
(0/*@EnableNMS*/)
</#if>