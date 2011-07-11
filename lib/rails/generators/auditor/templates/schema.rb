ActiveRecord::Schema.define(:version => 0) do

    create_table :auditor_logs, :force => true do |t|
      t.string    :request_uri
	  t.string    :request_paramaters
      t.string    :remote_address
      t.string    :user_id
      t.datetime  :created_at
    end

end
