class ChunksController < ApplicationController
  def genesis
    redirect_to chunk_path(id: Chunk.first.id)
  end

  def show
    @chunk = Chunk.find_by(id: params[:id].to_i).presence || Chunk.genesis
  end
end
