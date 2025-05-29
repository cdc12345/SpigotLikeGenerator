<#-- @formatter:off -->
<#include "../mcitems.ftl">
package ${package}.recipe;

public class ${name}CampfireRecipe implements IRecipeProvider {

	@Override public Recipe provide() {
		var recipe = new CampfireRecipe(new NamespacedKey("${data.getNamespace()}", "${data.getName()}"), ${mappedMCItemToItemStackCode(data.campfireCookingReturnStack)},
               				new RecipeChoice.MaterialChoice(${mappedMCItemToRecipeChoice(data.campfireCookingInputStack,true)}),${data.xpReward},${data.cookingTime});
		recipe.setCategory(CookingBookCategory.${data.cookingBookCategory});
		<#if data.group?has_content>recipe.setGroup("${data.group}");</#if>
		return recipe;
	}
}
<#-- @formatter:on -->