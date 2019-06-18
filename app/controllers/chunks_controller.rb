class ChunksController < ApplicationController
  before_action :set_chunk,           only: [:show]
  before_action :set_action,          only: [:show]
  before_action :set_previous_chunk,  only: [:show]

  before_action :track_chunk_history, only: [:show]

  def genesis
    redirect_to chunk_path(id: Chunk.first.try(:id).presence || Chunk.genesis.id)
  end

  def show
  end

  private

  def set_chunk
    @chunk = Chunk.find_by(id: params[:id].to_i).presence || Chunk.genesis
  end

  def set_action
    @action = Action.find_by(id: params[:from_action].to_i)
  end

  def set_previous_chunk
    if @action
      @previous_chunk = @action.previous_chunk
    elsif session[:chunk_history] && session[:chunk_history].reject {|c| c == @chunk.id }.any?
      @previous_chunk = Chunk.find(session[:chunk_history].reject {|c| c == @chunk.id }.last)
    else
      @previous_chunk = nil
    end
  end

  def track_chunk_history
    session[:chunk_history] ||= []
    if session[:chunk_history].include?(@chunk.id)
      # We backtracked to a previous chunk, so lets do so in the history too
      history_index = session[:chunk_history].index(@chunk.id)
      session[:chunk_history] = session[:chunk_history].first(1 + history_index)
    else
      if session[:chunk_history].last == @chunk.id
        # The user just refreshed the page; no need to add it again
      elsif @previous_chunk && session[:chunk_history].last == @previous_chunk.id
        # Add this chunk to the history
        session[:chunk_history] << @chunk.id
      else
        # We're on a new story, so start a new history
        session[:chunk_history] = [@chunk.id]
      end
    end
  end
end
