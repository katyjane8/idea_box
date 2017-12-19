class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :destroy, :edit, :update]

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

  def destroy
    @idea.destroy
    redirect_to user_ideas_path(current_user)
  end

  def update
    @idea.update(idea_params)
    if @idea.save!
      redirect_to user_idea_path(current_user, @idea)
    else
      render :edit
    end
  end

  def edit
  end

    private

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :body, :category_id)
    end
end
