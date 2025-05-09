<#include "mcelements.ftl">
((entity instanceof Player _player)?_player.hasDiscoveredRecipe(Objects.requireNonNull(${toResourceLocation(input$recipe)})):false)