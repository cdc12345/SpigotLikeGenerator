package org.cdc.spigot;

import net.mcreator.plugin.JavaPlugin;
import net.mcreator.plugin.Plugin;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SpigotJavaPluginMain extends JavaPlugin {

    private static final Logger LOG = LogManager.getLogger("Spigot Assistant");

    public SpigotJavaPluginMain(Plugin plugin) {
        super(plugin);

        LOG.info("Spigot Assistant is Running");
    }

}
