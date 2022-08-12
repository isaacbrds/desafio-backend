class CongressmenController < ApplicationController
  before_action :set_congressman, only: %i[show destroy]
  def index
    @congressmen = Congressman.order("created_at DESC").page(params[:page])
  end

  def show
    @expenses = @congressman.expenses.includes([:supplier, { invoices:
      :documents }]).order('invoices.liquid_value DESC').page(params[:page])
    @soma = Expense.where(congressman: @congressman).invoices_join.sum(:liquid_value)
  end

  def destroy
    @congressman.destroy
    respond_to do |format|
      sleep(20.seconds)
      Supplier.destroy_all
      format.html { redirect_to congressmen_url, notice: "congressman was successfully destroyed." }
    end
  end
  private

  def set_congressman
    @congressman = Congressman.find(params[:id])
  end
end
