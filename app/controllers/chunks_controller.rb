class ChunksController < ApplicationController
  def genesis
    redirect_to chunk_path(id: Chunk.genesis.id)
  end

  def show
    @chunk = Chunk.find_by(id: params[:id].to_i).presence || Chunk.genesis
    @action = Action.find_by(id: params[:from_action].to_i)
    @previous_chunk = @action.try(:previous_chunk)
  end
end
