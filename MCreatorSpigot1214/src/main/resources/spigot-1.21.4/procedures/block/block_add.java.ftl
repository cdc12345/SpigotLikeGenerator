<#include "mcelements.ftl">
<#include "mcitems.ftl">
world.setBlockData(${toBlockPos(input$x,input$y,input$z)},${mappedBlockToBlockData(input$block)});