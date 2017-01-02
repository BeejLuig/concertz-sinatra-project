3.times do |i|
  @user = User.create(username: "user#{i+1}", email: "user#{i}@user.com", password: "test")
  @artist = @user.artists.create(name: "artist#{i+1}", user_id: i+1)
  3.times do |j|
    Concert.create(ticket_price: 15.00, location: "location#{j+1}", concert_date: "Jan #{j+1}, 2017", artist_id: i+1)
  end
end
