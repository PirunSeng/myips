class InternetProtocolsController < ApplicationController
  before_action :find_internet_protocol, only: [:show, :edit, :update, :destroy]

  def index
    @internet_protocols = InternetProtocol.order(:address)
  end

  def new
    @internet_protocol = current_user.internet_protocols.new
  end

  def show
  end

  def create
    @internet_protocol = current_user.internet_protocols.new(internet_protocol_params)
    if @internet_protocol.save
      redirect_to root_path, notice: 'Successfully created!'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @internet_protocol.update_attributes(internet_protocol_params)
      redirect_to root_path, notice: 'Successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @internet_protocol.destroy
    redirect_to root_path, notice: 'Successfully deleted!'
  end

  private

  def internet_protocol_params
    params.require(:internet_protocol).permit(:address)
  end

  def find_internet_protocol
    @internet_protocol = current_user.internet_protocols.find(params[:id])
  end
end
