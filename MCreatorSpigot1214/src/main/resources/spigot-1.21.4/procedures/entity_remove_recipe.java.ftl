<#include "mcelements.ftl">
if (${input$entity} instanceof Player _player){
	_player.undiscoverRecipe(Objects.requireNonNull(${toResourceLocation(input$recipe)}));
}