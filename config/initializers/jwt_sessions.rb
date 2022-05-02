# frozen_string_literal: true

JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = Rails.application.secrets.secret_key_base
# JWTSessions.token_store = :redis, { redis_url: 'redis://127.0.0.1:6379/0' }
