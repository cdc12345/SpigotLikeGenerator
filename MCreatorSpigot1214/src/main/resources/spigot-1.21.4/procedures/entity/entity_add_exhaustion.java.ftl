if (${input$entity} instanceof HumanEntity _humanEntity)
		_humanEntity.setExhaustion(_humanEntity.getExhaustion()+${opt.toFloat(input$amount)});