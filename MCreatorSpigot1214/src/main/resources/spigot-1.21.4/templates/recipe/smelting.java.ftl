<#-- @formatter:off -->
<#include "../mcitems.ftl">
package ${package}.recipe;

public class ${name}SmeltingRecipe implements IRecipeProvider {

	@Override public Recipe provide() {
		return new net.minecraft.world.item.crafting.SmeltingRecipe(<#if data.group?has_content>"${data.group}"<#else>""</#if>, net.minecraft.world.item.crafting.CookingBookCategory.${data.cookingBookCategory}, net.minecraft.world.item.crafting.Ingredient.of(${toNMSItem(data.smeltingInputStack)}),
				new net.minecraft.world.item.ItemStack(${toNMSItem(data.smeltingReturnStack)}, 1), ${data.xpReward}, ${data.cookingTime}).toBukkitRecipe(new NamespacedKey("${data.getNamespace()}", "${data.getName()}"));
	}
}
<#-- @formatter:on -->