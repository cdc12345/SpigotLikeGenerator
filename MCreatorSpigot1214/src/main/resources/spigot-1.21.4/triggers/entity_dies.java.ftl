<#include "procedures.java.ftl">
public class ${name}Procedure implements Listener {
	@EventHandler public void onEntityAttacked(EntityDamageEvent event) {
		if (event.getEntity().isDead()) {
			<#assign dependenciesCode><#compress>
				<@procedureDependenciesCode dependencies, {
				"x": "event.getEntity().getLocation().getX()",
				"y": "event.getEntity().getLocation().getY()",
				"z": "event.getEntity().getLocation().getZ()",
				"world": "event.getEntity().getWorld()",
				"entity": "event.getEntity()",
				"amount": "event.getFinalDamage()",
				"damagesource": "event.getDamageSource()",
				"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		}
	}