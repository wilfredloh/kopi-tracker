class KopisController < ApplicationController

before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @kopis = Kopi.all
    @sorted
    if params[:sortby] == "name"
      @sorted = @kopis.sort_by{|kopi| kopi.name}
    elsif params[:sortby] == "roast"
      @sorted = @kopis.sort_by{|kopi| kopi.roast.name}
    elsif params[:sortby] == "popularity-asc"
      @sorted = @kopis.sort_by{|kopi| kopi.customers.length}
    elsif params[:sortby] == "popularity-des"
      arr = @kopis.sort_by{|kopi| kopi.customers.length}
      @sorted = arr.reverse!
    else
      @sorted = @kopis.sort_by{|kopi| kopi.id}
    end
  end


  def new
    @farms = Farm.all
    @roasts = Roast.all
    allCustomers = Customer.all
    @customers = allCustomers.sort_by{|customer| customer.name}
  end

  def create
    @kopi = Kopi.new(kopi_params)

    @kopi.user = current_user

    if @kopi.save
      redirect_to @kopi
    else
      render 'new'
    end
  end

  def show
    # deal with the case that we are trying to get a kopi for a farm that doesn't exist

    @kopi = Kopi.find(params[:id])
    @farm = @kopi.farm
    @roast = @kopi.roast

    if params[:farm_id].to_i != @kopi.farm.id
      # do something
    end
  end

  def edit
    @kopi = Kopi.find(params[:id])
    @farm = @kopi.farm
    @roast = @kopi.roast
    @farms = Farm.all
    @roasts = Roast.all
    allCustomers = Customer.all
    @customers = allCustomers.sort_by{|customer| customer.name}

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
    params.require(:kopi).permit(:name, :farm_id, :roast_id, :customer_ids => [])
  end
end