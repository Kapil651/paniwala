class SuppliersController < ApplicationController
  before_action :authenticate_supplier! 
  before_action :set_supplier, only: [:edit, :update]

  def edit
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to suppliers_edit_path(@supplier), notice: "Profile updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_supplier
    @supplier = current_supplier  # Ensure user can only edit their own profile
  end

  def supplier_params
    params.require(:supplier).permit(:name, :company_name, :address, :mobile, :image)
  end

end