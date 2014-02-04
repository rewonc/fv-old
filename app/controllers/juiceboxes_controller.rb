class JuiceboxesController < ApplicationController
  before_action :set_juicebox, only: [:show, :edit, :update, :destroy]

  # GET /juiceboxes
  # GET /juiceboxes.json
  def index
    @juiceboxes = Juicebox.all
  end

  # GET /juiceboxes/1
  # GET /juiceboxes/1.json
  def show
  end

  # GET /juiceboxes/new
  def new
    @juicebox = Juicebox.new
  end

  # GET /juiceboxes/1/edit
  def edit
  end

  # POST /juiceboxes
  # POST /juiceboxes.json
  def create
    @juicebox = Juicebox.new(juicebox_params)

    respond_to do |format|
      if @juicebox.save
        format.html { redirect_to @juicebox, notice: 'Juicebox was successfully created.' }
        format.json { render action: 'show', status: :created, location: @juicebox }
      else
        format.html { render action: 'new' }
        format.json { render json: @juicebox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juiceboxes/1
  # PATCH/PUT /juiceboxes/1.json
  def update
    respond_to do |format|
      if @juicebox.update(juicebox_params)
        format.html { redirect_to @juicebox, notice: 'Juicebox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @juicebox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /juiceboxes/1
  # DELETE /juiceboxes/1.json
  def destroy
    @juicebox.destroy
    respond_to do |format|
      format.html { redirect_to juiceboxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juicebox
      @juicebox = Juicebox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def juicebox_params
      params[:juicebox]
    end
end
