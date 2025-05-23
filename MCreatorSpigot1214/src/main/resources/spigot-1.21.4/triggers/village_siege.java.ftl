<#include "procedures.java.ftl">
@EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onVillageSiege(CreatureSpawnEvent event) {
		if (event.getSpawnReason() == CreatureSpawnEvent.SpawnReason.VILLAGE_INVASION) {
			<#assign dependenciesCode><#compress>
				<@procedureDependenciesCode dependencies, {
					"x": "event.getLocation().getX()",
					"y": "event.getLocation().getY()",
					"z": "event.getLocation().getZ()",
					"world": "event.getLocation().getWorld()",
					"entity": "event.getEntity()/*@Zombie*/",
					"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		}
	}