def override_asset_packager
  Synthesis::AssetPackage.class_eval do    
   private
   def create_new_build
     new_path = $mega_asset_base_path ? $mega_asset_base_path : @asset_path
     new_build_path = "#{new_path}/#{@target}_packaged.#{@extension}"
     if File.exists?(new_build_path)
       log "Latest version already exists: #{new_build_path}"
     else
       File.open(new_build_path, "w") {|f| f.write(compressed_file) }
       log "Created #{new_build_path}"
     end
   end 
  end
end