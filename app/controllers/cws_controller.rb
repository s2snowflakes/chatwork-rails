class CwsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render html: "index page"
  end

  def create
    # get room id and body of the message
    room_id = params[:webhook_event][:room_id]
    body = params[:webhook_event][:body]

    # find room
    c = ChatWork::Room.find room_id: room_id
    room_name = c.name

    # set up some params
    destination_room_id = 137369783
    body = "Message in #{room_name}: \n #{body}"

    # create message
    ChatWork::Message.create room_id: destination_room_id, body: body
    render status: 200
  end
end
