<#include "procedures.java.ftl">
public class ${name}Procedure implements Listener{
	@EventHandler public void whenEntityBlocksWithShield(EntityDamageByEntityEvent event) {
		if (event.getDamage(EntityDamageEvent.DamageModifier.BLOCKING) != 0) {
			<#assign dependenciesCode><#compress>
				<@procedureDependenciesCode dependencies, {
					"x": "event.getDamager().getLocation().getX()",
					"y": "event.getDamager().getLocation().getY()",
					"z": "event.getDamager().getLocation().getZ()",
					"world": "event.getDamager().getWorld()",
					"entity": "event.getDamager()",
					"damagesource": "event.getDamageSource()",
					"sourceentity": "event.getDamageSource().getCausingEntity()",
					"immediatesourceentity": "event.getDamageSource().getDirectEntity()",
					"originalblockedamount": "event.getDamage()",
					"blockedamount": "event.getDamage(EntityDamageEvent.DamageModifier.BLOCKING)",
					"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		}
	}