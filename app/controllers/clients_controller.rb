class ClientsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    client = Client.find_by(email: params[:client][:email])
    return redirect_to new_client_path, alert: '登録済です' if client
    
    client = Client.new(
      email: params[:client][:email],
      password: params[:client][:password],
      password_confirmation: params[:client][:password_confirmation]
    )
    if client.valid?
      client.save
      redirect_to reservations_path, notice: '登録しました'
    else
      redirect_to reservations_path, alert: client.errors.messages
    end
  end
end
