<#include "mcelements.ftl">
(Bukkit.getTag("entity_types", NamespacedKey.minecraft(${input$tag}), EntityType.class).isTagged(${input$entity}.getType()))