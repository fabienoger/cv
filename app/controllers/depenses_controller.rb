class DepensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_depense, only: [:show, :edit, :update, :destroy]

  # GET /depenses
  # GET /depenses.json
  def index
    @depenses = Depense.all
  end

  # GET /depenses/1
  # GET /depenses/1.json
  def show
  end

  # GET /depenses/new
  def new
    @depense = Depense.new
  end

  # GET /depenses/1/edit
  def edit
  end

  # POST /depenses
  # POST /depenses.json
  def create
    @depense = Depense.new(depense_params)

    respond_to do |format|
      if @depense.save
        format.html { redirect_to @depense, notice: 'Depense was successfully created.' }
        format.json { render :show, status: :created, location: @depense }
      else
        format.html { render :new }
        format.json { render json: @depense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /depenses/1
  # PATCH/PUT /depenses/1.json
  def update
    respond_to do |format|
      if @depense.update(depense_params)
        format.html { redirect_to @depense, notice: 'Depense was successfully updated.' }
        format.json { render :show, status: :ok, location: @depense }
      else
        format.html { render :edit }
        format.json { render json: @depense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /depenses/1
  # DELETE /depenses/1.json
  def destroy
    @depense.destroy
    respond_to do |format|
      format.html { redirect_to depenses_url, notice: 'Depense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_depense
      @depense = Depense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def depense_params
      params.require(:depense).permit(:title, :value, :date, :checked)
    end
end
