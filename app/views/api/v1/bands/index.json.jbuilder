json.bands do
  json.array! @bands do |band|
    json.extract! band, :id, :name, :photo, :location, :price, :description, :style, :link, :user_id, :tag_list
  end
end
