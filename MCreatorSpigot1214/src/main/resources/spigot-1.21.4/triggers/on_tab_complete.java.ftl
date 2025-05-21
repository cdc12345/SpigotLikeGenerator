<#include "procedures.java.ftl">
<#assign commandlabel = name?lower_case?replace("tabcompleter","")?replace("completer","")>
@CommandLabel(value = "${commandlabel}", priority = EventPriority.LOW)
public class ${name}Procedure implements TabCompleter {
	public List<String> onTabComplete(@NotNull CommandSender sender, @NotNull Command command, @NotNull String label,
			@NotNull String[] args) {
		if(!sender.hasPermission("${commandlabel}.use")) {
			return List.of();
		}
		ArrayList<String> complete = new ArrayList<>();
		Player completer = (Player) java.lang.reflect.Proxy.newProxyInstance(this.getClass().getClassLoader(), new Class[] { Player.class },
				(proxy, method, args1) -> {
					if (method.getName().equals("sendMessage")) {
						for (Object o : args1) {
							complete.add(Objects.toString(o));
						}
					}
					return Optional.empty();
		});
		double x = 0;
		double y = 0;
		double z = 0;
		Entity entity = null;
		World world = null;
		if (sender instanceof Entity) {
			entity = (Entity) sender;
			x = entity.getLocation().getX();
			y = entity.getLocation().getX();
			z = entity.getLocation().getX();
			world = entity.getWorld();
		} else if (sender instanceof BlockCommandSender) {
			x = ((BlockCommandSender) sender).getBlock().getLocation().getX();
			y = ((BlockCommandSender) sender).getBlock().getLocation().getX();
			z = ((BlockCommandSender) sender).getBlock().getLocation().getX();
			world = ((BlockCommandSender) sender).getBlock().getWorld();
		}
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
			"cmd": "label",
			"length": "args.length",
			"lastarg": "args[args.length - 1]",
			"entity": "entity",
			"completer": "completer",
			"world": "world",
			"x": "x",
			"y": "y",
			"z": "z",
			"event": "null"
			}/>
		</#compress></#assign>
		execute(null<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		return complete;
	}