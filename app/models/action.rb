class Action < ApplicationRecord
  # TODO figure out how to set up proper relations here
  belongs_to :previous_chunk, class_name: Chunk.name
  belongs_to :next_chunk,     class_name: Chunk.name

  attr_accessor :prior_chunk_text
end
