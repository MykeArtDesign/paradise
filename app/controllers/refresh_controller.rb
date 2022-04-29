class RefreshController < ApplicationController
  before_action :authorize_refresh_request!

  def create
    @session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
    @tokens = session.refresh_by_access_allowed do
      raise JWTSessions::Errors::Unauthorized, 'Somethings not right here!'
    end

    render json: { csrf: tokens[:csrf] }
    # response.set_cookie(JWTSessions.access_cookie,
    #                     value: tokens[:access],
    #                     httponly: true,
    #                     secure: Rails.env.production?)
  end
end
