class Status < ActiveRecord::Base
  attr_accessible :tweet, :user_id

  belongs_to :user,
            :class_name => 'User',
            :foreign_key => :user_id,
            :primary_key => :id
end
