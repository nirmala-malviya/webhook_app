class Api::V1::ProductsController < ApplicationController
    before_action :set_product, only: [:update]

  # New Products create
  def create
    @product = Product.new(product_params)
    if @product.save
        Webhook.notify_webhooks(@product, :create)
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # Product update
  def update
    if @product.update(product_params)
        Webhook.notify_webhooks(@product, :update)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end  
end
