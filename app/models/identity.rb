class Identity < ActiveRecord::Base
  belongs_to :user

  serialize :info, JSON
  serialize :extra, JSON

  def self.first_or_create_with_omniauth(auth)
    where(uid: auth['uid'], provider: auth['provider']).first_or_create(info: auth['info'], extra: auth['extra'])
  end

  def provider_title
    case provider
      when "facebook"
        "Facebook"
      when "twitter"
        "Twitter"
      when "github"
        "GitHub"
    end
  end

  def name
    info["name"]
  end

  def image
    case provider
      when "facebook"
        uri = URI.parse(info["image"])
        uri.scheme = "https"
        uri.to_s
      else
        info["image"]
    end
  end
end
