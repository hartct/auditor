module Auditor
  class Engine < Rails::Engine

    config.mount_at = '/auditor'
    config.widget_factory_name = 'Factory Name'
        
  end
end
