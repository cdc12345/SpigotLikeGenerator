package org.cdc.spigot.test;

import org.cdc.spigot.SpigotJavaPluginMain;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
import java.util.Properties;

public class TestGenerator {
	@Test public void testProcedureLangKey() throws IOException {
		Properties lang = new Properties();
		lang.load(SpigotJavaPluginMain.class.getResourceAsStream("/lang/texts.properties"));

		File procedurePath = new File(SpigotJavaPluginMain.class.getResource("/procedures").getFile());

		var list = Arrays.stream(Objects.requireNonNull(procedurePath.listFiles()))
				.map(a -> a.getName().replaceAll("\\.json$", "")).toList();

		//exist
		for (String string : list) {
			String key = "blockly.block." + string;
			if (string.startsWith("$")) {
				key = "blockly.category." + string.substring(1);
			}
			if (!lang.containsKey(key)) {
				throw new IOException("Missing key: " + key);
			}
		}

	}

	@Test public void testTriggersLangKey() throws IOException {
		Properties lang = new Properties();
		lang.load(SpigotJavaPluginMain.class.getResourceAsStream("/lang/texts.properties"));

		File triggersPath = new File(SpigotJavaPluginMain.class.getResource("/triggers").getFile());

		var list = Arrays.stream(Objects.requireNonNull(triggersPath.listFiles()))
				.map(a -> a.getName().replaceAll("\\.json$", "")).toList();
		//exist
		for (String string : list) {
			String key = "trigger." + string;
			if (!lang.containsKey(key)) {
				throw new IOException("Missing key: " + key);
			}
		}
	}
}
