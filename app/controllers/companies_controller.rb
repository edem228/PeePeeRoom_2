class CompaniesController < ApplicationController

  def index
    @companies = Company.all

      @hash = Gmaps4rails.build_markers(@users) do |company, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

    # def index
  # if params[:search].present?
  #   @companies = Companies.near(params[:search], 50, :order => :distance)
  # else
  #   @companies = Company.all
  # end
  # end  


  def shop
    @user = User.find(params[:id])
  end 
  
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(param_company)

    if @company.save
      redirect_to companies_path
    end
  end

  def show
    @company = Company.find(params[:id])

  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to companies_path
    
  end



  private

  def param_company
    params.require(:company).permit( :name, :address, :phone_number, :schedule , :latitude, :longitude)
  end

end
