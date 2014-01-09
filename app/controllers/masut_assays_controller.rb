#encoding: utf-8
class MasutAssaysController < ApplicationController
  # GET /masut_assays
  # GET /masut_assays.json
  def index
    @page_title = 'Перечень анализов качества мазута'
    @authorized_user = User.find(session[:user_id])
    case @authorized_user.subdivision
      when 'ТЭЦ-2','ТЭЦ-3','ТЭЦ-4','ТЭЦ-5','КРК'
        @masut_assays = MasutAssay.order(:dttm).find_all_by_subdivision(@authorized_user.subdivision)
      else
        @masut_assays = MasutAssay.order(:dttm).all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @masut_assays }
    end
  end

  # GET /masut_assays/1
  # GET /masut_assays/1.json
  def show
    @masut_assay = MasutAssay.find(params[:id])
    @authorized_user = User.find(session[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @masut_assay }
    end
  end

  # GET /masut_assays/new
  # GET /masut_assays/new.json
  def new
    @masut_assay = MasutAssay.new
    @authorized_user = User.find(session[:user_id])
    @masut_assay.subdivision = @authorized_user.subdivision
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @masut_assay }
    end
  end

  # GET /masut_assays/1/edit
  def edit
    @masut_assay = MasutAssay.find(params[:id])
    @authorized_user = User.find(session[:user_id])
  end

  # POST /masut_assays
  # POST /masut_assays.json
  def create
    @masut_assay = MasutAssay.new(params[:masut_assay])

    respond_to do |format|
      if @masut_assay.save
        format.html { redirect_to masut_assays_url, notice: 'Данные нового анализа мазута успешно записаны.' }
        format.json { render json: @masut_assay, status: :created, location: @masut_assay }
      else
        format.html { render action: "new" }
        format.json { render json: @masut_assay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /masut_assays/1
  # PUT /masut_assays/1.json
  def update
    @masut_assay = MasutAssay.find(params[:id])
    @authorized_user = User.find(session[:user_id])
    respond_to do |format|
      if @masut_assay.update_attributes(params[:masut_assay])
        format.html { redirect_to masut_assays_url, notice: 'Данные анализа качества мазута успешно скорректированы.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @masut_assay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /masut_assays/1
  # DELETE /masut_assays/1.json
  def destroy
    @masut_assay = MasutAssay.find(params[:id])
    @masut_assay.destroy

    respond_to do |format|
      format.html { redirect_to masut_assays_url }
      format.json { head :no_content }
    end
  end
end
