class Message < ApplicationRecord
    belongs_to :profile
    has_many :conversations

    def convo_builder
        self.conversations.build(name: self.name, image: self.image, chat: Faker::Quote.famous_last_words, message_id: self.id)
    end
end
