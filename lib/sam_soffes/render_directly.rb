class RenderDirectly < ActionController::Base
  include ActionController::Rendering
  include AbstractController::Layouts
   
  append_view_path Rails.root.join("app", "views").to_s 
  layout "application"
 
  def index
    render *env["generic_views.render_args"]
  end
end
 
module GenericActions  
  module Render
    def render(*args)
      app = RenderDirectly.action(:index)
      lambda do |env|
        env["generic_views.render_args"] = args
        app.call(env)
      end
    end
  end
end
