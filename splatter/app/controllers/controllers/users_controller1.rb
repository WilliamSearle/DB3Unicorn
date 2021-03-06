 class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new user_params(params[:user])

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update user_params(params[:user])
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end

  #showFollows **********
  def show_follows
    @user = User.find(params[:id])
    
    render json: @user.follows
  end

  #showFollowers **********
  def show_followers
    @user = User.find(params[:id])
    
    render json: @user.followers
  end


  # addFollows 
  def add_follows
    #@user = User.add_follows_params(params[:user])
    @user = User.find(params[:id])
    @follows = User.find(params[:follows_id])

    @user.follows << @follows
    head :no_content
  end
  

 #deleteFollows
 def delete_follows
   @user = user.find(params[:id])
   @follows = user.find(params[:follows_id])

   if @user.follows.delete(@follows)
     head :no_content
   else
     render json: @user.errors, status: :unprocessable_entity
   end
end

def splatts
  @user = User.find(params[:id])
render json: @user.splatts
end


#Sorted list of Splatts

# GET /users/splatts-feed/1
 def splatts_feed
   @feed = Splatt.find_by_sql("SELECT splatts.body, splatts.user_id, splatts.created_at FROM splatts JOIN follows ON follows.followed_id=splatts.user_id WHERE follows.follower_id=#{params[:id]} ORDER BY created_at DESC")
   render json: @feed
 end

private

  def user_params(params)
    params.permit(:emails, :password, :name, :blurb)
end
end
