<#include "procedures.java.ftl">
public class ${name}Procedure implements Listener {
	@EventHandler public void onPlayerLeftClick(PlayerInteractEvent event) {
		if (event.getAction() == org.bukkit.event.block.Action.LEFT_CLICK_BLOCK && event.getHand() == EquipmentSlot.HAND) {
			<#assign dependenciesCode><#compress>
				<@procedureDependenciesCode dependencies, {
				"x": "event.getClickedBlock().getLocation().getX()",
				"y": "event.getClickedBlock().getLocation().getY()",
				"z": "event.getClickedBlock().getLocation().getZ()",
				"world": "event.getPlayer().getWorld()",
				"entity": "event.getPlayer()",
				"direction": "event.getBlockFace()",
				"blockstate": "event.getClickedBlock().getState()",
				"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		}
	}