class PlaceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :business_status, :icon, :name, :photos, :place_id, :rating, :reference, :user_rating_total, :vicinity, :zip
end
