class SessionsController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create]
  def new
  end

  def create
    applicant = Applicant.find_by_email_address(params[:email_address])
    leasing_agent = LeasingAgent.find_by_email_address(params[:email_address])
    admin = Admin.find_by_email_address(params[:email_address])

    if leasing_agent && leasing_agent.authenticate(params[:password])
      session[:leasing_agent_id] = leasing_agent.id
      redirect_to root_url
    elsif admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to root_url
    elsif applicant && applicant.authenticate(params[:password])
      session[:applicant_id] = applicant.id
      redirect_to root_url
    else
      flash.now[:alert] = "Email or Password is invalid"
      render "new"
    end
  end

  def destroy
    session[:applicant_id] = nil
    session[:leasing_agent_id] = nil
    session[:admin_id] = nil
    redirect_to root_url
  end
end
