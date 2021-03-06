# frozen_string_literal: true
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :message_user

    def connect
      self.message_user = find_verified_user
    end

    def find_verified_user
      if env['warden'].user
        env['warden'].user
      else
        reject_unauthorized_connection
      end
    end
  end
end
