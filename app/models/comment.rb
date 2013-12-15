class Comment < ActiveRecord::Base
  belongs_to :parent
  validates :title, presence: true
end
