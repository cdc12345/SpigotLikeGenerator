private static double getAttributeBaseValue(Entity entity, Attribute attribute){
	if (entity instanceof LivingEntity _li){
		var attributein = _li.getAttribute(attribute);
		if (attributein != null) {
			return attributein.getBaseValue();
		}
	}
	return 0.0;
}
