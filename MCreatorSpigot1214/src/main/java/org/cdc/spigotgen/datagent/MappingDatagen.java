package org.cdc.spigotgen.datagent;

import org.bukkit.GameMode;
import org.bukkit.GameRule;
import org.bukkit.attribute.Attribute;
import org.bukkit.potion.PotionEffectType;
import org.cdc.framework.MCreatorPluginFactory;

import java.lang.reflect.Field;

public class MappingDatagen {
	public static void main(String[] args) {
		MCreatorPluginFactory mCreatorPluginFactory = MCreatorPluginFactory.createFactory("src/main/resources");

		var attributes = mCreatorPluginFactory.createDataList("attributes");
		var cls = Attribute.class;
		for (Field field: cls.getFields()){
			if (field.getType().equals(Attribute.class)){
				System.out.println(field.getName());
				attributes.appendElement(field.getName(),"Attribute."+field.getName());
			}
		}
		attributes.setDefault();
		attributes.initGenerator().build();

		var effects = mCreatorPluginFactory.createDataList("effects");
		var potioneffect = PotionEffectType.class;
		for (Field field:potioneffect.getFields()){
			if (field.getType().equals(PotionEffectType.class)){
				System.out.println(field.getName());
				effects.appendElement(field.getName(),"PotionEffectType."+field.getName());
			}
		}
		effects.setDefault();
		effects.initGenerator().build();

		var gamemodes = mCreatorPluginFactory.createDataList("gamemodes");
		for (GameMode gameMode: GameMode.values()){
			System.out.println(gameMode.name());
			gamemodes.appendElement(gameMode.name(),gameMode.name());
		}
		gamemodes.setDefault("SURVIVAL");
		gamemodes.initGenerator().build();


		var gamerules = mCreatorPluginFactory.createDataList("gamerules");
		var gamerul = GameRule.class;
		for (Field gamerule: gamerul.getFields()){
			if (gamerule.getType().equals(GameRule.class)) {
				System.out.println(gamerule.getName());
				gamerules.appendElement(gamerule.getName(),
						"GameRule." + gamerule.getName());
			}
		}
		gamerules.setDefault();
		gamerules.initGenerator().build();


		mCreatorPluginFactory.initGenerator("spigot-1.21.4",true);
	}
}
