require 'faker'

puts 'destroying all requests'
WaitingList.destroy_all
Request.destroy_all

puts 'creating 40 new requests'
40.times do
  r = Request.create(name: Faker::Name.name,
                 email: Faker::Internet.email,
                 phone: "0123456#{rand(100...999)}",
                 bio: Faker::BackToTheFuture.quote,
                 status: ['unconfirmed', 'confirmed', 'accepted', 'expired'].sample)

  WaitingList.create(request_id: r.id, date: Date.today, expired: [true, false].sample) if r.status == 'confirmed'
end
