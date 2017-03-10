class AttractionsController < ApplicationController 

  def new
  	@attraction = Attraction.new
  end

  def create
  	@attraction = Attraction.create(attraction_params)
    redirect_to "/attractions/#{@attraction.id}"
  end

  def index
  	@attractions = Attraction.all
  end

  def show
  	@attraction = Attraction.find_by(id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to 
  end

private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end