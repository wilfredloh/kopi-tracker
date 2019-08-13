class KopisController < ApplicationController

  def index
    @kopis = Kopi.all
  end


  def new
    @farms = Farm.all
  end

  def create
    @kopi = Kopi.new(kopi_params)

    @kopi.save
    redirect_to @kopi
  end

  def show
    # deal with the case that we are trying to get a kopi for a farm that doesn't exist

    @kopi = Kopi.find(params[:id])
    @farm = @kopi.farm

    if params[:farm_id].to_i != @kopi.farm.id
      # do something
    end
  end

  def edit
    @kopi = Kopi.find(params[:id])
  end

  def update
    @kopi = Kopi.find(params[:id])
    @kopi.update(kopi_params)
    redirect_to @kopi

  end

  def destroy
    @kopi = Kopi.find(params[:id])
    @kopi.destroy
    redirect_to kopis_path
  end


private

  def kopi_params
    params.require(:kopi).permit(:name, :roastedness, :farm_id)
  end
end