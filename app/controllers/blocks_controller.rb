class BlocksController < ApplicationController
	def index
		@blocks = Block.all;
	end

	def new
		@block = Block.new;
		@harvest_tools = Block.harvest_tools
	end
	
	def create
		@mod = Mod.find(params[:mod_id]);
		@block = @mod.blocks.create(block_params)
		
		redirect_to mod_path(@mod)
	end
	
	def show
		@block = Block.find(params[:id])
	end
	
	def edit
		@block = Block.find(params[:id]);
		@mod = Mod.find(params[:mod_id]);
	end
	
	def update
		@block = Block.find(params[:id]);
		@mod = Mod.find(params[:mod_id]);
		
		@block.update(block_params)
		redirect_to mod_path(@mod)
	end
	
	def destroy
		@block = Block.find(params[:id])
		@mod = Mod.find(params[:mod_id]);
		@block.destroy
		
		redirect_to mod_path(@mod)
	end
	
	private
	  def block_params
		params.require(:block).permit(:blockid, :name)
	  end
end
