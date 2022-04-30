# frozen_string_literal: true

JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = Rails.application.secrets.secret_key_base
