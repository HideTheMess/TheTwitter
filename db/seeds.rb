# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jlo = User.new( {:username => "jlos_booty" } )
jlo.save!

kanye = User.new( {:username  => "iamdagreatest"} )
kanye.save!

followers = User.create( [{:username  => "follower1"},
                         {:username  => "follower2"},
                         {:username  => "follower3" }])

jlos = Status.new({  :tweet   => "I've got a huge ass, y'all",
                     :user_id => 1
                     })
jlos.save!

followers_table = Follow.create([{:follower_id => 3, :followed_id => 1},
                                 {:follower_id => 4, :followed_id => 1},
                                 {:follower_id => 1, :followed_id => 2}])