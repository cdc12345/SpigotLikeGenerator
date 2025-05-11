<#if !input$entity?starts_with("/*@Player*/")>
if (${input$entity} instanceof Player _player) {
	<#if input$actbar=="true">
	_player.spigot().sendMessage(ChatMessageType.ACTION_BAR, new TextComponent(${input$text}));
	<#else>
	_player.sendMessage(${input$text});
	</#if>
}
<#else>
	<#if input$actbar=="true">
	${input$entity}.spigot().sendMessage(ChatMessageType.ACTION_BAR, new TextComponent(${input$text}));
	<#else>
	${input$entity}.sendMessage(${input$text});
	</#if>
</#if>