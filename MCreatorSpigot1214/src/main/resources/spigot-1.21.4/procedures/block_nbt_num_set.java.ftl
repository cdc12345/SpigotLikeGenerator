<#include "mcelements.ftl">
{
	Block block = world.getBlockAt(${toBlockPos(input$x,input$y,input$z)});
	if (block.getState() instanceof TileState tileState){
			tileState.getPersistentDataContainer().set(NamespacedKey.fromString(${input$tagName}),PersistentDataType.DOUBLE,${input$tagValue});
			tileState.update();
	}
}

