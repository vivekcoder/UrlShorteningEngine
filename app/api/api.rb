class API < Grape::API
  prefix 'api'
  format :json
  mount V1::Root
end