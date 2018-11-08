class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    @doses = Dose.all
  end

  def top
    @doses = Dose.where(stars: 4)
  end

  def show
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def edit
  end

  # def search
  #   @doses = dose.where("name LIKE '%#{params[:search]}%'")
  # end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.valid?
      @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    if @dose.update(dose_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    set_dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
