class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])  #one object
  end

  def new
    @cocktail = Cocktail.new
      #no parameters we have empty form then will send the attributes to create method
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
      if @cocktail.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new  #we are rendering the file new from the restaurant
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])   #we edit a restauran that alrady exists ...edit is the form taht has info and we when submit we sent teh info to update
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private
   def cocktail_params
    params.require(:cocktail).permit(:name)
   end
end
