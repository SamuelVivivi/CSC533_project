class LeasingAgentsController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create]
  before_action :set_leasing_agent, only: %i[ show edit update destroy ]
  #skip_before_action :authorize_leasing_agents!, only: :index

  def authorize_leasing_agents!
    redirect_to root_path unless session[:admin_id].present?
  end

  # GET /leasing_agents or /leasing_agents.json
  def index
    @leasing_agents = LeasingAgent.all
  end

  # GET /leasing_agents/1 or /leasing_agents/1.json
  def show
  end

  # GET /leasing_agents/new
  def new
    @leasing_agent = LeasingAgent.new
  end

  # GET /leasing_agents/1/edit
  def edit
  end

  # POST /leasing_agents or /leasing_agents.json
  def create
    @leasing_agent = LeasingAgent.new(leasing_agent_params)

    respond_to do |format|
      if @leasing_agent.save
        format.html { redirect_to @leasing_agent, notice: "Leasing agent was successfully created." }
        format.json { render :show, status: :created, location: @leasing_agent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leasing_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leasing_agents/1 or /leasing_agents/1.json
  def update
    respond_to do |format|
      if @leasing_agent.update(leasing_agent_params)
        format.html { redirect_to @leasing_agent, notice: "Leasing agent was successfully updated." }
        format.json { render :show, status: :ok, location: @leasing_agent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leasing_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leasing_agents/1 or /leasing_agents/1.json
  def destroy
    @leasing_agent.destroy
    respond_to do |format|
      format.html { redirect_to leasing_agents_url, notice: "Leasing agent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leasing_agent
      @leasing_agent = LeasingAgent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leasing_agent_params
      params.require(:leasing_agent).permit(:name, :email_address, :password, :password_confirmation, :phone_number)
    end
end
