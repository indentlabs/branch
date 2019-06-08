class ChunksController < ApplicationController
  def genesis
    redirect_to chunk_path(id: 1)
  end

  def show
    @chunk = Chunk.find_by(id: params[:id].to_i).presence || Chunk.genesis
  end
end
