class User < ApplicationRecord
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

  def email
    # shim until devise is in place
    "andrew@indentlabs.com"
  end

  def username
    "@drusepth"
  end
end
