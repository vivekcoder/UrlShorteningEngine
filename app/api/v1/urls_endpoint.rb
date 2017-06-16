module V1
  class UrlsEndpoint < API
    namespace :urls do
      params do
        requires :original
        # e.g. http://localhost:3000/api/v1/urls/convert?original=http://google.com/abcderfes
      end
      get '/convert' do
        url = Url.new(original: params[:original])
        url.sanitize
        if url.save
          return { short_url: url.shortened_url }
        end
      end
    end
  end
end
