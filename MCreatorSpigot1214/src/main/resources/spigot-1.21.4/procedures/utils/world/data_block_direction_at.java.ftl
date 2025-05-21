private static net.minecraft.core.Direction getBlockDirection(ServerLevel world, net.minecraft.core.BlockPos pos) {
		net.minecraft.world.level.block.state.BlockState blockState = world.getBlockState(pos);
		net.minecraft.world.level.block.state.properties.Property<?> property = blockState.getBlock()
				.getStateDefinition().getProperty("facing");
		if (property != null && blockState.getValue(property) instanceof net.minecraft.core.Direction direction)
			return direction;
		else if (blockState.hasProperty(net.minecraft.world.level.block.state.properties.BlockStateProperties.AXIS))
			return net.minecraft.core.Direction.fromAxisAndDirection(blockState.getValue(net.minecraft.world.level.block.state.properties.BlockStateProperties.AXIS),
					net.minecraft.core.Direction.AxisDirection.POSITIVE);
		else if (blockState.hasProperty(
				net.minecraft.world.level.block.state.properties.BlockStateProperties.HORIZONTAL_AXIS))
			return net.minecraft.core.Direction.fromAxisAndDirection(
					blockState.getValue(BlockStateProperties.HORIZONTAL_AXIS),
					net.minecraft.core.Direction.AxisDirection.POSITIVE);
		return net.minecraft.core.Direction.NORTH;
}