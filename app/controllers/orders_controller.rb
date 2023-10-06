class OrdersController < ApplicationController

    def create
        # @client = order_params[:client_id]
        # @project = order_params[:project_id]
        @order = Order.new(order_params)
        @order.calculate_fee
        
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
        params.require(:order).permit(:client_id, :project_id)
    end
end
