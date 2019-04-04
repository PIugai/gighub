json.extract! @user, :id, :name, :email, :photo

json.bands @user.bands do |band|
  json.extract! band, :id, :name, :photo, :location, :price, :description, :link

  json.bookings band.bookings do |booking|
    json.extract! booking, :id, :user_id, :band_id, :date
    json.extract! booking.user, :name, :email, :photo
    json.date booking.date.strftime("%m/%d/%y")
  end
end

json.bookings @user.bookings do |booking|
  json.extract! booking, :id, :date, :band_id
  json.extract! booking.band, :name, :photo, :location, :price, :description
  json.date booking.date.strftime("%m/%d/%y")
end
