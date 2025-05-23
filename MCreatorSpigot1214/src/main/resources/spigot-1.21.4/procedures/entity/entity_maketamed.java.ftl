if (${input$entity} instanceof Tameable _tamable && ${input$sourceentity} instanceof AnimalTamer _owner){
			_tamable.setTamed(true);
			_tamable.setOwner(_owner);
}