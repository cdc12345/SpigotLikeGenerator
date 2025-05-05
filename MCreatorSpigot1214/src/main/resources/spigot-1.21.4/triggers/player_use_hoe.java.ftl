<#include "procedures.java.ftl">
public class ${name}Procedure implements Listener {
	@EventHandler public void onPlayerHarvest(PlayerHarvestBlockEvent event) {
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"x": "event.getHarvestedBlock().getLocation().getX()",
			"y": "event.getHarvestedBlock().getLocation().getY()",
			"z": "event.getHarvestedBlock().getLocation().getZ()",
			"world": "event.getHarvestedBlock().getWorld()",
			"entity": "event.getPlayer()",
			"blockstate": "event.getHarvestedBlock().getState()",
			"event": "event"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}