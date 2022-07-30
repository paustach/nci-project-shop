class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :validate_user, only: %i[ show new ]

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
  end

  # User can access only their profile
  def validate_user
    redirect_to "/faq" unless current_user.id.to_s == params[:id] || current_user.admin
  end

  # GET /profiles/new
  def new
    @profile = Profile.new

    respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @profile }
    end

  end

  #Retrieve the profile of the current user. If the user doesn't exisit, they will be redirected to create a profile. 
  def signedinuserprofile
    profile = Profile.find_by_id(current_user.id)
    if profile.nil?
    redirect_to "/profiles/new"
    else
    @profile = Profile.find_by_id(current_user.id)
    redirect_to "/profiles/#{@profile.id}"
    end
  end
    
  
  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:firstName, :lastName, :addressLine1, :addressLine2, :postCode, :city, :phoneNumber)
    end
end
