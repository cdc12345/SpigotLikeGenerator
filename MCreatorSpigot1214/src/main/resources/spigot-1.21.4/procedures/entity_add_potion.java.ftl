if(${input$entity} instanceof LivingEntity _entity)
	_entity.addPotionEffect(new PotionEffect(${generator.map(field$potion, "effects")}, (int) ${input$duration}, (int) ${input$level}));