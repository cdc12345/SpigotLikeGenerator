<#if !input$entity?starts_with("/*@Player*/")>
(${input$entity}.getName())
<#else>
(${input$entity} instanceof Player _player${cbi}) ? _player${cbi}.getName() : ${input$entity}.getCustomName())
</#if>
