#encoding: utf-8
class CoilAssaysController < ApplicationController
  include UsersHelper
  # GET /coil_assays
  # GET /coil_assays.json
  def index
    @page_title = 'Перечень анализов качества угля'
    @authorized_user = User.find(session[:user_id])
    case @authorized_user.subdivision
      when 'ТЭЦ-2','ТЭЦ-4','ТЭЦ-5'
        @coil_assays = CoilAssay.order(:dttm).find_all_by_subdivision(@authorized_user.subdivision)
      else
        @coil_assays = CoilAssay.order(:dttm).all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coil_assays }
    end
  end

  # GET /coil_assays/1
  # GET /coil_assays/1.json
  def show
    @coil_assay = CoilAssay.find(params[:id])
    @authorized_user = User.find(session[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coil_assay }
    end
  end

  # GET /coil_assays/new
  # GET /coil_assays/new.json
  def new
    @coil_assay = CoilAssay.new
    @authorized_user = User.find(session[:user_id])
    @coil_assay.subdivision = @authorized_user.subdivision
    @coil_assay.is_suplier_assay = true if (has_grant?(:edit_filial) || has_grant?(:correct_filial))

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coil_assay }
    end
  end

  # GET /coil_assays/1/edit
  def edit
    @coil_assay = CoilAssay.find(params[:id])
    @authorized_user = User.find(session[:user_id])
  end

  # POST /coil_assays
  # POST /coil_assays.json
  def create
    @coil_assay = CoilAssay.new(params[:coil_assay])
    @authorized_user = User.find(session[:user_id])
    respond_to do |format|
      if @coil_assay.save
        format.html { redirect_to coil_assays_url, notice: 'Данные нового анализа угля были успешно записаны.' }
        format.json { render json: @coil_assay, status: :created, location: @coil_assay }
      else
        format.html { render action: "new" }
        format.json { render json: @coil_assay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coil_assays/1
  # PUT /coil_assays/1.json
  def update
    @coil_assay = CoilAssay.find(params[:id])
    @authorized_user = User.find(session[:user_id])
    respond_to do |format|
      if @coil_assay.update_attributes(params[:coil_assay])
        format.html { redirect_to coil_assays_url, notice: 'Данные нового анализа угля были успешно скорректированы.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coil_assay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coil_assays/1
  # DELETE /coil_assays/1.json
  def destroy
    @coil_assay = CoilAssay.find(params[:id])
    @coil_assay.destroy

    respond_to do |format|
      format.html { redirect_to coil_assays_url }
      format.json { head :no_content }
    end
  end
end
