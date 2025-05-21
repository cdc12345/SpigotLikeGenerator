<#include "mcitems.ftl">
<#if enableNMS(w)>
<@addTemplate file="utils/projectiles/potion.java.ftl"/>
createPotionProjectile(projectileLevel, net.minecraft.world.item.alchemy.PotionContents.createItemStack(Items.${field$potionType}, ${generator.map(field$potion, "potions")}), ${input$shooter}, new net.minecraft.world.phys.Vec3(${input$ax}, ${input$ay}, ${input$az}))
</#if>