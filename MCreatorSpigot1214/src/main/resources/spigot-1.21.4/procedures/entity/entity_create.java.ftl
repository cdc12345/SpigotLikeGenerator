<#assign entity = generator.map(field$entity, "entities", 1)!"null">
<#if entity != "null">
(world.createEntity(new Location(null,0,0,0),${entity}.getEntityClass()))
<#else>
(null)
</#if>