package org.cdc.spigotgen.datagent;

import net.minecraft.resources.ResourceKey;
import net.minecraft.world.level.biome.Biomes;
import org.bukkit.GameMode;
import org.bukkit.GameRule;
import org.bukkit.attribute.Attribute;
import org.bukkit.damage.DamageType;
import org.bukkit.potion.PotionEffectType;
import org.cdc.framework.MCreatorPluginFactory;

import java.lang.reflect.Field;
import java.util.Locale;

public class MappingDatagen {
	public static void main(String[] args) {
		MCreatorPluginFactory mCreatorPluginFactory = MCreatorPluginFactory.createFactory("src/main/resources");

		var attributes = mCreatorPluginFactory.createDataList("attributes");
		var cls = Attribute.class;
		for (Field field : cls.getFields()) {
			if (field.getType().equals(Attribute.class)) {
				System.out.println(field.getName());
				attributes.appendElement(field.getName(), "Attribute." + field.getName());
			}
		}
		attributes.setDefault();
		attributes.setMapTemplate("@JavaModNameAttributes.@REGISTRYNAME");
		attributes.initGenerator().build();

		var effects = mCreatorPluginFactory.createDataList("effects");
		var potioneffect = PotionEffectType.class;
		for (Field field : potioneffect.getFields()) {
			if (field.getType().equals(PotionEffectType.class)) {
				System.out.println(field.getName());
				effects.appendElement(field.getName(), "PotionEffectType." + field.getName());
			}
		}
		effects.setDefault();
		effects.initGenerator().build();

		var gamemodes = mCreatorPluginFactory.createDataList("gamemodes");
		for (GameMode gameMode : GameMode.values()) {
			System.out.println(gameMode.name());
			gamemodes.appendElement(gameMode.name(), gameMode.name());
		}
		gamemodes.setDefault("SURVIVAL");
		gamemodes.initGenerator().build();

		var gamerules = mCreatorPluginFactory.createDataList("gamerules");
		var gamerul = GameRule.class;
		for (Field gamerule : gamerul.getFields()) {
			if (gamerule.getType().equals(GameRule.class)) {
				System.out.println(gamerule.getName());
				gamerules.appendElement(gamerule.getName(), "GameRule." + gamerule.getName());
			}
		}
		gamerules.setDefault();
		gamerules.initGenerator().build();

		var damagesource = mCreatorPluginFactory.createDataList("damagesources");
		var damageType = DamageType.class;
		for (Field damageType1 : damageType.getFields()) {
			if (damageType1.getType().equals(damageType)) {
				String key = damageType1.getName();
				String preview = String.format("""
												
						- DamageType.%s
						- %s
						""", key, key.toLowerCase(Locale.ROOT));
				System.out.println(preview);
				damagesource.appendElement(key, preview);
			}
		}
		damagesource.appendElement("_bypass_prefix", "\"#\"");
		damagesource.setDefault();
		damagesource.initGenerator().build();

		var biomes = mCreatorPluginFactory.createDataList("biomes");
		var biomeType = Biomes.class;
		for (Field field : biomeType.getFields()) {
			if (field.getType().equals(ResourceKey.class)) {
				String key = field.getName().toLowerCase();
				System.out.println(key);
				biomes.appendElement(key, key);
			}
		}
		biomes.setDefault();
		biomes.setMapTemplate("@modid:@registryname");
		biomes.appendElement("_bypass_prefix", "\"#\"");
		biomes.initGenerator().build();

		mCreatorPluginFactory.initGenerator("spigot-1.21.4", true);
	}
}
