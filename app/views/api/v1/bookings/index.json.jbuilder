json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :user_id, :band_id, :date
    json.date booking.date.strftime("%m/%d/%y")
  end
end
