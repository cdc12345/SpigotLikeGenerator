<#-- @formatter:off -->
<#include "../mcitems.ftl">
package ${package}.recipe;

public class ${name}BlastingRecipe implements IRecipeProvider {

	@Override public Recipe provide() {
		var recipe = new BlastingRecipe(new NamespacedKey("${data.getNamespace()}", "${data.getName()}"), ${mappedMCItemToItemStackCode(data.blastingReturnStack)},
               				new RecipeChoice.MaterialChoice(${mappedMCItemToRecipeChoice(data.blastingInputStack,true)}),${data.xpReward},${data.cookingTime});
		recipe.setCategory(CookingBookCategory.${data.cookingBookCategory});
		<#if data.group?has_content>recipe.setGroup("${data.group}");</#if>
		return recipe;
	}
}
<#-- @formatter:on -->