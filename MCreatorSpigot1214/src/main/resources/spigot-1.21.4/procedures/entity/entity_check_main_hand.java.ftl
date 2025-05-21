<#include "mcitems.ftl">
<#if enableNMS(w)>
(((org.bukkit.craftbukkit.entity.CraftEntity)${input$entity}).getHandle() instanceof net.minecraft.world.entity.LivingEntity _entMainHand${cbi} && _entMainHand${cbi}.getMainArm() == net.minecraft.world.entity.HumanoidArm.${field$hand})
<#else>
(false/*Please enable NMS*/)
</#if>