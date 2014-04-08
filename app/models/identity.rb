class Identity < ActiveRecord::Base
  belongs_to :user

  serialize :info, JSON
  serialize :extra, JSON

  def self.find_with_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).last
  end

  def self.first_or_create_with_omniauth(auth)
    where(uid: auth['uid'], provider: auth['provider']).first_or_create(info: auth['info'], extra: auth['extra'])
  end
end
