class HerokuAssetPackager
  @@regex_pattern = /\/\w+\/(.*)_packaged.*/i
  
  def initialize_asset_packager
    override_asset_packager
    # Make dirs
    unless File.directory? heroku_file_location
      Dir.mkdir(heroku_file_location)
    end
    
    # Set asset base path
    # TODO: Check to see if this is a globally used thing?
    $mega_asset_base_path = heroku_file_location
    Synthesis::AssetPackage.build_all
    
  end
  
  def initialize(app)
    @app = app
    initialize_asset_packager if ENV["HEROKU"]
  end
  
  def call(env)
    @env = env
    if ENV["HEROKU"]
      return render_css if env['REQUEST_PATH'] =~ /\/stylesheets\/.*_packaged.css/i
      return render_js if env['REQUEST_PATH'] =~ /\/javascripts\/.*_packaged.js/i
    end
    
    @app.call(env)
  end
  
  def render_js
        file_name = @@regex_pattern.match(@env['REQUEST_PATH'])[1]
        
        file = "#{heroku_file_location}/#{file_name}_packaged.js"
        [
    			200,
    			{
    				'Cache-Control'  => 'public, max-age=86400',
    				'Content-Length' => File.size(file).to_s,
    				'Content-Type'   => 'text/javascript'
    			},
    			File.read(file)
    		]
  end
  
  def render_css
    file_name = @@regex_pattern.match(@env['REQUEST_PATH'])[1]
    file = "#{heroku_file_location}/#{file_name}_packaged.css"
        [
    			200,
    			{
    				'Cache-Control'  => 'public, max-age=86400',
    				'Content-Length' => File.size(file).to_s,
    				'Content-Type'   => 'text/css'
    			},
    			File.read(file)
    		]
  end
  
  def heroku_file_location
    "#{RAILS_ROOT}/tmp/asset_packager"
  end
end