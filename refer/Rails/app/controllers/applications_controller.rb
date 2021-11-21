class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[ show edit update destroy ]
  #skip_before_action :authorize_applications!, only: :index

  def authorize_applications!
    redirect_to root_path unless session[:leasing_agent_id].present?||session[:admin_id].present?||session[:applicant_id].present?
  end

  # GET /applications or /applications.json
  def index
    if current_applicant != nil
      @applications = Application.where(applicant_id: current_applicant.id)
      else
        @applications = Application.all
      end
  end

  # GET /applications/1 or /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
    # We add these lines so that the selected property’s data fields and applicant’s credit cards are available to the views at the front end
    if @property.nil?
      @property = Property.find(params[:property_id])
    end
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications or /applications.json
  def create
    @application = Application.new(application_params)

    @property = Property.find(params[:application][:property_id])
    # We link the application to the applicant and their credit card
    @application.applicant = current_applicant
    # We update the original property quantity
    #@property.quantity = @property.quantity - @application.quantity
    @property.save

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: "Application was successfully created." }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1 or /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: "Application was successfully updated." }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1 or /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: "Application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_application
    @application = Application.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def application_params
    params.require(:application).permit(:applicant_name, :datetime, :property_name, :approved_rejected_processing, :property_id)
  end
end
