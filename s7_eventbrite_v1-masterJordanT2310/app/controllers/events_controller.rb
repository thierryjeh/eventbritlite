class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(post_params)
    Attendance.create(event: @event, user: current_user)
    if @event.save
      flash[:success] = 'Super ! Tu as réussi à créer un évènement !'
      render 'show'
    else
      render 'new'
    end
  end

  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def post_params # récupérer les params
    post_params = params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end

end
