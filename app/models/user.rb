class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name
  field :password_digest
  has_secure_password
  validates_presence_of :name
  validates_presence_of :password_digest
end
