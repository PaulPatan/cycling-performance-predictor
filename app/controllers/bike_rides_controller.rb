class BikeRidesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bike_ride, only: %i[ show edit update destroy ]

  # GET /bike_rides or /bike_rides.json
  def index
    @bike_rides = BikeRide.all
  end

  # GET /bike_rides/1 or /bike_rides/1.json
  def show
  end

  # GET /bike_rides/new
  def new
    @bike_ride = BikeRide.new
  end

  # GET /bike_rides/1/edit
  def edit
  end

  # POST /bike_rides or /bike_rides.json
  def create
    @bike_ride = BikeRide.new(bike_ride_params)

    respond_to do |format|
      if @bike_ride.save
        format.html { redirect_to bike_ride_url(@bike_ride), notice: "Bike ride was successfully created." }
        format.json { render :show, status: :created, location: @bike_ride }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bike_ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bike_rides/1 or /bike_rides/1.json
  def update
    respond_to do |format|
      if @bike_ride.update(bike_ride_params)
        format.html { redirect_to bike_ride_url(@bike_ride), notice: "Bike ride was successfully updated." }
        format.json { render :show, status: :ok, location: @bike_ride }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bike_ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bike_rides/1 or /bike_rides/1.json
  def destroy
    @bike_ride.destroy!

    respond_to do |format|
      format.html { redirect_to bike_rides_url, notice: "Bike ride was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike_ride
      @bike_ride = BikeRide.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bike_ride_params
      params.require(:bike_ride).permit(:kilojoules, :total_elevation_gain, :distance, :average_heartrate, :average_watts, :moving_time, :weighted_average_watts, :average_cadence, :average_speed, :elapsed_time, :prediction, :user_id)
    end
end
