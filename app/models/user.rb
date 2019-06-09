class User < ApplicationRecord
  def self.genesis
    User.find_or_create_by!(
      name: 'Super Awesome User'
    )
  end
end
