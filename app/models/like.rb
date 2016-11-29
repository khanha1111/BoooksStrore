class Like < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true
  validates_uniqueness_of :target_id, :scope => :user_id
end
