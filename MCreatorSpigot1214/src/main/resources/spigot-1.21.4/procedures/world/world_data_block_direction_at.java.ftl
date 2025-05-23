<#include "mcelements.ftl">
<#if enableNMS1(w)>
<@addTemplate file="utils/world/data_block_direction_at.java.ftl"/>
(BlockFace.valueOf(getBlockDirection(((CraftWorld)world).getHandle(), ${toNMSBlockPos(input$x,input$y,input$z)}).name()))
<#else>
(BlockFace.UP/*@EnableNMS*/)
</#if>