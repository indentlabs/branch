class Action < ApplicationRecord
  belongs_to :previous_chunk
  belongs_to :next_chunk
end
