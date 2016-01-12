require 'rubygems'
require 'zip'

class ModsController < ApplicationController
	before_action :authenticate_user!

	def index
		@mods = Mod.where(user_id: current_user.id)
	end

	def new
		@mod = Mod.new;
	end
	
	def create
	  @mod = Mod.new(mod_params)
	  @mod.user_id = current_user.id
	  @mod.save
	  redirect_to mods_path
	end
	
	def show
		@mod = Mod.find(params[:id]);
		@author = User.find(@mod.user_id);
		
		#if @author != current_user
		#	flash[:error] = "You're not authorized to view this mod."
		#	redirect_to mods_path
		#end
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
			make_zip(z, mod);
		end
		
		send_file t.path,
			:type => 'application/zip',
			:disposition => 'attachment',
			:filename => mod.name + '.zip';
		
		t.close
	end
	
	def make_zip(zip, mod)
		@javafilepath = "src/main/java/" + mod.package_name.gsub(".", "/") + "/"
		@mod = mod
		@modclassname = mod.name.classify;
		@clientproxyname = "ClientProxy";
		@commonproxyname = "CommonProxy";
		
		@modfile_import_list = [
			"net.minecraftforge.common.config.Configuration",
			"net.minecraftforge.fml.common.event.FMLInitializationEvent",
			"net.minecraftforge.fml.common.event.FMLPostInitializationEvent",
			"net.minecraftforge.fml.common.event.FMLPreInitializationEvent",
			"net.minecraftforge.fml.common.Mod",
			"net.minecraftforge.fml.common.Mod.EventHandler",
			"net.minecraftforge.fml.common.Mod.Instance",
			"net.minecraftforge.fml.common.SidedProxy"
		]
		
		zip.put_next_entry(@javafilepath + @modclassname + ".java");
		zip.puts(render_to_string "java_modfile.java", :layout => false)
		
		zip.put_next_entry(@javafilepath + "client/ClientProxy.java");
		zip.puts(render_to_string "java_clientproxy.java", :layout => false)
		
		zip.put_next_entry(@javafilepath + "CommonProxy.java");
		zip.puts(render_to_string "java_commonproxy.java", :layout => false)
	end
	
	private
	  def mod_params
		params.require(:mod).permit(:modid, :name, :description, :version_number, :package_name)
	  end
end
