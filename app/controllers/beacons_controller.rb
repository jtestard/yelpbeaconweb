class BeaconsController < ApplicationController
  
  
  #api_beacons GET    /api/beacons(.:format)          api/beacons#index {:format=>"json"}
  def index
    if !params[:major].blank? and !params[:minor].blank? and !params[:proximity].blank? and !params[:status].blank?
      @beacon = Beacon.where(major: params[:major], minor: params[:minor]).first
      unless @beacon.nil?
        @behavior = Behavior.where(beacon_id: @beacon.id, proximity: params[:proximity], status: params[:status]).first
        unless @behavior.nil?
          respond_to do |format|
            format.json { render json: @behavior.action }
            format.xml { render xml: @behavior.action }
          end
        else
          respond_to do |format|
            format.json { render json: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]" }
            format.xml { render json: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]" }
          end
        end
      else
        respond_to do |format|
          format.json { render json: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]" }
          format.xml { render json: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]" }
        end      
      end
    else
      respond_to do |format|
        format.json { render json: "missing parameters in request" }
        format.xml { render xml: "missing parameters in request" }
      end
    end
  end
end