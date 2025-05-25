<#if !input$entity?starts_with("/*@Player*/")>
if (${input$entity} instanceof Player _player) {
	<#if input$entity == "completer">
	_player.sendMessage(${input$text});
	<#else>
	_player.spigot().sendMessage(ChatMessageType.<#if input$actbar=="true">ACTION_BAR<#else>CHAT</#if>, TextComponent.fromLegacy(${input$text}));
	</#if>
}
<#else>
	<#-- without completer -->
	${input$entity}.spigot().sendMessage(ChatMessageType.<#if input$actbar=="true">ACTION_BAR<#else>CHAT</#if>, TextComponent.fromLegacy(${input$text}));
</#if>