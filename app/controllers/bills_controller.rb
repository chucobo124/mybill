class BillsController < ApplicationController
  def create
    byebug
    render json: { success: 'ok' }
  end
end
