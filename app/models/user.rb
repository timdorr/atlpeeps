class User < ActiveRecord::Base
  has_attached_file :image,
                    styles: {full: "500x500#", thumb: "200x200#"},
                    convert_options: { full: "-quality 90", thumb: "-quality 90" },
                    default_url: "/images/missing.png"

  validates :name, presence: true
  validates :website,
            presence: true,
            format: {
                with:  /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/,
                message:  "isn't a valid URL",
                multiline: true }
  validate :validate_categories

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  has_many :identities

  has_one :facebook, -> { where(provider: "facebook") }, class_name: "Identity"
  has_one :twitter,  -> { where(provider: "twitter")  }, class_name: "Identity"
  has_one :github,   -> { where(provider: "github")   }, class_name: "Identity"

  scope :published,  -> { where(published: true, approved: true) }
  scope :unapproved, -> { where(approved: false) }

  CATEGORIES = %w{Blogger Photographer Developer Designer Copywriter Entrepreneur SEO Artist Musician Writer CEO Investor Researcher}

  def validate_categories
    if categories && categories.size > 3
      errors.add(:cateories, "- Too many categories selected.")
    end

    if categories.blank?
      errors.add(:cateories, "must have at least one selected")
    else
      categories.each do |category|
        unless category.empty? || CATEGORIES.include?(category)
          errors.add(:cateories, "contains an invalid category (#{category})")
        end
      end
    end
  end
end