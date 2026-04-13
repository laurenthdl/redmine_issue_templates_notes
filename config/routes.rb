Rails.application.routes.draw do

  resources :issue_templates_notes
  resources :issue_templates_notes_settings do
    collection do
      get :back_partial_init
    end
  end


  match 'issue_templates_notes/:id/edit',
        :controller => 'issue_templates_notes',
        :action => :edit,
        :via => :get

  match 'issue_templates_notes/preview',
        :controller => 'issue_templates_notes',
        :action => 'preview',
        :via => [:get,:post]

  match 'issue_templates_notes/:id/template_send',
        :controller => 'issue_templates_notes',
        :action => 'template_send',
        :via => [:get,:post]

  match 'issue_templates_notes_settings/user_auth',
        :controller => 'issue_templates_notes_settings',
        :action => 'user_auth',
        :via => [:get,:post]

end