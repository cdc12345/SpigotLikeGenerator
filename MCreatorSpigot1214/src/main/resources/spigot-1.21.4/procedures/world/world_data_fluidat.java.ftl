<#include "mcelements.ftl">
<#include "mcitems.ftl">
<#if enableNMS(w)>
/*@BlockState*/(new CraftBlockState(((CraftWorld) world).getHandle().getFluidState(${toNMSBlockPos(input$x,input$y,input$z)}).createLegacyBlock()))
<#else>
(null/*@NeedNMS*/)
</#if>