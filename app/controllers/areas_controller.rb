class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
  end

  def new
    @area = Area.new
  end

  def create
   
    @area = current_supplier.areas.build(area_params) 
   
    if @area.save
      redirect_to areas_path, notice: 'Area created successfully.'
     else

    puts "Error Saving area: #{@area.errors.full_messages.inspect}"
      render :new
    end
  end

  def edit
  end

  def update
    if @area.update(area_params)
      redirect_to areas_path, notice: "Area successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @area.destroy
      redirect_to areas_path, notice: "Area successfully deleted."
    else
      redirect_to areas_path, alert: "Failed to delete the area."
    end
  end

  private

  def set_area
    @area = Area.find_by(id: params[:id])
    redirect_to areas_path, alert: "Area not found." if @area.nil?
  end

  def area_params
   permitted_params = params.require(:area).permit(:name)
   permitted_params
  end
end
