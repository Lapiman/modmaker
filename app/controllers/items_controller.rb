class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end
	
	def create
		@mod = Mod.find(params[:mod_id])
		@item = @mod.items.create!(item_params)
		
		redirect_to mod_path(@mod)
	end
	
	def show
		@item = Item.find(params[:id])
	end
	
	def edit
		@item = Item.find(params[:id])
		@mod = Mod.find(params[:mod_id])
	end
	
	def update
		@item = Item.find(params[:id])
		@mod = Mod.find(params[:mod_id])
		
		@item.update(item_params)
		redirect_to mod_path(@mod)
	end
	
	def destroy
		@item = Item.find(params[:id])
		@mod = Mod.find(params[:mod_id])
		@item.destroy

		redirect_to mod_path(@mod)
	end
	
	private
	  def item_params
		params.require(:item).permit(:itemid, :name, :max_stack_size, :creative_tab, :texture)
	  end
end
