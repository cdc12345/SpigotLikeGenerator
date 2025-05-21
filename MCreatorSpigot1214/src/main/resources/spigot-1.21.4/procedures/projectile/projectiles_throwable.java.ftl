<#include "mcitems.ftl">
<#if enableNMS(w)>
<#if input$shooter == "null">
new ${generator.map(field$projectile, "projectiles", 0)}(${generator.map(field$projectile, "projectiles", 1)}, projectileLevel)
<#else>
<@addTemplate file="utils/projectiles/projectile.java.ftl"/>
initProjectileProperties(new ${generator.map(field$projectile, "projectiles", 0)}(${generator.map(field$projectile, "projectiles", 1)}, projectileLevel), ${input$shooter}, net.minecraft.world.phys.Vec3.ZERO)
</#if>
</#if>