<#include "mcelements.ftl">
(world.getBlockState(${toBlockPos(input$x,input$y,input$z)}).getBlockData().isFaceSturdy(${input$direction}),BlockSupport.FULL)