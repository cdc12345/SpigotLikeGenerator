<#include "mcelements.ftl">
<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.discoverRecipe(Objects.requireNonNull(${toResourceLocation(input$recipe)}));
<#else>
if (${input$entity} instanceof Player _player){
	_player.discoverRecipe(Objects.requireNonNull(${toResourceLocation(input$recipe)}));
}
</#if>
