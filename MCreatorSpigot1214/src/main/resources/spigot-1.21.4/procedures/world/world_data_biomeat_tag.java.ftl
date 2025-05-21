<#include "mcelements.ftl">
<#include "mcitems.ftl">
<#if enableNMS(w)>
(((CraftWorld)world).getHandle().getBiome(${toNMSBlockPos(input$x,input$y,input$z)}).is(net.minecraft.tags.TagKey.create(
net.minecraft.core.registries.Registries.BIOME, ${toNMSResourceLocation(input$tag)})))
<#else>
(false/*Please enable NMS*/)
</#if>