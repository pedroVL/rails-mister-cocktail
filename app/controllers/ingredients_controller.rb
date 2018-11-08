class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def top
    @ingredients = Ingredient.where(stars: 4)
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  # def search
  #   @ingredients = ingredient.where("name LIKE '%#{params[:search]}%'")
  # end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
