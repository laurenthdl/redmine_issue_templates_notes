class IssueTemplatesNotesSettingsController < ApplicationController
  before_action :require_login
  before_action :require_admin

  def back_partial_init
    render :partial => "redmine_notes"
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
        redirect_to controller: 'issue_templates_notes_settings', action: "back_partial_init"
      else
        @issue_templates_notes_setting.update!(user_auth: ['0'])
        flash[:notice] = l(:notice_successful_update)
        redirect_to controller: 'issue_templates_notes_settings', action: "back_partial_init"
      end
    end
  end
end
