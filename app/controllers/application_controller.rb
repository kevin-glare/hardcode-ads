class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/ads' do
    ads = Ad.order(updated_at: :desc)#.page(params[:page])
    serializer = AdSerializer.new(ads)

    serializer.serializable_hash.to_json
  end

  post '/ads' do
    result = Ads::CreateService.call(ad: params)

    if result.success?
      serializer = AdSerializer.new(result.ad)
      serializer.serialized_json
    else
      result.ad
    end
  end
end