class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]
  
    # GET /messages
    def index
      @messages = Message.all
  
      render json: MessageSerializer.new(@messages)
    end
  
    # GET /messages/1
    def show
      render json: MessageSerializer.new(@message)
    end
  
    # POST /messages
    def create
  
      @message = Message.new(message_params)
     
      if @message.save
        new_message = @message.convo_builder
        new_message.save
        
        render json: MessageSerializer.new(@message), status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /messages/1
    def update
      if @message.update(message_params)
        render json: @message
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /messages/1
    def destroy
      @message.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_message
        @message = Message.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def message_params
        params.require(:message).permit(:name, :message, :active, :image, :profile_id)
      end
  end
  