class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :chunks, dependent: :destroy
  has_many :actions, through: :chunks, dependent: :destroy

  def self.genesis
    User.find_or_create_by!(
      name: 'Genesis'
    )
  end

  def image_url(size=80)
    require 'digest/md5'
    email_md5 = Digest::MD5.hexdigest(email.downcase)

    # 80px is Gravatar's default size
    "https://www.gravatar.com/avatar/#{email_md5}?d=identicon&s=#{size}".html_safe
  end

  def username
    "@drusepth"
  end
end
