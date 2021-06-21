class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :initial_message, :active, :image, :profile_id, :created_at
end
