class CreateWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :webhooks do |t|
      t.string :url
      t.string :secret
      t.string :call_type
      t.timestamps
    end
  end
end
