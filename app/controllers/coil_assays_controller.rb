#encoding: utf-8
class CoilAssaysController < ApplicationController
  # GET /coil_assays
  # GET /coil_assays.json
  def index
    @coil_assays = CoilAssay.all
    @page_title = 'Перечень проб угля'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coil_assays }
    end
  end

  # GET /coil_assays/1
  # GET /coil_assays/1.json
  def show
    @coil_assay = CoilAssay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coil_assay }
    end
  end

  # GET /coil_assays/new
  # GET /coil_assays/new.json
  def new
    @coil_assay = CoilAssay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coil_assay }
    end
  end

  # GET /coil_assays/1/edit
  def edit
    @coil_assay = CoilAssay.find(params[:id])
  end

  # POST /coil_assays
  # POST /coil_assays.json
  def create
    @coil_assay = CoilAssay.new(params[:coil_assay])

    respond_to do |format|
      if @coil_assay.save
        format.html { redirect_to coil_assays_url, notice: 'Coil assay was successfully created.' }
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

    respond_to do |format|
      if @coil_assay.update_attributes(params[:coil_assay])
        format.html { redirect_to coil_assays_url, notice: 'Coil assay was successfully updated.' }
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
