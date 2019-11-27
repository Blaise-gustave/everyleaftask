class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:new, :show, :edit, :update, :destroy, :index]
  def index
    if params[:sort_expired]
      @tasks = Task.order('enddate DESC').page(params[:page])
    elsif params[:term]
      @tasks = Task.where('name LIKE ? or status LIKE ? ', "%#{params[:term]}%", "%#{params[:term]}%").page(params[:page])
    elsif params[:priority]
      @tasks = Task.all.order("priority DESC").page(params[:page])
    elsif  params[:key]
      @tasks= Task.joins(:labels)
      .where("labels.name LIKE ?", "%#{params[:key]}%").page(params[:page])

    else
      @tasks = Task.all.order("created_at DESC").page(params[:page])
    end
  end 
  def show
  end
  def new
    @task = current_user.tasks.build
  end
  def edit
  end
  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
    def task_params
      params.require(:task).permit(:name, :details, :status, :priority, :startdate, :enddate, label_ids:[])
    end
end
