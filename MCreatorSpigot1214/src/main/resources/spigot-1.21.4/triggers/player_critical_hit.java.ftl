<#include "procedures.java.ftl">
public class ${name}Procedure implements Listener {
	@EventHandler public void onEntityAttacked(EntityDamageByEntityEvent event) {
		if (isCritical(event.getDamager()) && event.getDamage() > 0.0F) {
			<#assign dependenciesCode><#compress>
				<@procedureDependenciesCode dependencies, {
				"x": "event.getEntity().getLocation().getX()",
				"y": "event.getEntity().getLocation().getY()",
				"z": "event.getEntity().getLocation().getZ()",
				"world": "event.getEntity().getWorld()",
				"entity": "event.getEntity()",
				"sourceentity": "event.getDamager()",
				"damagemodifier": "1",
				"isvanillacritical": "true",
				"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		}
	}
	public boolean isCritical(Entity damager){
		return damager.getFallDistance() > 0.0F && !damager.isOnGround()&& damager instanceof LivingEntity damager1 && !damager1.hasPotionEffect(
				PotionEffectType.BLINDNESS) && damager.getVehicle() == null;
	}