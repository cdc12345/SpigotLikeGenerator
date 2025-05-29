<#function mappedBlockToBlockStateCode mappedBlock>
	<#-- exclude Material. They don't have the BlockState......-->
	<#if mappedBlock?starts_with("/*@Material*/")>
		<#return mappedBlock>
    <#elseif mappedBlock?starts_with("/*@BlockState*/")>
        <#return mappedBlock?replace("/*@BlockState*/","")>
    <#elseif mappedBlock?contains("/*@?*/")>
        <#assign outputs = mappedBlock?keep_after("/*@?*/")?keep_before_last(")")>
        <#return mappedBlock?keep_before("/*@?*/") + "?" + mappedBlockToBlockStateCode(outputs?keep_before("/*@:*/"))
            + ":" + mappedBlockToBlockStateCode(outputs?keep_after("/*@:*/")) + ")">
    <#else>
        <#return mappedBlockToBlock(mappedBlock) + ".getState()">
    </#if>
</#function>

<#function mappedBlockToBlock mappedBlock>
	<#-- exclude Material. They don't have the Block......-->
	<#if mappedBlock?starts_with("/*@Material*/")>
		<#return mappedBlock>
    <#elseif mappedBlock?starts_with("/*@BlockState*/")>
        <#return mappedBlock?replace("/*@BlockState*/","") + ".getBlock()">
    <#elseif mappedBlock?contains("/*@?*/")>
        <#assign outputs = mappedBlock?keep_after("/*@?*/")?keep_before_last(")")>
        <#return mappedBlock?keep_before("/*@?*/") + "?" + mappedBlockToBlock(outputs?keep_before("/*@:*/"))
            + ":" + mappedBlockToBlock(outputs?keep_after("/*@:*/")) + ")">
    <#else>
        <#return mappedBlock>
    </#if>
</#function>

<#function mappedBlockToBlockType mappedBlock>
	<#if mappedBlock?starts_with("/*@Material*/")>
		<#return mappedBlock?keep_after("/*@Material*/")>
    <#elseif mappedBlock?starts_with("/*@BlockState*/")>
        <#return mappedBlock?replace("/*@BlockState*/","") + ".getType()">
	<#elseif mappedBlock?contains("/*@?*/")>
            <#assign outputs = mappedBlock?keep_after("/*@?*/")?keep_before_last(")")>
            <#return mappedBlock?keep_before("/*@?*/") + "?" + mappedBlockToBlockType(outputs?keep_before("/*@:*/"))
                + ":" + mappedBlockToBlockType(outputs?keep_after("/*@:*/")) + ")">
	<#else>
		<#return mappedBlockToBlock(mappedBlock) + ".getType()">
	</#if>
</#function>

<#function mappedBlockToBlockData mappedBlock>
	<#if mappedBlock?starts_with("/*@Material*/")>
		<#return mappedBlock?keep_after("/*@Material*/") + ".createBlockData()">
    <#elseif mappedBlock?starts_with("/*@BlockState*/")>
        <#return mappedBlock?replace("/*@BlockState*/","") + ".getBlockData()">
	<#elseif mappedBlock?contains("/*@?*/")>
            <#assign outputs = mappedBlock?keep_after("/*@?*/")?keep_before_last(")")>
            <#return mappedBlock?keep_before("/*@?*/") + "?" + mappedBlockToBlockData(outputs?keep_before("/*@:*/"))
                + ":" + mappedBlockToBlockData(outputs?keep_after("/*@:*/")) + ")">
	<#else>
		<#return mappedBlockToBlock(mappedBlock) + ".getBlockData()">
	</#if>
</#function>

