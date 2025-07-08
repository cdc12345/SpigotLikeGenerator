<#-- @formatter:off -->
package ${package};

import org.bukkit.plugin.java.JavaPlugin;
import java.lang.reflect.Method;

public class ${JavaModName} extends JavaPlugin {

	public static boolean isPaper;

	public static ${JavaModName} INSTANCE = null;
    public ${JavaModName}(){
    	INSTANCE = this;
    }

    @Override
    public void onLoad() {
		//check the environment
		try {
			Class.forName("io.papermc.paper.ServerBuildInfo");
			isPaper = true;
		} catch (ClassNotFoundException e) {
			isPaper = false;
		}
    	<#if w.hasElementsOfType("procedure")>
    	${JavaModName}Registers.registerReflect(a->{
			if (Listener.class.isAssignableFrom(a)) {
				getLogger().info("Register Listener: "+a.getName());
				try {
					getServer().getPluginManager().registerEvents((Listener) a.getConstructor().newInstance(),this);
				} catch (InstantiationException | IllegalAccessException | InvocationTargetException |
						 NoSuchMethodException e) {
					MCRLogger.info(e);
				}
			}
         });
    	</#if>
    	<#if w.hasElementsOfType("recipe")>
		${JavaModName}Registers.registerReflect(a -> {
			if (!a.isInterface() && IRecipeProvider.class.isAssignableFrom(a)) {
				getLogger().info("Register Recipe: " + a.getName());
				try {
					Bukkit.addRecipe(((IRecipeProvider) a.getConstructor().newInstance()).provide());
				} catch (InstantiationException | IllegalAccessException | InvocationTargetException |
						 NoSuchMethodException e) {
					MCRLogger.info(e);
				}
			}
		});
		</#if>
    	<#if w.hasElementsOfType("command")>
    	${JavaModName}Registers.registerReflect(a -> {
			if (a.isAnnotationPresent(CommandLabel.class)) {
				getLogger().info("Register Command: " + a.getName());
				CommandLabel label = a.getAnnotation(CommandLabel.class);
				var command = this.getCommand(label.value());
				if (command == null) {
					getLogger().info("wrong command: " + label.value());
					return;
				}
				Object object;
				try {
					object = a.getConstructor().newInstance();
				} catch (InstantiationException | IllegalAccessException | InvocationTargetException |
						 NoSuchMethodException e) {
					MCRLogger.info(e);
					return;
				}
				if (object instanceof CommandExecutor commandExecutor) {
					if (command.getTabCompleter() != null) {
						if (command.getExecutor().getClass().isAnnotationPresent(CommandLabel.class)) {
							CommandLabel commandLabel = command.getExecutor().getClass()
									.getAnnotation(CommandLabel.class);
							if (label.priority().getSlot() > commandLabel.priority().getSlot()) {
								command.setExecutor(commandExecutor);
							}
						} else {
							command.setExecutor(commandExecutor);
						}
					} else {
						command.setExecutor(commandExecutor);
					}
				}
				if (object instanceof TabCompleter tabCompleter) {
					if (command.getTabCompleter() != null) {
						if (command.getTabCompleter().getClass().isAnnotationPresent(CommandLabel.class)) {
							CommandLabel commandLabel = command.getTabCompleter().getClass()
									.getAnnotation(CommandLabel.class);
							if (label.priority().getSlot() > commandLabel.priority().getSlot()) {
								command.setTabCompleter(tabCompleter);
							}
						} else {
							command.setTabCompleter(tabCompleter);
						}
					} else {
						command.setTabCompleter(tabCompleter);
					}
				}
         }
        });
        </#if>
    }

	@Override
	public void onEnable() {
		//Do Something(
		// Start of user code block mod
        // End of user code block mod
		<#if w.hasElementsOfType("procedure") || w.hasElementsOfType("command") || w.hasElementsOfType("recipe")>
		${JavaModName}Registers.registerAll(getFile());
		</#if>
	}

    @Override
    public void onDisable() {
    	<#if w.hasElementsOfType("procedure")>HandlerList.unregisterAll(this);</#if>
    	// Start of user code block mod
        // End of user code block mod
    }

	public static class MCRLogger{
		private static final int MAX_DEPTH = 2;

		private static String toDeepString(Object object, List<String> ignoredMethod, int depth) {
			if (depth > MAX_DEPTH) {
				return String.valueOf(object);
			}
			List<String> list = new ArrayList<>(ignoredMethod);
			list.addAll(List.of("copy","clone","spigot"));
			HashMap<String, String> parameters = new HashMap<>();
			var methods = object.getClass().getMethods();
			for (Method method : methods) {
				if (!method.getReturnType().equals(Void.TYPE) && method.getParameters().length == 0) {
					String value;
					try {
						if (list.contains(method.getName())) {
							continue;
						}
						if (method.getName().equals("getClass")) {
							value = CommandLine.Help.Ansi.Style.fg_green.on() + "\"" + object.getClass().getName()
                             + "\"" + CommandLine.Help.Ansi.Style.fg_green.off();
						} else {
							value = toString(method.invoke(object), depth + 1);
						}
					} catch (IllegalAccessException | InvocationTargetException e) {
						value = e.toString();
					}
					parameters.put(method.getName(), value);
				}
			}
			return parameters.toString();
		}

		private static String toString(Object object, int depth) {
			if (object instanceof Entity entity) {
				return toDeepString(entity, List.of("eject","leaveVehicle"), depth);
			} else if (object instanceof Event event) {
				return toDeepString(event, List.of("callEvent", "getHandlers", "getHandlerList"), depth);
			} else if (object instanceof String string) {
             	return "\"" + string + "\"";
            } else if (object instanceof Exception e){
				StringWriter stringWriter = new StringWriter();
				PrintWriter printWriter = new PrintWriter(stringWriter);
				e.printStackTrace(printWriter);
				return stringWriter.toString();
            }
            // Start of user code block
            // End of user code block
			return String.valueOf(object);
		}

		public static void info(String prefix, Object o) {
			INSTANCE.getLogger().info(prefix + toString(o, 0));
		}

		public static void info(Object o) {
			INSTANCE.getLogger().info(toString(o, 0));
		}
	}
}
<#-- @formatter:on -->