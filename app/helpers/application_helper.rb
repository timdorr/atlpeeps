module ApplicationHelper
  def default_domain
    Rails.env.production? ? "www.atlpeeps.net" : "atlpeeps.dev"
  end

  def atv_domain
    Rails.env.production? ? "www.atvpeeps.net" : "atvpeeps.dev"
  end
end
