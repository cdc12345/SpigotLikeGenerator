<#if w.getWorkspace().getWorkspaceSettings().getMCreatorDependencies().contains("NMS")>
(((CraftEntity)${input$entity}).getHandle() instanceof net.minecraft.world.entity.LivingEntity _livEnt${cbi} && _livEnt${cbi}.swinging)
<#else>
(false/*@EnableNMS*/)
</#if>
