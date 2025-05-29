<#-- @formatter:off -->
<#include "../mcitems.ftl">
package ${package}.recipe;

public class ${name}StoneCuttingRecipe implements IRecipeProvider {
	@Override public Recipe provide() {
		var recipe = new StonecuttingRecipe(new NamespacedKey("${data.getNamespace()}", "${data.getName()}"),${mappedMCItemToItemStackCode(data.stoneCuttingReturnStack)},new RecipeChoice.MaterialChoice(${mappedMCItemToRecipeChoice(data.stoneCuttingInputStack,true)}));
		<#if data.group?has_content>recipe.setGroup("${data.group}");</#if>
		return recipe;
	}
}
<#-- @formatter:on -->