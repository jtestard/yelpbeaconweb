class SessionsController < ApplicationController
	def new
	end
	
	def create
	  business = Business.authenticate(params[:yelp_username], params[:password])
	  if business
	    session[:business_id] = business.id
	    redirect_to root_url, :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid username or password"
	    render "new"
	  end
	end
	
	def destroy
	  session[:business_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end
end