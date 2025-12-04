local animationRate = 1
local old = {
	update = update or function () end,
	die = die or function () end
}

function update(dt)
	old.update(dt)
	local phase = world.warpPhase()
	local flying = world.flyingType()
	if flying == "none" then
		if animationRate > 1 then
			animationRate = math.max(1, animationRate - 1 *dt)
		end
	elseif phase == "speedingup" then
		animationRate = math.min(3, animationRate + 1 *dt)
	elseif phase == "slowingdown" then
		animationRate = math.max(1, animationRate - 1 *dt)
	end

	animator.setAnimationRate(animationRate)
end
