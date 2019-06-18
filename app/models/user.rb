class User < ApplicationRecord
  has_many :chunks, dependent: :destroy
  has_many :actions, through: :chunks, dependent: :destroy

  def self.genesis
    User.find_or_create_by!(
      name: 'Genesis'
    )
  end
end
