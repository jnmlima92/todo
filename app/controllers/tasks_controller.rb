class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy mark_as_done]
  before_action :set_notice, only: %i[ index]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
    @backlog_tasks = @tasks.in_backlog
    @in_progress_tasks = @tasks.processing
    @done_tasks = @tasks.finished
    @cancelled_tasks = @tasks.cancelled
    @task_count = @tasks.count
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "#{Task.model_name.human} criada com sucesso" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "#{Task.model_name.human} atualizada com sucesso" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "#{t(Task.model_name.human)} removida com sucesso" }
      format.json { head :no_content }
    end
  end

  def mark_as_done
    respond_to do |format|
      response = @task.update_status
      
      if response[:task].present?
        format.html { redirect_to tasks_url(notice: response[:message].description, color: response[:message].hexadecimal_color) }
        format.json { render :show, status: :ok, location: :index }
      else
        format.html { redirect_to :index, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:description, :status)
    end

    def set_notice
      @notice = params[:notice] if params[:notice].present?
      @notice_color = params[:color] if params[:color].present?
    end
end
