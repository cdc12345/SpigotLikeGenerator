<#-- @formatter:off -->
package ${package}.network;

import ${package}.${JavaModName};

public class ${JavaModName}Variables {

	<#if w.hasVariablesOfScope("GLOBAL_SESSION")>
		<#list variables as var>
			<#if var.getScope().name() == "GLOBAL_SESSION">
				<@var.getType().getScopeDefinition(generator.getWorkspace(), "GLOBAL_SESSION")['init']?interpret/>
			</#if>
		</#list>
	</#if>

	<#if w.hasVariablesOfScope("GLOBAL_WORLD") || w.hasVariablesOfScope("GLOBAL_MAP")>
    	public static class WorldVariables {

    		<#list variables as var>
    			<#if var.getScope().name() == "GLOBAL_WORLD">
    				<@var.getType().getScopeDefinition(generator.getWorkspace(), "GLOBAL_WORLD")['init']?interpret/>
    			</#if>
    		</#list>
    	}
		public static class MapVariables{

			<#list variables as var>
				<#if var.getScope().name() == "GLOBAL_MAP">
					<@var.getType().getScopeDefinition(generator.getWorkspace(), "GLOBAL_MAP")['init']?interpret/>
				</#if>
			</#list>
		}
    </#if>
}
<#-- @formatter:on -->