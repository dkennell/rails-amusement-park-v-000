class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
  	if user.tickets < attraction.tickets && user.height < attraction.min_height
  		"Sorry. You do not have enough tickets the Roller Coaster. You are not tall enough to ride the Roller Coaster."
  	elsif user.tickets < attraction.tickets
  		"Sorry. You do not have enough tickets the #{attraction.name}."
  	elsif user.height < attraction.min_height
  		"Sorry. You are not tall enough to ride the #{attraction.name}."
  	else
  		user.tickets -= attraction.tickets
  		user.nausea += attraction.nausea_rating
  		user.happiness += attraction.happiness_rating
  		user.save
  	end
  end

end
