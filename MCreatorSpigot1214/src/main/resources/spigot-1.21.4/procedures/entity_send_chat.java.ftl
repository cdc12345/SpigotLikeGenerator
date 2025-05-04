if (${input$entity} instanceof Player _player)
	_player.spigot().sendMessage(<#if input$actbar=="true">ChatMessageType.ACTION_BAR<#else>ChatMessageType.CHAT</#if>, new TextComponent(${input$text}));