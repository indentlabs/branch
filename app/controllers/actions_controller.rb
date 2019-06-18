class ActionsController < ApplicationController
  def show
    @action = Action.find(params[:id].to_i)

    # handle on-approach logic

    redirect_to chunk_path(@action.next_chunk, from_action: @action.id)
  end

  def create
    old_chunk = Chunk.find_by(id: branch_params[:prior_chunk_id].to_i)

    old_chunk_new_text = branch_params[:prior_chunk_text].gsub("\r", "") + "\n"
    new_chunk_text = old_chunk.body
      .gsub("\r", "")
      .gsub('<div>', '<p>')
      .gsub('</div>', '</p>')
      .gsub('<p></p>\n', '')
      .gsub('<p><br></p>', '')
      .split(old_chunk_new_text)
      .drop(1)
      .join("\n")

    # Split the old chunk off into two chunks (unless we're branching at the end!)
    old_chunk.update(body: old_chunk_new_text) unless old_chunk.body == old_chunk_new_text
    unless new_chunk_text.empty?
      new_chunk = Chunk.create!(
        title:            old_chunk.title,
        body:             new_chunk_text,
        user:             old_chunk.user,
        background_color: old_chunk.background_color,
        text_color:       old_chunk.text_color,
        published_at:     old_chunk.published_at
      )

      old_chunk.actions.create!(
        title:         "Continue reading...",
        description:   "Read the original author's continuation of this story.",
        next_chunk_id: new_chunk.id
      )
    end

    # Create the forked chunk
    forked_chunk = Chunk.create!(
      title:            old_chunk.title,
      body:             "<p>" + branch_params[:new_chunk_text],
      user:             old_chunk.user, #todo current_user
      background_color: branch_params[:background_color] || old_chunk.background_color,
      text_color:       branch_params[:text_color]       || old_chunk.text_color,
      published_at:     DateTime.now
    )
    old_chunk.actions.create!(
      title:         branch_params[:title].presence || old_chunk.title || "Fork by Bob",
      description:   branch_params[:description]    || "No description",
      next_chunk_id: forked_chunk.id
    )

    redirect_to old_chunk
  end

  private

  def branch_params
    params.require(:branch).permit(
      :prior_chunk_id, :prior_chunk_text, :new_chunk_text, 
      :title, :description,
      :text_color, :background_color
    )
  end
end
