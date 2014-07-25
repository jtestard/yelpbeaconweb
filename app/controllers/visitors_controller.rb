class VisitorsController < ApplicationController
  def new
    @business = Business.new
  end
  
  def create
    @business = Business.new(params[:business])
    if @business.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
