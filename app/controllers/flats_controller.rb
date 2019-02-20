class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @flats = Flat.search(params[:search]).order("price_per_night ASC")
    else
      @flats = Flat.all.order('price_per_night ASC')
    end
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @flat.update(flat_params)
      redirect_to @flat
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy

    redirect_to flats_path
  end

  private

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :img_url)
  end
end
