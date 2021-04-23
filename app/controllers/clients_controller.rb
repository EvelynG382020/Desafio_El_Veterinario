class ClientsController < ApplicationController
    before_action :set_client, only: %i[ show edit update destroy ]
  
    # GET /clients 
    def index
      @clients = Client.all 
      #debo traer todos los clientes de la BD
    end
  
    # GET /clients/1 
    def show
      @pets = Pet.where(client_id: params[:id])
      #en show debo tener cliente por id que entran por parametro
    end
  
    # GET /clients/new
    def new
      @client = Client.new 
      #instanciar 
    end
  
    # GET /clients/1/edit
    def edit
    end
  
    # POST /clients 
    def create
      @client = Client.new(client_params)
        #cada cliente que recibe por parametro se crea y se itera para guardarlo
      respond_to do |format|
            if @client.save
            format.html { redirect_to @client, notice: "Client was successfully created." }
            else
            format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
  
    # PATCH/PUT /clients/1 
    def update
      respond_to do |format|
        if @client.update(client_params)
          format.html { redirect_to @client, notice: "Client was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /clients/1 or /clients/1.json
    def destroy
      @client.destroy
      respond_to do |format|
        format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @client = Client.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def client_params
        params.require(:client).permit(:name, :phone, :email)
      end
  end
  