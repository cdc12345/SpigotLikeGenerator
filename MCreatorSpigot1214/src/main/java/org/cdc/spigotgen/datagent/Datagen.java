package org.cdc.spigotgen.datagent;

import org.cdc.framework.MCreatorPluginFactory;
import org.cdc.framework.utils.BuiltInTypes;

public class Datagen {
	public static void main(String[] args) {
		MCreatorPluginFactory mCreatorPluginFactory = MCreatorPluginFactory.createFactory("MCreatorSpigot1214/src/main/resources");

		mCreatorPluginFactory.createTrigger("ontabcomplete").appendDependency("length", BuiltInTypes.Number);
	}
}
