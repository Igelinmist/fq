#encoding: utf-8
class GazAssaysController < ApplicationController
  # GET /gaz_assays
  # GET /gaz_assays.json
  def index
    @gaz_assays = GazAssay.all
    @page_title = 'Перечень проб газа'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gaz_assays }
    end
  end

  # GET /gaz_assays/1
  # GET /gaz_assays/1.json
  def show
    @gaz_assay = GazAssay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gaz_assay }
    end
  end

  # GET /gaz_assays/new
  # GET /gaz_assays/new.json
  def new
    @gaz_assay = GazAssay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gaz_assay }
    end
  end

  # GET /gaz_assays/1/edit
  def edit
    @gaz_assay = GazAssay.find(params[:id])
  end

  # POST /gaz_assays
  # POST /gaz_assays.json
  def create
    @gaz_assay = GazAssay.new(params[:gaz_assay])

    respond_to do |format|
      if @gaz_assay.save
        format.html { redirect_to gaz_assays_url, notice: 'Gaz assay was successfully created.' }
        format.json { render json: @gaz_assay, status: :created, location: @gaz_assay }
      else
        format.html { render action: "new" }
        format.json { render json: @gaz_assay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gaz_assays/1
  # PUT /gaz_assays/1.json
  def update
    @gaz_assay = GazAssay.find(params[:id])

    respond_to do |format|
      if @gaz_assay.update_attributes(params[:gaz_assay])
        format.html { redirect_to gaz_assays_url, notice: 'Gaz assay was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gaz_assay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gaz_assays/1
  # DELETE /gaz_assays/1.json
  def destroy
    @gaz_assay = GazAssay.find(params[:id])
    @gaz_assay.destroy

    respond_to do |format|
      format.html { redirect_to gaz_assays_url }
      format.json { head :no_content }
    end
  end
end
