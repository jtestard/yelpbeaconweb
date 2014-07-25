class BeaconsController < ApplicationController
  
  def new
    @beacon = Beacon.new
  end
  
  def destroy
    @beacon = Beacon.find(params[:id]).destroy
    redirect_to :root, :notice => "Beacon successfully destroyed!"
  end
  
  def create
    @beacon = Beacon.new(params[:beacon])
    if @beacon.save
      redirect_to :root, :notice => "Beacon successfully added!"
    else
      render :new
    end
  end
  
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
            format.html { render json: {url: @behavior.action, error: "", message: "" } }
          end
        else
          respond_to do |format|
            format.json { render json: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
            format.xml { render xml: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
            format.html { render json: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
          end
        end
      else
        respond_to do |format|
          format.json { render json: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
          format.xml { render xml: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
          format.html { render json: {url: "", error: "no action for this beacon configuration : [beacon: #{@beacon.inspect}, proximity: #{params[:proximity]}, status: #{params[:status]}]", message: "" } }
        end      
      end
    else
      respond_to do |format|
        format.json { render json: {url: "", error: "missing parameters in request", message: ""} }
        format.xml { render xml: {url: "", error: "missing parameters in request", message: ""} }
        format.html { render json: {url: "", error: "missing parameters in request", message: ""} }
      end
    end
  end
  
  
  protect_from_forgery with: :null_session
  def api
    puts params.inspect
    @businesses = []
    params[:beacons].each do |bc|
      beacon = Beacon.where(uuid: bc[:uuid], major: bc[:major], minor: bc[:minor]).first
      @businesses.push({businessId: beacon.biz_id, businessName: beacon.biz_name, businessURL: beacon.biz_image})
    end
    respond_to do |format|
      format.json { render json: @businesses }
      format.xml { render xml: @businesses }
    end
  end
end