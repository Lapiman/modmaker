class Block < ActiveRecord::Base
  belongs_to :mod

  enum harvest_tool: [:pickaxe, :axe, :shovel]
end
