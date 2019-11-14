class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.create(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
