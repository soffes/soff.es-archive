require 'test_helper'
require 'mocha'

class HerokuAssetPackagerTest < Test::Unit::TestCase
  def test_css_call
    env = {"REQUEST_PATH" => "/stylesheets/test_packaged.css"}

    app = mock()
    Synthesis::AssetPackage.expects(:build_all)
    hap = HerokuAssetPackager.new(app)

    assert !$mega_asset_base_path.nil?
    hap.expects(:render_css)

    hap.call(env)
  end

  def test_js_call
    env = {"REQUEST_PATH" => "/javascripts/test_packaged.js"}

    app = mock()
    
    Synthesis::AssetPackage.expects(:build_all)
    hap = HerokuAssetPackager.new(app)

    assert_equal false, $mega_asset_base_path.nil?
    hap.expects(:render_js)

    hap.call(env)
  end
  
  def test_regular_js_call
    env = {"REQUEST_PATH" => "/javascripts/test.js"}

    app = mock()
    app.expects(:call).with(env)
    
    Synthesis::AssetPackage.expects(:build_all)
    hap = HerokuAssetPackager.new(app)
    
    hap.call(env)
  end
  
  def test_regular_js_call
    env = {"REQUEST_PATH" => "/stylesheets/test.css"}

    app = mock()
    app.expects(:call).with(env)
    
    Synthesis::AssetPackage.expects(:build_all)
    hap = HerokuAssetPackager.new(app)
    
    hap.call(env)
  end
  
end