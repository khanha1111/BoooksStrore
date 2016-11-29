class Request < ApplicationRecord
  belongs_to :user
  before_save { self.status =false }
end
