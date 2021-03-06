# frozen_string_literal: true

class RefreshController < ApplicationController
  before_action :authorize_refresh_request!
  def create
    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
    render json: session.refresh(found_token)
  end
end
