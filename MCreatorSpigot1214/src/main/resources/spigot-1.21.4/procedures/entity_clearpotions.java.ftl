if(${input$entity} instanceof LivingEntity _entity)
	_entity.getActivePotionEffects().forEach(_pe -> _entity.removePotionEffect(_pe.getType()));