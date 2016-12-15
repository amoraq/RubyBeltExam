class ProductsController < ApplicationController
    def create
        product = Product.new(products_params)

        if product.save
            product.update(bought: false)
            redirect_to(:back)
        else
            flash[:errors] = product.errors.full_messages
            redirect_to(:back)
        end
    end

    def destroy
        product = Product.find(:id)
        product.destroy
        redirect_to(:back)
    end

    def buy
        product.find(:id)
        products.update(bought: true)
        redirect_to(:back)
    end

    private
        def products_params
            params.require(:product).permit(:name, :amount, :bought, :user_id, :created_at)
        end
end
