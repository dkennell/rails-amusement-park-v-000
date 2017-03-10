class RidesController < ApplicationController

  def create
  	@attraction = Attraction.find_by(id: params[:attraction_id])
  	@user = current_user

  	if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
  		flash[:alert] = "You are not tall enough to ride the #{@attraction.name} and You do not have enough tickets to ride the #{@attraction.name}"
  		redirect_to "/users/#{@user.id}"
  	elsif @user.height < @attraction.min_height
  		flash[:alert] = "You are not tall enough to ride the #{@attraction.name}" 
  	  	redirect_to "/users/#{@user.id}"
  	elsif @user.tickets < @attraction.tickets
  		flash[:alert] = "You do not have enough tickets to ride the #{@attraction.name}"
  	  	redirect_to "/users/#{@user.id}"
  	else  		
    	@user.tickets -= @attraction.tickets
    	@user.nausea += @attraction.nausea_rating
  	    @user.save
    	flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    	redirect_to "/users/#{@user.id}"
    end
  end
end