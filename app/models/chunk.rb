class Chunk < ApplicationRecord
  belongs_to :user

  def self.genesis
    Chunk.create!(
      user: User.genesis,
      title: 'Genesis',
      body:  'It was a dark and stormy night...',
      background_color: '#000000',
      published_at: DateTime.now
    )
  end
end
