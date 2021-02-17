namespace :tet do
  desc "send notification of how many days till Tet holiday"
  task noti: :environment do
    puts "task run"

    # set up some params
    destination_room_id = 116821963
    # group: 116821963
    # personal: 137385942
    days = ("2022/02/01".to_date - Date.today).to_i
    body = "[toall]
Còn #{days} ngày nữa là đến tết (rachoa)"

    # change token to bot's token
    ChatWork.api_key = ENV["BOT_ACCOUNT_TOKEN"]

    # create message from bot
    ChatWork::Message.create room_id: destination_room_id, body: body
  end
end
