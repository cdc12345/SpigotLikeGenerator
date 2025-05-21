<#include "mcelements.ftl">
//drop location: ${toBlockPos(input$x2,input$y2,input$z2)}
world.getBlockAt(${toBlockPos(input$x,input$y,input$z)}).breakNaturally();