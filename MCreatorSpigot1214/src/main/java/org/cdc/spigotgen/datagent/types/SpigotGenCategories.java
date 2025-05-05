package org.cdc.spigotgen.datagent.types;

import org.cdc.framework.interfaces.IProcedureCategory;

public enum SpigotGenCategories implements IProcedureCategory {
	SPIGOT_TOOLBOX("spigot_generator"),SERVER_MANAGE("server_management");

	private final String name;

	SpigotGenCategories(String name){
		this.name = name;
	}

	@Override public String getName() {
		return name;
	}
}
