class SchedulesController < ApplicationController
  
  def index
    @schedules = Schedule.all
  end
  
  def new
	  @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start, :close, :allday, :memo))
    @schedule.errors.any?
    @schedule.valid?

    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :schedules
    else
      flash.now[:notice] = "ERROR! 登録できませんでした"
      render "new"
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
    @schedule.errors.any?
    @schedule.valid?
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start, :close, :allday, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      flash.now[:notice] = "ERROR! 更新できませんでした"
      render "edit"
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end
  
end
