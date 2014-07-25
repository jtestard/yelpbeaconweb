class BehaviorsController < ApplicationController
  
  def new
    session[:beacon_id] = params[:beacon_id]
    @behavior = Behavior.new
  end
  
  def destroy
    @behavior = Behavior.find(params[:id]).destroy
    redirect_to :root, :notice => "Behavior successfully destroyed!"
  end
  
  def create
    @behavior = Behavior.new(proximity: params[:behavior][:proximity], status: params[:behavior][:status], action: params[:behavior][:action], beacon_id: session[:beacon_id])
    if @behavior.save
      redirect_to :root, :notice => "Behavior successfully added!"
      session[:beacon_id] = nil
    else
      render :new
    end    
  end

end
