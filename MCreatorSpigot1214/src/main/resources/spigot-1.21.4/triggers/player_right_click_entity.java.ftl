<#include "procedures.java.ftl">
public class ${name}Procedure implements Listener {
	@EventHandler public void onPlayerInteractEntity(PlayerInteractEntityEvent event) {
		if (event.getHand() == EquipmentSlot.HAND){
			<#assign dependenciesCode><#compress>
				<@procedureDependenciesCode dependencies, {
				"x": "event.getClickedEntity().getLocation().getX()",
				"y": "event.getClickedEntity().getLocation().getY()",
				"z": "event.getClickedEntity().getLocation().getZ()",
				"world": "event.getPlayer().getWorld()",
				"entity": "event.getRightClicked()",
				"sourceentity": "event.getPlayer()",
				"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		}
	}