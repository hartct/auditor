module Auditor
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'application_controller'
end

module ActionController
	module Auditor
		def self.included(base)
			base.extend(ClassMethods)
		end
    
		module ClassMethods
			def is_audited
				include ActionController::Auditor::InstanceMethods
				before_filter :audit_request
			end
		end

		module InstanceMethods
			def audit_request
				a = ::Auditor::AuditorLog.new
				a.request_uri = request.url
				a.request_parameters = request.filtered_parameters.inspect
				a.remote_address = request.remote_ip
				a.user_id = ::Auditor::Engine::config.user_id.call(request)
				a.save!
			end
		end
	end
end

ActionController::Base.send(:include, ActionController::Auditor)
