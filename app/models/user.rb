class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :identities

  has_one :facebook, -> { where(provider: "facebook") }, class_name: "Identity"
  has_one :twitter,  -> { where(provider: "twitter")  }, class_name: "Identity"
  has_one :github,   -> { where(provider: "github")   }, class_name: "Identity"
end
