public static double getAttributeValue(Entity entity, Attribute attribute){
	if (entity instanceof LivingEntity _li){
		var attributein = _li.getAttribute(attribute);
		if (attributein != null) {
			return attributein.getValue();
		}
	}
	return 0.0;
}