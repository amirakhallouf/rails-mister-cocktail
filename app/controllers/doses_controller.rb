class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id]) # :restaurant_id we can see it on our schema
    @dose = @cocktail.doses.new # we got reviews from restaurant.rb so we can call it . each resaturant has many reviews
  # Franscisc said new here is different from the def new . new (the red oen) is just a rails class method
  end

  def create

    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
        #going to the resaturant page restaurant_patwhere i amde teh review
    else
      render :new   # this is a rails convention <if we save teh review @review.save successfuly redirect me to restaurant_path(@review.restaurant).Otehrwise refersh(render) the new page
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end
  private
   def dose_params
    params.require(:dose).permit(:description,:ingredient_id)
   end
end
