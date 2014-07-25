class BeaconsController < ApplicationController
  
  
  #api_beacons GET    /api/beacons(.:format)          api/beacons#index {:format=>"json"}
  def index
    if !params[:major].blank? and !params[:minor].blank? and !params[:proximity].blank? and !params[:status].blank?
      @beacon = Beacon.where(major: params[:major], minor: params[:minor]).first
      unless @beacon.nil?
        @behavior = Behavior.where(beacon_id: @beacon.id, proximity: params[:proximity], status: params[:status]).first
        unless @behavior.nil?
          respond_to do |format|
            format.json { render json: {url: @behavior.action, error: "", message: "" } }
            format.xml { render xml: {url: @behavior.action, error: "", message: "" } }
          end
        else
          respond_to do |format|
            format.json { render json: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
            format.xml { render xml: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
          end
        end
      else
        respond_to do |format|
          format.json { render json: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
          format.xml { render xml: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
        end      
      end
    else
      respond_to do |format|
        format.json { render json: {url: "", error: "missing parameters in request", message: ""} }
        format.xml { render xml: {url: "", error: "missing parameters in request", message: ""} }
      end
    end
  end
end