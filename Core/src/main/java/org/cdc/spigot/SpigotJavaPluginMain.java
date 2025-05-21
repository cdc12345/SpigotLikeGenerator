package org.cdc.spigot;

import net.mcreator.plugin.JavaPlugin;
import net.mcreator.plugin.Plugin;
import net.mcreator.workspace.misc.WorkspaceInfo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SpigotJavaPluginMain extends JavaPlugin {

	private static final Logger LOG = LogManager.getLogger("Spigot Assistant");

	public SpigotJavaPluginMain(Plugin plugin) {
		super(plugin);

		WorkspaceInfo info = null;

		LOG.info("Spigot Assistant is Running");
	}

}
