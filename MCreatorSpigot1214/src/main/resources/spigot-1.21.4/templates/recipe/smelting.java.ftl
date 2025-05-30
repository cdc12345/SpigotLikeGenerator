<#-- @formatter:off -->
<#include "../mcitems.ftl">
package ${package}.recipe;

public class ${name}SmeltingRecipe implements IRecipeProvider {

	@Override public Recipe provide() {
		var recipe = new FurnaceRecipe(new NamespacedKey("${data.getNamespace()}", "${data.getName()}"), ${mappedMCItemToItemStackCode(data.smeltingReturnStack)},
							new RecipeChoice.MaterialChoice(${mappedMCItemToRecipeChoice(data.smeltingInputStack,true)}),${data.xpReward},${data.cookingTime});
		recipe.setCategory(CookingBookCategory.${data.cookingBookCategory});
		<#if data.group?has_content>recipe.setGroup("${data.group}");</#if>
		return recipe;
	}
}
<#-- @formatter:on -->