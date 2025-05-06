<#-- @formatter:off -->
package ${package};

import org.bukkit.plugin.java.JavaPlugin;

public class ${JavaModName} extends JavaPlugin {

	public static ${JavaModName} INSTANCE = null;
    public ${JavaModName}(){
    	INSTANCE = this;
    }

    @Override
    public void onLoad() {
    	<#if w.hasElementsOfType("procedure")>
    	${JavaModName}Registers.registerReflect(a->{
                                   			if (Listener.class.isAssignableFrom(a)) {
                                   				getLogger().info("Register Listener:"+a.getName());
                               					try {
                               						getServer().getPluginManager().registerEvents((Listener) a.getConstructor().newInstance(),this);
                               					} catch (InstantiationException | IllegalAccessException | InvocationTargetException |
                               							 NoSuchMethodException e) {
                               						throw new RuntimeException(e);
                               					}
                               				}
         });
    	</#if>
    	<#if w.hasElementsOfType("command")>
    	${JavaModName}Registers.registerReflect(a -> {
                               			if (a.isAnnotationPresent(CommandLabel.class)) {
                               				getLogger().info("Register Command:"+a.getName());
                               				CommandLabel label = a.getAnnotation(CommandLabel.class);
                               				Object object;
                               				try {
                               					object = a.getConstructor().newInstance();
                               				} catch (InstantiationException | IllegalAccessException | InvocationTargetException |
                               						 NoSuchMethodException e) {
                               					throw new RuntimeException(e);
                               				}
                               				if (object instanceof CommandExecutor commandExecutor) {
                               					Objects.requireNonNull(this.getCommand(label.value())).setExecutor(commandExecutor);
                               				}
                               				if (object instanceof TabCompleter tabCompleter){
                               					Objects.requireNonNull(this.getCommand(label.value())).setTabCompleter(tabCompleter);
                               				}
                               			}
        });
    }

	@Override
	public void onEnable() {
		//Do Something(
		</#if>
		<#if w.hasElementsOfType("procedure") || w.hasElementsOfType("command")>
		${JavaModName}Registers.registerAll(getFile());
		</#if>
	}

    @Override
    public void onDisable() {
    	<#if w.hasElementsOfType("procedure")>HandlerList.unregisterAll(this);</#if>
    }

	public static class MCRLogger{
		private static String toString(Object object){
			if (object instanceof Entity entity){
				return "Entity{Location="+entity.getLocation()+", type="+entity.getClass().getSimpleName()+", customName="+entity.getCustomName()+ ", toString=" + entity + "}";
			} else if (object instanceof Event event) {
				HashMap<String,String> parameters = new HashMap<>();
				var methods = event.getClass().getMethods();
				for (Method method: methods){
					if (!method.getReturnType().equals(Void.TYPE) && method.getParameters().length == 0){
						String value;
						try {
							value = toString(method.invoke(event));
						} catch (IllegalAccessException | InvocationTargetException e) {
							value = e.toString();
						}
						parameters.put(method.getName(),value);
					}
				}
				return parameters.toString();
			}
			return String.valueOf(object);
		}

		public static void info(Object o) {
			INSTANCE.getLogger().info("["+StackWalker.getInstance(StackWalker.Option.RETAIN_CLASS_REFERENCE).getCallerClass()+"]"+ toString(o));
		}
	}
}
<#-- @formatter:on -->