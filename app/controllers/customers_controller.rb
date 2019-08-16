class CustomersController < ApplicationController

# before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @customers = Customer.all
    @sorted
    if params[:sortby] == "name"
      @sorted = @customers.sort_by{|customer| customer.name}
    elsif params[:sortby] == "kopi-asc"
      @sorted = @customers.sort_by{|customer| customer.kopi.length}
    elsif params[:sortby] == "kopi-des"
      arr = @customers.sort_by{|customer| customer.kopi.length}
      @sorted = arr.reverse!
    else
      @sorted = @customers.sort_by{|customer| customer.id}
    end
  end


  def new
    allKopi = Kopi.all
    @kopis = allKopi.sort_by{|kopi| kopi.id}
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render 'new'
    end
  end

  def show
    # deal with the case that we are trying to get a customer for a farm that doesn't exist

    @customer = Customer.find(params[:id])

    # if params[:farm_id].to_i != @customer.farm.id
      # do something
    # end
  end

  def edit
    allKopi = Kopi.all
    @kopis = allKopi.sort_by{|kopi| kopi.id}
    @customer = Customer.find(params[:id])

  end

  def update
    @customer = customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to @customer

  end

  def destroy
    @customer = customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end


private

  def customer_params
    params.require(:customer).permit(:name, :kopi_ids => [])
  end
end