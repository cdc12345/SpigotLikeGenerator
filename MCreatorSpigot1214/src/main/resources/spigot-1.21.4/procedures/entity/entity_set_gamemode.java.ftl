<#if input$entity?starts_with("/*@Player*/")>
${input$entity}.setGameMode(GameMode.${generator.map(field$gamemode, "gamemodes")});
<#else>
if(${input$entity} instanceof Player _player)
	_player.setGameMode(GameMode.${generator.map(field$gamemode, "gamemodes")});
</#if>