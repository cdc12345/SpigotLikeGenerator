<#include "mcelements.ftl">
<#include "mcitems.ftl">
<#if enableNMS(w)>
/*@int*/(((CraftWorld)world).getHandle().getBlockState(${toNMSBlockPos(input$x,input$y,input$z)}).getLightBlock())
<#else>
(0/*Please enable NMS*/
</#if>