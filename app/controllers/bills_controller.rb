class BillsController < ApplicationController
  def create
    render json: { success: 'ok' }
  end
end
