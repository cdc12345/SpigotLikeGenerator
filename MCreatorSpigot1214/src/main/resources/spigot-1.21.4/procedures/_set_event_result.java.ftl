<#if trigger == "block_place">
	<#if result == "DEFAULT">if (event instanceof BlockPlaceEvent _event) _event.setBuild(true);
	<#elseif result == "ALLOW">if (event instanceof BlockPlaceEvent _event) _event.setBuild(true);
	<#elseif result == "DENY">if (event instanceof BlockPlaceEvent _event) _event.setBuild(false);
	</#if>
<#elseif trigger == "player_right_click_block">
	if (event instanceof PlayerInteractEvent _event) _event.setUseInteractedBlock(Event.Result.${result});
<#elseif trigger == "player_right_click_item">
	if (event instanceof PlayerInteractEvent _event) _event.setUseItemInHand(Event.Result.${result});
</#if>