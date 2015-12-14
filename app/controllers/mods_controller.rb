require 'rubygems'
require 'zip'

class ModsController < ApplicationController
	def index
		@mods = Mod.all;
	end

	def new
		@mod = Mod.new;
	end
	
	def create
	  @mod = Mod.new(mod_params)
	  @mod.save
	  redirect_to mods_path
	end
	
	def show
		@mod = Mod.find(params[:id]);
	end
	
	def edit
		@mod = Mod.find(params[:id]);
	end
	
	def update
		@mod = Mod.find(params[:id]);
		
		@mod.update(mod_params)
		redirect_to mod_path(@mod)
	end
	
	def destroy
		@mod = Mod.find(params[:id])
		@mod.destroy
		
		redirect_to mods_path
	end
	
	def download
		mod = Mod.find(params[:id])
		
		t = Tempfile.new("mod-temp-asdf")
		Zip::OutputStream.open(t.path) do |z|
			mod.make_zip(z);
		end
		
		send_file t.path,
			:type => 'application/zip',
			:disposition => 'attachment',
			:filename => mod.name + '.zip';
		
		t.close
	end
	
	private
	  def mod_params
		params.require(:mod).permit(:modid, :name, :author, :description)
	  end
end
