class PetsController < ApplicationController
    before_action :set_pet, only: [:show, :edit, :update, :destroy]
  
    # GET /pets
    def index
      @pets = Pet.all
    end
  
    # GET /pets/1
    def show
    end
  
    # GET /pets/new
    def new
      @pet = Pet.new
      @pet.build_client #El método build retorna un nuevo objeto del tipo de la colección, en este caso un nuevo cliente
    end
  
    # GET /pets/1/edit
    def edit
    end
  
    # POST /pets
    def create
      @pet = Pet.new(pet_params)
  
      respond_to do |format|
        if @pet.save
          format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  
    # PATCH/PUT /pets/1
    def update
      respond_to do |format|
        if @pet.update(pet_params)
          format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  
    # DELETE /pets/1
    def destroy
      @pet.destroy
      respond_to do |format|
        format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_pet
        @pet = Pet.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def pet_params
        params.require(:pet).permit(:name, :breed, :birth, :client_id)
      end
  end
  