namespace :tet do
  desc "send notification of how many days till Tet holiday"
  task noti: :environment do
    puts "task run"

    # set up some params
    destination_room_id = 116821963
    # group: 116821963
    # personal: 137385942
    days = ("2021/02/12".to_date - Date.today).to_i
    body = "[To:3056978]
Còn #{days} ngày nữa là đến tết (rachoa)
Thông báo bên lề cho đỡ quên: Kèo ăn ốc phạm ngọc thạch với chị X vào tháng 1 (hihi)"

    # change token to bot's token
    ChatWork.api_key = ENV["BOT_ACCOUNT_TOKEN"]

    # create message from bot
    ChatWork::Message.create room_id: destination_room_id, body: body
  end
end
