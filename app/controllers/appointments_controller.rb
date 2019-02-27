class AppointmentsController < ApplicationController
  before_action :set_user

  def index
    @docs = @user.appointments.where(role: 'doctor')
    @patients = @user.appointments.where(role: 'patient')
    @appointments = @user.appointments.all
  end

  def new
    @appointment = @user.appointments.new
  end

  def create
    @appointment = @user.appointments.new(user_params)
    if @appointment.save
      redirect_to user_appointments_path(@user)
    else
      render :new
    end
  end

  def destroy
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to user_appointments_path(@user)
  end

 private
   def set_user
     @user = User.find(params[:user_id]) 
   end

   def user_params
     params.require(:appointment).permit(:role, :doctor_id, :date, :time)
   end
end
