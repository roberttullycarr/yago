require 'jwt'

class JsonWebToken
  # Encodes and signs JWT Payload with expiration
  def self.encode(payload)
    payload.reverse_merge!(meta)
    JWT.encode(payload, ENV["SECRE_KEY_BASE"])
  end

  # Decodes the JWT with the signed secret
  def self.decode(token)
    JWT.decode(token, ENV["SECRE_KEY_BASE"])
  end



  # Validates the payload hash for expiration and meta claims
  def self.valid_payload(payload)
    !(expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud])
  end

  # Default options to be encoded in the token
  def self.meta
    {
      exp: 1.day.from_now.to_i,
      iss: 'issuer_name',
      aud: 'client'
    }
  end

  # Validates if the token is expired by exp parameter
  def self.expired(payload)
    Time.at(payload['exp']) < Time.now
  end

  private

  def hmac_secret
    Rails.application.secrets.secret_key_base || ENV["SECRET_KEY_BASE"]
  end
end
