<#if w.getWorkspace().getWorkspaceSettings().getMCreatorDependencies().contains("NMS")>
/*@int*/(((CraftWorld)world).getHandle().dimensionType().moonPhase(world.getTime()))
<#else>
(0/*@EnableNMS*/)
</#if>