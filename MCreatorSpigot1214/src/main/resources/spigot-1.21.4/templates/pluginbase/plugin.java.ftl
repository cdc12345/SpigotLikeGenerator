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
        </#if>
    	<#if w.hasElementsOfType("procedure") || w.hasElementsOfType("command")>
    	${JavaModName}Registers.registerAll(getFile());
    	</#if>
    }

	@Override
	public void onEnable() {
		//Do Something(
	}

    @Override
    public void onDisable() {
    	<#if w.hasElementsOfType("procedure")>HandlerList.unregisterAll(this);</#if>
    }

	public static class MCRLogger{
		public static void info(Object o){
			INSTANCE.getLogger().info(String.valueOf(o));
		}
	}
}
<#-- @formatter:on -->