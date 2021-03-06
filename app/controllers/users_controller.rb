#encoding: utf-8

class UsersController < ApplicationController
  skip_before_filter :authorize, only: :login
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @page_title = 'Управление топлива и транспорта'
    @authorized_user = User.find(session[:user_id])

    respond_to do |format|
      format.html {redirect_to(controller: 'users', action: 'home') if @authorized_user.grants & 256 == 0}
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @authorized_user = User.find(session[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @authorized_user = User.find(session[:user_id])
    @page_title = 'Регистрация нового пользователя'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @authorized_user = User.find(session[:user_id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def home
    @page_title = 'Стартовая страница авторизованного пользователя'
    @authorized_user = User.find(session[:user_id])
  end

  def login
    user = User.find_by_login(params[:login])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      user.last_login = Time.now
      user.login_count +=1
      user.save
      redirect_to controller: 'users', action: 'home'
    else
      redirect_to controller: 'home', action: 'index'
      flash[:error] = 'Неверная комбинация имени и пароля'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Сеанс работы завершен'
    redirect_to controller: 'home', action: 'index'
  end


  def report
    @authorized_user = User.find(session[:user_id])
    @dt = get_date_hash(params[:period])


  end

  protected

  def get_date_hash(text_period)
    dt={}
    if text_period == 'Текущий месяц'
      dt2=Date.today
      dt1=Date.new(dt2.year,dt2.month,1)
      dt = {start_day: dt1, end_date: dt2}
    end
    dt

  end
end
