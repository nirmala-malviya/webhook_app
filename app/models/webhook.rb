class Webhook < ApplicationRecord
  validates :url, presence: true
  validates :secret, presence: true
  validates :call_type, presence: true

  def self.notify_webhooks(product, event_type)
    Webhook.all.each do |endpoint|
      WebhookNotifierJob.perform_later(product, endpoint.url, event_type, endpoint.secret)
    end
  end
end
