<#-- @formatter:off -->
<#include "../mcitems.ftl">
package ${package}.recipe;

public class ${name}SmokingRecipe implements IRecipeProvider {

	@Override public Recipe provide() {
		var recipe = new SmokingRecipe(new NamespacedKey("${data.getNamespace()}", "${data.getName()}"), ${mappedMCItemToItemStackCode(data.smokingReturnStack)},
               				new RecipeChoice.MaterialChoice(${mappedMCItemToRecipeChoice(data.smokingInputStack,true)}),${data.xpReward},${data.cookingTime});
		recipe.setCategory(CookingBookCategory.${data.cookingBookCategory});
		<#if data.group?has_content>recipe.setGroup("${data.group}");</#if>
		return recipe;
	}
}
<#-- @formatter:on -->