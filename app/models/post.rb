class Post
  include Mongoid::Document
  field :title
  field :content
  validates_presence_of :title
  embeds_many :posts
  belongs_to :post
end
