<#-- @formatter:off -->
<#include "../mcitems.ftl">
package ${package}.recipe;

import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.inventory.*;
import org.bukkit.inventory.recipe.CraftingBookCategory;

public class ${name}CraftRecipe implements IRecipeProvider {

	@Override public Recipe provide() {

		<#if data.recipeShapeless>
			ShapelessRecipe recipe = new ShapelessRecipe(new NamespacedKey("${data.getNamespace()}", "${data.getName()}"), new ItemStack(${data.recipeReturnStack},${data.recipeRetstackSize}));
		<#else>
			ShapedRecipe recipe = new ShapedRecipe(new NamespacedKey("${data.getNamespace()}", "${data.getName()}"), new ItemStack(${data.recipeReturnStack},${data.recipeRetstackSize}));
		</#if>

		<#if data.group?has_content>recipe.setGroup("${data.group}");</#if>
		recipe.setCategory(CraftingBookCategory.${data.craftingBookCategory});

		<#if data.recipeShapeless>
			  <#list data.recipeSlots as element>
				  <#if !element.isEmpty()>
					  recipe1.addIngredient(new RecipeChoice.MaterialChoice(${mappedMCItemToRecipeChoice(element,true)}));
				  </#if>
			  </#list>
        <#else>
			<#assign recipeArray = data.getOptimisedRecipe()>
			<#assign patternKeys = data.getPatternKeys()>
			recipe.shape(
			<#list recipeArray as rl>
				"<#list rl as re><#if !re.isEmpty()>${patternKeys.get(re)}<#else> </#if></#list>"<#sep>,
			</#list>
			);
			<#list patternKeys.keySet() as item>
				recipe.setIngredient('${patternKeys.get(item)}', new RecipeChoice.MaterialChoice(${mappedMCItemToRecipeChoice(item,true)}));
			</#list>
        </#if>
		return recipe;
	}
}
<#-- @formatter:on -->