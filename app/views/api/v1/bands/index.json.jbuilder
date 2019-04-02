json.bands do
  json.array! @bands do |band|
    json.extract! band, :id, :name, :photo, :location, :price, :description, :link, :user_id
  end
end
