class FarmsController < ApplicationController

  def index
    @farms = Farm.all
    @sorted
    if params[:sortby] == "location"
      @sorted = @farms.sort_by{|farm| farm.location}
    else
      @sorted = @farms.sort_by{|farm| farm.id}
    end
  end

  def new
  end

  def create
    @farm = Farm.new(farm_params)
    @farm.save
    redirect_to @farm
  end

  def show
    @farm = Farm.find(params[:id])
    @kopis = @farm.kopi

  end

  def edit
    @farm = Farm.find(params[:id])
  end

  def update
    @farm = Farm.find(params[:id])
    @farm.update(farm_params)
    redirect_to @farm

  end

  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy
    redirect_to root_path
  end

private

  def farm_params
    params.require(:farm).permit(:location, :phone_num)
  end

end