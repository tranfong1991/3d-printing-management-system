class Print < ActiveRecord::Base
  enum status: [:pending, :started, :failed, :aborted, :declined, :completed]
end
