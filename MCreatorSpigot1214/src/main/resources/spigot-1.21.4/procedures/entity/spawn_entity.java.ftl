<#assign entity = generator.map(field$entity, "entities", 1)!"null">
<#if entity != "null">
	world.spawnEntity(new Location(world, ${input$x}, ${input$y}, ${input$z}), ${entity});
</#if>