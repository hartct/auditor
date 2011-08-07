Rails.application.routes.draw do 

  mount_at = Auditor::Engine.config.mount_at

  match mount_at => 'auditor/widgets#index'

  resources :widgets, :only => [ :index, :show ],
                          :controller => "auditor/widgets",
                          :path_prefix => mount_at,
                          :as => "auditor_"

end
