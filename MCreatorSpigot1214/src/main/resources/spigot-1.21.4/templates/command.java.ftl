<#--
 # This file is part of Spigot-Generator-MCreator.
 # Copyright (C) 2020-2023, Goldorion, opensource contributors
 #
 # Spigot-Generator-MCreator is free software: you can redistribute it and/or modify
 # it under the terms of the GNU Lesser General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 # Spigot-Generator-MCreator is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 # GNU Lesser General Public License for more details.
 #
 # You should have received a copy of the GNU Lesser General Public License
 # along with Spigot-Generator-MCreator.  If not, see <https://www.gnu.org/licenses/>.
-->
<#-- @formatter:off -->
<#include "procedures.java.ftl">

package ${package}.commands;

import org.bukkit.command.Command;
import org.bukkit.entity.Entity;

@CommandLabel("${data.commandName}")
public class ${name} implements CommandExecutor, TabCompleter {

	private int parameterIndex = 0;

	@Override
	public boolean onCommand(CommandSender sender, Command cmd, String label, String[] args) {
		if(label.equalsIgnoreCase("${data.commandName}") && sender.hasPermission("${data.commandName}.use")) {
			parameterIndex = 0;

			<#if argscode?contains("location_x")>double location_x = 0;</#if>
			<#if argscode?contains("location_y")>double location_y = 0;</#if>
			<#if argscode?contains("location_z")>double location_z = 0;</#if>
			<#if argscode?contains("entity")>Entity entity = null;</#if>
			<#if argscode?contains("world")>World world = null;</#if>
			if (sender instanceof Entity _entity) {
				<#if argscode?contains("entity")>entity = _entity;</#if>
				<#if argscode?contains("location_x")>location_x = _entity.getLocation().getX();</#if>
				<#if argscode?contains("location_y")>location_y = _entity.getLocation().getX();</#if>
				<#if argscode?contains("location_z")>location_z = _entity.getLocation().getX();</#if>
				<#if argscode?contains("world")>world = _entity.getWorld();</#if>
			} else if (sender instanceof BlockCommandSender _sender) {
				<#if argscode?contains("location_x")>location_x = _sender.getBlock().getLocation().getX();</#if>
				<#if argscode?contains("location_y")>location_y = _sender.getBlock().getLocation().getX();</#if>
				<#if argscode?contains("location_z")>location_z = _sender.getBlock().getLocation().getX();</#if>
				<#if argscode?contains("world")>world = _sender.getBlock().getWorld();</#if>
			}

			<#if argscode?contains("cmdparams")>
			HashMap<String, String> cmdparams = new HashMap<>();
			Arrays.stream(args).forEach(param -> {
				if(parameterIndex >= 0)
					cmdparams.put(Integer.toString(parameterIndex), param);
				parameterIndex++;
			});
			parameterIndex = 0;
			</#if>

			HashMap<String,Object> arguments = new HashMap<>();

			${argscode}
			return true;
		}
		return false;
	}

	${extra_templates_code}

	@Nullable @Override
	public List<String> onTabComplete(@NotNull CommandSender sender, @NotNull Command command, @NotNull String label,
			@NotNull String[] args) {
		return List.of();
	}
}
<#-- @formatter:on -->