<#-- it also convert itemstack to material -->
<#function mappedMCItemToItemStackCode mappedBlock amount=1>
	<#if mappedBlock?starts_with("/*@Material*/")>
		<#return toItemStack(mappedBlock?keep_after("/*@Material*/"),amount)>
    <#elseif mappedBlock?starts_with("/*@ItemStack*/")>
        <#return mappedBlock?replace("/*@ItemStack*/", "")>
    <#elseif mappedBlock?contains("/*@?*/")>
        <#assign outputs = mappedBlock?keep_after("/*@?*/")?keep_before_last(")")>
        <#return mappedBlock?keep_before("/*@?*/") + "?" + mappedMCItemToItemStackCode(outputs?keep_before("/*@:*/"), amount)
            + ":" + mappedMCItemToItemStackCode(outputs?keep_after("/*@:*/"), amount) + ")">
    <#else>
        <#return toItemStack(mappedBlock, amount)>
    </#if>
</#function>

<#function toItemStack item amount>
    <#if amount == 1>
        <#return "new ItemStack(" + item + ")">
    <#else>
        <#return "new ItemStack(" + item + "," + (amount == amount?floor)?then(amount + ")","(int)(" + amount + "))")>
    </#if>
</#function>

<#function mappedElementToRegistryEntry mappedElement>
    <#return JavaModName + generator.isBlock(mappedElement)?then("Blocks", "Items") + "."
    + generator.getRegistryNameFromFullName(mappedElement)?upper_case + transformExtension(mappedElement)?upper_case>
</#function>

<#function transformExtension mappedBlock>
    <#assign extension = mappedBlock?keep_after_last(".")?replace("body", "chestplate")?replace("legs", "leggings")>
    <#return (extension?has_content)?then("_" + extension, "")>
</#function>

<#function enableNMS w>
	<#return w.getWorkspace().getWorkspaceSettings().getMCreatorDependencies().contains("NMS")>
</#function>

<#function mappedMCItemToItemType mappedItem>
	<#if mappedItem?starts_with("/*@Material*/")>
		<#return mappedItem?keep_after("/*@Material*/")>
    <#elseif mappedItem?starts_with("/*@ItemStack*/")>
        <#return mappedItem?replace("/*@ItemStack*/","") + ".getType()">
	<#elseif mappedItem?contains("/*@?*/")>
            <#assign outputs = mappedItem?keep_after("/*@?*/")?keep_before_last(")")>
            <#return mappedItem?keep_before("/*@?*/") + "?" + mappedMCItemToItemType(outputs?keep_before("/*@:*/"))
                + ":" + mappedMCItemToItemType(outputs?keep_after("/*@:*/")) + ")">
	<#else>
		<#return mappedItem + ".getType()">
	</#if>
</#function>

<#function mappedMCItemToRecipeChoice mappedBlock acceptTags=false>
    <#if mappedBlock.getUnmappedValue().startsWith("CUSTOM:")>
    	<#return "Material.AIR">
    <#elseif mappedBlock.getUnmappedValue().startsWith("TAG:")>
        <#if acceptTags>
            <#return "Objects.requireNonNullElse(Bukkit.getTag(\"items\",NamespacedKey.fromString(\"" + mappedBlock.getUnmappedValue().replace("TAG:", "").replace("mod:", modid + ":")?lower_case + "\"),Material.class),Tag.AIR)">
        <#else>
            <#return "Material.AIR">
        </#if>
    <#else>
        <#assign mapped = mappedBlock.getMappedValue(1) />
        <#if mapped.startsWith("#")>
            <#if acceptTags>
                <#return "Objects.requireNonNullElse(Bukkit.getTag(\"items\",NamespacedKey.fromString(\"" + mapped?keep_after("#") + "\"), Material.class),Tag.AIR)">
            <#else>
                <#return "Material.AIR">
            </#if>
        <#elseif mapped.contains(":")>
            <#return "Material.matchMaterial(\""+mapped+"\")">
        <#else>
            <#return "Material.matchMaterial(\"minecraft:" + mapped+"\")">
        </#if>
    </#if>
</#function>

<#function toNMSItem mappedItem>
	<#if mappedItem?starts_with("/*@Material*/")>
		<#return "CraftItemType.bukkitToMinecraft("+mappedItem?keep_after("/*@Material*/") +")">
	<#else>
		<#return mappedItem>
	</#if>
</#function>