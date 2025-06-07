<#include "mcelements.ftl">
<@addTemplate file="utils/world/execute_command_result.java.ftl"/>
(executeCommandGetResult(world, ${toBlockPos(input$x, $input$y, $input$z)}, ${input$command}))