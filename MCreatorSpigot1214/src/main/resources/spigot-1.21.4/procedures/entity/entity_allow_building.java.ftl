<#include "mcitems.ftl">
<#if enableNMS(w)>
if (((org.bukkit.craftbukkit.entity.CraftEntity)${input$entity}).getHandle() instanceof net.minecraft.world.entity.player.Player _player) {
    _player.getAbilities().mayBuild = ${input$condition};
    _player.onUpdateAbilities();
}
<#else>
//Please enable NMS
</#if>