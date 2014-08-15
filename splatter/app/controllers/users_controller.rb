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

  #YOLO
  def splatts
    @user = User.find(params[:id])

    render json: @user.splatts
  end

  #showFollows **********
  def show_follows
    @user = User.find(params[:id])
    
    render json: @user.u1.follows
  end

  #showFollowers **********
  def show_followers
    @user = User.find(params[:id])
    
    render json: @user.u1.followers
  end


  # addFollows 
  def add_follows
    @user = User.add_follows_params(params[:user])
  end
  

 #deleteFollows
 def delete_follows
   @user = User.delete_follows_params(params[:user])
 end

 end



private

  def user_params(params)
    params.permit(:emails, :password, :name, :blurb)
end
end
