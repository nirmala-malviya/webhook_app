class WebhookNotifierJob < ApplicationJob
  queue_as :default

  require 'httparty'

  def perform(product, url, event_type, secret)
    payload = {
      item: {
        name: product.name,
        data: product.description,
        event_type: event_type
      }
    }

    begin
      HTTParty.get(url, body: payload.to_json, headers: { 'Content-Type' => 'application/json' })
    rescue StandardError => e
      Rails.logger.error("Error sending webhook to #{url}: #{e.message}")
      # Optionally, you could retry the job or notify someone of the failure
      # raise e
    end
  end  
end
