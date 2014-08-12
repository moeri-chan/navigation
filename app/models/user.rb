class User < ActiveRecord::Base
  include Mongoid::Document
  has_secure_password
  field :name
  validates_presence_of :name
  validates_presence_of :password_digest
end
