class CwsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render html: "index page"
  end

  def create
    puts params.to_s
    room_id = params[:webhook_event][:room_id]
    body = params[:webhook_event][:body]
    c = ChatWork::Room.find room_id: room_id
    room_name = c.name
    destination_room_id = 137369783
    body = "Message in #{room_name}: #{body}"
    ChatWork::Message.create room_id: destination_room_id, body: body
    render status: 200
  end
end
