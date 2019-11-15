class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def create
    @dose = Dose.create(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
