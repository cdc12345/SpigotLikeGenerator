<#include "mcelements.ftl">
((entity instanceof Player _player${cbi})?_player${cbi}.hasDiscoveredRecipe(Objects.requireNonNull(${toResourceLocation(input$recipe)})):false)