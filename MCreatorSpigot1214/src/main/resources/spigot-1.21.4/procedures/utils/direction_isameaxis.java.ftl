public static boolean isInSameAxis(BlockFace face,BlockFace other){
	return face.getOppositeFace() == other || face == other;
}