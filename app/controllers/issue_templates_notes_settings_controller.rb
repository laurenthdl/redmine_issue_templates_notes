class IssueTemplatesNotesSettingsController < ApplicationController
  layout 'admin'

  before_action :require_login
  before_action :require_admin

  def back_partial_init
    redirect_to plugin_settings_path(:redmine_issue_templates_notes)
  end

  def new
    @issue_templates_notes_setting = IssueTemplateNoteSetting.new
  end

  def user_auth
    @issue_templates_notes_setting = IssueTemplateNoteSetting.find_or_create_by(id: 1) do |s|
      s.user_auth = ['0']
    end
    if request.post?
      if params[:activated].present?
        saved = @issue_templates_notes_setting[:user_auth] || []
        activated_ids = params[:activated]
        delete_ids = params[:seen] - activated_ids
        saved += activated_ids - saved
        saved -= delete_ids
        @issue_templates_notes_setting.update!(user_auth: saved)
        flash[:notice] = l(:notice_successful_update)
      else
        @issue_templates_notes_setting.update!(user_auth: ['0'])
        flash[:notice] = l(:notice_successful_update)
      end
      redirect_to plugin_settings_path(:redmine_issue_templates_notes)
    end
  end
end
