class Print < ActiveRecord::Base
  enum status: [:pending, :started, :aborted]
end
