require 'open-uri'
class CocktailsController < ApplicationController
  def new
    @cocktail = Cocktail.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)

    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{@cocktail.name}"
    drinks = JSON.parse(open(url).read)

    if drinks["drinks"].length > 0

      @cocktail.photo = drinks["drinks"][0]["strDrinkThumb"]

    end

    if @cocktail.save

      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
