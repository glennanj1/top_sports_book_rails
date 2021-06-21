class ConversationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image, :chat, :name, :message_id
end
