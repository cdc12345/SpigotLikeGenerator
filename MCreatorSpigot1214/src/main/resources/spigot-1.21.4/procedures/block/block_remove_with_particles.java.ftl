<#include "mcelements.ftl">
world.getBlockAt(${toBlockPos(input$x,input$y,input$z)}).breakNaturally(true)