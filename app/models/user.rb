class User < ApplicationRecord
  def self.genesis
    User.find_or_create_by!(
      name: 'Puppetmaster'
    )
  end
end
