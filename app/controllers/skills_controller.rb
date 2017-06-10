class SkillsController < ApplicationController
  def index

  end

  def new
    @skill = Skill.new(skill_params)
  end

  def create
    @skill = current_user.skills.new(skill_params)
    if @skill.save
      flash[:success] = "You've added a skill!"
      redirect_to @user
    else
      render "user/#{current_user.id}"
    end
  end

  def index
    @skills = Skill.all
    if params[:search]
      @skills = Skill.search(params[:search]).order("created_at DESC")
    else
      @skills = Skill.all.order("created_at DESC")
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:subcategory_id, :user_id, :title, :description, :teach)
  end
end
