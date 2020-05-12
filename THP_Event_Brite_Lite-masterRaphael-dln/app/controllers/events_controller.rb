class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
  end

  def index
    @event = Event.all
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
