class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile, only: [:update, :basics, :goals, :photos]

  def show
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to manage_profile_basics_path(@profile), notice: "プロフィールを保存しました"
    else
      render 'new', notice: "プロフィールを保存できませんでした"
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_back(fallback_location: root_path, :notice => "プロフィールを保存しました")
    end
  end

  def basics
  end

  def goals
  end

  def judge
    if Profile.find_by(user_id: params[:id])
      @profile = Profile.find_by(user_id: params[:id])
      redirect_to manage_profile_basics_path(@profile)
    else
      redirect_to new_profile_path(params[:id])
    end
  end

  def photos
    @photo = Photo.new
  end

  private
  def profile_params
    params.require(:profile).permit(:height, :weight, :age, :trainer, :direction, :experience, :goal_text, :competition, :comp_date, :twitter_id, :instagram_id, :line_id, :website_url)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
