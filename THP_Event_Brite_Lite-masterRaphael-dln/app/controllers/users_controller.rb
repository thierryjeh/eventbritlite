class UsersController < ApplicationController
 # before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
