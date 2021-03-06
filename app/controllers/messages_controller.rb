class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_pet, only: [:new]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all.personal(current_user.id).recientes
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @pet = Pet.find(@message.pet_id)
    @petitioner = User.find(@message.petitioner)
    @owner = User.find(@message.owner)
  end

  # GET /messages/new
  def new
    @pet = Pet.find(params[:id])
    @user = User.find_by_id(@pet.user_id)
    PostMailer.UserMailer(@user.email,current_user.user_name,current_user.email,current_user.phone,@user.user_name).deliver_now
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @pet = Pet.find(@message.pet_id)
    #@message.make_new_text(params[:text])

    respond_to do |format|
      if @message.save
        @pet.status = 'p'
        @pet.requested = true
        @pet.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @pet = Pet.find(@message.pet_id)
    @pet.status = "n"
    @pet.requested = false
    @pet.save
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:owner, :petitioner, :pet_id, :text, :status)
      # params.fetch(:message, {})
    end
end
