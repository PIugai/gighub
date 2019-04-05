json.bands do
  json.array!(@bands.sort_by{|b| -b[:id]}) do |band| #this sorts by highest ID first
  # json.array! @bands do |band| #this is the original that sorts by lowest ID first
    json.extract! band, :id, :name, :photo, :location, :price, :description, :style, :link, :user_id, :tag_list
  end
end
