package ${package};

import java.util.function.Consumer;

public class ${JavaModName}Registers {
	private static final List<Consumer<Class<?>>> reflects = new ArrayList<>();

	public static void registerAll(File file){
		try (JarFile jarFile = new JarFile(file)) {
			var entries = jarFile.entries();
			while (entries.hasMoreElements()) {
				var entry = entries.nextElement();
				if (entry.getName().endsWith(".class")) {
					String classPath = entry.getName().replace('/', '.');
					Class<?> cls = Class.forName(classPath.substring(0, classPath.length() - 6));
					for (Consumer<Class<?>> re:reflects){
						re.accept(cls);
					}
				}
			}
		} catch (IOException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	public static void registerReflect(Consumer<Class<?>> consumer){
		reflects.add(consumer);
	}
}