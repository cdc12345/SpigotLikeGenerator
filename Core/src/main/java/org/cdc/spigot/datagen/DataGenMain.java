package org.cdc.spigot.datagen;

import org.cdc.framework.MCreatorPluginFactory;
import org.cdc.framework.utils.BuiltInToolBoxId;
import org.cdc.framework.utils.BuiltInTypes;
import org.cdc.framework.utils.Side;
import org.cdc.spigot.datagen.types.SpigotGenCategories;

import java.awt.*;

public class DataGenMain {
	public static void main(String[] args) {
		MCreatorPluginFactory mCreatorPluginFactory = MCreatorPluginFactory.createFactory("src/main/resources");

		var en = mCreatorPluginFactory.createDefaultLanguage();
		//		mCreatorPluginFactory.createTrigger("ontabcomplete").appendDependency("length", BuiltInTypes.Number);
		mCreatorPluginFactory.createApis("LuckPerms");
		mCreatorPluginFactory.createApis("EssentialsX");
		mCreatorPluginFactory.createApis("NMS");

		mCreatorPluginFactory.createTrigger().setName("explosion_occurs_spigot").setSide(Side.Server)
				.appendDependency("world", BuiltInTypes.World).appendDependency("x", BuiltInTypes.Number)
				.appendDependency("y", BuiltInTypes.Number).appendDependency("z", BuiltInTypes.Number)
				.appendDependency("entity", BuiltInTypes.Entity).setCancelable(true)
				.setLanguage(en, "Spigot: An explosion occurs").buildAndOutput();
		mCreatorPluginFactory.createTrigger("on_disable_spigot").setSide(Side.Server)
				.setLanguage(en, "Spigot: on Disable").buildAndOutput();
		mCreatorPluginFactory.createTrigger("on_tab_complete").appendDependency("cmd", BuiltInTypes.String)
				.appendDependency("length", BuiltInTypes.Number).appendDependency("lastarg", BuiltInTypes.String)
				.appendDependency("entity", BuiltInTypes.Entity).appendDependency("completer", BuiltInTypes.Entity)
				.appendDependency("world", BuiltInTypes.World).appendDependency("x", BuiltInTypes.Number)
				.appendDependency("y", BuiltInTypes.Number).appendDependency("z", BuiltInTypes.Number)
				.setLanguage(en, "Spigot: on Tab Complete").initGenerator().buildAndOutput();

		mCreatorPluginFactory.createProcedureCategory("spigot_generator").setColor(Color.GRAY)
				.setLanguage(en, "Spigot ToolBox").buildAndOutput();
		mCreatorPluginFactory.createProcedureCategory("server_management").setColor(Color.GRAY)
				.setParentCategory(SpigotGenCategories.SPIGOT_TOOLBOX.getName()).setLanguage(en, "ServerManage")
				.buildAndOutput();
		mCreatorPluginFactory.getToolKit().createInputProcedure("server_broadcast")
				.setToolBoxId(SpigotGenCategories.SERVER_MANAGE).appendArgs0InputValue("message", BuiltInTypes.String)
				.toolBoxInitBuilder().setName("message").appendConstantString("Message").buildAndReturn()
				.setLanguage(en, "Server broadcast %1").initGenerator().buildAndOutput();
		mCreatorPluginFactory.getToolKit().createInputProcedure("server_ban_player")
				.setToolBoxId(SpigotGenCategories.SERVER_MANAGE).appendArgs0InputValue("player", BuiltInTypes.Entity)
				.appendArgs0InputValue("reason", BuiltInTypes.String).appendArgs0InputValue("time", BuiltInTypes.Number)
				.appendArgs0InputValue("source", BuiltInTypes.String).toolBoxInitBuilder().setName("player")
				.appendDefaultEntity().buildAndReturn().toolBoxInitBuilder().setName("reason").appendConstantString("")
				.buildAndReturn().toolBoxInitBuilder().setName("time").appendConstantNumber(1).buildAndReturn()
				.toolBoxInitBuilder().setName("source").appendConstantString("Console").buildAndReturn()
				.setLanguage(en, "Ban player %1, reason %2, Days: %3, Source:%4").initGenerator().buildAndOutput();
		mCreatorPluginFactory.getToolKit().createInputProcedure("server_ban_player_advanced")
				.setToolBoxId(SpigotGenCategories.SERVER_MANAGE).appendArgs0InputValue("player", BuiltInTypes.Entity)
				.appendArgs0InputValue("reason", BuiltInTypes.String).appendArgs0InputValue("time", BuiltInTypes.Number)
				.appendArgs0FieldDropDown("timeunit", "MINUTE", "MINUTES", "HOUR", "HOURS", "DAY", "DAYS", "MONTH",
						"MONTHS").appendArgs0InputValue("source", BuiltInTypes.String).toolBoxInitBuilder()
				.setName("player").appendDefaultEntity().buildAndReturn().toolBoxInitBuilder().setName("reason")
				.appendConstantString("").buildAndReturn().toolBoxInitBuilder().setName("time").appendConstantNumber(1)
				.buildAndReturn().toolBoxInitBuilder().setName("source").appendConstantString("Console")
				.buildAndReturn()
				.setLanguage(en, "Ban player %1, reason %2, amount of time: %3,Time unit: %4, Source: %5")
				.initGenerator().buildAndOutput();
		mCreatorPluginFactory.getToolKit().createInputProcedure("server_kick_player")
				.setToolBoxId(SpigotGenCategories.SERVER_MANAGE).appendArgs0InputValue("player", BuiltInTypes.Entity)
				.appendArgs0InputValue("message", BuiltInTypes.String).toolBoxInitBuilder().setName("player")
				.appendDefaultEntity().buildAndReturn().toolBoxInitBuilder().setName("message")
				.appendConstantString("Reason").buildAndReturn().setLanguage(en, "Kick %1 , reason: %2").initGenerator()
				.buildAndOutput();
		mCreatorPluginFactory.getToolKit().createInputProcedure("server_shutdown")
				.setToolBoxId(SpigotGenCategories.SERVER_MANAGE).setLanguage(en, "Server Shutdown").initGenerator()
				.buildAndOutput();
		mCreatorPluginFactory.getToolKit().createInputProcedure("common_do_nothing").setColor(Color.ORANGE.darker())
				.appendArgs0StatementInput("statement").statementBuilder().setName("statement").buildAndReturn()
				.setToolBoxId(BuiltInToolBoxId.Procedure.ADVANCED).setLanguage(en, "Do nothing %1").initGenerator()
				.buildAndOutput();

		//		mCreatorPluginFactory.initGenerator("spigot-1.21.4");

		en.buildAndOutput();
	}
}
