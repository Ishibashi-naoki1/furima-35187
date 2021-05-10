class MessagesController < ApplicationController
  # before_action :message_params, only:[:crate]
  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
      redirect_to item_path(@message.item.id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
