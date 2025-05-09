<#include "mcitems.ftl">
if (${input$entity} instanceof Player _player) {
	ItemStack _setstack = ${mappedMCItemToItemStackCode(input$item, 1)};
	_setstack.setAmount(${opt.toInt(input$amount)});
	_player.getInventory().setItemInMainHand(_setstack);
}