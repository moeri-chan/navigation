class Link
  include Mongoid::Document
  field :title
  field :url
  validates_presence_of :title
  validates_presence_of :url
end
