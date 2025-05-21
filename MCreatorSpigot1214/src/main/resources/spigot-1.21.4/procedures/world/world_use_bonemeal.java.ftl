<#include "mcelements.ftl">
<#if enableNMS1(w)>
if (((CraftWorld)world).getHandle() instanceof net.minecraft.world.level.Level _level) {
	net.minecraft.core.BlockPos _bp = ${toNMSBlockPos(input$x,input$y,input$z)};
	if (net.minecraft.world.item.BoneMealItem.growCrop(new net.minecraft.world.item.ItemStack(net.minecraft.world.item.Items.BONE_MEAL), _level, _bp)
	|| net.minecraft.world.item.BoneMealItem.growWaterPlant(new net.minecraft.world.item.ItemStack(net.minecraft.world.item.Items.BONE_MEAL), _level, _bp, null)) {
    				_level.levelEvent(2005, _bp, 0);
    }
}
<#else>
//@EnableNMS
</#if>