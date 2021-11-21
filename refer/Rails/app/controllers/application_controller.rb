class ApplicationController < ActionController::Base
  helper_method :current_applicant, :current_agent, :current_admin
  #before_action :authorized
  #helper_method :logged_in?

  def logged_in?
    !current_applicant.nil?||!current_agent.nil?||!current_admin.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end

  def current_agent
    if session[:leasing_agent_id]
      @current_agent ||= LeasingAgent.find(session[:leasing_agent_id])
    else
      @current_agent = nil
    end
  end

  def current_applicant
    if session[:applicant_id]
      @current_applicant ||= Applicant.find(session[:applicant_id])
    else
      @current_applicant = nil
    end
  end

  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find(session[:admin_id])
    else
      @current_admin = nil
    end
  end

  def logged_in?
    !current_applicant.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end
end
