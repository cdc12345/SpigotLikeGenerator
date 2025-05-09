<#if field$type == "UNDEAD">
false<#-- not have the undead tag -->
<#elseif field$type == "ARTHROPOD">
(Tag.ENTITY_TYPES_ARTHROPOD.isTagged(${input$entity}.getType()))
<#elseif field$type == "ILLAGER">
(Tag.ENTITY_TYPES_ILLAGER.isTagged(${input$entity}.getType()))
<#elseif field$type == "WATER">
(Tag.ENTITY_TYPES_AQUATIC.isTagged(${input$entity}.getType()))
<#else>
false<#-- fallback for workspaces using UNDEFINED type, as this one no longer exists in 1.20.6+ -->
</#if>