<#-- @formatter:off -->
new BukkitRunnable(){
	@Override public void run() {
		${statement$do}
	}
}.runTaskLater(${JavaModName}.INSTANCE,${opt.toInt(input$ticks)});
<#-- @formatter:on -->