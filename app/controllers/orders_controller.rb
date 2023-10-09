class OrdersController < ApplicationController

    def new
    end

    def create
        @stripe_service = StripeService.new
        @project = Project.find(order_params[:project_id])
        @customer = User.find(order_params[:client_id])

        unless @customer.present?
            @customer = Customer.create(customer_params)
        end

        @stripe_customer = @stripe_service.find_or_create_customer(@customer)
        @card = @stripe_service.create_stripe_customer_card(card_params, @stripe_customer)

        @order = Order.new(client_id: order_params[:client_id], project_id: order_params[:project_id])
        @order.calculate_fee
        @price = order_params[:value]

        @charge = @stripe_service.create_stripe_charge(@price, @stripe_customer.id, @card.id, @project)

        if @order.save
            flash[:notice] = 'Your Order has been registered Succesfully!'
            redirect_to projects_path
        else
            flash[:alert] = 'Failed to create order!'
            redirect_to new_project_path
        end
    end


    private

    def order_params
        params.require(:order).permit(:fullname, :email, :client_id, :project_id, :value, :card_number, :exp_month, :exp_year, :cvv)
    end

    def card_params
        params.require(:order).permit(:fullname, :email, :card_number, :exp_month, :exp_year, :cvv)

    end
end
