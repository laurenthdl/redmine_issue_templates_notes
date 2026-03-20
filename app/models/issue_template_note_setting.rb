class IssueTemplateNoteSetting < ActiveRecord::Base
  serialize :user_auth, type: Array

  validates :user_auth, presence: true, if: :user_auth?
end
