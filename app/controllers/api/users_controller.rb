class Api::UsersController < ApplicationController

  # enable after sessions is complete
  # before_action :require_login

  def create
    @user = User.new(user_params)
    if @user.save
      Profile.create(user_id: @user.id)
      Friend.seed_starter_friends(@user.id)
      login(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 420
    end
  end

  def show
    @user = User.find(params[:id])
    @profile_id = @user.profile.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @profile = @user.profile
      render 'api/profiles/show.json.jbuilder'
    else
      render json: @user.errors.full_messages, status: 420
    end
  end
  def index
    #current_user.friends should get all users from friends list
    #User.find_by user query string from search to find users with find friends

    #first get all friends of user
    #then get all posts of all user friends and user

    # create an array from ids of @users
    # users_friends.pluck(&:id)

    # users.index.json.jbuilder ---- postIds = @posts.pluck(&:id)
  end

  def get_friend_requests
    friendships = current_user.requested_by.where("status = 'PENDING' ").pluck(:friender)
    query = "(#{friendships.join(',')})"
    if friendships.length > 0
      @users = User.where("id in #{query}").includes(:profile)
    else
      @users = []
    end
    render :index
  end

  def get_friends
    @users = User.find(params[:id]).friends.includes(:profile)
    render :index
  end

  def search
    @users = User.where("name iLIKE ?", "%#{(params[:query])}%").includes(:profile).limit(10)
    render :search_results
  end

  def create_friendship
    @friendship = current_user.friends_requested.new(friend_params)
    @friendship.status = "PENDING"

    if @friendship.save
      @user = @friendship.out_friends
      render :show
    else
      render json: @friendship.errors.full_messages
    end
  end

  def update_friendship
    friend_id = params[:id]


    @friendship = Friend.where(<<-SQL, current_user.id, friend_id, current_user.id, friend_id)
      (friends.friender = ? AND friends.friendee = ?) OR (friends.friendee = ? AND friends.friender = ?)
      SQL

    if @friendship.update(status: params[:friend][:status])
      @user = @friendship.first.in_friends
      render :show
    else
      render json: @friendship.errors.full_messages
    end
  end

  def destroy_friendship
    friend_id = params[:id]
    friendship = Friend.where(<<-SQL, current_user.id, friend_id, current_user.id, friend_id)
      (friends.friender = ? AND friends.friendee = ?) OR (friends.friendee = ? AND friends.friender = ?)
      SQL
    friendship.destroy
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avi, :cover_photo)
  end

  def friend_params
    params.require(:friend).permit(:friendee, :status)
  end
end
