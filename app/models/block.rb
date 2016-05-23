class Block < ActiveRecord::Base
	belongs_to :mod

	enum harvest_tool: [:pickaxe, :axe, :shovel]
	enum creative_tab: [:tabBlock, :tabDecorations, :tabRedstone, :tabTransport, :tabMisc, :tabFood, :tabTools, :tabCombat, :tabBrewing, :tabMaterials]
	enum step_sound: [:woodSound, :groundSound, :plantSound, :stoneSound, :metalSound, :glassSound, :clothSound, :sandSound, :snowSound, :ladderSound, :anvilSound, :slimeSound]
	enum material: [:air, :grass, :ground, :wood, :rock, :iron, :anvil, :water, :lava, :leaves, :plants, :vine, :sponge, :cloth, :fire, :sand, :circuits, :carpet, :glass, :redstoneLight, :tnt, :coral, :ice, :packedIce, :snow, :craftedSnow, :cactus, :clay, :gourd, :dragonEgg, :portal, :cake, :web]

	has_attached_file :texture
	validates_attachment :texture, content_type: { content_type: "image/png" }
end
