class PetHistoriesController < ApplicationController
    before_action :set_pet_history, only: [:show, :edit, :update, :destroy]
  
    # GET /pet_histories
    def index
      @pet_histories = PetHistory.all
    end
  
    # GET /pet_histories/1
    def show
    end
  
    # GET /pet_histories/new
    def new
      @pet_history = PetHistory.new
      @pets = Pet.all
    end
  
    # GET /pet_histories/1/edit
    def edit
      @pets = Pet.all
    end
  
    # POST /pet_histories
    def create
      @pets = Pet.all
      @pet_history = PetHistory.new(pet_history_params)
  
      respond_to do |format|
        if @pet_history.save
          format.html { redirect_to @pet_history, notice: 'Pet history was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  
    # PATCH/PUT /pet_histories/1
    def update
      @pets = Pet.all
      respond_to do |format|
        if @pet_history.update(pet_history_params)
          format.html { redirect_to @pet_history, notice: 'Pet history was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  
    # DELETE /pet_histories/1
    def destroy
      @pet_history.destroy
      respond_to do |format|
        format.html { redirect_to pet_histories_url, notice: 'Pet history was successfully destroyed.' }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_pet_history
        @pet_history = PetHistory.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def pet_history_params
        params.require(:pet_history).permit(:weight, :heigth, :diagnosis, :description, :pet_id, pets_attributes:[:name, :breed, :weight, :height])
        #Los atributos de la clase Pet llegarán al controlador con el nombre de pets_attributes, los otros atributos necesarios para crear una instancia
      end
end
  