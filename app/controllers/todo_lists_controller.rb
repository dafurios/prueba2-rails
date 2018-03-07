class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = TodoList.all
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    id_user = TodoList.where(todo_id: params[:id]).pluck(:user_id)
    @users = User.where(id: id_user).order('id asc').limit(5)
    quantity = User.where(id: id_user).count
      if quantity > 5
        @rest = User.where(id: id_user).order('id desc').limit(quantity-5)
      end
  end

  # GET /todo_lists/new
  def new
    @todo_list = TodoList.new
  end

  # GET /todo_lists/1/edit
  def edit
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    #raise
    if params[:flag] == 'Hecho'
    list = TodoList.new(
    completed: true,
    todo_id: params[:todo_id],
    user: current_user
    )
    if list.save
      redirect_to root_path, notice: 'Tarea Completada!'
    elsif
      redirect_to root_path, alert: 'Por Favor, Vuelve a Guardar!'
    end

  elsif params[:flag] == 'Falta'
    TodoList.find_by(todo_id: params[:todo_id]).destroy

    redirect_to root_path, notice: 'Tarea Incompleta!'
  end



    # @todo_list = TodoList.new(todo_list_params)
    #
    # respond_to do |format|
    #   if @todo_list.save
    #     format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
    #     format.json { render :show, status: :created, location: @todo_list }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @todo_list.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:completed)
    end
end
