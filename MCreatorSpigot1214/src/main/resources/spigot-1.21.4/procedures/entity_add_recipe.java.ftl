<#include "mcelements.ftl">
if (${input$entity} instanceof Player _player){
	_player.discoverRecipe(Objects.requireNonNull(${toResourceLocation(input$recipe)}));
}
