json.extract! @user, :id, :name, :email, :photo

json.bands @user.bands do |band|
  json.extract! band, :id, :name, :photo, :location, :price, :description, :link

  json.bookings band.bookings do |booking|
    json.extract! booking, :id, :user_id, :band_id, :date
    json.date booking.date.strftime("%m/%d/%y")
  end
end

json.bookings @user.bookings do |booking|
  json.extract! booking, :id, :user_id, :band_id, :date
  json.date booking.date.strftime("%m/%d/%y")
end
