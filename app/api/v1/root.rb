module V1
  class Root < API
    version 'v1'
    mount V1::UrlsEndpoint
  end
end