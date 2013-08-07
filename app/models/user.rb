class User < ActiveRecord::Base
  attr_accessible :username

  # I tweet
  has_many :statuses,
          :class_name  => 'Status',
          :foreign_key => :user_id,
          :primary_key => :id

  # I am a User and I follow Kanye west
  has_many :follows,
          :class_name  => 'Follow',
          :foreign_key => :follower_id,
          :primary_key => :id

  has_many :following,
           :through  => :follows,
           :source   => :followed

  # Iam Jlo and people follow me
  has_many :inbound_follows,
          :class_name   => "Follow",
          :foreign_key  => :followed_id

  has_many :followers,
          :through => :inbound_follows,
          :source  => :follower

  def followers_list


  end

end
