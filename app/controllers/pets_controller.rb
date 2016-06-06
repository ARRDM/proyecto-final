# coding: utf-8
class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    #@pets = Pet.all.activos
    if (params[:aname] != "" && params[:aname] != nil)  ||
       (params[:abreed] != "" && params[:abreed] != nil) ||
       (params[:ahair] != "" && params[:ahair] != nil) ||
       (params[:aage] != "" && params[:aage] != nil) ||
       (params[:agender] != "" && params[:agender] != nil) ||
       (params[:asize] != "" && params[:asize] != nil) ||
       (params[:adescription] != "" && params[:adescription] != nil)
      @pets = Pet.all.order('created_at ASC')
      @pets = Pet.busqueda_avanzada(params[:aname],params[:abreed],params[:ahair],params[:aage],params[:agender],params[:asize], params[:adescription])
      if params[:aradio] != ""
        @pets = Pet.search_distance(@pets,params[:aradio],params[:lat2],params[:lng2])
      end

    else
      
      if params[:search]      
        @pets = Pet.search(params[:search]).order("created_at ASC")
      else
        @pets = Pet.all.order('created_at ASC')
      end
      if (params[:search_distance] != "" && params[:search_distance] != nil)
        @pets = Pet.search_distance(@pets,params[:search_distance],params[:lat],params[:lng])
      else
      end
      if (params[:latitude] != "" && params[:latitude] != nil)
        @pets = Pet.ordena(@pets,params[:latitude],params[:longitude])
      end
    end
    
    
    @hash = @pets.map {|a| {lat: a.user.latitude, lng: a.user.longitude, infowindow: "Aquí vive:"+a.name + " \n Edad:"+ a.age } }
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @user = User.where(id: @pet.user_id)
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @message = Message.where(pet_id: @pet.id).first
    if @message != nil
      @message.destroy
    end
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :breed, :hair, :age, :gender, :size, :description, :status, :image, :user_id, :requested)
    end
end
