public static boolean isDay(World world) {
    long time = world.getTime();
    return time < 12300 || time > 23850;
}