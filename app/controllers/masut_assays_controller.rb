#encoding: utf-8
class MasutAssaysController < ApplicationController
  # GET /masut_assays
  # GET /masut_assays.json
  def index
    @masut_assays = MasutAssay.all
    @page_title = 'Перечень проб мазута'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @masut_assays }
    end
  end

  # GET /masut_assays/1
  # GET /masut_assays/1.json
  def show
    @masut_assay = MasutAssay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @masut_assay }
    end
  end

  # GET /masut_assays/new
  # GET /masut_assays/new.json
  def new
    @masut_assay = MasutAssay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @masut_assay }
    end
  end

  # GET /masut_assays/1/edit
  def edit
    @masut_assay = MasutAssay.find(params[:id])
  end

  # POST /masut_assays
  # POST /masut_assays.json
  def create
    @masut_assay = MasutAssay.new(params[:masut_assay])

    respond_to do |format|
      if @masut_assay.save
        format.html { redirect_to masut_assays_url, notice: 'Masut assay was successfully created.' }
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

    respond_to do |format|
      if @masut_assay.update_attributes(params[:masut_assay])
        format.html { redirect_to masut_assays_url, notice: 'Masut assay was successfully updated.' }
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
