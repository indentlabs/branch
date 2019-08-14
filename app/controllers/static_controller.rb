class StaticController < ApplicationController
  def index
    continuation_chunk_ids = Action.pluck(:next_chunk_id)
    @genesis_chunks = Chunk.where.not(id: continuation_chunk_ids)
      .includes(:user)
      .order('id asc')
      .limit(40)
  end
end
