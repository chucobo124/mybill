class BillsController < ApplicationController
  def show
  end

  def create
    account_class = Bill.type[type_params.to_i]
    respond_msg = { error: 'The type is not include or you have wrong params' }
    unless account_class.blank?
      account_data = account_data_params.to_h
      account_data[:price] = account_data[:price].to_d
      account_type = account_class.name.downcase
      account = account_class.create account_data
      account.bills.create
      respond_msg = { success: 'ok' }
    end
    render json: respond_msg
  end

  private

  def account_data_params
    params.require(:account_data).permit(:title, :description, :price)
  end

  def type_params
    params.require(:type)
  end
end
