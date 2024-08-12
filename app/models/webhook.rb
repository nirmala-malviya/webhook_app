class Webhook < ApplicationRecord
  validates :url, presence: true
  validates :secret, presence: true
  validates :call_type, presence: true

  def self.notify_webhooks(product, event_type)
    webhooks = Webhook.all
    if webhooks.present?
      webhooks.each do |endpoint|
        WebhookNotifierJob.perform_later(product, endpoint.url, event_type, endpoint.secret)
      end
    end
  end
end
