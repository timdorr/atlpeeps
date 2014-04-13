class User < ActiveRecord::Base
  has_attached_file :image, styles: {full: "500x500#", thumb: "200x200#"}, default_url: "/images/missing.png"

  validates :name, presence: true
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  has_many :identities

  has_one :facebook, -> { where(provider: "facebook") }, class_name: "Identity"
  has_one :twitter,  -> { where(provider: "twitter")  }, class_name: "Identity"
  has_one :github,   -> { where(provider: "github")   }, class_name: "Identity"
end
