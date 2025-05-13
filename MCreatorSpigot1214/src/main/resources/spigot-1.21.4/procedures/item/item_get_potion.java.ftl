<@addTemplate file="utils/item/potion_itemstack_create.java.ftl"/>
/*@ItemStack*/(getPotionItemStack(Material.${field$type},${generator.map(field$potion, "potions")}))