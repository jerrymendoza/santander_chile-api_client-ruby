require "faraday"
require "faraday_middleware"
require "erb"
require "santander_chile/api_client/version"

module SantanderChile
  module ApiClient
    autoload :Error, "santander_chile/api_client/error"
    autoload :Token, "santander_chile/api_client/token"

    #models
    autoload :Object, "santander_chile/api_client/models/object"
    autoload :Account, "santander_chile/api_client/models/account"
    autoload :Movement, "santander_chile/api_client/models/movement"
    autoload :Contact, "santander_chile/api_client/models/contact"
    autoload :Collection, "santander_chile/api_client/collection"
    autoload :Template, "santander_chile/api_client/templates/templates"

    #resources
    autoload :Resource, "santander_chile/api_client/resources/resource"
    autoload :ProductsResource, "santander_chile/api_client/resources/products"
    autoload :MovementsResource, "santander_chile/api_client/resources/movements"
    autoload :PaymentsResource, "santander_chile/api_client/resources/payments"

    #client
    autoload :Configuration, "santander_chile/api_client/client/configuration"
    autoload :Connection, "santander_chile/api_client/client/connection"
    autoload :Authentication, "santander_chile/api_client/client/authentication"
    autoload :Client, "santander_chile/api_client/client"
  end
end
