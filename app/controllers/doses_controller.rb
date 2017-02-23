class DosesController < ApplicationController
 def new

  @cocktail = Cocktail.find(params[:cocktail_id])

  @dose = Dose.new
end

def create
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new(dose_params)
  @dose.cocktail = @cocktail
  if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render :new
  end

end

def destroy
  @dose.destroy
  redirect_to cocktail_path(cocktail.id), notice: 'Dose was successfully destroyed.'
end

private

def dose_params
  params.require(:dose).permit(:ingredient_id, :cocktail_id , :description)
end
end
