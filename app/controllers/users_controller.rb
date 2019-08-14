class UsersController < ApplicationController
  before_action :set_user, only: [:show, :stories]

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/stories
  def stories
    continuation_chunk_ids = Action.pluck(:next_chunk_id)
    @genesis_chunks = Chunk.where.not(id: continuation_chunk_ids)
      .where(user: @user)
      .order('id asc')

    @contributed_chunks = Chunk.where(user: @user)
      .where.not(id: @genesis_chunks.map(&:id))
      .order('id desc')
  end

  def invite
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
