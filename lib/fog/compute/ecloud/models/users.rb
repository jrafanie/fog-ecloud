require File.expand_path("../user", __FILE__)

module Fog
  module Compute
    class Ecloud
      class Users < Fog::Ecloud::Collection
        identity :href

        model Fog::Compute::Ecloud::User

        def all
          data = service.get_users(href).body[:User]
          load(data)
        end

        def get(uri)
          if data = service.get_user(uri)
            new(data.body)
          end
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
