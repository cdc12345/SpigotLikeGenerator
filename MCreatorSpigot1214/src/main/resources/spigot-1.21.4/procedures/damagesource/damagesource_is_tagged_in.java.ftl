<#include "mcelements.ftl">
(Bukkit.getTag("damage_types", ${toResourceLocation(input$tag)}, DamageType.class).isTagged(${input$damagesource}.getDamageType()))