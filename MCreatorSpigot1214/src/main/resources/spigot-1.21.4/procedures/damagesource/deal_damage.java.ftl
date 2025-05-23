if (${input$entity} instanceof org.bukkit.entity.Damageable _damage)
	_damage.damage(${opt.toFloat(input$amount)},${input$damagesource});