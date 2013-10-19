class ImagesController < ApplicationController
  def index
    q = params[:q].to_s
    render(json: {}) and return if q.size < 3

    query  = {
      v: '1.0', rsz: 8, imgsz: 'huge', safe: 'active',
      as_rights: 'cc_noncommercial', as_sitesearch: 'flickr.com',
      q: q
    }
    query['userip'] = request.remote_ip unless localhost?
    uri = URI::HTTP.build(
      host: 'ajax.googleapis.com',
      path: '/ajax/services/search/images',
      query: query.to_query
    )
    render json: Net::HTTP.get(uri)
  end
end
