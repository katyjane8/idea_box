class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = current_user.ideas.new
  end

  def create
    @idea = current_user.ideas.create(idea_params)
    if @idea.save!
      redirect_to user_idea_path(current_user, @idea)
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

    private

    def idea_params
      params.require(:idea).permit(:title, :body, :category_id)
    end
end
