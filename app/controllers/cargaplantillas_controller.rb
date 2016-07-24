class CargaplantillasController < ApplicationController
  before_action :set_cargaplantilla, only: [:show, :edit, :update, :destroy]

  # GET /cargaplantillas
  # GET /cargaplantillas.json
  def index
    @cargaplantillas = Cargaplantilla.all
  end

  # GET /cargaplantillas/1
  # GET /cargaplantillas/1.json
  def show
  end

  # GET /cargaplantillas/new
  def new
    @cargaplantilla = Cargaplantilla.new
  end

  # GET /cargaplantillas/1/edit
  def edit
  end

  # POST /cargaplantillas
  # POST /cargaplantillas.json
  def create
    @cargaplantilla = Cargaplantilla.new(cargaplantilla_params)

    respond_to do |format|
      if @cargaplantilla.save
        format.html { redirect_to @cargaplantilla, notice: 'Cargaplantilla was successfully created.' }
        format.json { render :show, status: :created, location: @cargaplantilla }
      else
        format.html { render :new }
        format.json { render json: @cargaplantilla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cargaplantillas/1
  # PATCH/PUT /cargaplantillas/1.json
  def update
    respond_to do |format|
      if @cargaplantilla.update(cargaplantilla_params)
        format.html { redirect_to @cargaplantilla, notice: 'Cargaplantilla was successfully updated.' }
        format.json { render :show, status: :ok, location: @cargaplantilla }
      else
        format.html { render :edit }
        format.json { render json: @cargaplantilla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargaplantillas/1
  # DELETE /cargaplantillas/1.json
  def destroy
    @cargaplantilla.destroy
    respond_to do |format|
      format.html { redirect_to cargaplantillas_url, notice: 'Cargaplantilla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargaplantilla
      @cargaplantilla = Cargaplantilla.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cargaplantilla_params
      params.require(:cargaplantilla).permit(:titulo,:file)
    end
end
