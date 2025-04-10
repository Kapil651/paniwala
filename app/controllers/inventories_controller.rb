class InventoriesController < ApplicationController
  before_action :authenticate_supplier! 
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

 
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
   
    @inventory = current_supplier.inventories.build(inventory_params) 
   
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory created successfully.'
      InventoryMailer.inventory_email(current_supplier).deliver_now
    else

    puts "Error Saving Inventory: #{@inventory.errors.full_messages.inspect}"
      render :new
    end
  end

  def edit
  end

  def update
    if @inventory.update(inventory_params)
      redirect_to @inventory, notice: "Inventory successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @inventory.destroy
      redirect_to inventories_path, notice: "Inventory successfully deleted."
    else
      redirect_to inventories_path, alert: "Failed to delete the inventory."
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find_by(id: params[:id])
    redirect_to inventories_path, alert: "Inventory not found." if @inventory.nil?
  end

  def inventory_params
   permitted_params = params.require(:inventory).permit(:name, :count, :price)
   permitted_params[:count] = permitted_params[:count].to_i if permitted_params[:count].present?
   permitted_params[:price] = permitted_params[:price].to_f if permitted_params[:price].present?
   permitted_params
  end
end
