class ProfileSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :match, :image
end
