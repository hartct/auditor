Rails.application.routes.draw do |map|

  mount_at = Auditor::Engine.config.mount_at

  match mount_at => 'auditor/widgets#index'

  map.resources :widgets, :only => [ :index, :show ],
                          :controller => "auditor/widgets",
                          :path_prefix => mount_at,
                          :name_prefix => "auditor_"

end
