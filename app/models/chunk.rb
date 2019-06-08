class Chunk < ApplicationRecord
  belongs_to :user

  def self.genesis
    Chunk.create!(
      user: User.genesis,
      title: 'Genesis',
      body: genesis_story_body,
      background_color: '#000000',
      text_color: '#FFFFFF',
      published_at: DateTime.now
    )
  end

  def self.genesis_story_body
<<-STORY
"Do you want this strawberry?" Dr. Steven asked calmly.

I looked up at him, and then at the strawberry in his hand. It was a small strawberry, clearly not the best in the bunch. But it was a strawberry, and I love strawberries. Even a tiny strawberry would be a joyride for my starving tastebuds. I quickly responded, "Sure, I’ll have it."

The doctor smiled gently at me and closed his hand around the strawberry. He strolled to the opposite end of the table that I was sitting at and set the fruit down on a small, white coaster.

"Okay, Andrew. Here’s the deal." He paused to make sure I had seen where he placed the strawberry. “You can have this strawberry at any time you wish. However, there’s something else.” He took a step in my direction. "I’m going to leave. If this strawberry is still here when I get back, you can have five strawberries. Do you understand?"

Five strawberries, I thought. I was very hungry; I hadn’t eaten all day. It was a trade-off between time and food. If I waited longer, I could have more food to eat. I was smarter than the other kids; I knew to wait would be the smarter choice if I could stand it. I nodded to the professor and he left without another word.
STORY
  end
end
