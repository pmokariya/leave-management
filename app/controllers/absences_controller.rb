class AbsencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_absence, only: [:show, :edit, :update, :destroy]

  def index
    @absences = Absence.all
  end

  def show
  end

  def new
    @absence = Absence.new
    @manager_users = User.where(:role=>"manager")
  end

  def edit
  end

  def create
    @manager_users = User.where(:role=>"manager")
    @absence = current_user.absences.build(absence_params)  
    respond_to do |format|
      if @absence.save
        @absence.update_attributes(:user_id=>current_user.id)
        UsersAbsence.create(:absence_id =>@absence.id ,:user_id => @absence.user_id)
        format.html { redirect_to @absence, notice: 'Leave application was sent successfully.' }
        format.json { render :show, status: :created, location: @absence }
      else
        format.html { render :new }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @absence.update(absence_params)
        format.html { redirect_to @absence, notice: 'Leave application was successfully updated.' }
        format.json { render :show, status: :ok, location: @absence }
      else
        format.html { render :edit }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @absence.destroy
    respond_to do |format|
      format.html { redirect_to absences_url, notice: 'Leave application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def absence_approve
    @user_absence = UsersAbsence.where(:absence_id =>params[:absence_id]).last
    @user_absence.update_attributes(:is_approve => true,:status=>"approved")
    @user_absence.save
    flash[:notice] = "Leave application request is successfully approved."
    redirect_to absences_path
  end

  def absence_reject
    @user_absence = UsersAbsence.where(:absence_id =>params[:absence_id]).last
    @user_absence.update_attributes(:is_approve => false,:status=>"rejected")
    @user_absence.save
    @absence = Absence.find(@user_absence.absence_id)
    @absence.update_attributes(:reject_msg => params[:absence][:reject_msg])
    @absence.save
    flash[:notice] = "Leave application request is successfully rejected."
    redirect_to absences_path
  end

  private
    def set_absence
      @absence = Absence.find(params[:id])
    end

    def absence_params
      params.require(:absence).permit!
    end
end
