private static int getEntityScore(String score, Entity entity){
	if (_ent instanceof Player player) {
		Scoreboard _sc = _player.getScoreboard();
		Objective _so = _sc.getObjective(score);
		if (_so != null) {
			return _so.getScore(_player.getPlayerListName()).getScore();
		}
	}
	return 0;
}
