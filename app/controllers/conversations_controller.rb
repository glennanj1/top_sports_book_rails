class ConversationsController < ApplicationController
    before_action :set_conversation, only: [:show, :update, :destroy]
  
    # GET /conversations
    def index
      @message = Message.find(params[:message_id])
      @conversations = @message.conversations
  
      render json: ConversationSerializer.new(@conversations)
    end
  
    # GET /conversations/1
    def show
      render json: @conversation
    end
  
    # POST /conversations
    def create
      
      @conversation = Conversation.new(conversation_params)
  
      if @conversation.save
        render json: ConversationSerializer.new(@conversation), status: :created
      else
        render json: @conversation.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /conversations/1
    def update
      if @conversation.update(conversation_params)
        render json: @conversation
      else
        render json: @conversation.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /conversations/1
    def destroy
      @conversation.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_conversation
        @conversation = Conversation.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def conversation_params
        params.require(:conversation).permit(:image, :chat, :name, :message_id)
      end
  end
  