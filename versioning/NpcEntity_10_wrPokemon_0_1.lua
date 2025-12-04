require "/scripts/versioningutils.lua"

local oldIdMap = {
	["wr/nickit"] = "wr/nickit_anthro",
}
function update(diskStore)
	if oldIdMap[diskStore.npcVariant.species:lower()] then
		diskStore.npcVariant.species = oldIdMap[diskStore.npcVariant.species:lower()]
	end
	if oldIdMap[diskStore.npcVariant.humanoidIdentity.species:lower()] then
		diskStore.npcVariant.humanoidIdentity.species = oldIdMap[diskStore.npcVariant.humanoidIdentity.species:lower()]
	end
	local overrideSpecies = sb.jsonQuery(diskStore.npcVariant, "overrides.identity.species")
	if overrideSpecies then
		if oldIdMap[overrideSpecies:lower()] then
			diskStore.npcVariant.overrides.identity.species = oldIdMap[overrideSpecies:lower()]
		end
	end

	return diskStore
end
