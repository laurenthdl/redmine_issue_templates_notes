require File.expand_path('../../test_helper', __FILE__)

class HideSubmitButtonScopeTest < ActiveSupport::TestCase
  JS_PATH = File.expand_path(
    '../../../assets/javascripts/redmine_issue_templates_notes.js', __FILE__
  )

  def setup
    @js_source = File.read(JS_PATH)
  end


  def test_hide_submit_selector_should_be_scoped_to_this_plugin_settings_page
    assert_includes @js_source, '#settings.plugin-redmine_issue_templates_notes'
  end


  def test_hide_submit_selector_should_not_match_every_plugin_settings_page
    refute_match(/\$\(\s*["']#settings["']\s*\)\s*\.find\(\s*["']input\[name=commit\]["']/,
                 @js_source)
  end
end
