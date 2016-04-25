class Print < ActiveRecord::Base

  enum status: [:pending, :started, :aborted, :declined, :canceled, :completed]

end
