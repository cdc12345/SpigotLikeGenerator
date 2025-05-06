<#function toResourceLocation string>
    <#if string?matches('"[^+]*"')>
        <#return "NamespacedKey.fromString(" + string?lower_case + ")">
    <#else>
        <#return "NamespacedKey.fromString((" + string + ").toLowerCase(java.util.Locale.ENGLISH))">
    </#if>
</#function>

<#function toAxis direction>
    <#if (direction == "Direction.EAST") || (direction == "Direction.WEST")>
        <#return "\"X\"">
    <#elseif (direction == "Direction.UP") || (direction == "Direction.DOWN")>
        <#return "\"Y\"">
    <#elseif (direction == "Direction.NORTH") || (direction == "Direction.SOUTH")>
        <#return "\"Z\"">
    <#else>
        <#return "\"UNKNOWN\"">
    </#if>
</#function>

<#function toArmorSlot slot>
    <#if slot == "/*@int*/0">
        <#return "EquipmentSlot.FEET">
    <#elseif slot == "/*@int*/1">
        <#return "EquipmentSlot.LEGS">
    <#elseif slot == "/*@int*/2">
        <#return "EquipmentSlot.CHEST">
    <#elseif slot == "/*@int*/3">
        <#return "EquipmentSlot.HEAD">
    <#else>
        <#return "EquipmentSlot.HAND">
    </#if>
</#function>

<#function toBlockPos x y z world="world">
    <#return "new Location(" + world + "," + opt.removeParentheses(x) + "," + opt.removeParentheses(y) + "," + opt.removeParentheses(z) +")">
</#function>