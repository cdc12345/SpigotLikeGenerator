<#include "procedures.java.ftl">
public class ${name}Procedure implements Listener{
	@EventHandler public void onEntityTamed(EntityTameEvent event) {
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
				"x": "event.getEntity().getLocation().getX()",
				"y": "event.getEntity().getLocation().getY()",
				"z": "event.getEntity().getLocation().getZ()",
				"world": "event.getEntity().getWorld()",
				"entity": "event.getEntity()",
				"sourceentity": "event.getOwner()",
				"event": "event"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}