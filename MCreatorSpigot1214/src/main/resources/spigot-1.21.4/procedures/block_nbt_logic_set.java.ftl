<#include "mcelements.ftl">
{
	Block block = world.getBlockAt(${toBlockPos(input$x,input$y,input$z)});
	final var value = ${input$tagValue};
	block.removeMetadata(${input$tagName},${JavaModName}.INSTANCE);
	block.setMetadata(${input$tagName}, new MetadataValueAdapter(${JavaModName}.INSTANCE) {
				@Nullable @Override public Object value() {
					return value;
				}

				@Override public void invalidate() {

				}
	});
}