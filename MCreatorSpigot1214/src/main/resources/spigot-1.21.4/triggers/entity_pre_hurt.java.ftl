<#include "procedures.java.ftl">
public class ${name}Procedure implements Listener{
	@EventHandler public void onEntityAttacked(EntityDamageEvent event) {
			<#assign dependenciesCode><#compress>
				<@procedureDependenciesCode dependencies, {
					"x": "event.getEntity().getLocation().getX()",
					"y": "event.getEntity().getLocation().getY()",
					"z": "event.getEntity().getLocation().getZ()",
					"world": "event.getEntity().getWorld()",
					"amount": "event.getFinalDamage()",
					"entity": "event.getEntity()",
					"damagesource": "event.getDamageSource()",
					"sourceentity": "event.getDamageSource().getCausingEntity()",
					"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}