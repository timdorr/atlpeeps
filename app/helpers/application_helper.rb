module ApplicationHelper
  def default_domain
    Rails.env.production? ? "atlpeeps.net" : "atlpeeps.dev"
  end

  def atv_domain
    Rails.env.production? ? "atvpeeps.net" : "atvpeeps.dev"
  end
end
