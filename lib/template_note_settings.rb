class TemplateNoteSettings
  def authorized_users
    setting = IssueTemplateNoteSetting.find_by(id: 1)
    setting&.user_auth || []
  rescue ActiveRecord::StatementInvalid
    []
  end
end